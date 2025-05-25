Class Qa.Fhir.Util.Json Extends %RegisteredObject
{

ClassMethod SUCCESS(data As %DynamicObject, message As %String = "") As %String
{
	Set Object = {}
	Set success = 1
	Set Object.code=200
    Set Object.data=data
	Set Object=Object.%Set("success",success,"boolean")
	Set:$L(message)'=0 Object.msg=message
	Set pResponse = Object.%ToJSON()
	Quit pResponse
}

ClassMethod ERROR(message As %String = "") As %String
{
	Set Object = {}
	Set success = 0
	Set Object.code=500
	Set Object=Object.%Set("success",success,"boolean")
	Set:$L(message)'=0 Object.msg=message
	Set pResponse = Object.%ToJSON()
	Quit pResponse
}

}
