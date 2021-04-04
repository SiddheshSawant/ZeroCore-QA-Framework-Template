*** Settings ***
#Library                         Selenium2Library

*** Variables ***
${Footer Text Locator}          xpath=//*[@id="gatsby-focus-wrapper"]/div/footer/div/div[1]/h2
${Footer Text}                  Ready to get started on your next project?

${Get In Touch Locator}         //*[@id="gatsby-focus-wrapper"]/div/footer/div/div[1]/a
${Get In Touch Text}            GET IN TOUCH
${Get In Touch Hyperlink}       ${URL.${ENV}}contact-us
${Get In Touch Target}

${Privacy Locator}              //*[@id="gatsby-focus-wrapper"]/div/footer/div/div[2]/div/ul/li[1]/a
${Privacy Text}                 Privacy
${Privacy Hyperlink}            ${URL.${ENV}}privacy-statement
${Privacy Target}

${Backend Terms of Use Locator}     //*[@id="gatsby-focus-wrapper"]/div/footer/div/div[2]/div/ul/li[2]/a
${Backend Terms of Use Text}        Backend Terms of Use
${Backend Terms of Use Hyperlink}   ${URL.${ENV}}backend-terms-of-service
${Backend Terms of Use Target}

${Twitter Locator}                  //*[@id="gatsby-focus-wrapper"]/div/footer/div/div[2]/ul/li[1]/a
${Twitter Text}
${Twitter Hyperlink}                https://twitter.com/raweng
${Twitter Target}                   _blank

*** Keywords ***
Scroll To Footer
    Functions.Scroll To Element         ${Footer Text Locator}
    Sleep                               2s

Verify Footer Elements
    Element Text Should Be      ${Footer Text Locator}      ${Footer Text}

    Functions.Verify The Link   ${Get In Touch Locator}     ${Get In Touch Text}    ${Get In Touch Hyperlink}   ${Get In Touch Target}
    Functions.Verify The Link   ${Privacy Locator}          ${Privacy Text}         ${Privacy Hyperlink}        ${Privacy Target}
    Functions.Verify The Link   ${Backend Terms of Use Locator}     ${Backend Terms of Use Text}    ${Backend Terms of Use Hyperlink}   ${Backend Terms of Use Target}
    Functions.Verify The Link   ${Twitter Locator}          ${Twitter Text}         ${Twitter Hyperlink}        ${Twitter Target}


#    Mouse Down                  xpath=//*[@id="gatsby-focus-wrapper"]/div/footer/div/div[2]/ul/li[2]/a
#    ${Linkedin URL}=  Get Element Attribute	    xpath=//*[@id="gatsby-focus-wrapper"]/div/footer/div/div[2]/ul/li[2]/a   href
#    Log                         Linkedin link URL = ${Linkedin URL}
#    Element Attribute Value Should Be  xpath=//*[@id="gatsby-focus-wrapper"]/div/footer/div/div[2]/ul/li[2]/a   href    https://www.linkedin.com/company/raw-engineering

    Element Text Should Be      class=footer-copyright      Copyright © 2021 Raw Engineering LLC. All Rights Reserved.

    Page Should Contain Image   class=soc-footer-logo       limit=1     SOC Logo available