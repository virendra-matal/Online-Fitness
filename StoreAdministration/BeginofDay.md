---
title: Begin of Day
description: 
published: true
date: 2023-10-03T06:18:53.245Z
tags: 
editor: markdown
dateCreated: 2023-07-17T07:37:04.592Z
---

Begin Of Day

The main purpose of this master is to  enables user to set the transaction date. No transactions can be performed in ETP Store unless a BOD is done.
. The business use case of this master is to set the transaction date at the store level. This master will be available under the menu ‘Store Administration’


BOD SCREEN:
![screenshot_(55).png](/screenshot_(55).png)

On accessing the Begin of the day from the ‘Store Administration’ menu, a list screen will be shown with fields like Store, Transaction Date, Card views for Active, Expired Promotions and PromotionsExpiring in 7 days, Cash Pending to deposit and no days left to do the bank deposit, No of days left to Update the walk in entries,  Expected stock, list of functionality whose number series lift below 5%

![screenshot_p.png](/screenshot_p.png)
If the user has access to multiple companies within the group, the user can change the company using the bread crumb on the left hand side.

![screenshot_(66).png](/screenshot_(66).png)
If user has access to multiple store then user can select the store from the dropdown list. If user has access to only one store then by default store field will show the store name of which user has access to.

After store and transaction date selection user can seen the list of promotions which are active, expired and the promotions which are expiring in 7 days.

On click on any promotion user will be redirected to the promotion view screen on which user will be able to see the details of the respective promotions. After clicking on the Back button user will redirect to the BOD screen.

On the right side of the screen user will be able to see the total available cash present in the store and how many number of days left to deposit the available cash in the bank under the card titled as “Cash Pending to Deposit”
Below this one card is showing how many number of days are left to update the walk in entries and there will be a “Update” button. Clicking on this button user will redirect to the Walkin Details page where user can update the walk-in entries and after clicking on the back button user will redirect to the BOD screen.

Below this Card there is  a card present named as “ Expected Stock Receipt” which will show the details of any stock is expected to arrive on the store on selected transaction date. It will show from, which store the stock is arriving, Doc. no. of that stock, stock qty and arrival date.
 
There is one card named number series left below 5% ; in which the user will be able to see the list of functions whose number series has not been set as auto reset and number series is less than 5% . Users can click on the “create” button then the user will redirect to the number series store page where users can create new number series for respective functionality.
 
When user click on the “save” button from the top right side of the corner then BOD will be done and it will show the validation message “ BOD done successfully”
 
Here the condition is, once user has done the BOD for a respective date then user can't do the BOD for the previous date.


 







