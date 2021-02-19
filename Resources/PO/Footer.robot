*** Settings ***
#Library                         Selenium2Library


*** Keywords ***
Scroll To Footer
    Sleep                       1s
    Scroll To Element           class=title-linethrough
    Sleep                       1s
#    Scroll To Element           xpath=//*[@class="title-linethrough"]
    Sleep                       1s
    Scroll To Element           class=author-quote
    Sleep                       2s
    Scroll To Element           class=soc-footer-logo
    Sleep                       1s

Verify Footer Elements
#    Mouse Down                  class=section-title
    Element Text Should Be      class=section-title   Ready to get started on your next project?

    Mouse Down                  css=#gatsby-focus-wrapper > div > footer > div > div.footer-top.text-center > a
    Element Text Should Be      css=#gatsby-focus-wrapper > div > footer > div > div.footer-top.text-center > a  GET IN TOUCH
#    ${Get In Touch Text}=       Get Element Attribute	    css=#gatsby-focus-wrapper > div > footer > div > div.footer-top.text-center > a  value
#    Log                         Get In Touch button Text = ${Get In Touch Text}
    ${Get In Touch URL}=        Get Element Attribute	    xpath=//*[@id="gatsby-focus-wrapper"]/div/footer/div/div[1]/a  href
    Log                         Get In Touch button URL = ${Get In Touch URL}
    Element Attribute Value Should Be  xpath=//*[@id="gatsby-focus-wrapper"]/div/footer/div/div[1]/a  href    ${URL.${ENV}}contact-us

    Mouse Down                  css=#gatsby-focus-wrapper > div > footer > div > div.footer-bottom > div > ul > li:nth-child(1) > a
    Element Text Should Be      css=#gatsby-focus-wrapper > div > footer > div > div.footer-bottom > div > ul > li:nth-child(1) > a     Privacy
    ${Privacy URL}=  Get Element Attribute	    css=#gatsby-focus-wrapper > div > footer > div > div.footer-bottom > div > ul > li:nth-child(1) > a   href
    Log                         Privacy link URL = ${Privacy URL}
    Element Attribute Value Should Be  css=#gatsby-focus-wrapper > div > footer > div > div.footer-bottom > div > ul > li:nth-child(1) > a   href    ${URL.${ENV}}privacy-statement

    Mouse Down                  xpath=//*[@id="gatsby-focus-wrapper"]/div/footer/div/div[2]/div/ul/li[2]/a
    Element Text Should Be      xpath=//*[@id="gatsby-focus-wrapper"]/div/footer/div/div[2]/div/ul/li[2]/a     Backend Terms of Use
    ${Terms of Use URL}=  Get Element Attribute	    xpath=//*[@id="gatsby-focus-wrapper"]/div/footer/div/div[2]/div/ul/li[2]/a   href
    Log                         Backend Terms of Use link URL = ${Terms of Use URL}
    Element Attribute Value Should Be  xpath=//*[@id="gatsby-focus-wrapper"]/div/footer/div/div[2]/div/ul/li[2]/a   href    ${URL.${ENV}}backend-terms-of-service

    Mouse Down                  xpath=//*[@id="gatsby-focus-wrapper"]/div/footer/div/div[2]/ul/li[2]/a
    ${Linkedin URL}=  Get Element Attribute	    xpath=//*[@id="gatsby-focus-wrapper"]/div/footer/div/div[2]/ul/li[2]/a   href
    Log                         Linkedin link URL = ${Linkedin URL}
    Element Attribute Value Should Be  xpath=//*[@id="gatsby-focus-wrapper"]/div/footer/div/div[2]/ul/li[2]/a   href    https://www.linkedin.com/company/raw-engineering

    Element Text Should Be      class=footer-copyright      Copyright © 2021 Raw Engineering LLC. All Rights Reserved.

    Page Should Contain Image   class=soc-footer-logo       limit=1     SOC Logo available