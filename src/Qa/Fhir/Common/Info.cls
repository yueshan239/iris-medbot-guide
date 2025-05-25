Class Qa.Fhir.Common.Info Extends %RegisteredObject
{

/// Description
ClassMethod FhirServerInfo() As %Status
{
    Set requestObj = ##class(%DynamicObject).%New()
    d requestObj.%Set("IPAddress","127.0.0.1")
    d requestObj.%Set("Port","52773")
    d requestObj.%Set("Url", "")
    d requestObj.%Set("Params", "")
    Return requestObj
}

}
