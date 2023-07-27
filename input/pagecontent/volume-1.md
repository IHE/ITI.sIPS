
Given that HL7 has published an [International Patient Summary, which is a FHIR-Document](http://hl7.org/fhir/uv/ips/), this Implementation Guide defines how to communicate and access the IPS using [IHE Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html). This is an IHE Content Module as defined in the IHE Technical Frameworks [General Introduction](https://profiles.ihe.net/GeneralIntro/). This Implementation Guide does not further refine the IPS, and thus any document conforming to the [HL7 base IPS specification]({{site.data.fhir.hl7ips}}) is applicable here.

An [International Patient Summary (IPS) document]({{site.data.fhir.hl7ips}}) is an electronic health record extract containing essential healthcare information about a subject of care.
As specified in EN ISO 27269, it is designed for supporting the use case scenario for ‘unplanned, cross border care’, but it is not limited to it.
It is intended to be international, i.e., to provide generic solutions for global application beyond a particular region or country.

The IPS dataset is minimal and non-exhaustive; specialty-agnostic and condition-independent; but still clinically relevant. The [FHIR IPS document specification is published by HL7]({{site.data.fhir.hl7ips}}) and is the focus of the sIPS. There is a CDA encoding of the IPS, but there has been little interest in use at this time.

The IHE sIPS does not modify the [HL7 IPS]({{site.data.fhir.hl7ips}}) specification, but provides for methods of sharing the IPS using [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html). The IPS, as a "current summary", is an excellent document for the ["On-Demand" capability of the Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#212-dynamic-documents) infrastructure. On-Demand is available in [XDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10) with [On-Demand Documents Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html), [XCA](https://profiles.ihe.net/ITI/TF/Volume1/ch-18.html) with [On-Demand Documents Option](https://profiles.ihe.net/ITI/TF/Volume1/ch-18.html#18.2.4), and with [MHD/MHDS](https://profiles.ihe.net/ITI/MHD/index.html). Further details for IPS use of On-Demand are outlined below in section 3.9.2.1.2. IHE Document Sharing also has "Stable" and "Delayed Assembly" document entry types that are further explained in the [HIE Whitepaper: Dynamics Documents](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#212-dynamic-documents).

The IPS document is composed by a set of robust, well-defined and potentially reusable sets of core data items (indicated as IPS library in the figure below). The tight focus of the IPS on unplanned care is in this case not a limitation, but, on the contrary, facilitates their potential re-use beyond the IPS scope.

<div>
<img src="IPS_doc_library.png" caption="Figure 1: The IPS product and by-products" width="70%" >
</div>

## 1:56.1 sIPS Actors, Transactions, and Content Modules

<a name="actors-and-transactions"> </a>

- [Content Creator](#creator)
- [Content Consumer](#consumer)

<figure>
{%include docSharing.svg%}
<figcaption><b>Figure: sIPS Actor Diagram</b></figcaption>
</figure>
<br clear="all">

### 56.1.1 Actors

The actors in this profile are described in more detail in the sections below.

<a name="creator"> </a>

#### 56.1.1.1 Content Creator

The [Content Creator](pcc.html#31-document-sharing-pcc-1) creates the [IPS content](http://hl7.org/fhir/uv/ips/) and shares it using one of the methods defined in the [IHE Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html).

FHIR Capability Statement for [Content Creator](CapabilityStatement-IHE.sIPS.ContentCreator.html)

The HL7 IPS is serialized into a FHIR Document Bundle and encoded as a document following the [PCC Serializing FHIR Documents](pcc.html#31-document-sharing-pcc-1).
The HL7 IPS is mapped to the [Document Sharing Metadata according to PCC Volume 2: 4.1](pcc.html#4-ihe-patient-care-coordination-bindings). This shows how to map the FHIR Composition resource elements into XDS/XDM/XDR/XCA [Document Entry](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2) and MHD [FHIR DocumentReference](https://profiles.ihe.net/ITI/MHD/32_fhir_maps.html) elements.

<a name="consumer"> </a>

#### 56.1.1.2 Content Consumer

The [Content Consumer](pcc.html#31-document-sharing-pcc-1) consumes the [IPS content](http://hl7.org/fhir/uv/ips/) and obtains it using one of the methods defined in the [IHE Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html).

FHIR Capability Statement for [Content Consumer](CapabilityStatement-IHE.sIPS.ContentConsumer.html)

The HL7 IPS is mapped to the [Document Sharing Metadata according to PCC Volume 2: 4.1](pcc.html#4-ihe-patient-care-coordination-bindings). This shows how to map the FHIR Composition resource elements into XDS/XDM/XDR/XCA [Document Entry](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2) and MHD [FHIR DocumentReference](https://profiles.ihe.net/ITI/MHD/32_fhir_maps.html) elements.

#### 56.1.2 IPS Content

The Content Creator and Content Consumer share the [IPS content](http://hl7.org/fhir/uv/ips/) using one of the methods defined in the [IHE Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html).

The HL7 IPS is mapped to the [Document Sharing Metadata according to PCC Volume 2: 4.1](pcc.html#4-ihe-patient-care-coordination-bindings). This shows how to map the FHIR Composition resource elements into XDS/XDM/XDR/XCA [Document Entry](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2) and MHD [FHIR DocumentReference](https://profiles.ihe.net/ITI/MHD/32_fhir_maps.html) elements.

<a name="actor-options"> </a>

## 56.2 sIPS Actor Options

Options that may be selected for each actor in this implementation guide, are listed in Table 3.2-1 below. Dependencies
between options when applicable are specified in notes.

|     Actor        |      Option          |
|------------------|----------------------|
| Content Consumer | View                 |
| Content Consumer | Document Import      |
| Content Consumer | Discrete Data Import |
{: .grid}

### 56.2.1 View Option

This option defines the processing requirements placed on Content Consumers for providing
access, rendering and management of the medical document. See the [View Option in IHE PCC TF-2:3.1.1](pcc.html#31-document-sharing-pcc-1) for more details on this option.

The Content Consumer Actor shall be able to present a view of the document. Minimal view guidance following [FHIR core Document Presentation](http://hl7.org/fhir/documents.html#presentation).

### 56.2.2 Document Import Option

This option defines the processing requirements placed on Content Consumers for providing
access, and importing the entire medical document and managing it as part of the patient record.
See the [Document Import Option in IHE PCC TF-2:3.1.2](pcc.html#31-document-sharing-pcc-1) for more details on this option.

### 56.2.3 Discrete Data Import Option

This option defines the processing requirements placed on Content Consumers for providing
access, and importing discrete data from selected sections of the medical document and
managing them as part of the patient record. See the [Discrete Data Import Option in IHE PCC TF-2:3.1.4](pcc.html#31-document-sharing-pcc-1) for more details on this option.

<a name="required-groupings"> </a>

## 56.3 sIPS Required Actor Groupings

The Content Creator and Content Consumer communicate the content using the [IHE Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html).

The Content Creator shall be grouped with a Document Source actor from one of the Document Sharing Implementation Guides (e.g. XDS, XCA, XDM, XDR, MHD, MHDS, etc).

The Content Consumer shall be grouped with a Document Consumer actor from one of the Document Sharing Implementation Guides (e.g. XDS, XCA, XDM, XDR, MHD, MHDS, etc).

Document Sharing [Health Information Exchange Whitepaper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) includes additional HIE functionalities that are covered in the following sections:
- [Document Sharing: Profiles](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#3-document-sharing-profiles)
- [Consuming data as FHIR Resources: Profiles, and Content](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#4-consuming-data-as-fhir-resources)
- [Patient identity Management: Whitepaper, and Profiles](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#5-patient-identity-management)
- [Provider Directory Solutions: Profiles, and Content](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#6-common-provider-directory)
- [Security and Privacy Solutions: Handbooks, Profiles, and Content](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#7-security-and-privacy)

<a name="overview"> </a>

## 56.4 sIPS Overview

This Implementation Guide simply hooks [HL7 IPS](http://hl7.org/fhir/uv/ips/index.html) to IHE [Document Sharing (XDS, XCA, XDR, XDM, MHD, MHDS)](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html), using existing Content Creator / Content Consumer actors that already support this binding.

### 56.4.1 Concepts

The Concepts of [Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) are defined in the [IHE Whitepaper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html), and [ITI Profiles](https://profiles.ihe.net/ITI/).

The Concepts of the [HL7 International Patient Summary (IPS)](http://hl7.org/fhir/uv/ips/index.html) are defined in the [HL7 Implementation Guide](http://hl7.org/fhir/uv/ips/index.html).

The [IHE Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) infrastructures define a common set of Document Metadata, Submission Set, and Folders. There are [defined methods of communicating documents](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#3-document-sharing-profiles) including push, centralized registry, and federated discovery and retrieval. The metadata model is designed to be content agnostic so can support any past or future document specification, which enables all existing networks to support the IPS without modification.

A Document Entry (aka FHIR DocumentReference) is metadata about a document. This metadata is designed to support provenance, lifecycle, authenticity, patient identity, privacy, and exchange of the document that is described. The document can be any kind of format, in this content module we are focused on the [International Patient Summary (IPS) document]({{site.data.fhir.hl7ips}}) and the format of JSON or XML. Submission Set is the metadata about the publication event, who published these documents, why, when, where, etc. The Folder is an adhoc grouping mechanism that can be used for purposes like grouping a clinical episode. Further explanation of the [Value of Metadata](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#26-value-of-metadata) is covered in the [HIE Whitepaper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html).

<figure>
{%include on-demand.svg%}
<figcaption><b>Figure 56.4.1-1: Example On-Demand relationship to snapshot Stable entries.</b></figcaption>
</figure>
<br clear="all">

### 56.4.2 Use Cases

### 56.4.2.1 Publishing IPS

```Gherkin
Given that the HL7 FHIR IPS Implementation Guide provides a Medical Summary in FHIR format
And that IHE Document Sharing is a recognized document sharing infrastructure
When a FHIR IPS is published
And there is a need to make it discoverable
Then I need to have clear specification on how I express in Document Sharing the existence of a FHIR IPS sources
```

Note: the above use-case is written in [Gherkin](https://cucumber.io/docs/gherkin/), a use-case language optimized for automated testing.

See further discussion:
- General explaination of [Centralized Discovery and Retrieve in the HIE Whitepaper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#32-centralized-discovery-and-retrieve)
- General explaination of [Federated Discover and Retrieve in the HIE Whitepaper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#33-federated-discovery-and-retrieve)
- General explaination of [Document Publishing in the HIE Whitepaper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#321-document-publishing)

### 56.4.2.2  Making On-Demand access to IPS available

```Gherkin
Given that the HL7 FHIR IPS Implementation Guide provides a Medical Summary in FHIR format
And that IHE Document Sharing is a recognized document sharing infrastructure
When an FHIR IPS could be made available on-demand
And there is a need to make it discoverable
Then I need to have clear specification on how I express in Document Sharing the existence of a FHIR IPS sources
```

See further discussion:
- General explaination of [Centralized Discovery and Retrieve in the HIE Whitepaper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#32-centralized-discovery-and-retrieve)
- General explaination of [Federated Discover and Retrieve in the HIE Whitepaper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#33-federated-discovery-and-retrieve)
- General explaination of [Dynamic Documents in the HIE Whitepaper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#212-dynamic-documents)
- Content Module specific for IPS On-Demand - [3:5.9.2.1.2 On-Demand](content.html#359212-on-demand)

### 56.4.2.3  Retrieving an IPS

```Gherkin
Given that the HL7 FHIR IPS Implementation Guide provides a Medical Summary in FHIR format
And that IHE Document Sharing is a recognized document sharing infrastructure
When an application needs access to a FHIR IPS
Then I need to have clear specification on how I use Document Sharing to find FHIR IPS sources
```

See further discussion:
- General explaination of [Centralized Discovery and Retrieve in the HIE Whitepaper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#32-centralized-discovery-and-retrieve)
- General explaination of [Federated Discover and Retrieve in the HIE Whitepaper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#33-federated-discovery-and-retrieve)
- General explaination of [Document Discovery and retrival in the HIE Whitepaper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#322-document-discovery)

### 56.4.2.4  Pushing and IPS to a recipient

```Gherkin
Given that the HL7 FHIR IPS Implementation Guide provides a Medical Summary in FHIR format
And that IHE Document Sharing is a recognized document sharing infrastructure
When an FHIR IPS needs to be sent to a specific recipient
Then I need to have clear specification on how I use Document Sharing to find FHIR IPS sources
```

See further discussion:
- General explaination of [PUSH model of Document Sharing in the HIE Whitepaper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#31-push)

<a name="security-considerations"> </a>

## 56.5 sIPS Security Considerations

See [Security and Privacy Solutions: Handbooks, Profiles, and Content](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#7-security-and-privacy)

<a name="other-grouping"> </a>

## 56.6 sIPS Cross-Profile Considerations

All cross-profile considerations are discussed elsewhere.
