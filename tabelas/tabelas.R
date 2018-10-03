library(readxl) #Inicia biblioteca para importação de planilhas
library(xtable) #Inicia biblioteca para conversão de tabelas para o Latex
oleo <- read_excel("~/Documentos/PRODER/Artigos/oleo/oleo.xlsx") #Abre conjunto de dados

umidademedia<-mean(x = oleo$Umidade, na.rm = TRUE) #Calcula e armazena a média ignorando dados não preenchidos
umidadesd<-sd(x = oleo$Umidade, na.rm = TRUE) #Calcula e armazena o desvio padrão ignorando dados não preenchidos
calciomedia<-mean(x = oleo$Cálcio, na.rm = TRUE)
calciosd<-sd(x = oleo$Cálcio, na.rm = TRUE)

tabela<-c(umidademedia,calciomedia,umidadesd,calciosd) #Agrega valores calculados
tabela<-matrix(data = tabela, nrow = 2, ncol = 2) #Cria tabela com valores agregados

colnames(tabela) <- c("Media", "SD") #Nomeia as colunas
rownames(tabela) <- c("Humidity", "Calcium") #Nomeia as linhas
tabela #Mostra tabela montada

xtable(tabela, caption=NULL, label="teste", align=NULL, vsep=NULL, digits=NULL,
       display=NULL) #Realiza conversão para o Latex
