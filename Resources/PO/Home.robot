*** Settings ***
#Library                         Selenium2Library

*** Variables ***
${Logo Locator}                 xpath=//*[@id="main-header"]/div/a
${Logo Alt Text}                Raw Engineering
${Logo Hyperlink}               ${URL.${ENV}}

${What We Do Link Locator}      xpath=//*[@id="main-header"]/div/nav/ul/li[2]/a
${What We Do Link Text}         WHAT WE DO
${What We Do Link Hyperlink}    ${URL.${ENV}}services
${What We Do Link Target}       ${Empty}

${Our Work Link Locator}        xpath=//*[@id="main-header"]/div/nav/ul/li[3]/a
${Our Work Link Text}           OUR WORK
${Our Work Link Hyperlink}      ${URL.${ENV}}work
${Our Work Link Target}

${Miami Locator}                xpath=//*[@id="gatsby-focus-wrapper"]/div/div/main/section/div/div/div/div/div[1]/div/a
${Miami Alt Text}               Miami Heat App screenshots
${Miami Hyperlink}              ${Protocol}${${ENV} Domain}miami-heat-case-study

${Contact Button Locator}       xpath=//*[@id="main-header"]/div/nav/div[1]/a
${Contact Button Text}          CONTACT
${Contact Button Hyperlink}     ${Protocol}${${ENV} Domain}contact-us



*** Keywords ***
Verify Site URL
    Location Should Be          ${URL.${ENV}}
    Log Location
#    Log To Console              \nSite URL Verified

Verify Homepage Title
    Title Should Be             Raw Engineering: Digital Transformation
    Log Title
#    Log To Console              Page Title Verified

########################################################################################################################

Verify Page Title  #with 'If-ElseIf-Else'
    # TODO: Example of 'IF-ELSE IF-ELSE'
    ${Title}     Get Title

    Set Log Level       Trace
    Run Keyword If      '${Title}' == 'Raw Engineering: Digital Transformation'    Keyword 1
    ...     ELSE IF     '${Title}' == 'Raw Engineering: Contact Us'     Keyword 2
    ...     ELSE        Keyword 3
    Set Log Level       Info
#    Log To Console      \nPage Title Verified with 'IF-ELSE IF-ELSE'.

Keyword 1
    Log     Correct Title in 'IF' case, so Keyword 1 is executed.
Keyword 2
    Log     Correct Title in 'ELSE IF' case, so Keyword 2 is executed.
Keyword 3
    Log     No match found for Title, so 'ELSE' case is executed.
#    comment


Verify Banner Section
    Check Header
    Check Description
    Check Image

Check Header
#    Highlight Element           xpath=//h1
    Sleep   2s
    Element Text Should Be      xpath=//h1    Fast Track Innovation From Vision to Reality

Check Description
    Element Text Should Be      xpath=//*[@id="gatsby-focus-wrapper"]/div/div/div/div[1]//p    Raw Engineering’s experienced Strategic Consultants, Solutions Architects, Designers, and Developers turn Business Vision into Digital Reality.

Check Image
    Page Should Contain Image   Hero Image: City at night with blurred lights


Verify All Section Headings
    Wait Until Page Contains    Digital Transformation: Building the Modern Microservices Stack
    Wait Until Page Contains    Headless CMS Strategy & Implementation
    Wait Until Page Contains    Custom Mobile, Web & Product Development
    Wait Until Page Contains    DevOps & Cloud Management
    Wait Until Page Contains    LATEST WORK
    Wait Until Page Contains    TESTIMONIALS
    ${Page Links Count}  Get Element Count  xpath=//a
    Get All Links


*** Comments ***
Enter Basic Auth Details
    # TODO: Work on Basic Auth's Alert message confirmation
    Sleep                       2s
    Alert Should Be Present     Sign in

    Click Button  Confirm
