---
title: Access Control
description: 
published: true
date: 2023-10-05T05:19:40.787Z
tags: 
editor: markdown
dateCreated: 2023-07-17T05:13:29.821Z
---

# Access Control WIKI
Access Control WIKI

The main purpose of  Access Control is to manage and restrict access to specific users or user groups for Product and Customer Master. This means that users will only be able to access the data that is relevant to their roles and permissions, ensuring data security and privacy.In Access Control, User will be able to Control Product & Location Attribute with Merchandise and Location Hierarchy Access for Promotion Defination.Access Control Also Allows to Control the Access for Report based on Selected Report Attribute for Specific User/User Group.

Access Control List Screen
![1.jpg](/1.jpg)


In the Access Control List Screen, users are provided with the ability to observe pre-existing access control particulars, encompassing the following information:

Access Control Name: The designated name for the access control in question.
Access Type: The specified category of access, such as Product, Location, Customer, and Report.
Available Users: The total count of users available for assignment.
Assigned Users: The overall number of users who have been allocated to a specific access control.
Status: The current state of the access control, with "Green" indicating an active status and "Grey" indicating an inactive status.

In this same List Screen, users are granted the capability to perform actions such as editing, activating, and deactivating specific access controls.

within this List Screen, a button is provided to enable users to create a brand new access control.

Access Control Creation 

Access Control Basic Configuration 
![2.jpg](/2.jpg)

Access Control Basic Configuration has 3 Fields Name,Duration and Status 
Access Control Name : User can enter the name of Access Control
Valid From and To Date : User can enter From & To Date when this access control will be applicable
Active / Inactive : User can configure the Active/Inactive Status for Access Control
Access Type Configuration
![3.jpg](/3.jpg)


There are 4 Types on Access Type : 
Product 
![4.jpg](/4.jpg)
In Access Type Product, User will be able to select a Merchandise Hierarchy, Product Attrbute and Product Attributes Value.Product Attributes and Product Attribute Value will have Impact on Product Master.Where as Merchandise Hierarchy,Product Attributes and Product Attribute Value will have Impact on Promotion Defination.

Customer 
![5.jpg](/5.jpg)

In Access Type - Customer, User will be able to Select Customer Attribute and Customer Attribute Value, It will have impact on Customer Master Only.
Location 

![6.jpg](/6.jpg)
In Access Type - Location, User will be able to Select Location Hierarchy, Store Attribute and Store Attribute Value and it will have impact on Promotion Defination.
Report

![7.jpg](/7.jpg)
In Access Type - Report, User will be able to select the Report Attribute and Report Attribute Value and It will impact on Reports.

Access Control Actions

![8.jpg](/8.jpg)
Create 
Opting for this action signifies that users can generate products utilizing designated product attributes exclusively. If a user group or individual user lacks assignments in any Access Control Master pertaining to product attributes, there are no limitations imposed on their product creation, allowing for use of any product attributes. This analogous behavior holds true for customer attributes as well. In cases of creation, should a selected product or customer attribute already exist within another active Access Control record, the system will issue a message indicating the presence of a similar entry in a distinct active Access Control master, specifying its appropriate name.

Edit 
Choosing this action grants users the ability to modify product details in the Product Master, restricted to chosen product attributes exclusively. For user groups or individual users without assignments within any Access Control Master concerning product attributes, editing products for any attributes is unhindered. This parallel conduct applies to customer attributes as well.

Display
Selecting this action empowers users to access product information, limited to designated product attributes only. In instances where a user group or individual user lacks assignments in any Access Control Master for product attributes, no viewing constraints exist, enabling access to products with any attributes. This parallel approach is extended to customer attributes.

If a user possesses solely the creation privilege, they may encounter restrictions while attempting to view certain customer attributes, like Mobile Number and Email. These attributes will be displayed in encrypted or obscured formats on the user interface to ensure confidentiality.

Export
Enabling this action permits users to export lists of products or customers accessible within their user privileges. Absence of assignments in any Access Control Master for either product or customer attributes, among user groups or individual users, translates to unrestricted access to view products or customers.
User Groups and Users Assignments


User Groups and Users Assignments - Here user can Assing Access of Access Type Selected Value to Users or User Groups. 
![qq.jpg](/qq.jpg)
Access Control Impact on Product Master
Access Control has a significant impact on the Product Master, empowering users to perform actions such as creating, editing, viewing, and exporting products exclusively within their granted access scope.
 This access is contingent upon the chosen product attribute, effectively ensuring that users can interact with products aligned specifically with their assigned permissions.
Access Control Impact on Customer Master
Access Control on the Customer Master has a significant impact on user interactions. Users are restricted to viewing customers based on their granted access privileges. 
For instance, users may have access to customers belonging to the Regular and Employee customer groups, while being denied access to the Enterprise customer group. Furthermore, 
the customer search functionality at the store is aligned with the deduplication level.
If the deduplication group is defined at the store level, the search results will only display customers within the same store group, reinforcing data consistency and security."

Access Control Impact on Promotion 
With Access Control in place, users or user groups gain the ability to exclusively create promotions based on meticulously defined criteria, specifically tied to mapped product or location attribute values, as well as merchandise or location hierarchy breadcrumbs.Only users or user groups possessing the necessary access rights are empowered to Create promotions. The system also employs visual cues, such as asterisks (*) denoting mandatory attributes, to further guide users in adhering to access-based criteria.


In Promotion, if the user has Access To a Product Brand and Let's say there are 5 Brands 
1. Nike
2. Puma 
3. Adidas 
4. New Balance 
5. Asics

Then in the Value Selection List, only these 5 Brands will be visible:- 
![10.jpg](/10.jpg)
Access Control Impact on Report

Access Control has a notable impact on reports, Displaying data access in accordance with the Access Control Master. This guarantees that users can only access and generate reports based on the permissions granted to them,
thus preserving data confidentiality and ensuring that information is disseminated in accordance with predefined access privileges.

Access Control Validation 


If User has selected Same Product Attribute in other Attribute Dropdown
Message : Selected Product Attribute Is Already Selected in Other Product Attribute Selection
If User has selected Same Location Attribute in other Attribute Dropdown
Message : Selected Location Attribute Is Already Selected in Other Location Attribute Selection
If User has selected Same Merchandise Hierarchy Breadcrumb in other Hierarchy Field
Message : Selected Merchandise Hierarchy Is Already Selected in Other Merchandise Hierarchy Selection
If User has selected Same Location Hierarchy Breadcrumb in other Hierarchy Field
Message : Selected Location Hierarchy Is Already Selected in Other Location Hierarchy Selection
Access Control Name Not entered and tries to change the Status.
Message should display “Please Enter the appropriate Access Control Name”.
Trying to save the record without selecting the Product or Customer Attributes
Message will be ‘“Please select appropriate Product or Customer Attributes”
Trying to attach same user for 2 access controls with same product attribute and attribute value
Message will be “User ‘User name’ is already assigned to access control ‘Access control name’”


