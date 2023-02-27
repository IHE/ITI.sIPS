
# 1:XX Profile name

Given that HL7 has published an [International Patient Summary, which is a FHIR-Document](http://hl7.org/fhir/uv/ips/), this Implementation Guide defines how to communicate and access the IPS using [IHE Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html). This is an IHE Content Module as defined in the IHE Technical Frameworks [General Introduction](https://profiles.ihe.net/GeneralIntro/). This Implementation Guide does not further refine the IPS, and thus any document conforming to the HL7 base IPS specification is applicable here.

## 1:X.1 aIPS Actors, Transactions, and Content Modules

<a name="actors-and-transactions"> </a>

- [Content Creator](#creator)
- [Content Consumer](#consumer)

<div>
{%include docSharing.svg%}
</div>
<br clear="all">

**Figure: aIPS Actor Diagram**

### XX.1.1 Actors
The actors in this profile are described in more detail in the sections below.

#### XX.1.1.1 Content Creator

<a name="creator"> </a>

The Content Creator creates the [IPS content](http://hl7.org/fhir/uv/ips/) and shares it using one of the methods defined in the [IHE Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html).

FHIR Capability Statement for [Content Creator]{CapabilityStatement-IHE.aIPS.ContentCreator.html}

The HL7 IPS is mapped to the Document Sharing Metadata according to PCC Volume 2: 4.1. This shows how to map the FHIR Composition resource elements into XDS/XDM/XDR/XCA [Document Entry](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2) and MHD [FHIR DocumentReference](https://profiles.ihe.net/ITI/MHD/32_fhir_maps.html) elements.

#### XX.1.1.2 Content Consumer

<a name="consumer"> </a>

The Content Consumer consumes the [IPS content](http://hl7.org/fhir/uv/ips/) and obtains it using one of the methods defined in the [IHE Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html).

FHIR Capability Statement for [Content Consumer]{CapabilityStatement-IHE.aIPS.ContentConsumer.html}

The HL7 IPS is mapped to the Document Sharing Metadata according to PCC Volume 2: 4.1. This shows how to map the FHIR Composition resource elements into XDS/XDM/XDR/XCA [Document Entry](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2) and MHD [FHIR DocumentReference](https://profiles.ihe.net/ITI/MHD/32_fhir_maps.html) elements.

#### XX.1.2 IPS Content

The Content Creator and Content Consumer share the [IPS content](http://hl7.org/fhir/uv/ips/) using one of the methods defined in the [IHE Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html).

The HL7 IPS is mapped to the Document Sharing Metadata according to PCC Volume 2: 4.1. This shows how to map the FHIR Composition resource elements into XDS/XDM/XDR/XCA [Document Entry](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2) and MHD [FHIR DocumentReference](https://profiles.ihe.net/ITI/MHD/32_fhir_maps.html) elements.

## XX.2 aIPS Actor Options

<a name="actor-options"> </a>

Options that may be selected for each actor in this implementation guide, are listed in Table 3.2-1 below. Dependencies
between options when applicable are specified in notes.

|     Actor        |      Option          |
|------------------|----------------------|
| Content Consumer | View                 |
| Content Consumer | Document Import      |
| Content Consumer | Discrete Data Import |
{: .grid}

### XX.2.1 View Option

This option defines the processing requirements placed on Content Consumers for providing
access, rendering and management of the medical document. See the View Option in IHE PCC
TF-2:3.1.1 for more details on this option.

The Content Consumer Actor shall be able to present a view of the document.

TODO: Is there a minimal rendering requirement? Is rendering of the Composition.text sufficient? Given that the .text is not required, is this view option useful?

### XX.2.2 Document Import Option

This option defines the processing requirements placed on Content Consumers for providing
access, and importing the entire medical document and managing it as part of the patient record.
See the Document Import Option in IHE PCC TF-2:3.1.2 for more details on this option.

### XX.2.3 Discrete Data Import Option

This option defines the processing requirements placed on Content Consumers for providing
access, and importing discrete data from selected sections of the medical document and
managing them as part of the patient record. See the Discrete Data Import Option in IHE PCC
TF-2:3.1.4 for more details on this option.

## XX.3 aIPS Required Actor Groupings

<a name="required-groupings"> </a>

The Content Creator and Content Consumer communicate the content using the [IHE Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html).

The Content Creator shall be grouped with a Document Source actor from one of the Document Sharing Implementation Guides (e.g. XDS, XDM, XDR, MHD, etc).

The Content Consumer shall be grouped with a Document Consumer actor from one of the Document Sharing Implementation Guides (e.g. XDS, XDM, XDR, MHD, etc).

Document Sharing [Health Information Exchange Whitepaper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) includes additional HIE functionalities that are covered in the following sections:
- [Document Sharing: Profiles](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#3-document-sharing-profiles)
- [Consuming data as FHIR Resources: Profiles, and Content](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#4-consuming-data-as-fhir-resources)
- [Patient identity Management: Whitepaper, and Profiles](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#5-patient-identity-management)
- [Provider Directory Solutions: Profiles, and Content](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#6-common-provider-directory)
- [Security and Privacy Solutions: Handbooks, Profiles, and Content](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#7-security-and-privacy)

## XX.4 ToDo Overview

<a name="overview"> </a>

This Implementation Guide simply hooks [HL7 IPS](http://hl7.org/fhir/uv/ips/index.html) to IHE [Document Sharing (XDS, XCA, XDR, XDM, MHD, MHDS)](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html), using existing Content Creator / Content Consumer actors that already support this binding.

### XX.4.1 Concepts

The Concepts of [Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) are defined in the [IHE Whitepaper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html), and [ITI Profiles](https://profiles.ihe.net/ITI/).

The Concepts of the [HL7 International Patient Summary (IPS)](http://hl7.org/fhir/uv/ips/index.html) are defined in the [HL7 Implementation Guide](http://hl7.org/fhir/uv/ips/index.html).

### XX.4.2 Use Cases

### XX.4.2.1 Publishing IPS

```Cucumber
Given that the HL7 FHIR IPS Implementation Guide provides a Medical Summary in FHIR format
And that IHE Document Sharing is a recognized document sharing infrastructure
When a FHIR IPS is published
And there is a need to make it discoverable
Then I need to have clear specification on how I express in Document Sharing the existence of a FHIR IPS sources
```

### XX.4.2.2  Making On-Demand access to IPS available

```Cucumber
Given that the HL7 FHIR IPS Implementation Guide provides a Medical Summary in FHIR format
And that IHE Document Sharing is a recognized document sharing infrastructure
When an FHIR IPS could be made available on-demand
And there is a need to make it discoverable
Then I need to have clear specification on how I express in Document Sharing the existence of a FHIR IPS sources
```

### XX.4.2.3  Retrieving an IPS

```Cucumber
Given that the HL7 FHIR IPS Implementation Guide provides a Medical Summary in FHIR format
And that IHE Document Sharing is a recognized document sharing infrastructure
When an application needs access to a FHIR IPS
Then I need to have clear specification on how I use Document Sharing to find FHIR IPS sources
```

### XX.4.2.4  Pushing and IPS to a recipient

```Cucumber
Given that the HL7 FHIR IPS Implementation Guide provides a Medical Summary in FHIR format
And that IHE Document Sharing is a recognized document sharing infrastructure
When an FHIR IPS needs to be sent to a specific recipient
Then I need to have clear specification on how I use Document Sharing to find FHIR IPS sources
```


## XX.5 ToDo Security Considerations

<a name="security-considerations"> </a>

See [Security and Privacy Solutions: Handbooks, Profiles, and Content](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#7-security-and-privacy)

## XX.6 ToDo Cross-Profile Considerations

<a name="other-grouping"> </a>

none

