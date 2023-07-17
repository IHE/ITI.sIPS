
|------------------------------------------------|
| Editor, add the following new section to [ITI Volume 3](https://profiles.ihe.net/ITI/TF/Volume3) : |
{:.grid .bg-info}


## 3:5.9 International Patient Summary Content Module

An [International Patient Summary (IPS) document](https://hl7.org/fhir/uv/ips/) is an electronic health record extract containing essential healthcare information about a subject of care.
As specified in EN 17269 and ISO 27269, it is designed for supporting the use case scenario for ‘unplanned, cross border care’, but it is not limited to it.
It is intended to be international, i.e., to provide generic solutions for global application beyond a particular region or country.

The IPS dataset is minimal and non-exhaustive; specialty-agnostic and condition-independent; but still clinically relevant. The [IPS document specification is published by HL7](https://hl7.org/fhir/uv/ips/).

The IHE aIPS does not modify the [HL7 IPS](https://hl7.org/fhir/uv/ips/) specification, but provides for methods of making the IPS accessible and providing methods to communicate it using [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html). The IPS, as a "current summary", is an excellent document for the ["On-Demand" capability of the Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#212-dynamic-documents) infrastructure. On-Demand is available in [XDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10) with [On-Demand Documents Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html), [XCA](https://profiles.ihe.net/ITI/TF/Volume1/ch-18.html) with [On-Demand Documents Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-18.html#18.2.4), and with [MHD/MHDS](https://profiles.ihe.net/ITI/MHD/index.html). Further details for IPS use of On-Demand are outlined below in section 3.9.2.1.2.

The IPS document is composed by a set of robust, well-defined and potentially reusable sets of core data items (indicated as IPS library in the figure below). The tight focus of the IPS on unplanned care is in this case not a limitation, but, on the contrary, facilitates their potential re-use beyond the IPS scope.

<div>
<img src="IPS_doc_library.png" caption="Figure 1: The IPS product and by-products" width="70%" >
</div>


### 3:5.9.1 Referenced Standards

- [International Patient Summary (IPS) document](https://hl7.org/fhir/uv/ips/)

### 3:5.9.2 Document Sharing Metadata

The [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) infrastructures define a common set of Document Metadata, Submission Set, and Folders. There are [defined methods of communicating documents](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#3-document-sharing-profiles) including push, centralized registry, and federated discovery and retrieval. The metadata model is designed to be content agnostic so can support any past or future document specification, which enables all existing networks to support the IPS without modification.

There is a limitation in the Document Sharing metadata that each Document entry must have only one mime-type. The FHIR model supports many mime-type encodings, as does IPS. Some environments may choose one of the FHIR mime-type encodings, where others may need both JSON and XML mime-type encoding of the IPS document bundle. Where more than one mime-type encoding is needed one would need to register multiple Document entries and [indicate they are transforms](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#27-document-relationships) only differing in mime-type. With multiple Document entries registered, the Document Consumer can pick the mime-type desired, and with the [transform relationship](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#27-document-relationships) be confident that there is no semantic difference between the two mime-type encodings.

#### 3:5.9.2.1 DocumentEntry/DocumentReference Metadata

IPS is a FHIR document, the Document Entry metadata is derived from the FHIR document Composition Resource following the [Document Sharing Metadata requirements in the PCC TF-2:4](pcc.html) unless otherwise specified below.

##### 3:5.9.2.1.1 FormatCode

The FormatCode shall be `{{site.data.fhir.hl7ips}}/StructureDefinition/Bundle-uv-ips`, the canonical URI of the [IPS Bundle Profile]({{site.data.fhir.hl7ips}}/StructureDefinition-Bundle-uv-ips.html). As a canonical URI, where a `system` is needed, it shall be `urn:ietf:rfc:3986`.

##### 3:5.9.2.1.2 On-Demand

When the Document Source is willing to offer to Document Consumers the ability for an on on-demand instance of the IPS to be returned using current data, it can register a Document Entry as "On-Demand". XDS and XCA the On-Demand entry is indicated with a given On-Demand ObjectType as expressed in the given options, in MHD/MHDS an On-Demand entry is indicated with an absent .size and .hash.

When the On-Demand entry is requested by a Document Consumer, the responding actor may chose to utilize the IPS $summary operation. This use of the $summary operation is not required to be the method used.

The returned document would, based on configuration, result in an additional DocumentEntry/DocumentReference (aka Snapshot) existing that is in transforms relationship with the On-Demand DocumentEntry/DocumentReference, and representing the returned document metadata.

#### 3:5.9.2.2 SubmissionSet Metadata

No additional requirements. The SubmissionSet represents the activity  For more information, see [PCC TF-2: 4.1.1.1](pcc.html).

#### 3:5.9.2.2 Folder Metadata

No additional requirements. For more information, see [PCC TF-2: 4.1.1.3](pcc.html).

### 3:5.9.3 Specification

This Content Module does not constrain the IPS content. For the definition of the [IPS content as defined by HL7]({{site.data.fhir.hl7ips}})

### 3:5.9.4 Examples

Given the [IPS examples](https://hl7.org/fhir/uv/ips/examples.html) provided in the [IPS Implementation Guide](https://hl7.org/fhir/uv/ips), the following DocumentReference would be an example as Registered in Document Sharing. Submission Set and Folders are not shown as they are more dependent on the situation of the publication than the content itself.

See example artifacts

- [Example Bundle: IPS Bundle example](https://hl7.org/fhir/uv/ips/Bundle-IPS-examples-Bundle-01.html) 
  - [Example DocumentReference for IPS Bundle in XML encoding](DocumentReference-ex-DocumentReference-Bundle-01-xml.html)
  - [Example DocumentReference for IPS Bundle in JSON encoding](DocumentReference-ex-DocumentReference-Bundle-01-json.html) with transform relationship to XML encoding.

