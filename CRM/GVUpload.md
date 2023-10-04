---
title: GV Upload
description: 
published: true
date: 2023-09-22T07:25:43.838Z
tags: 
editor: markdown
dateCreated: 2023-07-17T05:12:06.254Z
---

# Header
Introduction

A Gift Voucher (GV) is a form of payment issued by a store to customers as a reward or gift for shopping. Customers receive these vouchers, which can be used to make purchases at the store. Essentially, it serves as a credit or monetary value that can be applied towards future transactions, providing customers with a convenient and often appreciated way to enjoy discounts or free merchandise from the store. These vouchers come in two main types: physical cards/paper vouchers (which are sold by the store) and digital vouchers. They represent a store credit that customers can use for future purchases, serving as an incentive for shopping and allowing for convenient discounts or free items.
 
GV creation
To create GV user needs to go to product master, Selecting Catalog Id as GV voucher and filling all the mandatory details and save for raw product types and finished products.

![screenshot_(51).png](/screenshot_(51).png)
 

GV allocation
We can allot it to specific customers and customer circles if the Store has a Unify subscription. If it is not purchased and GV is already sold out but after the subscription the customer can redeem the GV.

GV selling
GV can be sold at the time of billing or can also be redeemed at the time of billing.

 ![1.png](/1.png)

GV code
Every GV has its own unique code, one GV cannot be used for multiple customers Controlled, Non Controlled, Batch controlled, serialize (not excluding the value of 1)
![2.png](/2.png)

 
GV stock
We can add GV inventory through stock In. When GV in stock in multiple tables get affected like stock transaction, product balance, stock ledger. 
![3.png](/3.png)

 
GV Create
When we create GV the GV contains its manufacturer name, expiry date, Gv amount with currency and lot no.
![4.png](/4.png)

GV configuration and expiry
For some stores it depends upon the configuration of the retail template of the store. In retail configuration property it has the feature of allowing expiry control to control the expiry of GV.

GV Upload
GV upload comes in the CRM part

![5.png](/5.png)

 GV application for customer.
1) Enter the customer name in the Pos.
2) Select the GV mode in the Pos
3) Select the GV from product search.
4) Click on apply for the customer.
5) Checkout and save.
