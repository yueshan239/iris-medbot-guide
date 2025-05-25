Class Qa.Fhir.Util.BypassingInvok Extends %RegisteredObject
{

ClassMethod BypassingFHIRClient(Method As %String, Endpoint As %String, Path As %String, QueryString As %String = "", PostJson As %String = "") As %DynamicObject
{
	 Set fhirService = ##class(HS.FHIRServer.Service).EnsureInstance(Endpoint)
	 Set request = ##class(HS.FHIRServer.API.Data.Request).%New()
	 Set request.RequestPath = Path
	 Set request.RequestMethod = Method
	 IF Method ="Get"{
	 	Set:$L(QueryString)'=0 request.QueryString = QueryString
	 }
	 IF Method ="POST"{
	 	Set:$L(PostJson)'=0 request.Json = PostJson
	 }
	 do fhirService.DispatchRequest(request, .response)

	Quit response
}

}
