Class Qa.Fhir.BS.FhirService Extends Ens.BusinessService
{

Parameter SETTINGS = "TargetConfigNames:Basic:selector?multiSelect=0&context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId}";

Property TargetConfigNames As Ens.DataType.ConfigName;

Method Send(Method As %String, pRequest As %String, Output pResponse As Qa.Fhir.Msg.FhirResponse) As %Status
{

    Set request=##class(Qa.Fhir.Msg.FhirRequest).%New()
    Set pResponse=##class(Qa.Fhir.Msg.FhirResponse).%New()
    Set request.Method = Method
    d request.RequestMessage.Insert(pRequest)	
	Set tSC = ..OnProcessInput(request,.out)
    Set pResponse = out
    Quit tSC
    
	Quit $$$OK
}

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{
	Quit ..SendRequestSync(..TargetConfigNames, pInput, .pOutput)
}

}
