Class Qa.Fhir.Msg.FhirRequest Extends Ens.Request
{

Parameter XMLNAME = "REQUEST";

Property Method As %String;

Property RequestMessage As list Of %String(MAXLEN = "", XMLNAME = "RequestMessage", XMLPROJECTION = "element");

Storage Default
{
<Data name="FhirRequestDefaultData">
<Subscript>"FhirRequest"</Subscript>
<Value name="1">
<Value>Method</Value>
</Value>
<Value name="2">
<Value>RequestMessage</Value>
</Value>
</Data>
<DefaultData>FhirRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
