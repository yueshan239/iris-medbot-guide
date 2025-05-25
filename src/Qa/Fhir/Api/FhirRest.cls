Class Qa.Fhir.Api.FhirRest Extends %CSP.REST
{

XData UrlMap
{
<Routes>
    <Route Url="/IQAS/:Method" Method="POST" Call="Search"/>
</Routes>
}

ClassMethod Search(Method As %String) As %Status
{

#;	kill ^Log
	Do %response.SetHeader("Content-Type", "application/json;charset=UTF-8")
    Set out=##class(Qa.Fhir.Msg.FhirResponse).%New()
    Set json=##class(Qa.Fhir.Util.Json).%New()
	Try{
		Set content=""
		Set:$L(%request.Content)'=0 content=$zcvt(%request.Content.Read(),"I","UTF8")
		Set ^Log($ZDT($NOW(),3,,6))="Calling the Search interface :"_content
        Set service =##class(Qa.Fhir.BS.FhirService).%New("Qa.Fhir.BS.FhirService")
		Set tSC= ##class(Ens.Director).CreateBusinessService("Qa.Fhir.BS.FhirService", .service)
        Set tSC =service.Send(Method, content, .out)
	   	set message=out.ResponseMessages.GetAt(1)
	   	
	}Catch(e){
        Set message=json.ERROR(e.DisplayString)
	}
    w $zcvt(message,"O","UTF8")
    Quit $$$OK
}

}
