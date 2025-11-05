#Incluindo localmente o arquivo
#Ativando o pacote que baixa a base
library(readxl)
#Abrindo a base
Base <- read_excel("~/Documentos/Pratica estatistica 5.11/Base_trabalho.xlsx")
View(Base)                   

#Abrindo o dicionário
Dicionario <- read_excel("~/Documentos/Pratica estatistica 5.11/dicionario_Base_trabalho.xlsx")
View(Dicionario)


#Pacotes importantes para manipular os dados
library(dplyr)
library(ggplot2)
#Questao 5
#Exercicio A Modificar as variáveis qualitativas e transformar em fatores

#Utilizando ctrl+shift+m, codificador pipe, que indica que as mudanças feitas a seguir deverão ser aplicadas
Base <- Base %>% 
#Modificando as variáveis qualitativas e as transformando em fatores (FACTOR), levels indica os valores atribuidos as variaveis e labels sao os nomes que subsituem as variaveis numericas
  mutate(
    sexo = factor(sexo, levels = c(0, 1), labels = c("Feminino", "Masculino")),
    filhos = factor(filhos, levels = c(0, 1), labels = c("Não", "Sim")),
    escolaridade = factor(escolaridade, levels = c(1, 2, 3), labels = c("Fundamental", "Médio", "Superior")),
    casado = factor(casado, levels = c(0, 1), labels = c("Não", "Sim")),
#A variavel reincidente aparece na base, mas nao está descrita no dicionario, tenho que verificar se foi erro do dicionario ou se não é par contar. Mas irei assumir o valor de 0,1
    reincidente = factor(reincidente, levels = c(0, 1), labels = c("Não", "Sim")) 
  )

#Visualizando a base
str(Base)
View(Base)


#Questao 5 - Letra B Analise sobre dados faltantes

#Analisar quantos dados Not Available tem no total, em toda a base
total_na<- sum(is.na(Base))
total_na
#Após essa análise, identifiquei que a base está completa e não apresenta dados faltantes

#Questao 5 - Letra C - Histograma da variável idade
histog_idade <- ggplot(Base, aes(x = idade)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "white") +
  labs(
    title = "Histograma de Idade",
    x = "Idade (em anos)",
    y = "Frequência"
  ) +
  theme_minimal()

print(histog_idade)


