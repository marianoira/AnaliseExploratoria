#Reabrindo a base e o dicionário

#instalando o tidyverse para utilizar o Pipe
install.packages("tidyverse")
library (tidyverse)

library(readxl)
Base<- read_excel("~/Duda _ uff/25.2/Base_trabalho.xlsx")
View(Base)
dicionario<- read_excel("~/Duda _ uff/25.2/dicionario_Base_trabalho.xlsx")
View(dicionario)

#Questao 9 - Letra A - Modificar as variáveis qualitativas e transformar em fatores

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

#Questao 9 - Letra B
#Calculando Media, 1 quartil, mediana e 3 quartil para Idade
#mean para a media, quantile para os quartis, onde 0.25 e 0.75 indicam respectivamente os quartis 1 e 3, e median para mediana. NA.RM=TRUE será utilizado para remover valores faltantes caso existam. Nesse caso, já foi verificado que nao existem valores faltantes, mas por segurança, continuarei utilizando.
media_idade = mean(Base$idade, na.rm = TRUE)
q1_idade = quantile(Base$idade , 0.25, na.rm = TRUE)
mediana_idade = median(Base$idade , na.rm = TRUE)
q3_idade = quantile(Base$idade , 0.75, na.rm = TRUE)

#Calculando Media, 1 quartil, mediana e 3 quartil para Score_periculosidade

media_periculosidade = mean(Base$score_periculosidade, na.rm = TRUE)
q1_periculosidade = quantile(Base$score_periculosidade, 0.25, na.rm = TRUE)
mediana_periculosidade = median(Base$score_periculosidade, na.rm = TRUE)
q3_periculosidade = quantile(Base$score_periculosidade, 0.75, na.rm = TRUE)


#Calculando Media, 1 quartil, mediana e 3 quartil para tempo_preso
media_tempopreso = mean(Base$tempo_preso, na.rm = TRUE)
q1_tempopreso = quantile(Base$tempo_preso , 0.25, na.rm = TRUE)
mediana_tempopreso = median(Base$tempo_preso , na.rm = TRUE)
q3_tempopreso = quantile(Base$tempo_preso , 0.75, na.rm = TRUE)

#Questao 9 - C - grafico de dispersao
library(ggplot2)

#usando ggplot para criação do gráfico
ggplot(
  data = Base,
  aes(x = tempo_preso, y = score_periculosidade)) +
  geom_point(alpha = 0.6, color = "blue") + 
  labs(title = "Relação entre Tempo Preso e Score de Periculosidade",
    x = "Tempo Preso (em meses)",
    y = "Score de Periculosidade") +
  theme_minimal() 

#Questao 9 - D - calculo de correlacao / complete.obs será utilizado para garantir que dados faltantes nao sejam utilizados.
correlacao <- cor(Base$tempo_preso, Base$score_periculosidade, use = "complete.obs")
print(correlacao)

#Questao 9 - E 
library(dplyr)

#calculando variância, desvio padrão e amplitude do score de periculosidade 
medidas_dispersao <- Base %>%
  summarise(
    var_periculosidade = var(Base$score_periculosidade, na.rm = TRUE),
    sd_periculosidade = sd(Base$score_periculosidade, na.rm = TRUE),
    amplitude_periculosidade = max(Base$score_periculosidade, na.rm = TRUE) - min(score_periculosidade, na.rm = TRUE),
    
    #calculando variância, desvio padrão e amplitude da idade
    var_idade = var(Base$idade, na.rm = TRUE),
    sd_idade = sd(Base$idade, na.rm = TRUE),
    amplitude_idade = max(Base$idade, na.rm = TRUE) - min(idade, na.rm = TRUE),
    
    #calculando variância, desvio padrão e amplitude do tempo_preso
    var_tempo = var(Base$tempo_preso, na.rm = TRUE),
    sd_tempo = sd(Base$tempo_preso, na.rm = TRUE),
    amplitude_tempo = max(Base$tempo_preso, na.rm = TRUE) - min(tempo_preso, na.rm = TRUE)
  )

print(medidas_dispersao)


