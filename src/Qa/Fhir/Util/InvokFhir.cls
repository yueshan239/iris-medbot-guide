Class Qa.Fhir.Util.InvokFhir Extends %RegisteredObject
{

/// @param IPAddress The IP address of the FHIR server.
/// @param Port The port of the FHIR server.
/// @param Url The URL of the FHIR server.
/// @param Params The parameters to be sent in the request.
/// Example: "key1:value1;key2:value2"
/// @param HttpResponse The response from the FHIR server.
/// @return %Status The status of the request.
/// @return The response from the FHIR server.
/// @description This method sends a GET request to the FHIR server and returns the response.
ClassMethod GET(IPAddress As %String, Port As %String, Url As %String, Params As %String = "", Output HttpResponse As %String(MAXLEN=256000)) As %Status
{
	
	Set httpRequest=##class(%Net.HttpRequest).%New()
	Set httpRequest.Port=Port
	Set httpRequest.Server=IPAddress
	Set httpRequest.Https=0
	Set httpRequest.Timeout=15
	do httpRequest.SetHeader("Accept","*/*")
	IF $L(Params)'=0{
		Set Lists=$LISTFROMSTRING(Params,";")
		Set Length =$LISTLENGTH(Lists)
		for i=1:1:Length{
			Set param=$ZSTRIP(($LISTGET(Lists,i)),"<>W")
			Set Key =$P(param,":",1)
			Set Value =$P(param,":",2)
			Do httpRequest.SetParam(Key,Value)
		}
	}
	Set status=httpRequest.Get(Url)
	IF 'status {
		Set HttpResponse = "Connection failed, call exception"
		return "Connection failed, call exception："_$SYSTEM.Status.GetErrorText(status)
	}
	Set response = httpRequest.HttpResponse
	Set ResponseData = response.Data
	Set HttpResponse=""
	while 'ResponseData.AtEnd{
		Set HttpResponse=HttpResponse_ResponseData.Read()
	}
	Quit $$$OK
}

ClassMethod POST(IPAddress As %String, Port As %String, ContentType As %String, Url As %String, Body As %String, Output HttpResponse As %String(MAXLEN=256000)) As %Status
{
	
	Set httpRequest=##class(%Net.HttpRequest).%New()
	Set httpRequest.Port=Port
	Set httpRequest.Server=IPAddress
	Set httpRequest.ContentType="application/json+fhir"
	Set httpRequest.Https=0
	Set httpRequest.Timeout=15
	Set httpRequest.ContentCharset="UTF-8"
	do httpRequest.EntityBody.Write(Body)
	Set status=httpRequest.Post(Url)
	IF 'status {
		Set HttpResponse = "Connection failed, call exception"
		return "Connection failed, call exception："_$SYSTEM.Status.GetErrorText(status)
	}
	Set response = httpRequest.HttpResponse
	Set ResponseData = response.Data
	Set HttpResponse=""
	while 'ResponseData.AtEnd{
		Set HttpResponse=HttpResponse_ResponseData.Read()
	}
	Quit status
}

}
