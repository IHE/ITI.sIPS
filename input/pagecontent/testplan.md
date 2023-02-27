<div markdown="1" class="stu-note">

This Test Plan page is a prototype.   We expect the maturity of the content will improve over time.  For now, we summarize high level testing scope and available tools. Comments are welcome.
</div>

The Test Plan builds upon quality testing of Document Sharing, and IPS Content. This Test plan focuses on the intersection between IPS and the Document Sharing Implementation Guides.

## Introduction

Given that IPS has test plans, test procedures, test tools, and examples;

And that Document Sharing has test plans, test procedures, test tools, and examples;

When IPS is communicated using Document Sharing

Then the interaction between Document Sharing and IPS shall follow the aIPS Implementation Guide.

### Unit Test Procedure

#### IPS

##### Content Creator

When an IPS is created by a Content Creator, then it shall comply with the IPS specification and be tested with the IPS tests

##### Content Consumer

The Content Consumer shall be able to consume without failure an IPS Document conforming with the IPS specification and be tested with the IPS tests. The Content Consumer shall be robust to IPS Document content that deviates from the IPS specification.

#### Document Sharing

When an IPS is communicated by a Content Creator, then the communications shall comply with the Document Sharing specifications and be tested with the IHE Document Sharing tests.

### Integration Test Procedure

Based on the IHE Integration Statement for the System Under Test (SUT), the integration between the IPS and Document Sharing shall be tested.

#### Content Creator

Content Creator shall be able to show sharing using all of the Document Sharing methods claimed as grouped with the Content Consumer.

#### Content Consumer

Content Consumer shall be able to consume IPS content shared using all of the Document Sharing methods claimed as grouped with the Content Consumer.

