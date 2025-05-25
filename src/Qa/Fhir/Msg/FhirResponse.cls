Class Qa.Fhir.Msg.FhirResponse Extends Ens.Response
{

Parameter XMLNAME = "RESPONSE";

Property ResponseMessages As list Of %String(MAXLEN = "", XMLNAME = "ResponseMessages", XMLPROJECTION = "element");

Storage Default
{
<Data name="FHirResponseDefaultData">
<Subscript>"FHirResponse"</Subscript>
<Value name="1">
<Value>ResponseMessages</Value>
</Value>
</Data>
<DefaultData>FHirResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
