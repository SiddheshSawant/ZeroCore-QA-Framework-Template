*** Settings ***
Documentation                   To test Raw Engineering website on ${ENV}
#Library                         SeleniumLibrary

Resource                        ../Resources/Config.robot
Resource                        ../Resources/Common.robot
Resource                        ../Resources/PO/Header.robot
Resource                        ../Resources/PO/Footer.robot
Resource                        ../Resources/PO/Home.robot


#Force Tags                      Sanity
#Default Tags                    Trial

#Suite Setup                     Launch Website in the Browser
Suite Setup                     Open Headless Chrome
#Suite Setup                     Open Headless Firefox

#Test Setup                      Common.Launch Website in the Browser
#Test Teardown                   Common.End Testing
Suite Teardown                  End Testing


*** Variables ***
${BROWSER}                      Chrome
${ENV}                          Prod
&{URL}                          Prod=${Protocol}${${ENV}_Domain}  PreProd=${Protocol}%{BASIC_AUTH}${${ENV}_Domain}   Stage=${Protocol}%{BASIC_AUTH}${${ENV}_Domain}

${Protocol}                     https://
${Prod_Domain}                  www.raweng.com/
${PreProd_Domain}               pre-prod.raweng.com/
${Stage_Domain}                 staging.raweng.com/


*** Test Cases ***
Step 1 - Verify Onboarding for Website
    [Tags]                      Onboarding
    Home.Verify Website Homepage
    Home.Verify Homepage Title

Step 2 - Verify Header Section
    [Tags]                      Header
    Header.Verify Website Logo
    Header.Verify Header Navs

Step 3 - Verify Footer Section
    [Tags]                      Footer
    Footer.Scroll To Footer
    Footer.Verify Footer Elements

Step 4 - Verify Home Page
    [Tags]                      Home
    Home.Verify Page Title  #with 'If-ElseIf-Else'
    Home.Verify Banner Sectionvgi
    Home.Verify All Section Headings
    Pass Execution  Skipping this test case as it is under development
    Our Work.Verify Featured Case Studies


*** Comments ***
