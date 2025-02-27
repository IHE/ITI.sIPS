Instance: IHE.sIPS.ContentCreator
InstanceOf: CapabilityStatement
Title: "IHE sIPS Content Creator Actor"
Usage: #definition
* description = """
CapabilityStatement for the IHE sIPS Content Creator Actor 

The Content Creator creates the [IPS content](http://hl7.org/fhir/uv/ips/) and shares it using one of the methods defined in the [IHE Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html).

FHIR Capability Statement for [Content Creator](CapabilityStatement-IHE.sIPS.ContentCreator.html)

The HL7 IPS is mapped to the Document Sharing Metadata according to PCC Volume 2: 4.1. This shows how to map the FHIR Composition resource elements into XDS/XDM/XDR/XCA [Document Entry](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2) and MHD [FHIR DocumentReference](https://profiles.ihe.net/ITI/MHD/32_fhir_maps.html) elements.
"""
* url = "https://profiles.ihe.net/ITI/sIPS/CapabilityStatement/IHE.sIPS.ContentCreator"
* name = "IHE_sIPS_ContentCreator"
* title = "IHE sIPS Content Creator Actor"
* status = #active
* experimental = false
* date = "2023-02-27"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* document
  * mode = #producer
  * documentation = "see [IHE ITI sIPS Implementation Guide](index.html)."
  * profile = "http://hl7.org/fhir/uv/ips/StructureDefinition/Composition-uv-ips"

Instance: IHE.sIPS.ContentConsumer
InstanceOf: CapabilityStatement
Title: "IHE sIPS Content Consumer Actor"
Usage: #definition
* description = """
CapabilityStatement for the IHE sIPS Content Consumer Actor 

The Content Consumer consumes the [IPS content](http://hl7.org/fhir/uv/ips/) and obtains it using one of the methods defined in the [IHE Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html).

FHIR Capability Statement for [Content Consumer](CapabilityStatement-IHE.sIPS.ContentConsumer.html)

The HL7 IPS is mapped to the Document Sharing Metadata according to PCC Volume 2: 4.1. This shows how to map the FHIR Composition resource elements into XDS/XDM/XDR/XCA [Document Entry](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2) and MHD [FHIR DocumentReference](https://profiles.ihe.net/ITI/MHD/32_fhir_maps.html) elements.
"""
* url = "https://profiles.ihe.net/ITI/sIPS/CapabilityStatement/IHE.sIPS.ContentConsumer"
* name = "IHE_sIPS_ConsumerCreator"
* title = "IHE sIPS Content Consumer Actor"
* status = #active
* experimental = false
* date = "2023-02-27"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* document
  * mode = #consumer
  * documentation = "see [IHE ITI sIPS Implementation Guide](index.html)."
  * profile = "http://hl7.org/fhir/uv/ips/StructureDefinition/Composition-uv-ips"

