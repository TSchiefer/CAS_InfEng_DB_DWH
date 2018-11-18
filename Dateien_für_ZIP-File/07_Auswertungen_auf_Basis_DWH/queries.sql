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
	  p.PRODUKT_NAME = "Northwind Traders Coffee";


SELECT ORDER_MONTH, SUM(f.BRUTTO_ERLOES)
FROM northwind_dwh.verkauf_fact f
JOIN northwind_dwh.zeit_dim t
ON f.ZEIT_ID_DIM = t.ZEIT_ID_DIM
GROUP BY t.ORDER_MONTH;      
     
     
SELECT ORDER_MONTH, r.STATE_PROVINCE, f.BRUTTO_ERLOES
FROM northwind_dwh.verkauf_fact f
JOIN northwind_dwh.region_dim r
ON f.REGION_ID_DIM = r.REGION_ID_DIM
JOIN northwind_dwh.produkt_dim p
ON f.PRODUKT_ID_DIM = p.PRODUKT_ID_DIM
JOIN northwind_dwh.zeit_dim t
ON f.ZEIT_ID_DIM = t.ZEIT_ID_DIM
WHERE p.PRODUKT_NAME = "Northwind Traders Chocolate" AND r.STATE_PROVINCE = "OR";
