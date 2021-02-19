*** Settings ***


*** Variables ***


*** Keywords ***
Verify Page Loaded
    [Documentation]         Verifies the page loaded for expected - Location, Title and H1 text
    [Arguments]             ${Page Location}   ${Page Title}   ${Page H1}
    Location Should Be      ${Page Location}
    Title Should Be         ${Page Title}
    Page H1 Should Be       ${Page H1}

Page H1 Should Be
    [Documentation]         Verifies the H1 text of page loaded
    [Arguments]             ${Page H1}
    Element Text Should Be  xpath=//h1  ${Page H1}

#-----------------------------------------------------------------------------------------------------------------------

Scroll To Element
    [Documentation]         Choses the Scrolling Method depending on the Type of current browser opened
    [Arguments]             ${locator}
    Run Keyword If      '${Browser}' == 'Chrome'    Scroll Element Into View        ${locator}
    ...     ELSE IF     '${Browser}' == 'Firefox'   Scroll Element In Firefox       ${locator}
    ...     ELSE        Scroll Element In Firefox   ${locator}

Scroll Element In Firefox
    [Documentation]         Alternative for 'Scroll Element Into View' which gives error as 'Element Out Of Bounds of Viewport'
    [Arguments]             ${locator}
    ${x}=        Get Horizontal Position  ${locator}
    ${y}=        Get Vertical Position    ${locator}
    Execute Javascript  window.scrollTo(${x}, ${y})
    Sleep    2s

#-----------------------------------------------------------------------------------------------------------------------

Clear The Text
    [Documentation]         Clears the Text from given locator field
    [Arguments]             ${Locator}
    # TODO: Improve the function for ease of use.
    ${Text}=     Get Element Attribute   ${Locator}      value
    ${Text Length}=    Get Length      ${Text}
    Run Keyword If    """${Text}""" != ''           # Check If the Text value becomes empty
    ...     Repeat Keyword  ${Text Length +1}  Press Keys  ${Locator}   BACKSPACE    # Repeat the keyword to Press BACKSPACE key for ('Text Length' +1) number of times

Input The Text
    [Documentation]         Clears the Text from given locator field before Inputting newly given Text
    [Arguments]             ${Locator}          ${Text}
    # TODO: Improve the function for ease of use.
    Run Keyword And Continue On Failure     Functions.Clear The Text    ${Locator}
    Enter Text To Field     ${Locator}          ${Text}

#-----------------------------------------------------------------------------------------------------------------------

Verify The Link
    # TODO: Example - creating reusable Keyword-Function manually
    [Documentation]         Verifys the Link for given locator by checking Mouse Hover, Text, Location
    [Arguments]             ${Locator}       ${Text}       ${Hyperlink}       ${Target}
    # TODO: Improve the function for ease of use.
    Check for Mouse Hover Effect    ${Locator}
    Check for Text                  ${Locator}      ${Text}
    Check for Location              ${Locator}      href       ${Hyperlink}
    Check for Location Target       ${Locator}      target     ${Target}

Click The Link
    [Documentation]         Clicks the Link for given locator by checking Mouse Hover, Text, Location & Click
    [Arguments]             ${Locator}       ${Text}       ${Hyperlink}       ${Target}
    # TODO: Improve the function for ease of use.
#    Check for Mouse Hover Effect    ${Locator}
#    Check for Text                  ${Locator}     ${Text}
#    Check for Location              ${Locator}     href    ${Hyperlink}
#    Check for Location Target       ${Locator}     target     ${Target}
    Functions.Verify The Link   ${Locator}       ${Text}       ${Hyperlink}     ${Target}
    Set Log Level           Trace
    Check for Click Action          ${Locator}
    Run Keyword If    '${Target}' == '_blank'     Switch to Previous Tab      # Check If Target value in Hyperlink is '_blank' after clicing on the link switch back to previous tab
    Set Log Level           Info

#-----------------------------------------------------------------------------------------------------------------------

Verify The Button
    [Documentation]         Verifys the Button for given locator by checking Mouse Hover, Text, Location
    [Arguments]             ${Locator}       ${Text}       ${Hyperlink}
    # TODO: Improve the function for ease of use.
    Check for Mouse Hover Effect    ${Locator}
    Check for Text             ${Locator}     ${Text}
    Check for Location         ${Locator}     href    ${Hyperlink}

Click The Button
    [Documentation]         Clicks the Button for given locator by checking Mouse Hover, Text, Location & Click
    [Arguments]             ${Locator}       ${Text}       ${Hyperlink}
    # TODO: Improve the function for ease of use.
#    Check for Mouse Hover Effect    ${Locator}
#    Check for Text             ${Locator}     ${Text}
#    Check for Location         ${Locator}     href    ${Hyperlink}
    Functions.Verify The Button   ${Locator}       ${Text}       ${Hyperlink}
    Check for Click Action          ${Locator}

#-----------------------------------------------------------------------------------------------------------------------

Verify The Image
    [Documentation]         Verifys the Image for given locator by checking Mouse Hover, Alt Text, Location
    [Arguments]             ${Locator}       ${Alt_Text}        ${Hyperlink}
    # TODO: Improve the function for ease of use.
    Check for Mouse Hover Effect    ${Locator}
    Check for Alt Text             ${Locator}   alt        ${Alt_Text}
    Check for Location         ${Locator}       href       ${Hyperlink}

Click The Image
    [Documentation]         Clicks the Image for given locator by checking Mouse Hover, Alt Text, Location & Click
    [Arguments]             ${Locator}       ${Alt_Text}       ${Hyperlink}
    # TODO: Improve the function for ease of use.
#    Check for Mouse Hover Effect    ${Locator}
#    Check for Alt Text             ${Locator}   alt        ${Alt_Text}
#    Check for Location         ${Locator}       href       ${Hyperlink}
    Functions.Verify The Image   ${Locator}       ${Alt_Text}       ${Hyperlink}
    Check for Click Action          ${Locator}

#-----------------------------------------------------------------------------------------------------------------------
########################################################################################################################

Enter Text To Field
    [Arguments]             ${Locator}      ${Text}
    Run Keyword And Continue On Failure     Input Text              ${Locator}      ${Text}
    Sleep                   1s
Check for Mouse Hover Effect
    [Arguments]             ${Locator}
    Run Keyword And Continue On Failure     Mouse Over              ${Locator}
    Sleep                   1s
Check for Location
    [Arguments]             ${Locator}       ${href}       ${Hyperlink}
    Run Keyword And Continue On Failure     Element Attribute Value Should Be     ${Locator}     href      ${Hyperlink}
Check for Location Target
    [Arguments]             ${Locator}      ${Attribute}     ${Target}
    Run Keyword And Continue On Failure     Element Attribute Value Should Be     ${Locator}     target      ${Target}
Check for Text
    [Arguments]             ${Locator}     ${Text}
    Run Keyword And Continue On Failure     Element Text Should Be  ${Locator}     ${Text}
Check for Click Action
    [Arguments]             ${Locator}
    Run Keyword And Continue On Failure     Click Element           ${Locator}
    Sleep                   2s
Check for Alt Text
    [Arguments]             ${Locator}       ${alt}       ${Alt_Text}
    Run Keyword And Continue On Failure     Element Attribute Value Should Be     ${Locator}//img     alt      ${Alt_Text}
Switch to Previous Tab
    @{Get Tab Titles}        Get Window Titles
    Switch Window            ${Get Tab Titles}[0]
#    Close window             @{Get Tab Titles}[1]
    Sleep                    2s