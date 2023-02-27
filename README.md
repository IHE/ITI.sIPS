# Status
This is the supplement template for IHE-Profiles using the IG publisher. repository is under-construction. Please try using it. If you have questions, contact John Moehrke. 

Instructions [are found here](https://github.com/IHE/supplement-template/wiki/Getting-Started)

## Background

I would really like to understand what needs to be written. I am very much against just updating the 82 page PDF. What is really needed? Surely what is needed can be said in about 10 pages or less.  I am willing to author an Implementation Guide that meets a defined and demanded need.  I expect a very small IG that simply hooks HL7 IPS to IHE Document Sharing (XDS, XCA, XDR, XDM, MHD, MHDS), using existing Content Creator / Content Consumer actors that already support this binding.

Can we work with these outside parties to define the use-case(s)?

1. Publishing IPS
Given that the HL7 FHIR IPS Implementation Guide provides a Medical Summary in FHIR format
And that IHE Document Sharing is a recognized document sharing infrastructure
When a FHIR IPS is published
And there is a need to make it discoverable
Then I need to have clear specification on how I express in Document Sharing the existence of a FHIR IPS sources

2. Making On-Demand access to IPS available
Given that the HL7 FHIR IPS Implementation Guide provides a Medical Summary in FHIR format
And that IHE Document Sharing is a recognized document sharing infrastructure
When an FHIR IPS could be made available on-demand
And there is a need to make it discoverable
Then I need to have clear specification on how I express in Document Sharing the existence of a FHIR IPS sources

3. Retrieving an IPS
Given that the HL7 FHIR IPS Implementation Guide provides a Medical Summary in FHIR format
And that IHE Document Sharing is a recognized document sharing infrastructure
When an application needs access to a FHIR IPS
Then I need to have clear specification on how I use Document Sharing to find FHIR IPS sources

4. Pushing and IPS to a recipient
Given that the HL7 FHIR IPS Implementation Guide provides a Medical Summary in FHIR format
And that IHE Document Sharing is a recognized document sharing infrastructure
When an FHIR IPS needs to be sent to a specific recipient
Then I need to have clear specification on how I use Document Sharing to find FHIR IPS sources

This would result in a very small IHE Implementation Guide -- Accessibility of IPS (aIPS). This would be a IG format, so would be easy for others to depend-on it as necessary and further refine it. Such as derivations of the IPS for given use-cases like Occupational Data, EMS, or Maternal Health.

Given that it is possible we are addressing a new audience. We could express in a bit more detail the above use-cases than we tend to do for a basic Content Profile that simply leverages PCC

It is possible that this IG could/should mention the IPS $summary operation, or IPA $docref operation. I don't know that mentioning these is useful or necessary as they already exist in the HL7 specifications.

### Also CPs

Note that there is at least one CP that added FHIR-Document to the PCC Volume 2: 4.1 on how to map document content to document sharing metadata. This added support for FHIR-Document in addition to the CDA mapping that exists. This is very important in addition to something specific about IPS as a FHIR-Document. 

How many PCC approved CPs are there? The technical framework has not been updated since 2016.
