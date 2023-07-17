
|------------------------------------------------|
| Editor, the following is an excerpt from [PCC Volume 2](https://www.ihe.net/uploadedFiles/Documents/PCC/IHE_PCC_TF_Vol2.pdf): It is provided here for convenience to the reader and is not intended to be different. It does have CP-PCC-0300 integrated. |
{:.grid .bg-info}


# 3 IHE Transactions

This section defines each IHE transaction in detail, specifying the
standards used, and the information transferred.

## 3.1 Document Sharing \[PCC-1\]

\[PCC-1\] describes common functional requirements for content exchange.

Option for a Content Consumer are described below. Content profiles may
reference these options as requirements for its Content Consumer;
profiles may define other options as necessary.

- **Actor**: Content Creator
- **Role**: Create document(s) to be exchanged between two actors
- **Actor**: Content Consumer
- **Role**: Consume document(s) that has been exchanged between two
  actors

Documents are created by a Content Creator and consumed by a Content
Consumer.

The sharing or transmission of content from one actor to the other is
addressed by grouping with appropriate actors from IHE profiles such as:

- Cross Enterprise Document Sharing (XDS)
- Cross Enterprise Document Sharing on Media (XDM)
- Cross Enterprise Document Sharing Reliable Ex (XDR)
- Cross Community Access (XCA)
- Multi-Patient Query (MPQ)
- Mobile Access to Health Documents (MHD)
- Request Form for Data Capture (RFD)
- others as appropriate

The population of metadata in the transport from the created content to
the IHE transaction that shares it must be described in a Content
Binding. Bindings for Document Sharing transactions such as XDS, XCA,
XDR and XDM have been described in the section on Content Bindings in
IHE PCC TF-2: 4. Transactions found in other IHE profiles (e.g., RFD,
MHD) may also be used to exchange content.

**<u>Content Creator Expected Actions</u>**

1. The Content Creator SHALL create the document according to the
content profile that is specified by the actor in the profile where
it is used.
2. The content SHALL be shared using appropriate actors from the IHE
profile it is grouped with as described above.

**<u>Content Consumer Expected Actions</u>**

1. The Content Consumer SHALL be able access documents using
appropriate actors from the IHE profile it is grouped with as
described above.
2. The Content Consumer SHALL support processing of the document as
needed by the profile.
3. The Content Consumer options below MAY be referenced by profiles
where this transaction is used to provide specific processing
requirements.

### 3.1.1 View Option

A Content Consumer that supports the View Option:

1.  SHALL render the document for viewing.

When a CDA Document is used, this rendering shall meet the requirements
defined for CDA Release 2 content presentation semantics (See Section
1.2.4 of the CDA Specification: Human readability and rendering CDA
Documents). CDA Header information providing context critical
information shall also be rendered in a human readable manner. This
includes at a minimum the ability to render the document with the
stylesheet specifications provided by the document source, if the
document source provides a stylesheet. Content Consumers may optionally
view the document with their own stylesheet, but must provide a
mechanism to view using the source stylesheet.

### 3.1.2 Document Import Option

The Content Consumer that supports the ***Document*** Import Option
shall also support the View Option. In addition, the Content Consumer
that supports the Document Import Option shall be able to support the
storage of the entire document (as provided by the sharing framework,
along with sufficient metadata to ensure its later viewing). This Option
requires the proper tracking of the document origin. Once a document has
been imported, the Content Consumer shall offer a means to view the
document without the need to retrieve it again. When viewed after it was
imported, a Content Consumer may choose to access the sharing framework
to find out if the related Document viewed has been deprecated, replaced
or addended.

**Note:** For example, when using XDS, a Content Consumer may choose to
query the Document Registry about a document previously imported in
order to find out if this previously imported document may have been
replaced or has received an addendum. This capability is offered to
Content Consumers by this Integration Profile, but not required, as the
events that may justify such a query are extremely implementation
specific.

### 3.1.3 Section Import Option

The Content Consumer that supports the ***Section*** Import Option shall
also support the View Option. In addition, the Content Consumer that
supports the Section Import Option shall be able to support the import
of one or more sections of the document (along with sufficient metadata
to link the data to its source). Once sections have been selected, a
Content Consumer shall offer a means to copy the imported section(s)
into local data structures as free text. This is to support the display
of section level information for comparison or editing in workflows such
as medication reconciliation while discrete data import is not possible.
When viewed again after it is imported, a Content Consumer may choose to
find out if the related information has been updated.

**Note:** For example, when using XDS, a Content Consumer may choose to
query the Document Registry about a document whose sections were
previously imported in order to find out if this previously imported
document may have been replaced or has received an addendum. This
capability is offered to Content Consumers by this Integration Profile,
but not required, as the events that may justify such a query are
extremely implementation specific.

This Option does not require, but does not exclude the Content Consumer
from offering a means to select and import specific subsets of the
narrative text of a section.

### 3.1.4 Discrete Data Import Option

The Content Consumer that supports the Discrete Data Import Option shall
be able to support the storage of the structured content of one or more
sections of the document. This Option requires that the user be offered
the possibility to select among the specific sections that include
structured content a set of clinically relevant record entries (e.g., a
problem or an allergy in a list) for import as part of the local patient
record.

**Note:** The Discrete Data Import Option does not require the support
of the View, Import Document or Import Sections Options so that it could
be used alone to support implementations of Content Consumers such as
Public Health Data or Clinical Research systems that might aggregate and
anonymize specific population healthcare information data as Document
Consumer Actors, but one where no care provider actually views the
medical summaries.

When discrete data is accessed after it was imported, a Content Consumer
<u>may</u> choose to check if the document related to the discrete data
viewed has been deprecated, replaced or addended.

A Content Consumer Actor grouped with the XDS Document Source Actor may
query the Document Registry about a document from which discrete data
was previously imported in order to find out if this previously imported
document may have been replaced or has received an addendum.

### 3.1.5 Serializing FHIR Documents

A FHIR document is a FHIR Bundle where the first entry is a FHIR
Composition and resources referenced are in the Bundle. A composition is
a coherent set of information that is a statement of healthcare
information, including clinical observations and services. A document is
an immutable set of resources with a fixed presentation that is authored
and/or attested by humans, organizations and devices.

All documents have the following structure: a Bundle of resources of
type "document" that has a Composition resource as the first resource in
the bundle, followed by a series of other resources, referenced from the
Composition resource, that provide supporting evidence for the document.
The bundle gathers all the content of the document into a single XML or
JSON document which may be signed and managed as required. Please see
<http://hl7.org/fhir/documents.html>;
[http://hl7.org/fhir/bundle.html#document](http://hl7.org/fhir/bundle.html%23document).

A Bundle of type “document” is a RESTful object that is not updated, it
is just retrievable. See <http://hl7.org/fhir/bundle.html#rest> . When a
Bundle is placed into the control of Document Sharing (e.g. XDS, MHD,
XCA, XDM, etc) it is retrieved in the Bundle form as a document given
the Document Sharing metadata. The mapping from Composition to
DocumentReference can be found in the FHIR core in both Composition and
DocumentReference. However, this mapping is only between Composition and
DocumentReference. See
<http://hl7.org/fhir/composition-mappings.html#fhirdocumentreference> ;
<http://hl7.org/fhir/documentreference-mappings.html#fhircomposition>

For a mapping between DocumentReferenece and XDS DocumentEntry
attributes see <http://hl7.org/fhir/documentreference-mappings.html#xds>

Additionally, below in table 4.1.1 is a mapping between FHIR Document
Composition elements and the XDS DocumentEntry attributes.

# 4 IHE Patient Care Coordination Bindings

This section describes how the payload used in a transaction of an IHE
profile is related to and/or constrains the data elements sent or
received in those transactions. This section is where any specific
dependencies between the content and metadata / transaction are defined.

A content integration profile can define multiple bindings. Each binding
should identify the transactions and content to which it applies.

The source for all required and optional attributes have been defined in
the bindings below. Two tables describe the XDS object
types: XDSDocumentEntry, and XDSSubmissionSet.
The definitions of the [metadata attributes is defined in ITI Volume 3:4](https://profiles.ihe.net/ITI/TF/Volume3/index.html#4), with the [optionality defined in ITI Volume 3:4.3](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.3.html#4.3)
For a mapping between DocumentReferenece and XDS DocumentEntry
attributes see <http://hl7.org/fhir/documentreference-mappings.html#xds>

## 4.1 Medical Document Binding to Document Sharing Metadata

This binding defines a transformation that generates 
[metadata for the XDSDocumentEntry and XDSSubmissionSet](https://profiles.ihe.net/ITI/TF/Volume3/index.html#4) elements of appropriate
transactions from the [Document Sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) profiles given a medical document
and information from other sources. The medical document refers to the
document being stored in a repository that will be referenced in the
registry. The other sources of information include the configuration of
the Document Source Actor, the XDS Affinity Domain, the site or
facility, local agreements, other documents in the registry/repository,
and this Content Profile. 
See [Overview of Health Document Sharing Communities](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#13-overview-of-health-document-sharing-communities)

In many cases, the [CDA/FHIR document](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#231-fhir-document-vs-cda-document) is created for the purposes of sharing
within an XDS Affinity Domain. In these cases the context of the [CDA/FHIR Document](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#231-fhir-document-vs-cda-document) and
the context of the XDS Affinity Domain are the same, in which case the
following mappings shall apply.

In other cases, the [CDA/FHIR document](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#231-fhir-document-vs-cda-document) may have been created for internal use,
and are subsequently being shared. In these cases the context of the [CDA/FHIR document](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#231-fhir-document-vs-cda-document) 
would not necessarily coincide with that of the XDS Affinity
Domain, and the mappings below would not necessarily apply.
See [Principles of IHE for Health Document sharing](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#2-principles-of-ihe-for-health-document-sharing)

Please note the specifics given in the table below.

### 4.1.1 XDSDocumentEntry Metadata

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 17%" />
<col style="width: 24%" />
<col style="width: 35%" />
</colgroup>
<thead>
<tr class="header">
<th>
<p><strong>XDSDocumentEntry Attribute</strong></p>
</th>
<th>
<p><strong>derivation comment</strong></p>
</th>
<th>
<p><strong>FHIR Document</strong></p>
</th>
<th>
<p><strong>CDA Document</strong></p>
</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>
<p>availabilityStatus</p>
</td>
<td></td>
<td>
<p>NA</p>
</td>
<td></td>
</tr>
<tr class="even">
<td>
<p>authorInstitution</p>
</td>
<td></td>
<td>
<p>R2 Composition. author where the Reference is to an Organization</p>
</td>
<td>
<p>$inst &lt;= /ClinicalDocument/author<br />
/assignedAuthor<br />
/representedOrganization<br />
<br />
The authorInstitution can be formated<br />
using the following XPath expression, where $inst in the expression
below represents the representedOrganization.<br />
concat($inst/name)</p>
</td>
</tr>
<tr class="odd">
<td>
<p>authorPerson</p>
</td>
<td></td>
<td>
<p>R2 Composition.author where the Reference is to a Practitioner,
Device, or Patient</p>
</td>
<td>
<p>$person &lt;= /ClinicalDocument/author<br />
<br />
The author can be formatted using the following XPath expression, where
$person in the expression below represents the author.<br />
concat(<br />
$person/id/@extension,"^",<br />
$person/assignedPerson/name/family,"^",<br />
$person/assignedPerson/name/given[1],"^",<br />
$person/assignedPerson/name/given[2],"^",<br />
$person/assignedPerson/name/suffix,"^",<br />
$person/assignedPerson/name/prefix,"^",<br />
"^^^&amp;", $person/id/@root,"&amp;ISO")</p>
</td>
</tr>
<tr class="even">
<td>
<p>authorRole</p>
</td>
<td>
<p>This metadata element should be based on a mapping of the
participation function defined in the document to the set of author
roles configured for the affinity domain.</p>
</td>
<td>
<p>R2 Composition.author where the Reference is to a
PractitionerRole</p>
</td>
<td>
<p>If the context of the CDA coincides with that of the affinity domain,
then the following x-path may be appropriate:<br />
/ClincicalDocument/author/<br />
participationFunction</p>
</td>
</tr>
<tr class="odd">
<td>
<p>authorSpecialty</p>
</td>
<td>
<p>This metadata element should be based on a mapping of the code
associated with the author to detailed defined classification system for
healthcare providers such configured in the affinitity domain. Possible
classifications include those found in SNOMED-CT, or the HIPAA
Healthcare Provider Taxonomy.</p>
</td>
<td>
<p>R2 Composition.author where the Reference is a PractitionerRole use
the PractitionerRole.speciality</p>
</td>
<td>
<p>If the context of the CDA coincides with that of the affinity domain,
then the following x-path may be appropriate:<br />
/ClinicalDocument/author/<br />
assignedAuthor/code</p>
</td>
</tr>
<tr class="even">
<td>
<p>classCode</p>
</td>
<td>
<p>Derived from a mapping to an Affinity Domain specified coded value to
use and coding system. Affinity Domains are encouraged to use the
appropriate value for Type of Service, based on the LOINC Type of
Service (see Page 53 of the LOINC User's Manual).</p>
</td>
<td>
<p>Must be consistent with Composition.category</p>
</td>
<td>
<p>Must be consistent with /ClinicalDocument/code/@code</p>
</td>
</tr>
<tr class="odd">
<td>
<p>classCodeDisplayName</p>
</td>
<td>
<p>DisplayName of the classCode derived appropriate Display Name based
on the Type of Service.</p>
</td>
<td>
<p>Must be consistent with Composition.category</p>
</td>
<td>
<p>Must be consistent with /ClinicalDocument/code/@code</p>
</td>
</tr>
<tr class="even">
<td>
<p>confidentialityCode</p>
</td>
<td>
<p>Derived from a mapping of the document confidentialityCode and other
security labels to Affinity Domain specified coded values and coding
system.</p>
</td>
<td>
<p>Derived from Composition.confidentiality,
Composition.meta.security</p>
</td>
<td>
<p>/ClinicalDocument/<br />
confidentialityCode/@code<br />
-AND/OR-<br />
/ClinicalDocument/authorization/<br />
consent[<br />
templateId/@root=<br />
'1.3.6.1.4.1.19376.1.5.3.1.2.5'<br />
] /code/@code</p>
</td>
</tr>
<tr class="odd">
<td>
<p>comments</p>
</td>
<td>
<p>There is no well-known element in a document to derive a simple
comment.</p>
</td>
<td>
<p>O</p>
</td>
<td></td>
</tr>
<tr class="even">
<td>
<p>creationTime</p>
</td>
<td>
<p>Times specified in clinical documents may be specified with a
precision in fractional sections, and may contain a time zone offset. In
the XDS Metadata, it can be precise to the second, and is always given
in UTC, so the timezone offset if present must be added to the current
time to obtain the UTC time.</p>
</td>
<td>
<p>Composition.date</p>
</td>
<td>
<p>/ClinicalDocument/effectiveTime</p>
</td>
</tr>
<tr class="odd">
<td>
<p>entryUUID</p>
</td>
<td>
<p>This element identifies the Document Entry, not the document.</p>
</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>
<p>eventCodeList</p>
</td>
<td>
<p>These values express a collection of keywords that may be relevant to
the consumer of the documents in the registry. They may come from
anywhere in the document, according to its purpose.</p>
</td>
<td>
<p>Composition.event</p>
</td>
<td>
<p>They may come from anywhere in the CDA document, according to its
purpose.</p>
</td>
</tr>
<tr class="odd">
<td>
<p>eventCodeDisplayNameList</p>
</td>
<td>
<p>These are the display names for the collection of keywords described
above.</p>
</td>
<td>
<p>R(if event<br />
Code is valued) Composition.event</p>
</td>
<td>
<p>These are the display names for the collection of keywords described
above.</p>
</td>
</tr>
<tr class="even">
<td>
<p>formatCode</p>
</td>
<td>
<p>The format code for each PCC Document content profile is provided
within the document specifications.</p>
</td>
<td>
<p>Bundle.meta.profile</p>
</td>
<td>
<p>The format code for each PCC Document content profile is provided
within the document specifications.</p>
<p>Usually related to the CDA template id.</p>
</td>
</tr>
<tr class="odd">
<td>
<p>healthcareFacilityTypeCode</p>
</td>
<td>
<p>A fixed value assigned to the Document Source and configured form a
set of Affinity Domain defined values. Usually from a mapping to an
Affinity Domain specific ValueSet.</p>
</td>
<td>
<p>May be derived from Composition.author where the Reference is to an
Organization</p>
<p>Composition.author where</p>
</td>
<td>
<p>Must be consistent with /clinicalDocument/code</p>
</td>
</tr>
<tr class="even">
<td>
<p>healthcareFacility<br />
TypeCodeDisplay<br />
Name</p>
</td>
<td>
<p>The display name for the healthcare facility type code indicated
above.</p>
</td>
<td>
<p>May be derived from Composition.author where the Reference is to an
Organization</p>
</td>
<td>
<p>Must be consistent with /clinicalDocument/code</p>
</td>
</tr>
<tr class="odd">
<td>
<p>languageCode</p>
</td>
<td>
<p>The human language of the narrative within the document</p>
</td>
<td>
<p>Composition.meta. language</p>
</td>
<td>
<p>/ClinicalDocument/languageCode</p>
</td>
</tr>
<tr class="even">
<td>
<p>legalAuthenticator</p>
</td>
<td></td>
<td>
<p>Composition.attester</p>
</td>
<td>
<p>$person &lt;= /ClinicalDocument/<br />
legalAuthenticator</p>
<p>The legalAuthenticator can be formatted using the following XPath
expression, where $person in the expression below represents the
legalAuthenticator.<br />
concat(<br />
$person/id/@extension,"^",<br />
$person/assignedPerson/name/family,"^",<br />
$person/assignedPerson/name/given[1],"^",<br />
$person/assignedPerson/name/given[2],"^",<br />
$person/assignedPerson/name/suffix,"^",<br />
$person/assignedPerson/name/prefix,"^",<br />
"^^^&amp;", $person/id/@root,"&amp;ISO")</p>
</td>
</tr>
<tr class="odd">
<td>
<p>mimeType</p>
</td>
<td>
<p>The mime type of the document.</p>
</td>
<td>
<p>see <a
href="http://hl7.org/fhir/http.html#mime-type">http://hl7.org/fhir/http.html#mime-type</a></p>
</td>
<td>
<p>text/xml</p>
</td>
</tr>
<tr class="even">
<td>
<p>patientId</p>
</td>
<td>
<p>The XDS Affinity Domain patient ID can be mapped from the patient
identity in the document by using transactions from the ITI patient
identity profiles.</p>
<p>See sourcePatientId below.</p>
</td>
<td>
<p>Composition.subject</p>
</td>
<td>
<p>$patID &lt;= /ClinicalDocument/recordTarget/<br />
patientRole/id</p>
</td>
</tr>
<tr class="odd">
<td>
<p>practiceSettingCode</p>
</td>
<td>
<p>This elements should be based on an Affinity Domain managed ValueSet
of coarse classification system for the class of specialty practice.
Recommend the use of the classification system for Practice Setting,
such as that described by the Subject Matter Domain in LOINC.</p>
</td>
<td>
<p>May be derived from Composition.author where the Reference is to an
Organization</p>
</td>
<td></td>
</tr>
<tr class="even">
<td>
<p>practiceSettingCodeDisplayName</p>
</td>
<td>
<p>This element shall contain the display names associated with the
codes described above.</p>
</td>
<td>
<p>May be derived from Composition.author where the Reference is to an
Organization</p>
</td>
<td></td>
</tr>
<tr class="odd">
<td>
<p>serviceStartTime</p>
</td>
<td>
<p>Times specified in clinical documents may be specified with a
precision in fractional sections, and may contain a time zone offset. In
the XDS Metadata, it can be precise to the second, and is always given
in UTC, so the timezone offset if present must be added to the current
time to obtain the UTC time.</p>
</td>
<td>
<p>R2 Composition.event.period</p>
</td>
<td>
<p>/ClinicalDocument/documentationOf/<br />
serviceEvent/effectiveTime/low/<br />
@value</p>
</td>
</tr>
<tr class="even">
<td>
<p>serviceStopTime</p>
</td>
<td>
<p>Times specified in clinical documents may be specified with a
precision in fractional sections, and may contain a time zone offset. In
the XDS Metadata, it can be precise to the second, and is always given
in UTC, so the timezone offset if present must be added to the current
time to obtain the UTC time.</p>
</td>
<td>
<p>R2 Composition.event.period</p>
</td>
<td>
<p>/ClinicalDocument/documentationOf/<br />
serviceEvent/effectiveTime/high/<br />
@value</p>
</td>
</tr>
<tr class="odd">
<td>
<p>sourcePatientId</p>
</td>
<td>
<p>This element contains the patient id as is known in the source
domain.</p>
</td>
<td>
<p>Composition.subject</p>
</td>
<td>
<p>$patID &lt;= /ClinicalDocument/recordTarget/<br />
patientRole/id</p>
<p>The patientId can be formatted using the following XPath expression,
where $patID in the expression below represents the appropriate
identifier.<br />
concat($patID/@extension,"^^^&amp;", $patID/@root, "&amp;ISO")</p>
</td>
</tr>
<tr class="even">
<td>
<p>sourcePatientInfo</p>
</td>
<td>
<p>The sourcePatientInfo metadata element can be assembled from various
components of the patientRole element in the clinical document.</p>
</td>
<td>
<p>Composition.subject</p>
</td>
<td>
<p>/ClinicalDocument/recordTarget/<br />
patientRole</p>
</td>
</tr>
<tr class="odd">
<td>
<p>title</p>
</td>
<td>
<p>/ClinicalDocument/title</p>
</td>
<td>
<p>Composition.title</p>
</td>
<td>
<p>/ClinicalDocument/title</p>
</td>
</tr>
<tr class="even">
<td>
<p>typeCode</p>
</td>
<td>
<p>The typeCode should be mapped to an Affinity Domain managed ValueSet
of document type codes. One suggested coding system to use for typeCode
is LOINC, in which case the mapping step can be omitted.</p>
</td>
<td>
<p>Composition.type</p>
</td>
<td>
<p>/ClinicalDocument/code/@code</p>
</td>
</tr>
<tr class="odd">
<td>
<p>typeCodeDisplay<br />
Name</p>
</td>
<td>
<p>The display name of the typeCode above.</p>
</td>
<td>
<p>Composition.type</p>
</td>
<td>
<p>/ClinicalDocument/code/@displayName</p>
</td>
</tr>
<tr class="even">
<td>
<p>uniqueId</p>
</td>
<td>
<p>The uniqueId is the unique id within the document.</p>
</td>
<td>
<p>Composition.identifier</p>

<p>or</p>

<p>Composition.id if no business identifier given</p>
</td>
<td>
<p>$docID &lt;= /ClinicalDocument/id</p>
<p>The uniqueId can be formatted using the following XPath expression,
where $docID in the expression below represents the identifier.<br />
concat($docID/@root,"^", $docID/@extension)</p>
</td>
</tr>
</tbody>
</table>

#### 4.1.1.1 XDSSubmissionSet Metadata

The submission set metadata is as defined for XDS, and is not
necessarily affected by the content of the clinical document. Metadata
values in an XDSSubmissionSet with names identical to those in the
XDSDocumentEntry may be inherited from XDSDocumentEntry metadata, but
this is left to XDS Affinity Domain policy and/or application
configuration.

For XDR and XDM the XDS Submission Set intendedRecipient attribute may
be populated as specified in the table below.

| XDSSubmissionSet Attribute | FHIR Document | Source/ Value |
|----------------------------|---------------|---------------|
| intendedRecipient | NA | \$person <= /ClinicalDocument/intendedRecipient<br />and/or<br />\$inst <= /ClinicalDocument/intendedRecipient/receivedOrganization
{: .grid}

#### 4.1.1.2 Use of XDS Submission Set

This content format uses the XDS Submission Set to create a package of
information to send from one provider to another. All documents
referenced by the Medical Summary in this Package must be in the
submission set.

#### 4.1.1.3 Use of XDS Folders

No specific requirements identified.

#### 4.1.1.4 Configuration

IHE Content Profiles using this binding require that Content Creators
and Content Consumers be configurable with institution and other
specific attributes or parameters. Implementers should be aware of these
requirements to make such attributes easily configurable. There shall be
a mechanism for the publishing and distribution of style sheets used to
view clinical documents.
