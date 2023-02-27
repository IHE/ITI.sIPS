# Status

[CI Build](http://build.fhir.org/ig/IHE/ITI.aIPS/branches/master/index.html)

## Background

I would really like to understand what needs to be written. I am very much against just updating the [82 page PDF](https://www.ihe.net/uploadedFiles/Documents/PCC/IHE_PCC_Suppl_IPS.pdf). What is really needed? Surely what is needed can be said in about 10 pages or less.  I am willing to author an Implementation Guide that meets a defined and demanded need.  I expect a very small IG that simply hooks HL7 IPS to IHE Document Sharing (XDS, XCA, XDR, XDM, MHD, MHDS), using existing Content Creator / Content Consumer actors that already support this binding.

Given that it is possible we are addressing a new audience. We could express in a bit more detail the above use-cases than we tend to do for a basic Content Profile that simply leverages PCC

### Additional mentions

It is possible that this IG could/should mention the:

- On-Demand document concept, especially given IPS is a summary
- IPS $summary operation, mostly to explain how this mechanism might be hooked to Document Sharing On-Demand document entries
- IPA $docref operation.
- MHD Simplified Publish
- MHD Generate Metadata
- MHD ITI-65 FHIR documents Publish
- IHE-DSG for document digital sigantures

I don't know that mentioning these is useful or necessary as they already exist in the HL7 / IHE specifications.

### Also CPs

Note that there is at least one CP that added FHIR-Document to the PCC Volume 2: 4.1 on how to map document content to document sharing metadata. This added support for FHIR-Document in addition to the CDA mapping that exists. This is very important in addition to something specific about IPS as a FHIR-Document. 

How many PCC approved CPs are there? The technical framework has not been updated since 2016.
