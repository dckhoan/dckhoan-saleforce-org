# SEKUDLO Salesforce Technical Test - Duong Cong Khoan

Org Homepage: https://dckhoan-dev-ed.lightning.force.com/lightning/page/home

Username: v.tran@skedulo.com

Password: skedulo123456

## Task 1

Add a custom feld Total Contacts of type Number on Account object with default value 0.

Add a custom feld Actve of type Boolean on Contact object with default value false. On creaton of a
contact for an account, automatcally trigger an approval process to approve the contact. If the contact
is approved, set the actve fag to true and increment the value of feld Total Contacts on Account by 1.

On deletng the actve contact, decrement the value of feld Total Contacts on the Account by 1.

Write the logic to increment and decrement the total contacts count using bulk patern.

## Task 2

Create a Visualforce page to accept a String as an input and search Accounts and Contacts with the
name startng with the entered string. The search should be case-insensitve.

As an output show a table of the records found with the type of record.

For example: if input string is ‘ABC’ and there is an Account with name ABC Corp and Contact with name
ABC Test Person, show the output in the following format:

Record Name     | Record Type | Click to open

ABC Corp        | Account     | View

ABC Test Person | Contact     | View

On clicking the View link, open the record in another screen/tab.

---

Please visit page: https://dckhoan-dev-ed.lightning.force.com/lightning/n/Search_Accounts_and_Contacts

## Task 3
Write a RESTful web service to accept a payload of multple contacts and update those contacts. Add
basic validatons like the input contacts should exist in the system. API should return proper success and
error responses.

---

Endpoint:   https://dckhoan-dev-ed.my.salesforce.com/services/apexrest/Contacts/

API Description

Update Contacts

**Request**    PATCH

Body
- contacts: array of objects
  - id: string (required)
  - firstname: string
  - lastname: string
  - email: string

Request sample

```
curl --request PATCH --header "Authorization: Bearer 00D5j000001hMNh!ASAAQDSwMNqVZUD.CYopCtJ1_fMueoTpfFgbUOFinGa8J8qTpWrineqsSTr8uh6QLPcpld21csdWl1XuM2WriZX_X6vXs9iQ" --header "Content-Type: application/json" --data @contacts.txt --url https://dckhoan-dev-ed.my.salesforce.com/services/apexrest/Contacts/
```

**Responses**   200 500

Body
- array of objects
   - id: string
   - success: boolean
   - errors: array of string

Response sample

```
[ {
  "success" : false,
  "id" : "0035j000006Xnl8DDC",
  "errors" : [ "Id does not exist in the system." ]
}, {
  "success" : true,
  "id" : "0035j000006EcDiAAK",
  "errors" : [ ]
} ]
```


