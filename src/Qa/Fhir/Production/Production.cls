Class Qa.Fhir.Production.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Qa.Fhir.Production.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="HS.FHIRServer.Interop.Service" Category="" ClassName="HS.FHIRServer.Interop.Service" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HS.FHIRServer.Interop.Operation" Category="" ClassName="HS.FHIRServer.Interop.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Qa.Fhir.BS.FhirService" Category="" ClassName="Qa.Fhir.BS.FhirService" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">Qa.Fhir.BP.Send</Setting>
  </Item>
  <Item Name="Qa.Fhir.BO.FhirOperation" Category="" ClassName="Qa.Fhir.BO.FhirOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Qa.Fhir.BP.Send" Category="" ClassName="Qa.Fhir.BP.Send" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
