
Instance:   ex-DocumentReference-Bundle-01-xml
InstanceOf: IHE.MHD.UnContained.Comprehensive.DocumentReference
//InstanceOf: IHE.MHD.Minimal.DocumentReference
Title:      "DocumentReference for the Bundle-01 IPS document in XML"
Description: """
Example of a Comprehensive DocumentReference resource.

- This is for the XML encoding
- Where the IPS Bundle is [the IPS examples 01]({{site.data.fhir.hl7ips}}Bundle-IPS-examples-Bundle-01.html) 
- This is fully filled for all mandatory elements.
- IPS has multiple authenticators, XDS DocumentEntry has only one available
- IPS does not have a class, Comprehensive requires a category - replicated the type.
- IPS didn't have a declared language, presumed US
- made up an inline Patient
- facility and practice setting come from publisher policy or setting and are not derived from Composition
"""
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:oid:2.16.724.4.8.10.200.10"
* masterIdentifier.value = "3f69e0a5-2177-4540-baab-7a5d0877428f"
* identifier[entryUUID].system = "urn:ietf:rfc:3986"
* identifier[entryUUID].value = "urn:uuid:0c287d32-01e3-4d87-9953-9fc59407eb21"
* identifier[entryUUID].use = #official
* status = #current
* content.attachment.contentType = #application/fhir+xml
// This URL would be used to retrieve the content, and in this case that would be the given FHIR Bundle
* content.attachment.url = "{{site.data.fhir.hl7ips}}Bundle-IPS-examples-Bundle-01.xml"
//* content.attachment.url = "http://example.com/fhir/bundle-1.xml"
* type = http://loinc.org#60591-5 "Patient summary Document"
// class does not exist in this example, so replicate the type
* category = http://loinc.org#60591-5 "Patient summary Document"
* subject = Reference(Patient/2b90dd2b-2dab-4c75-9bb9-a355e07401e8)
* date = 2017-12-11T14:30:00+01:00
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* author = Reference(Practitioner/1c616b24-3895-48c4-9a02-9a64110351ef)
* authenticator = Reference(Practitioner/1c616b24-3895-48c4-9a02-9a64110351ef)
* context.related = Reference(Organization/890751f4-2924-4636-bab7-efffc7f3cf15)
* custodian = Reference(Organization/890751f4-2924-4636-bab7-efffc7f3cf15)
* relatesTo.code = #appends
* relatesTo.target.identifier.system = "urn:oid:2.16.724.4.8.10.200.10"
* relatesTo.target.identifier.value = "c2277753-9f90-4a95-8ddb-a0b3f6e7d292"
* content.attachment.title = "Patient Summary as of December 11, 2017 14:30"
* context.event = http://terminology.hl7.org/CodeSystem/v3-ActClass#PCPR
* context.period.end = 2017-12-11T14:30:00+01:00
* content.format.system = "urn:ietf:rfc:3986"
* content.format.code = #http://hl7.org/fhir/uv/ips/StructureDefinition/Bundle-uv-ips
* content.attachment.creation = 2017-12-11T14:30:00+01:00
// note the size and hash are NOT included at all
* content.attachment.language = urn:ietf:bcp:47#en
* context.facilityType = http://snomed.info/sct#225732001 "Community hospital"
* context.practiceSetting =  http://snomed.info/sct#408443003 "General medical practice"
* context.sourcePatientInfo = Reference(Patient/2b90dd2b-2dab-4c75-9bb9-a355e07401e8)

Instance:   ex-DocumentReference-Bundle-01-json
InstanceOf: IHE.MHD.UnContained.Comprehensive.DocumentReference
//InstanceOf: IHE.MHD.Minimal.DocumentReference
Title:      "DocumentReference for the Bundle-01 IPS document in JSON"
Description: """
Example of a Comprehensive DocumentReference resource.

- This is for the JSON encoding. Links in Transform relationship to the XML encoded form.
- Where the IPS Bundle is [the IPS examples 01]({{site.data.fhir.hl7ips}}Bundle-IPS-examples-Bundle-01.html) 
- This is fully filled for all mandatory elements.
- IPS has multiple authenticators, XDS DocumentEntry has only one available
- IPS does not have a class, Comprehensive requires a category - replicated the type.
- IPS didn't have a declared language, presumed US
- made up an inline Patient
- facility and practice setting come from publisher policy or setting and are not derived from Composition
"""
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* masterIdentifier.system = "urn:oid:2.16.724.4.8.10.200.10"
* masterIdentifier.value = "3f69e0a5-2177-4540-baab-7a5d0877428f"
* identifier[entryUUID].system = "urn:ietf:rfc:3986"
* identifier[entryUUID].value = "urn:uuid:0c287d32-01e3-4d87-9953-9fc59407eb21"
* identifier[entryUUID].use = #official
* status = #current
* content.attachment.contentType = #application/fhir+json
// This URL would be used to retrieve the content, and in this case that would be the given FHIR Bundle
* content.attachment.url = "{{site.data.fhir.hl7ips}}Bundle-IPS-examples-Bundle-01.json"
//* content.attachment.url = "http://example.com/fhir/bundle-1.xml"
* type = http://loinc.org#60591-5 "Patient summary Document"
// class does not exist in this example, so replicate the type
* category = http://loinc.org#60591-5 "Patient summary Document"
* subject = Reference(Patient/2b90dd2b-2dab-4c75-9bb9-a355e07401e8)
* date = 2017-12-11T14:30:00+01:00
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* author = Reference(Practitioner/1c616b24-3895-48c4-9a02-9a64110351ef)
* authenticator = Reference(Practitioner/1c616b24-3895-48c4-9a02-9a64110351ef)
* context.related = Reference(Organization/890751f4-2924-4636-bab7-efffc7f3cf15)
* custodian = Reference(Organization/890751f4-2924-4636-bab7-efffc7f3cf15)
* relatesTo.code = #appends
* relatesTo.target.identifier.system = "urn:oid:2.16.724.4.8.10.200.10"
* relatesTo.target.identifier.value = "c2277753-9f90-4a95-8ddb-a0b3f6e7d292"
* content.attachment.title = "Patient Summary as of December 11, 2017 14:30"
* context.event = http://terminology.hl7.org/CodeSystem/v3-ActClass#PCPR
* context.period.end = 2017-12-11T14:30:00+01:00
* content.format.system = "urn:ietf:rfc:3986"
* content.format.code = #http://hl7.org/fhir/uv/ips/StructureDefinition/Bundle-uv-ips
* content.attachment.creation = 2017-12-11T14:30:00+01:00
// note the size and hash are NOT included at all
* content.attachment.language = urn:ietf:bcp:47#en
* context.facilityType = http://snomed.info/sct#225732001 "Community hospital"
* context.practiceSetting =  http://snomed.info/sct#408443003 "General medical practice"
* context.sourcePatientInfo = Reference(Patient/2b90dd2b-2dab-4c75-9bb9-a355e07401e8)

// this JSON encoding is indicated as transform of the XML encoding (could be either way, but XDS has one-way relationship)
* relatesTo.code = #transforms
* relatesTo.target = Reference(DocumentReference/ex-DocumentReference-Bundle-01-xml)

Instance: 2b90dd2b-2dab-4c75-9bb9-a355e07401e8
InstanceOf: Patient
Title: "HIE managed instance of Patient for Martha DeLarosa"
Description: "Example of an PDQm managed Patient"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier.system = "urn:oid:2.16.840.1.113883.2.4.6.3"
* identifier.value = "574687583"
* active = true
* name.family = "DeLarosa"
* name.given = "Martha"
* telecom.system = #phone
* telecom.value = "+31788700800"
* telecom.use = #home
* gender = #female
* birthDate = "1972-05-01"
* address.line = "Laan Van Europa 1600"
* address.city = "Dordrecht"
* address.postalCode = "3317 DB"
* address.country = "NL"
* contact.relationship	= http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH
* contact.name.family = "Mum"
* contact.name.given = "Martha"
* contact.telecom.system = #phone
* contact.telecom.value = "+33-555-20036"
* contact.telecom.use = #home
* contact.address.line = "Promenade des Anglais 111"
* contact.address.city = "Lyon"
* contact.address.postalCode = "69001"
* contact.address.country = "FR"


Instance: 1c616b24-3895-48c4-9a02-9a64110351ef
InstanceOf: Practitioner
Title: "HIE managed instance of Practitioner for Beetje van Hulp"
Description: "Example of mCSD managed Practitioner"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier.system = "urn:oid:2.16.528.1.1007.3.1"
* identifier.value = "129854633"
* identifier.assigner.display = "CIBG"
* active = true
* name.family = "van Hulp"
* name.given = "Beetje"
* qualification.code = http://terminology.hl7.org/CodeSystem/v2-0360#MD "Doctor of Medicine"

Instance: 890751f4-2924-4636-bab7-efffc7f3cf15
InstanceOf: Organization
Title: "HIE Managed instance of Organization for Anorg Aniza"
Description: "Example of mCSD managed Organization"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier.system = "urn:oid:2.16.528.1.1007.3.3"
* identifier.value = "564738757"
* active = true
* name = "Anorg Aniza Tion BV / The best custodian ever"
* telecom.system = #phone
* telecom.value =  "+31-51-34343400"
* telecom.use = #work
* address.use = #work
* address.line = "Houttuinen 27"
* address.city = "Dordrecht"
* address.postalCode = "3311 CE"
* address.country = "NL"
