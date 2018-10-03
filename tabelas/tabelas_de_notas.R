library(readxl) #Inicia biblioteca para importação de planilhas
library(xtable) #Inicia biblioteca para conversão de tabelas para o Latex
notas <- read_excel("~/Documentos/Trabalho/2018.2/CENTEC/Frequências.xlsx", range = "TEE-MAT!E6:E53") #Abre conjunto de dados

notamedia<-mean(x = notas$Nota, na.rm = TRUE) #Calcula e armazena a média ignorando dados não preenchidos
notasd<-sd(x = notas$Nota, na.rm = TRUE) #Calcula e armazena o desvio padrão ignorando dados não preenchidos

tabela<-c(notamedia,notasd) #Agrega valores calculados
tabela<-matrix(data = tabela, nrow = 1, ncol = 2) #Cria tabela com valores agregados

colnames(tabela) <- c("Media", "SD") #Nomeia as colunas
rownames(tabela) <- c("AV1") #Nomeia as linhas
tabela #Mostra tabela montada

xtable(tabela, caption=NULL, label="teste", align=NULL, vsep=NULL, digits=NULL,
       display=NULL) #Realiza conversão para o Latex
