select ItemName from MenuItems
WHERE MenuItemID = ANY (SELECT MenuItemID from Orders WHERE OrderQuantity > 2) ;