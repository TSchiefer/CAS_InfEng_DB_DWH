library(dplyr)
products <- read.csv("git/CAS_InfEng_DB_DWH/csv_files/products.csv")
products <- as_tibble(products)

indices_duplicates <- duplicated(products$product_name)
indices_duplicates

dupl_prod_name <- products %>% 
  filter(indices_duplicates)

all_duplicates <- products %>% 
  semi_join(dupl_prod_name, by = "product_name") %>% 
  arrange(product_name)

View(all_duplicates)

boysenberry_spreads <- all_duplicates %>% 
  filter(product_name == "Northwind Traders Boysenberry Spread") %>% 
  select(-id)
green_beans <- all_duplicates %>% 
  filter(product_name == "Northwind Traders Green Beans") %>% 
  select(-id)
marmalade <- all_duplicates %>% 
  filter(product_name == "Northwind Traders Marmalade") %>% 
  select(-id)

identical(
  boysenberry_spreads %>% slice(1), boysenberry_spreads %>% slice(2)
  )

identical(
  green_beans %>% slice(1), green_beans %>% slice(2)
  )

identical(
  marmalade %>% slice(1), marmalade %>% slice(2)
  )