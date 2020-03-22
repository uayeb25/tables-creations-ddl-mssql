CREATE PROCEDURE example.clean_all_tables
AS

---- ENTIDADES DEBILES SEGUNDO NIVEL
DELETE FROM example.OrderDetails

---- ENTIDADES DEBILES
DELETE FROM example.Orders
DELETE FROM example.Products

--- ENTIDADES FUERTES
DELETE FROM example.Categories
DELETE FROM example.Shippers
DELETE FROM example.Employees
DELETE FROM example.Customers
DELETE FROM example.Suppliers
