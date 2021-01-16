*** Settings ***
Library  SeleniumLibrary
Library  Collections

*** Variables ***
${browser} =  chrome
${url} =  https://www.flipkart.com/
${Electronics} =  xpath=//*[@id="container"]/div/div[2]/div/div/span[1]
${Category_Type} =  Mi 3i 20000 mAh Power Bank (Fast Charging, 18W)
${add_to_cart} =  xpath=//*[@id="container"]/div/div[3]/div[1]/div[1]/div[2]/div/ul/li[1]/button
${Expected_Page_element} =  xpath=//*[@id="container"]/div/div[2]/div/div/div[1]/div/div[2]/div/div[1]/div[1]/div[1]/a


*** Test Cases ***
LoginTest

    Open Browser    ${url}  ${browser}
    maximize browser window
    LOGIN TO APPLICATION
    Navigate to Category "Electronics"


Select Category
    Select the sub category 'power bank'
    Select an item
    Add to cart

*** Keywords ***
LOGIN TO APPLICATION
    Input Text  xpath=/html/body/div[2]/div/div/div/div/div[2]/div/form/div[1]/input  6282519546
    Input Text  xpath=/html/body/div[2]/div/div/div/div/div[2]/div/form/div[2]/input  swathy@19
    #sleep  3s
    Click Button  xpath=/html/body/div[2]/div/div/div/div/div[2]/div/form/div[3]/button
    sleep  2
    Log to Console  Step1

Navigate to Category "Electronics"
    Mouse Over  ${Electronics}
    sleep  3s
    Log to Console  Step2

Select the sub category 'power bank'
    Click element  Xpath=//*[@id="container"]/div/div[2]/div/div/div/div[2]/a[4]
    sleep  5s
    Log to Console  Step3

Select an item
    ${Category_count} =  Get Element Count  xpath=//div[@class='E2-pcE _1q8tSL']/div
    sleep  3s
    FOR  ${i}  IN RANGE  1  ${Category_count}
        ${Category_Name} =  Get Text  xpath=//div[@class='E2-pcE _1q8tSL']/div[2]/div/div[${i}]/div/a[2]
        Exit For Loop If  "${Category_Name}" == "${Category_Type}"
    END
    Click Element  xpath=//div[@class='E2-pcE _1q8tSL']/div[2]/div/div[${i}]/div/a[2]
    Log to Console  Step4


Add to cart
     Select window  Mi 3i 20000 mAh Power Bank (Fast Charging, 18W) Price in India - Buy Mi 3i 20000 mAh Power Bank (Fast Charging, 18W) online at Flipkart.com
     ${url1} =  get Location
     log to console  ${url1}
     Click Element  ${add_to_cart}
     Log to Console  Step5


