# SQL_Schema
 
### Features Implemented:
## Stored Procedures
- For getting the Product list according to the Categories. --> [getProductsByCategory]
- Add items to the Cart (into the Cart table). --> [addToCart]
  - If there exists a record with the User_ID and Prod_ID, then it will just add the Quantity of the products with the existing ones.
- Delete items from the Cart. --> [deleteFromCart]
- To get all the items in the Cart for a given User_ID. --> [getTotalAmount]

## Triggers
- To show the Cart for a given User_ID whenever an Update, Insert or Delete operations. --> [showCart]
- To sum the price of all products in the Cart of a User and update the Total Amount after an Update, Insert or Delete operations. --> [updatePrice]

## Views
- To get all the Products from the Products table and their respective Categories from the Categories (inner join) to show them to the user. --> [productsAndCategoryView]
- To show the Cart details to the user. --> [cartView]

## Indexing
-  Created unique clustured indexex on the Products and Categories View, i.e (productsAndCategoryView). --> [indx_productsAndCategoryView]
