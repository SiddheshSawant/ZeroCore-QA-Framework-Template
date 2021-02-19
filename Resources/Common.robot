*** Settings ***
Library                         SeleniumLibrary
Resource                        ../Resources/Config.robot
Resource                        ../Resources/Functions.robot

*** Variables ***
${Cookie Text Locator}          xpath=//*[@id="onetrust-policy-text"]
${Cookie Text Value}            We use cookies to improve your experience. By continuing to browse the site, you agree to our Cookie Policy
${Cookie Link Text}             Cookie Policy
${Cookie Policy Link}           ${URL.${ENV}}privacy-statement
${Cookie Bar Close}             xpath=//*[@id="onetrust-close-btn-container"]/button


*** Keywords ***
Start Testing
    Config.Launch Browser
    Config.Maximize Launced Browser
    Config.Open Website URL

    Verify & Close Cookie Policy Bar                                    # Keyword/Function created below

    End Testing

####################################################################################################################
Verify & Close Cookie Policy Bar
    #Element Text Should Be      ${Cookie Text Locator}     ${Cookie Text Value}
    #Verify The Link             ${Cookie Text Locator}/a   ${Cookie Link Text}   ${Cookie Policy Link}   ${Empty}
    #Mouse Down               ${Cookie Bar Close}
    #Click Element               ${Cookie Bar Close}
    Sleep                       1s
    Capture Page Screenshot
#    Click Button                id=onetrust-accept-btn-handler

End Testing
    Sleep                       2s
    Close All Browsers


