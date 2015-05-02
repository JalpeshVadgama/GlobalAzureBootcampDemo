<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="AzureBootCampDemo" generation="1" functional="0" release="0" Id="b106dd1c-4767-4fed-a7a5-de85f6fb7a51" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="AzureBootCampDemoGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="AzureBootCampDemoRole:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/AzureBootCampDemo/AzureBootCampDemoGroup/LB:AzureBootCampDemoRole:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="AzureBootCampDemoRole:AzureStorageSettings" defaultValue="">
          <maps>
            <mapMoniker name="/AzureBootCampDemo/AzureBootCampDemoGroup/MapAzureBootCampDemoRole:AzureStorageSettings" />
          </maps>
        </aCS>
        <aCS name="AzureBootCampDemoRoleInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureBootCampDemo/AzureBootCampDemoGroup/MapAzureBootCampDemoRoleInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:AzureBootCampDemoRole:Endpoint1">
          <toPorts>
            <inPortMoniker name="/AzureBootCampDemo/AzureBootCampDemoGroup/AzureBootCampDemoRole/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapAzureBootCampDemoRole:AzureStorageSettings" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureBootCampDemo/AzureBootCampDemoGroup/AzureBootCampDemoRole/AzureStorageSettings" />
          </setting>
        </map>
        <map name="MapAzureBootCampDemoRoleInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureBootCampDemo/AzureBootCampDemoGroup/AzureBootCampDemoRoleInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="AzureBootCampDemoRole" generation="1" functional="0" release="0" software="D:\AzureBootCamp\Demo\AzureBootCampDemo\AzureBootCampDemo\csx\Release\roles\AzureBootCampDemoRole" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="AzureStorageSettings" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;AzureBootCampDemoRole&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;AzureBootCampDemoRole&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureBootCampDemo/AzureBootCampDemoGroup/AzureBootCampDemoRoleInstances" />
            <sCSPolicyUpdateDomainMoniker name="/AzureBootCampDemo/AzureBootCampDemoGroup/AzureBootCampDemoRoleUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/AzureBootCampDemo/AzureBootCampDemoGroup/AzureBootCampDemoRoleFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="AzureBootCampDemoRoleUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="AzureBootCampDemoRoleFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="AzureBootCampDemoRoleInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="84c0a8a5-eacd-4280-a1a1-e0c3505b55fd" ref="Microsoft.RedDog.Contract\ServiceContract\AzureBootCampDemoContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="0ca4f00a-a9f9-4cba-a8d2-905b667eda13" ref="Microsoft.RedDog.Contract\Interface\AzureBootCampDemoRole:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/AzureBootCampDemo/AzureBootCampDemoGroup/AzureBootCampDemoRole:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>