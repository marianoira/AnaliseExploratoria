#Incluindo localmente o arquivo
#Ativando o pacote que baixa a base
library(readxl)
#Abrindo a base
Base <- read_excel("~/Documentos/Pratica estatistica 5.11/Base_trabalho.xlsx")
View(Base)                   

#Abrindo o dicionário
Dicionario <- read_excel("~/Documentos/Pratica estatistica 5.11/dicionario_Base_trabalho.xlsx")
View(Dicionario)
