*** Settings ***
#Library                         Selenium2Library
#Resource                        ../Resources/Config.robot


*** Variables ***
${Logo Locator}                 xpath=//*[@id="main-header"]/div/a
${Logo Alt Text}                Raw Engineering
${Logo Hyperlink}               ${URL.${ENV}}

${What We Do Link Locator}      xpath=/html/body/div[1]/div[1]/div/header/*//a[@href="/services"]
${What We Do Link Text}         WHAT WE DO
${What We Do Link Hyperlink}    ${URL.${ENV}}services
${What We Do Link Target}       ${Empty}

${Our Work Link Locator}        xpath=/html/body/div[1]/div[1]/div/header/*//a[@href="/work"]
${Our Work Link Text}           OUR WORK
${Our Work Link Hyperlink}      ${URL.${ENV}}work
${Our Work Link Target}

${Who We Are Link Locator}      xpath=/html/body/div[1]/div[1]/div/header/*//a[@href="/who-we-are"]
${Who We Are Link Text}         WHO WE ARE
${Who We Are Link Hyperlink}    ${URL.${ENV}}who-we-are
${Who We Are Link Target}

${Blog Link Locator}            xpath=/html/body/div[1]/div[1]/div/header/*//a[@href="/blog"]
${Blog Link Text}               BLOG
${Blog Link Hyperlink}          ${URL.${ENV}}blog
${Blog Link Target}

${Careers Link Locator}         xpath=/html/body/div[1]/div[1]/div/header/*//a[@href="/careers"]
${Careers Link Text}            CAREERS
${Careers Link Hyperlink}       ${URL.${ENV}}careers
${Careers Link Target}

${Contact Button Locator}       xpath=/html/body/div[1]/div[1]/div/header/*//nav/div//a[@href="/contact-us"]
${Contact Button Text}          CONTACT
${Contact Button Hyperlink}     ${URL.${ENV}}contact-us
${Contact Button Target}


*** Keywords ***
Verify Website Logo
    Click Image                 Raw Engineering
    Sleep                       1s
    Location Should Be          ${URL.${ENV}}

Verify Header Navs
    # TODO: Example - Calling Keywords in Keyword
    Check Logo
    Check Nav Links
    Scroll To Bottom
#    Log To Console              \nHeader Section Verified.


########################################################################################################################


Check Logo
    # TODO: Example - Calling manually created Keyword-Functions
    Functions.Verify The Image          ${Logo Locator}           ${Logo Alt Text}     ${Logo Hyperlink}
    Functions.Click The Image           ${Logo Locator}           ${Logo Alt Text}     ${Logo Hyperlink}

Check Nav Links
#   Functions.Verify The Link           ${What We Do Link Locator}  ${What We Do Link Text}  ${What We Do Link Hyperlink}  ${What We Do Link Target}
    Functions.Verify The Link           ${Our Work Link Locator}    ${Our Work Link Text}    ${Our Work Link Hyperlink}    ${Our Work Link Target}
    Functions.Verify The Link           ${Who We Are Link Locator}    ${Who We Are Link Text}    ${Who We Are Link Hyperlink}    ${Who We Are Link Target}
    Functions.Verify The Link           ${Blog Link Locator}    ${Blog Link Text}    ${Blog Link Hyperlink}    ${Blog Link Target}
    Functions.Verify The Link           ${Careers Link Locator}    ${Careers Link Text}    ${Careers Link Hyperlink}    ${Careers Link Target}
    Functions.Verify The Link           ${Contact Button Locator}    ${Contact Button Text}    ${Contact Button Hyperlink}    ${Contact Button Target}

Scroll To Bottom
    Scroll To Element               xpath=//*[@id="gatsby-focus-wrapper"]/div/footer/div/div[1]/h2
    Sleep                           2s


*** Comments ***
    # TODO: Example - 'Run Keyword And Continue On Failure'
    Run Keyword And Continue On Failure     Scroll Element Into View        xpath=//*[@id="gatsby-focus-wrapper"]/div/footer/div/div[1]/h2
