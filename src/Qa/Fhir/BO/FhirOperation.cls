Class Qa.Fhir.BO.FhirOperation Extends Ens.BusinessOperation
{

Property URL As %String;

Property APIKey As %String;

Property Model As %String;

Parameter SETTINGS = "URL:Basic,APIKey:Basic,Model:Basic";

/// Description
Method FhirService(pInput As Qa.Fhir.Msg.FhirRequest, Output pOutput As Qa.Fhir.Msg.FhirResponse) As %Status
{
    Set json = ##class(Qa.Fhir.Util.Json).%New()
    Set pOutput = ##class(Qa.Fhir.Msg.FhirResponse).%New()  
    Set AiUtil = ##class(Qa.Fhir.Service.CallAI).%New()
    Set sc = $$$OK
    // do something
    
    Set MethodName = pInput.Method
    Set message = pInput.RequestMessage.GetAt(1)
    Set request ={}.%FromJSON(message)
    $$$LOGINFO("Method"_MethodName)
    IF MethodName="GetPatient" {
        Set dataString = ..GetPatient(request)
        Set data = {}.%FromJSON(dataString)
    } ELSEIF MethodName="MedicationRequest" {
        Set dataString = ..MedicationRequest(request)
        Set data = {}.%FromJSON(dataString)
    } ELSEIF MethodName="AiGenerate" {
        Set Bundle =..GetPatient(request)
        Set BundleObj = {}.%FromJSON(Bundle)
        Set Patient = BundleObj.entry.%Get(0).resource.id
        Set ParamObject = {}
        Set ParamObject.Params = "patient:"_Patient
        Set MedicationString = ..MedicationRequest(ParamObject)
        Set aiMessage =AiUtil.AiRequest(MedicationString)
        // call ai 
        Set data = AiUtil.Call(..URL,..APIKey,..Model,aiMessage)
        
         
    } ELSE {
        Set data = ..Error()
    }

    Set response = json.SUCCESS(data,"Success !!!")
    d pOutput.ResponseMessages.Insert(response)
    Return sc
}

/// Description
Method GetPatient(pInput As %String) As %Status
{
    Set sc = $$$OK ,ResponseData=""
    // do something
    Set FhirUtil = ##class(Qa.Fhir.Util.InvokFhir).%New()
    Set FhirServerInfo = ##class(Qa.Fhir.Common.Info).%New()
    Set Info = FhirServerInfo.FhirServerInfo()
    Set Url = "/fhir/r4/Patient"
    Set Params = pInput.Params
    Set tSC = FhirUtil.GET(Info.IPAddress,Info.Port,Url,Params,.ResponseData)
    Return ResponseData
}

/// Description
Method MedicationRequest(pInput As %String) As %Status
{
    Set sc = $$$OK ,ResponseData=""
    // do something
    Set FhirUtil = ##class(Qa.Fhir.Util.InvokFhir).%New()
    Set FhirServerInfo = ##class(Qa.Fhir.Common.Info).%New()
    Set Info = FhirServerInfo.FhirServerInfo()
    Set Url = "/fhir/r4/MedicationRequest"
    Set Params = pInput.Params
    Set tSC = FhirUtil.GET(Info.IPAddress,Info.Port,Url,Params,.ResponseData)
    Return ResponseData
}

/// Description
Method Error() As %DynamicObject
{
    Set Json = ##class(Qa.Fhir.Util.Json).%New()
    Set Error=Json.ERROR("404 Not Found")
    Return Error
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="Qa.Fhir.Msg.FhirRequest"> 
		<Method>FhirService</Method>
	</MapItem>	
</MapItems>
}

}
