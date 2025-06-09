#importando bases de dados

library(readxl)# Para ler arquivos Excel
library(dplyr) # Para manipulação de dados
# Ler os dados dos arquivos
indicadores <- read_xls("Base_indicadores.xls")
tuberculose <- read_xls("Base_tuberculose.xls")

#unindo-as


names(indicadores)
names(tuberculose)
base_final <- left_join(x = tuberculose, 
                        y = indicadores, 
                        by = "CODIBGE_com6")


base_final = base_final |> 
  select(-Municipio.x) |> 
  rename(Municipio = Municipio.y)
base_final = base_final |>  
  select(CODIBGE_com6, Municipio, not_tuberc,pop2010, idhm2010,gini_r2010, IVS)
