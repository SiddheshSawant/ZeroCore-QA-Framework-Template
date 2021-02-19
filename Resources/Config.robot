*** Settings ***




*** Keywords ***
Open Headless Firefox
   ${firefox_options}=      Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()   sys, selenium.webdriver
    Call Method    ${firefox_options}   add_argument    --headless
    Create Webdriver        Firefox     firefox_options=${firefox_options}
    Set Global Variable  ${Browser}     Firefox

    Set Window Size             1440    860                 # Used for headless chrome browser which doesn't get maximized till this resolution

    Go To                       ${URL.${ENV}}
    Sleep                       2s

    Common.Verify & Close Cookie Policy Bar                        # Comman case to verify and close Policy bar

Open Headless Chrome
    ${chrome_options}=      Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Create Webdriver        Chrome      chrome_options=${chrome_options}
    Set Global Variable  ${Browser}     Chrome

    Set Window Size             1440    860                 # Used for headless chrome browser which doesn't get maximized till this resolution
#    Clear Browser Cache
    Go To                       ${URL.${ENV}}
    Sleep                       2s

    Common.Verify & Close Cookie Policy Bar                        # Comman case to verify and close Policy bar

Clear Browser Cache                                                # Clear Browser Cache for Chrome
    Sleep               1s
    Go To               chrome://settings/clearBrowserData
    Sleep              2s
    Capture Page Screenshot
    Press Keys          None   Enter
    Sleep              1s
    Capture Page Screenshot

Get Unique String
    ${Current DateTime}=    Get Current Date    result_format=%Y%m%d%H%M%S
    Log    ${Current DateTime}
    Set Global Variable  ${Current DateTime}

Launch Website in the Browser
    Launch Browser                          # Keyword/Function created below
    Maximize Launced Browser
    Open Website URL
    # TODO: Example - Putting any message after Keyword/Test Case execution using 'Comment'
    Comment         PASS: Website Opened!

########################################################################################################################

# Small fuctions(keywords) created to use directly

Launch Browser
    Open Browser                about:blank     ${BROWSER}

Maximize Launced Browser
    Maximize Browser Window
    Set Window Size             1440    860
Open Website URL
    Go To                       ${URL.${ENV}}
    Sleep                       2s

Close The Browser
    Sleep                       2s
    Close All Browsers


