Instance: IHE.aIPS.ContentCreator
InstanceOf: CapabilityStatement
Title: "IHE aIPS Content Creator Actor"
Usage: #definition
* description = """
CapabilityStatement for the IHE aIPS Content Creator Actor 

Explain
- blah
- blah
"""
* url = "https://profiles.ihe.net/ITI/aIPS/CapabilityStatement/IHE.aIPS.ContentCreator"
* name = "IHE_aIPS_ContentCreator"
* title = "IHE aIPS Content Creator Actor"
* status = #active
* experimental = false
* date = "2023-02-27"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* document
  * mode = #producer
  * documentation = "see [IHE ITI aIPS Implementation Guide](https://profiles.ihe.net/ITI/aIPS/index.html)."
  * profile = "http://hl7.org/fhir/uv/ips/StructureDefinition/Composition-uv-ips"

Instance: IHE.aIPS.ContentConsumer
InstanceOf: CapabilityStatement
Title: "IHE aIPS Content Consumer Actor"
Usage: #definition
* description = """
CapabilityStatement for the IHE aIPS Content Consumer Actor 

Explain
- blah
- blah
"""
* url = "https://profiles.ihe.net/ITI/aIPS/CapabilityStatement/IHE.aIPS.ContentConsumer"
* name = "IHE_aIPS_ConsumerCreator"
* title = "IHE aIPS Content Consumer Actor"
* status = #active
* experimental = false
* date = "2023-02-27"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* document
  * mode = #consumer
  * documentation = "see [IHE ITI aIPS Implementation Guide](https://profiles.ihe.net/ITI/aIPS/index.html)."
  * profile = "http://hl7.org/fhir/uv/ips/StructureDefinition/Composition-uv-ips"

