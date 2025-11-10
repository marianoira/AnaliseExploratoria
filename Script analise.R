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
  labs(title = "Histograma de Idade",
    x = "Idade (em anos)",
    y = "Frequência"
  ) +
  theme_minimal()

print(histog_idade)

#Questao 5 - Letra D - Boxplot tempo_preso
boxplot_tp <- ggplot(Base, aes(y = tempo_preso)) +
  geom_boxplot(fill = "blue", color = "green", alpha = 0.7) +
  labs(title = "Boxplot do Tempo Preso (em meses)",
       y = "Tempo Preso (meses)") +
    theme_minimal() +
  theme(axis.text.x = element_blank())

print(boxplot_tp)

#Questao 5 - Letra E - Boxplot score por escolaridade

boxplot_score_escolaridade <- ggplot(Base, aes(x = escolaridade, 
                                             y = score_periculosidade, 
                                             fill = escolaridade)) +
  
  geom_boxplot(alpha = 0.7) +
  
  labs(
    title = "Boxplot do Score de Periculosidade por Escolaridade",
    x = "Escolaridade",
    y = "Score de Periculosidade",
    fill = "Escolaridade"
  ) +
  
  scale_fill_brewer("blue") + # Paleta de cores para melhor visualização
  theme_minimal(base_size = 14) +
  theme(legend.position = "none") # Remove a legenda se a cor já está no eixo X

print(boxplot_score_escolaridade)


#Questao 5 - Letra F - Grafico de barras reincidente

grafico_reincidente <- ggplot(Base, aes(x = reincidente, fill = reincidente)) +
  geom_bar(color = "blue") 
  labs(
    title = "Grafico de Reincidencia",
    x = "Situação de Reincidência",
    y = "Contagem (Frequência Absoluta)",
    fill = "Reincidência"
  ) +
  
  scale_fill_manual(values = c("Não Reincidente" = "lightblue", "Reincidente" = "darkblue")) +
  theme_minimal(base_size = 14) 

print(grafico_reincidente)

#Verificando se o grafico condiz com as respostas obtidas.
table(Base$reincidente)
