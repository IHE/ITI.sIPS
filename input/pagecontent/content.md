
|------------------------------------------------|
| Editor, add the following new section to [ITI Volume 3](https://profiles.ihe.net/ITI/TF/Volume3) : |
{:.grid .bg-info}


## 3:5.9 International Patient Summary Content Module

An [International Patient Summary (IPS) document]({{site.data.fhir.hl7ips}}) is an electronic health record extract containing essential healthcare information about a subject of care.
As specified in EN ISO 27269, it is designed for supporting the use case scenario for ‘unplanned, cross border care’, but it is not limited to it.
It is intended to be international, i.e., to provide generic solutions for global application beyond a particular region or country.

The IPS dataset is minimal and non-exhaustive; specialty-agnostic and condition-independent; but still clinically relevant. The [IPS document specification is published by HL7]({{site.data.fhir.hl7ips}}).

The IHE sIPS does not modify the [HL7 IPS]({{site.data.fhir.hl7ips}}) specification, but provides for methods of sharing the IPS using [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html). The IPS, as a "current summary", is an excellent document for the ["On-Demand" capability of the Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#212-dynamic-documents) infrastructure. On-Demand is available in [XDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10) with [On-Demand Documents Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html), [XCA](https://profiles.ihe.net/ITI/TF/Volume1/ch-18.html) with [On-Demand Documents Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-18.html#18.2.4), and with [MHD/MHDS](https://profiles.ihe.net/ITI/MHD/index.html). Further details for IPS use of On-Demand are outlined below in section 3.9.2.1.2.

The IPS document is composed by a set of robust, well-defined and potentially reusable sets of core data items (indicated as IPS library in the figure below). The tight focus of the IPS on unplanned care is in this case not a limitation, but, on the contrary, facilitates their potential re-use beyond the IPS scope.

<div>
<img src="IPS_doc_library.png" caption="Figure 1: The IPS product and by-products" width="70%" >
</div>

### 3:5.9.1 Referenced Standards

- [International Patient Summary (IPS) document]({{site.data.fhir.hl7ips}})

### 3:5.9.2 Document Sharing Metadata

The [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) infrastructures define a common set of Document Metadata, Submission Set, and Folders. There are [defined methods of communicating documents](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#3-document-sharing-profiles) including push, centralized registry, and federated discovery and retrieval. The metadata model is designed to be content agnostic so can support any past or future document specification, which enables all existing networks to support the IPS without modification.

A Document Entry (aka FHIR DocumentReference) is metadata about a document. This metadata is designed to support provenance, lifecycle, authenticity, patient identity, privacy, and exchange of the document that is described. The document can be any kind of format, in this content module we are focused on the [International Patient Summary (IPS) document]({{site.data.fhir.hl7ips}}) and the format of JSON or XML. Submission Set is the metadata about the publication event, who published these documents, why, when, where, etc. The Folder is an adhoc grouping mechanism that can be used for purposes like grouping a clinical episode. Further explanation of the [Value of Metadata](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#26-value-of-metadata) is covered in the [HIE Whitepaper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html).

There is a limitation in the Document Sharing metadata that each Document entry must have only one mime-type. The FHIR model supports many mime-type encodings, as does IPS. Some environments may choose one of the FHIR mime-type encodings, where others may need both JSON and XML mime-type encoding of the IPS document bundle. Where more than one mime-type encoding is needed one would need to register multiple Document entries and [indicate they are transforms](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#27-document-relationships) only differing in mime-type. With multiple Document entries registered, the Document Consumer can pick the mime-type desired, and with the [transform relationship](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#27-document-relationships) be confident that there is no semantic difference between the two mime-type encodings.

To fill out a Document Entry there is a mapping table [PCC TF-2: 4.1.1](pcc.html) that provides guidance. The mapping to a FHIR DocumentReference from the document FHIR Composition is the same as is found in the [FHIR Core DocumentReference Mapping from Composition](http://hl7.org/fhir/R4/documentreference-mappings.html#fhircomposition), the [PCC TF-2: 4.1.1](pcc.html) provides additional guidance.

#### 3:5.9.2.1 DocumentEntry/DocumentReference Metadata

IPS is a FHIR document, the Document Entry metadata is derived from the FHIR document Composition Resource following the [Document Sharing Metadata requirements in the PCC TF-2:4](pcc.html) unless otherwise specified below.

##### 3:5.9.2.1.1 FormatCode

The FormatCode shall be `{{site.data.fhir.hl7ips}}/StructureDefinition/Bundle-uv-ips`, the canonical URI of the [IPS Bundle Profile]({{site.data.fhir.hl7ips}}/StructureDefinition-Bundle-uv-ips.html). As a canonical URI, where a `system` is needed, it shall be `urn:ietf:rfc:3986`.

##### 3:5.9.2.1.2 On-Demand

When the Document Source is willing to offer to Document Consumers the ability for an on on-demand instance of the IPS to be returned using current data, it can register a [Document Entry (DocumentReference) as "On-Demand"](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#212-dynamic-documents). XDS and XCA the On-Demand entry is indicated with a given On-Demand ObjectType as expressed in the given options, in MHD/MHDS an On-Demand entry is indicated with an absent .size and .hash. The Document Entry (DocumentReference) will express specific parameters that would be used if the Document Consumer were to request a document be created "On-Demand"; such as timeperiod refinements, setting, language, etc.

When the On-Demand entry is requested by a Document Consumer, the responding actor may chose to utilize the [IPS $summary operation]({{site.data.fhir.hl7ips}}/OperationDefinition-summary.html). This use of the [$summary operation]({{site.data.fhir.hl7ips}}OperationDefinition-summary.html) is not required to be the method used. The [IPS $summary operation]({{site.data.fhir.hl7ips}}OperationDefinition-summary.html) being invoked in this way uses the Document Sharing network to enable very remote clients, such as those many XCA communities away. Note that the [IPS $summary operation]({{site.data.fhir.hl7ips}}/OperationDefinition-summary.html) may be used in other Implementation Guides more directly by a http client.

The returned document would, based on configuration, result in an additional DocumentEntry/DocumentReference (aka Snapshot) existing that is in transforms relationship with the On-Demand DocumentEntry/DocumentReference, and representing the returned document metadata. This snapshot is a "stable" instance that can be retrieved again in the future. More discussion of the relationship between the on-demand and the instances that are preserved as snapshots is explain in [HIE Whitepaper: Dynamic Documents](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#212-dynamic-documents).

The following figure shows one On-Demand Document Entry (DocumentReference), and two instances that have been requested and preserved as snapshots with a transforms relationship.

<figure>
{%include on-demand.svg%}
<figcaption><b>Figure 3:5.9.2.1.2: Example On-Demand relationship to snapshot Stable entries.</b></figcaption>
</figure>
<br clear="all">

#### 3:5.9.2.2 SubmissionSet Metadata

No additional requirements. The SubmissionSet represents the activity  For more information, see [PCC TF-2: 4.1.1.1](pcc.html).

#### 3:5.9.2.2 Folder Metadata

No additional requirements. For more information, see [PCC TF-2: 4.1.1.3](pcc.html).

### 3:5.9.3 Specification

This Content Module does not constrain the IPS content. For the definition of the [IPS content as defined by HL7]({{site.data.fhir.hl7ips}})

### 3:5.9.4 Examples

Given the [IPS examples]({{site.data.fhir.hl7ips}}examples.html) provided in the [IPS Implementation Guide](https://hl7.org/fhir/uv/ips), the following DocumentReference would be an example as Registered in Document Sharing. Submission Set and Folders are not shown as they are more dependent on the situation of the publication than the content itself.

See example artifacts

- [Example Bundle: IPS Bundle example]({{site.data.fhir.hl7ips}}Bundle-IPS-examples-Bundle-01.html) 
  - [Example DocumentReference for IPS Bundle in XML encoding](DocumentReference-ex-DocumentReference-Bundle-01-xml.html)
  - [Example DocumentReference for IPS Bundle in JSON encoding](DocumentReference-ex-DocumentReference-Bundle-01-json.html) with transform relationship to XML encoding.

