SELECT SUM(f.GEWINN)
FROM northwind_dwh.verkauf_fact f
JOIN northwind_dwh.kunde_dim k
ON f.KUNDE_ID_DIM = k.KUNDE_ID_DIM
WHERE k.COMPANY = "Company A";


SELECT SUM(f.GEWINN)
FROM northwind_dwh.verkauf_fact f
JOIN northwind_dwh.kunde_dim k
ON f.KUNDE_ID_DIM = k.KUNDE_ID_DIM
JOIN northwind_dwh.produkt_dim p
ON f.PRODUKT_ID_DIM = p.PRODUKT_ID_DIM
WHERE k.COMPANY = "Company A" AND
	  p.PRODUKT_NAME = "Northwind Traders Coffee                ";