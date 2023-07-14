# IHE Transactions 

This section defines each IHE transaction in detail, specifying the
standards used, and the information transferred.

## Document Sharing \[PCC-1\]

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

1)  The Content Creator SHALL create the document according to the
    content profile that is specified by the actor in the profile where
    it is used.

2)  The content SHALL be shared using appropriate actors from the IHE
    profile it is grouped with as described above.

**<u>Content Consumer Expected Actions</u>**

1)  The Content Consumer SHALL be able access documents using
    appropriate actors from the IHE profile it is grouped with as
    described above.

2)  The Content Consumer SHALL support processing of the document as
    needed by the profile.

3)  The Content Consumer options below MAY be referenced by profiles
    where this transaction is used to provide specific processing
    requirements.

### View Option 

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

### Document Import Option

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

### Section Import Option

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

### Discrete Data Import Option

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

## Serializing FHIR Documents

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

# IHE Patient Care Coordination Bindings

This section describes how the payload used in a transaction of an IHE
profile is related to and/or constrains the data elements sent or
received in those transactions. This section is where any specific
dependencies between the content and transaction are defined.

A content integration profile can define multiple bindings. Each binding
should identify the transactions and content to which it applies.

The source for all required and optional attributes have been defined in
the bindings below. Three tables describe the three main XDS object
types: XDSDocumentEntry, XDSSubmissionSet, and XDSFolder.
XDSSubmissionSet and XDSDocumentEntry are required. Use of XDSFolder is
optional. These concepts are universal to XDS, XDR and XDM.

The columns of the following tables are:

- **\<XXX\> attribute** – name of an XDS attribute, followed by any
  discussion of the binding detail.

- **Optional?** - Indicates the required status of the XDS attribute,
  and is one of R, R2, or O (optional). This column is filled with the
  values specified in the XDS Profile as a convenience.

- **Source Type** – Will contain one of the following values:

| Source Type | Description                                                                                                                                                                                                                                                                                                                                             |     |
|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----|
| SA          | Source document Attribute – value is copied directly from source document. The Source/Value column identifies where in the source document this attribute comes from. Specify the location in XPath when possible.                                                                                                                                      |     |
| SAT         | Source document Attribute with Transformation – value is copied from source document and transformed. The Source/Value column identifies where in the source document this attribute comes from. Specify the location in XPath when possible. Extended Discussion column must not be empty and the transform must be defined in the extended discussion |     |
| FM          | Fixed (constant) by Mapping - for all source documents. Source/Value column contains the value to be used in all documents.                                                                                                                                                                                                                             |     |
| FAD         | Fixed by Affinity Domain – value configured into Affinity Domain, all documents will use this value.                                                                                                                                                                                                                                                    |     |
| CAD         | Coded in Affinity Domain – a list of acceptable codes are to be configured into Affinity Domain. The value for this attribute shall be taken from this list.                                                                                                                                                                                            |     |
| CADT        | Coded in Affinity Domain with Transform - a list of acceptable codes are to be configured into Affinity Domain. The value for this attribute shall be taken from this list.                                                                                                                                                                             |     |
| n/a         | Not Applicable – may be used with an optionality R2 or O attribute to indicate it is not to be used.                                                                                                                                                                                                                                                    |     |
| DS          | Document Source – value comes from the Document Source Actor. Use Source/Value column or Extended Discussion to give details.                                                                                                                                                                                                                           |     |
| O           | Other – Extended Discussion must be 'yes' and details given in an Extended Discussion.                                                                                                                                                                                                                                                                  |     |

- **Source/Value** – This column indicates the source or the value used.

The following tables are intended to be summaries of the mapping and
transforms. The accompanying sections labeled 'Extended Discussion' are
to contain the details as necessary.

## Medical Document Binding to XDS, XDM and XDR

This binding defines a transformation that generates metadata for the
XDSDocumentEntry and XDSSubmissionSet elements of appropriate
transactions from the XDS, XDM and XDR profiles given a medical document
and information from other sources. The medical document refers to the
document being stored in a repository that will be referenced in the
registry. The other sources of information include the configuration of
the Document Source Actor, the XDS Affinity Domain, the site or
facility, local agreements, other documents in the registry/repository,
and this Content Profile.

In many cases, the CDA document is created for the purposes of sharing
within an XDS Affinity Domain. In these cases the context of the CDA and
the context of the XDS Affinity Domain are the same, in which case the
following mappings shall apply.

In other cases, the CDA document may have been created for internal use,
and are subsequently being shared. In these cases the context of the CDA
document would not necessarily coincide with that of the XDS Affinity
Domain, and the mappings below would not necessarily apply.

Please note the specifics given in the table below.

### XDSDocumentEntry Metadata

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 17%" />
<col style="width: 24%" />
<col style="width: 35%" />
</colgroup>
<thead>
<tr class="header">
<th><blockquote>
<p><strong>XDSDocumentEntry Attribute</strong></p>
</blockquote></th>
<th><blockquote>
<p><strong>derivation comment</strong></p>
</blockquote></th>
<th><blockquote>
<p><strong>FHIR Document</strong></p>
</blockquote></th>
<th><blockquote>
<p><strong>CDA Document</strong></p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><blockquote>
<p>availabilityStatus</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>R NA</p>
</blockquote></td>
<td></td>
</tr>
<tr class="even">
<td><blockquote>
<p>authorInstitution</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>R2 Composition. author where the Reference is to an Organization</p>
</blockquote></td>
<td><blockquote>
<p>$inst &lt;= /ClinicalDocument/author<br />
/assignedAuthor<br />
/representedOrganization<br />
<br />
The authorInstitution can be formated<br />
using the following XPath expression, where $inst in the expression
below represents the representedOrganization.<br />
concat($inst/name)</p>
</blockquote></td>
</tr>
<tr class="odd">
<td><blockquote>
<p>authorPerson</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>R2 Composition.author where the Reference is to a Practitioner,
Device, or Patient</p>
</blockquote></td>
<td><blockquote>
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
</blockquote></td>
</tr>
<tr class="even">
<td><blockquote>
<p>authorRole</p>
</blockquote></td>
<td><blockquote>
<p>This metadata element should be based on a mapping of the
participation function defined in the document to the set of author
roles configured for the affinity domain.</p>
</blockquote></td>
<td><blockquote>
<p>R2 Composition.author where the Reference is to a
PractitionerRole</p>
</blockquote></td>
<td><blockquote>
<p>If the context of the CDA coincides with that of the affinity domain,
then the following x-path may be appropriate:<br />
/ClincicalDocument/author/<br />
participationFunction</p>
</blockquote></td>
</tr>
<tr class="odd">
<td><blockquote>
<p>authorSpecialty</p>
</blockquote></td>
<td><blockquote>
<p>This metadata element should be based on a mapping of the code
associated with the author to detailed defined classification system for
healthcare providers such configured in the affinitity domain. Possible
classifications include those found in SNOMED-CT, or the HIPAA
Healthcare Provider Taxonomy.</p>
</blockquote></td>
<td><blockquote>
<p>R2 Composition.author where the Reference is a PractitionerRole use
the PractitionerRole.speciality</p>
</blockquote></td>
<td><blockquote>
<p>If the context of the CDA coincides with that of the affinity domain,
then the following x-path may be appropriate:<br />
/ClinicalDocument/author/<br />
assignedAuthor/code</p>
</blockquote></td>
</tr>
<tr class="even">
<td><blockquote>
<p>classCode</p>
</blockquote></td>
<td><blockquote>
<p>Derived from a mapping to an Affinity Domain specified coded value to
use and coding system. Affinity Domains are encouraged to use the
appropriate value for Type of Service, based on the LOINC Type of
Service (see Page 53 of the LOINC User's Manual).</p>
</blockquote></td>
<td><blockquote>
<p>R Must be consistent with Composition.category</p>
</blockquote></td>
<td><blockquote>
<p>Must be consistent with /ClinicalDocument/code/@code</p>
</blockquote></td>
</tr>
<tr class="odd">
<td><blockquote>
<p>classCodeDisplayName</p>
</blockquote></td>
<td><blockquote>
<p>DisplayName of the classCode derived appropriate Display Name based
on the Type of Service.</p>
</blockquote></td>
<td><blockquote>
<p>R Must be consistent with Composition.category</p>
</blockquote></td>
<td><blockquote>
<p>Must be consistent with /ClinicalDocument/code/@code</p>
</blockquote></td>
</tr>
<tr class="even">
<td><blockquote>
<p>confidentialityCode</p>
</blockquote></td>
<td><blockquote>
<p>Derived from a mapping of the document confidentialityCode and other
security labels to Affinity Domain specified coded values and coding
system.</p>
</blockquote></td>
<td><blockquote>
<p>R Derived from Composition.confidentiality,
Composition.meta.security</p>
</blockquote></td>
<td><blockquote>
<p>/ClinicalDocument/<br />
confidentialityCode/@code<br />
-AND/OR-<br />
/ClinicalDocument/authorization/<br />
consent[<br />
templateId/@root=<br />
'1.3.6.1.4.1.19376.1.5.3.1.2.5'<br />
] /code/@code</p>
</blockquote></td>
</tr>
<tr class="odd">
<td><blockquote>
<p>comments</p>
</blockquote></td>
<td><blockquote>
<p>There is no well-known element in a document to derive a simple
comment.</p>
</blockquote></td>
<td><blockquote>
<p>O</p>
</blockquote></td>
<td></td>
</tr>
<tr class="even">
<td><blockquote>
<p>creationTime</p>
</blockquote></td>
<td><blockquote>
<p>Times specified in clinical documents may be specified with a
precision in fractional sections, and may contain a time zone offset. In
the XDS Metadata, it can be precise to the second, and is always given
in UTC, so the timezone offset if present must be added to the current
time to obtain the UTC time.</p>
</blockquote></td>
<td><blockquote>
<p>R Composition.date</p>
</blockquote></td>
<td><blockquote>
<p>/ClinicalDocument/effectiveTime</p>
</blockquote></td>
</tr>
<tr class="odd">
<td><blockquote>
<p>entryUUID</p>
</blockquote></td>
<td><blockquote>
<p>This element identifies the Document Entry, not the document.</p>
</blockquote></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td><blockquote>
<p>eventCodeList</p>
</blockquote></td>
<td><blockquote>
<p>These values express a collection of keywords that may be relevant to
the consumer of the documents in the registry. They may come from
anywhere in the document, according to its purpose.</p>
</blockquote></td>
<td><blockquote>
<p>O Composition.event</p>
</blockquote></td>
<td><blockquote>
<p>They may come from anywhere in the CDA document, according to its
purpose.</p>
</blockquote></td>
</tr>
<tr class="odd">
<td><blockquote>
<p>eventCodeDisplayNameList</p>
</blockquote></td>
<td><blockquote>
<p>These are the display names for the collection of keywords described
above.</p>
</blockquote></td>
<td><blockquote>
<p>R(if event<br />
Code is valued) Composition.event</p>
</blockquote></td>
<td><blockquote>
<p>These are the display names for the collection of keywords described
above.</p>
</blockquote></td>
</tr>
<tr class="even">
<td><blockquote>
<p>formatCode</p>
</blockquote></td>
<td><blockquote>
<p>The format code for each PCC Document content profile is provided
within the document specifications.</p>
</blockquote></td>
<td><blockquote>
<p>R Bundle.meta.profile</p>
</blockquote></td>
<td><blockquote>
<p>The format code for each PCC Document content profile is provided
within the document specifications.</p>
<p>Usually related to the CDA template id.</p>
</blockquote></td>
</tr>
<tr class="odd">
<td><blockquote>
<p>healthcareFacilityTypeCode</p>
</blockquote></td>
<td><blockquote>
<p>A fixed value assigned to the Document Source and configured form a
set of Affinity Domain defined values. Usually from a mapping to an
Affinity Domain specific ValueSet.</p>
</blockquote></td>
<td><blockquote>
<p>May be derived from Composition.author where the Reference is to an
Organization</p>
<p>Composition.author where</p>
</blockquote></td>
<td><blockquote>
<p>Must be consistent with /clinicalDocument/code</p>
</blockquote></td>
</tr>
<tr class="even">
<td><blockquote>
<p>healthcareFacility<br />
TypeCodeDisplay<br />
Name</p>
</blockquote></td>
<td><blockquote>
<p>The display name for the healthcare facility type code indicated
above.</p>
</blockquote></td>
<td><blockquote>
<p>May be derived from Composition.author where the Reference is to an
Organization</p>
</blockquote></td>
<td><blockquote>
<p>Must be consistent with /clinicalDocument/code</p>
</blockquote></td>
</tr>
<tr class="odd">
<td><blockquote>
<p>languageCode</p>
</blockquote></td>
<td><blockquote>
<p>The human language of the narrative within the document</p>
</blockquote></td>
<td><blockquote>
<p>R Composition.meta. language</p>
</blockquote></td>
<td><blockquote>
<p>/ClinicalDocument/languageCode</p>
</blockquote></td>
</tr>
<tr class="even">
<td><blockquote>
<p>legalAuthenticator</p>
</blockquote></td>
<td></td>
<td><blockquote>
<p>O Composition.attester</p>
</blockquote></td>
<td><blockquote>
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
</blockquote></td>
</tr>
<tr class="odd">
<td><blockquote>
<p>mimeType</p>
</blockquote></td>
<td><blockquote>
<p>The mime type of the document.</p>
</blockquote></td>
<td><blockquote>
<p>R see <a
href="http://hl7.org/fhir/http.html#mime-type">http://hl7.org/fhir/http.html#mime-type</a></p>
</blockquote></td>
<td><blockquote>
<p>text/xml</p>
</blockquote></td>
</tr>
<tr class="even">
<td><blockquote>
<p>patientId</p>
</blockquote></td>
<td><blockquote>
<p>The XDS Affinity Domain patient ID can be mapped from the patient
identity in the document by using transactions from the ITI patient
identity profiles.</p>
<p>See sourcePatientId below.</p>
</blockquote></td>
<td><blockquote>
<p>R Composition.subject</p>
</blockquote></td>
<td><blockquote>
<p>$patID &lt;= /ClinicalDocument/recordTarget/<br />
patientRole/id</p>
</blockquote></td>
</tr>
<tr class="odd">
<td><blockquote>
<p>practiceSettingCode</p>
</blockquote></td>
<td><blockquote>
<p>This elements should be based on an Affinity Domain managed ValueSet
of coarse classification system for the class of specialty practice.
Recommend the use of the classification system for Practice Setting,
such as that described by the Subject Matter Domain in LOINC.</p>
</blockquote></td>
<td><blockquote>
<p>R May be derived from Composition.author where the Reference is to an
Organization</p>
</blockquote></td>
<td></td>
</tr>
<tr class="even">
<td><blockquote>
<p>practiceSettingCodeDisplayName</p>
</blockquote></td>
<td><blockquote>
<p>This element shall contain the display names associated with the
codes described above.</p>
</blockquote></td>
<td><blockquote>
<p>R May be derived from Composition.author where the Reference is to an
Organization</p>
</blockquote></td>
<td></td>
</tr>
<tr class="odd">
<td><blockquote>
<p>serviceStartTime</p>
</blockquote></td>
<td><blockquote>
<p>Times specified in clinical documents may be specified with a
precision in fractional sections, and may contain a time zone offset. In
the XDS Metadata, it can be precise to the second, and is always given
in UTC, so the timezone offset if present must be added to the current
time to obtain the UTC time.</p>
</blockquote></td>
<td><blockquote>
<p>R2 Composition.event.period</p>
</blockquote></td>
<td><blockquote>
<p>/ClinicalDocument/documentationOf/<br />
serviceEvent/effectiveTime/low/<br />
@value</p>
</blockquote></td>
</tr>
<tr class="even">
<td><blockquote>
<p>serviceStopTime</p>
</blockquote></td>
<td><blockquote>
<p>Times specified in clinical documents may be specified with a
precision in fractional sections, and may contain a time zone offset. In
the XDS Metadata, it can be precise to the second, and is always given
in UTC, so the timezone offset if present must be added to the current
time to obtain the UTC time.</p>
</blockquote></td>
<td><blockquote>
<p>R2 Composition.event.period</p>
</blockquote></td>
<td><blockquote>
<p>/ClinicalDocument/documentationOf/<br />
serviceEvent/effectiveTime/high/<br />
@value</p>
</blockquote></td>
</tr>
<tr class="odd">
<td><blockquote>
<p>sourcePatientId</p>
</blockquote></td>
<td><blockquote>
<p>This element contains the patient id as is known in the source
domain.</p>
</blockquote></td>
<td><blockquote>
<p>R Composition.subject</p>
</blockquote></td>
<td><blockquote>
<p>$patID &lt;= /ClinicalDocument/recordTarget/<br />
patientRole/id</p>
<p>The patientId can be formatted using the following XPath expression,
where $patID in the expression below represents the appropriate
identifier.<br />
concat($patID/@extension,"^^^&amp;", $patID/@root, "&amp;ISO")</p>
</blockquote></td>
</tr>
<tr class="even">
<td><blockquote>
<p>sourcePatientInfo</p>
</blockquote></td>
<td><blockquote>
<p>The sourcePatientInfo metadata element can be assembled from various
components of the patientRole element in the clinical document.</p>
</blockquote></td>
<td><blockquote>
<p>R Composition.subject</p>
</blockquote></td>
<td><blockquote>
<p>/ClinicalDocument/recordTarget/<br />
patientRole</p>
</blockquote></td>
</tr>
<tr class="odd">
<td><blockquote>
<p>title</p>
</blockquote></td>
<td><blockquote>
<p>/ClinicalDocument/title</p>
</blockquote></td>
<td><blockquote>
<p>O Composition.title</p>
</blockquote></td>
<td><blockquote>
<p>/ClinicalDocument/title</p>
</blockquote></td>
</tr>
<tr class="even">
<td><blockquote>
<p>typeCode</p>
</blockquote></td>
<td><blockquote>
<p>The typeCode should be mapped to an Affinity Domain managed ValueSet
of document type codes. One suggested coding system to use for typeCode
is LOINC, in which case the mapping step can be omitted.</p>
</blockquote></td>
<td><blockquote>
<p>R Composition.type</p>
</blockquote></td>
<td><blockquote>
<p>/ClinicalDocument/code/@code</p>
</blockquote></td>
</tr>
<tr class="odd">
<td><blockquote>
<p>typeCodeDisplay<br />
Name</p>
</blockquote></td>
<td><blockquote>
<p>The display name of the typeCode above.</p>
</blockquote></td>
<td><blockquote>
<p>R Composition.type</p>
</blockquote></td>
<td><blockquote>
<p>/ClinicalDocument/code/@displayName</p>
</blockquote></td>
</tr>
<tr class="even">
<td><blockquote>
<p>uniqueId</p>
</blockquote></td>
<td><blockquote>
<p>The uniqueId is the unique id within the document.</p>
</blockquote></td>
<td><blockquote>
<p>R Composition.identifier</p>
</blockquote>
<p>or</p>
<blockquote>
<p>Composition.id if no business identifier given</p>
</blockquote></td>
<td><blockquote>
<p>$docID &lt;= /ClinicalDocument/id</p>
<p>The uniqueId can be formatted using the following XPath expression,
where $docID in the expression below represents the identifier.<br />
concat($docID/@root,"^", $docID/@extension)</p>
</blockquote></td>
</tr>
</tbody>
</table>

#### XDSSubmissionSet Metadata

The submission set metadata is as defined for XDS, and is not
necessarily affected by the content of the clinical document. Metadata
values in an XDSSubmissionSet with names identical to those in the
XDSDocumentEntry may be inherited from XDSDocumentEntry metadata, but
this is left to XDS Affinity Domain policy and/or application
configuration.

For XDR and XDM the XDS Submission Set intendedRecipient attribute may
be populated as specified in the table below.

<table>
<colgroup>
<col style="width: 24%" />
<col style="width: 18%" />
<col style="width: 57%" />
</colgroup>
<thead>
<tr class="header">
<th>XDSSubmissionSet Attribute</th>
<th>FHIR Document</th>
<th>Source/ Value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>intendedRecipient</td>
<td>NA</td>
<td><p>$person &lt;= /ClinicalDocument/intendedRecipient<br />
and/or<br />
$inst &lt;=
/ClinicalDocument/intendedRecipient/receivedOrganization<br />
<br />
The intendedRecipient can be formatted<br />
using the following XPath expression, where $inst in the expression
below represents the receivedOrganization and where $person in the
expression below represents the intendedRecipient.<br />
concat(<br />
$person/id/@extension,"^",<br />
$person/informationRecipient/name/family,"^",<br />
$person/informationRecipient/name/given[1],"^",<br />
$person/informationRecipient/name/given[2],"^",<br />
$person/informationRecipient/name/suffix,"^",<br />
$person/informationRecipient/name/prefix,"^",<br />
"^^^&amp;", $person/id/@root,"&amp;ISO",<br />
"|"<br />
$inst/name)</p>
<p>"^^^^^&amp;",<br />
$inst/id/@root, "&amp;ISO", "^^^^", $inst/id/@extension)<br />
--&gt;</p></td>
</tr>
</tbody>
</table>

#### Use of XDS Submission Set

This content format uses the XDS Submission Set to create a package of
information to send from one provider to another. All documents
referenced by the Medical Summary in this Package must be in the
submission set.

#### Use of XDS Folders

No specific requirements identified.

#### Configuration

IHE Content Profiles using this binding require that Content Creators
and Content Consumers be configurable with institution and other
specific attributes or parameters. Implementers should be aware of these
requirements to make such attributes easily configurable. There shall be
a mechanism for the publishing and distribution of style sheets used to
view clinical documents.
