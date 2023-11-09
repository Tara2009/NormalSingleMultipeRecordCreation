*** Settings ***
Resource          ../CommonResource/Common.robot
Library           String
Library           DataDriver                  reader_class=TestDataApi    name=CreateMultipleContacts.xlsx
Suite Setup       Setup Browser
Suite Teardown    End Suite
Test Template     create contacts using excel

*** Variables ***
${MulRecMessage}        Hoh Hoh!Successfully inserted Multiple Records from Excel for 

*** Test Cases ***
[Tags]        MultipleRecord
create contacts using excel with ${M_Salutation}    ${M_FirstName}     ${M_LastName}    ${M_Phone}

*** Keywords ***
create contacts using excel
    [Arguments]    ${M_Salutation}    ${M_FirstName}     ${M_LastName}    ${M_Phone}
    Appstate                    Home
    LaunchApp                   Sales
    ClickText                   Contacts
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   New                         anchor=import               timeout=120s
    UseModal                    On
    PickList                    Salutation                  ${M_Salutation}
    TypeText                    First Name                  ${M_FirstName}
    TypeText                    Last Name                   ${M_LastName}
    ${fullName}                 Catenate                    ${M_FirstName}              ${M_LastName}
    Log                        ${fullName}
    TypeText                    Phone                       ${M_Phone}
    ComboBox                    Search Accounts...          Dickenson plc
    TypeText                    Email                       tara@gamil.com
    TypeText                    Mailing Street              hanuman nagar 4th line
    TypeText                    Mailing City                guntur
    TypeText                    Mailing State/Province      ap
    TypeText                    Mailing Zip/Postal Code     522006
    TypeText                    Mailing Country             india
    TypeText                    Other Street                vijayapuri colony
    TypeText                    Other City                  guntur
    TypeText                    Other State/Province        ap
    TypeText                    Other Zip/Postal Code       52206
    TypeText                    Other Country               india
    TypeText                    Fax                         9876503467
    PickList                    Lead Source                 Web
    TypeText                    Home Phone                  2218868
    ClickText                   Birthdate                   anchor=Home Phone
    DropDown                    Pick a Year                 1979
    ClickText                   Previous                    Month
    ClickText                   Previous                    Month
    ClickText                   Previous                    Month
    ClickText                   20
    TypeText                    Other Phone                 0866667734
    TypeText                    Department                  tesing department
    TypeText                    Assistant                   no assistant
    TypeText                    Asst. Phone                 +7207207177
    TypeText                    Mobile                      9966119982
    TypeText                    Description                 learning copado robotic testing
    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       1
    ${ConfirmMessage}           Catenate                    ${MulRecMessage}            ${fullName}   
    Log                        ${ConfirmMessage}

 # Delete generated contacts for cleanup
    #LaunchApp                   Sales
    #Wait Until Keyword Succeeds                             1 min                       5 sec            ClickText    Contacts
    #VerifyText                  Recently Viewed             timeout=120s
    #ClickText                   ${fullName}                 timeout=120s
    #ClickText                   Show more actions
    #ClickText                   Delete
    #ClickText                   Delete
    #ClickText                   Close
    #VerifyText                  Recently Viewed             timeout=120s