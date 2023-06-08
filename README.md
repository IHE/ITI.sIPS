# Status

approved work item starting spring 2023

[ITI New Work Item Proposal](https://github.com/IHE/IT-Infrastructure/issues/197)

## CI Build

[CI Build](http://build.fhir.org/ig/IHE/ITI.aIPS/branches/master/index.html)

## ITI bi-weekly development call

ITI meets for one hour every other week to develop this work toward Public-Comment, toward Trial-Implementation publication. Target for Public-Comment is Summer 2023, thus first Trial-Implementation publication in Fall 2023. Depending on the scope attempted

- bi-weekly - Thursday @ 9amCT/10amET/1600CET
- Starting June 8, 2023
- [teams meeting](https://teams.microsoft.com/l/meetup-join/19%3ameeting_NDUyNmZlYWYtODMwMi00NzFiLTg0NGMtN2UwYTVhMjZkZThj%40thread.v2/0?context=%7b%22Tid%22%3a%2202a9376b-a4f9-4a63-a240-52c43ebf9a89%22%2c%22Oid%22%3a%226459fea4-110a-4d17-85f0-00587211a0c0%22%7d)

Best to [join the ITI-Technical committee](https://www.ihe.net/ihe_domains/it_infrastructure/), but I am interested in diverse perspectives from anyone.

## Background

I would really like to understand what needs to be written. I am very much against just updating the [82 page PDF](https://www.ihe.net/uploadedFiles/Documents/PCC/IHE_PCC_Suppl_IPS.pdf). What is really needed? Surely what is needed can be said in about 10 pages or less.  I am willing to author an Implementation Guide that meets a defined and demanded need.  I expect a very small IG that simply hooks HL7 IPS to IHE Document Sharing (XDS, XCA, XDR, XDM, MHD, MHDS), using existing Content Creator / Content Consumer actors that already support this binding.

I propose that this focus on the [FHIR-Document encoding of IPS](http://hl7.org/fhir/uv/ips/). There is a [CDA encoding](https://art-decor.org/art-decor/decor-project--hl7ips-), but there is less market demand for that. With the FHIR IG we can have our IG dependon the FHIR IPS to create a stronger linkage.

Given that it is possible we are addressing a new audience. We could express in a bit more detail the above use-cases than we tend to do for a basic Content Profile that simply leverages PCC

### Additional mentions

It is possible that this IG could/should mention the:

- using XDS association relationships to show that a CDA and IPS are semantically the same content with different encodings
- On-Demand document concept, especially given IPS is a summary
- IPS $summary operation, mostly to explain how this mechanism might be hooked to Document Sharing On-Demand document entries
- IPA $docref operation.
- MHD Simplified Publish
- MHD Generate Metadata
- MHD ITI-65 FHIR documents Publish
- IHE-DSG for document digital signatures
- IHE-DEN for document encryuption
- Include some examples
- Describe patient mediated
- mention the possibility of use with 360x

I don't know that mentioning these is useful or necessary as they already exist in the HL7 / IHE specifications.

### Also CPs

Note that there is at least one CP that added FHIR-Document to the PCC Volume 2: 4.1 on how to map document content to document sharing metadata. This added support for FHIR-Document in addition to the CDA mapping that exists. This is very important in addition to something specific about IPS as a FHIR-Document.

How many PCC approved CPs are there? The technical framework has not been updated since 2016.

### Name of the profile

The acronym should be clearly "IPS", but needs to be distinct from the content definition from HL7 "IPS". Thus I used the word "access", which transformed into "accessibility". However the word "accessibility" has a perspective of human readability and understandability, especially with disabilities. The goal of the IG is to show how to access, communicate, publish the IPS content on existing Document Sharing (XDS, XCA, XDR, MHD, MHDS, etc) infrastructure. So, we need a new name:

- Accessibility of IPS (aIPS)
- Access to IPS (aIPS)
- IPS sharing (IPSS)
- Mobile IPS (mIPS)
- IPS Document Exchange (IPS-DX)
- IPS Sharing: IPS-S to set a pattern for other document sharing and make the -S the known text for sharing
- IPS Metadata (IPS-M): This is similar to Document Exchange but is more subtle. -M is probably a bad choice because that is to close to "m" for Mobile.
- IPS Metadata (IPS Meta): So you can post your IPS on Facebook.
