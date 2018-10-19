library(readxl) #Inicia biblioteca para importação de planilhas
library(xtable) #Inicia biblioteca para conversão de tabelas para o Latex
library(qcc) #Inicia biblioteca para plotagem de cartas de controle

PATH <- "~/Documentos/RCodes/Moto.xlsx" #Indica o endereço do arquivo da planilha
table_name <- "Planilha" #Indica o nome da planilha

table1 <- read_excel(PATH, range = paste(table_name,"1!B3:B100", sep = "")) #Abre conjunto de dados
name1 <- read_excel(PATH, range = paste(table_name,"1!B1:B2", sep = "")) #Abre conjunto de dados
table2 <- read_excel(PATH, range = paste(table_name,"1!C3:C100", sep = "")) #Abre conjunto de dados
name2 <- read_excel(PATH, range = paste(table_name,"1!C1:C2", sep = "")) #Abre conjunto de dados
table3 <- read_excel(PATH, range = paste(table_name,"1!D3:D100", sep = "")) #Abre conjunto de dados
name3 <- read_excel(PATH, range = paste(table_name,"1!D1:D2", sep = "")) #Abre conjunto de dados
table4 <- read_excel(PATH, range = paste(table_name,"1!E3:E29", sep = "")) #Abre conjunto de dados
name4 <- read_excel(PATH, range = paste(table_name,"1!E1:E2", sep = "")) #Abre conjunto de dados
table5 <- read_excel(PATH, range = paste(table_name,"1!F3:F100", sep = "")) #Abre conjunto de dados
name5 <- read_excel(PATH, range = paste(table_name,"1!F1:F2", sep = "")) #Abre conjunto de dados
table6 <- read_excel(PATH, range = paste(table_name,"1!G3:G100", sep = "")) #Abre conjunto de dados
name6 <- read_excel(PATH, range = paste(table_name,"1!G1:G2", sep = "")) #Abre conjunto de dados
table7 <- read_excel(PATH, range = paste(table_name,"1!H3:H100", sep = "")) #Abre conjunto de dados
name7 <- read_excel(PATH, range = paste(table_name,"1!H1:H2", sep = "")) #Abre conjunto de dados
table8 <- read_excel(PATH, range = paste(table_name,"1!I3:I100", sep = "")) #Abre conjunto de dados
name8 <- read_excel(PATH, range = paste(table_name,"1!I1:I2", sep = "")) #Abre conjunto de dados
table9 <- read_excel(PATH, range = paste(table_name,"1!J3:J100", sep = "")) #Abre conjunto de dados
name9 <- read_excel(PATH, range = paste(table_name,"1!J1:J2", sep = "")) #Abre conjunto de dados
table10 <- read_excel(PATH, range = paste(table_name,"1!K3:K100", sep = "")) #Abre conjunto de dados
name10 <- read_excel(PATH, range = paste(table_name,"1!K1:K2", sep = "")) #Abre conjunto de dados

media_table1<-mean(x = table1$id1, na.rm = TRUE) #Calcula e armazena a média ignorando dados não preenchidos
sd_table1<-sd(x = table1$id1, na.rm = TRUE) #Calcula e armazena o desvio padrão ignorando dados não preenchidos
media_table2<-mean(x = table2$id2, na.rm = TRUE) #Calcula e armazena a média ignorando dados não preenchidos
sd_table2<-sd(x = table2$id2, na.rm = TRUE) #Calcula e armazena o desvio padrão ignorando dados não preenchidos
media_table3<-mean(x = table3$id3, na.rm = TRUE) #Calcula e armazena a média ignorando dados não preenchidos
sd_table3<-sd(x = table3$id3, na.rm = TRUE) #Calcula e armazena o desvio padrão ignorando dados não preenchidos
media_table4<-mean(x = table4$id4, na.rm = TRUE) #Calcula e armazena a média ignorando dados não preenchidos
sd_table4<-sd(x = table4$id4, na.rm = TRUE) #Calcula e armazena o desvio padrão ignorando dados não preenchidos
media_table5<-mean(x = table5$id5, na.rm = TRUE) #Calcula e armazena a média ignorando dados não preenchidos
sd_table5<-sd(x = table5$id5, na.rm = TRUE) #Calcula e armazena o desvio padrão ignorando dados não preenchidos
media_table6<-mean(x = table6$id6, na.rm = TRUE) #Calcula e armazena a média ignorando dados não preenchidos
sd_table6<-sd(x = table6$id6, na.rm = TRUE) #Calcula e armazena o desvio padrão ignorando dados não preenchidos
media_table7<-mean(x = table7$id7, na.rm = TRUE) #Calcula e armazena a média ignorando dados não preenchidos
sd_table7<-sd(x = table7$id7, na.rm = TRUE) #Calcula e armazena o desvio padrão ignorando dados não preenchidos
media_table8<-mean(x = table8$id8, na.rm = TRUE) #Calcula e armazena a média ignorando dados não preenchidos
sd_table8<-sd(x = table8$id8, na.rm = TRUE) #Calcula e armazena o desvio padrão ignorando dados não preenchidos
media_table9<-mean(x = table9$id9, na.rm = TRUE) #Calcula e armazena a média ignorando dados não preenchidos
sd_table9<-sd(x = table9$id9, na.rm = TRUE) #Calcula e armazena o desvio padrão ignorando dados não preenchidos
media_table10<-mean(x = table10$id10, na.rm = TRUE) #Calcula e armazena a média ignorando dados não preenchidos
sd_table10<-sd(x = table10$id10, na.rm = TRUE) #Calcula e armazena o desvio padrão ignorando dados não preenchidos

#tabela<-c(media_table1,media_table2,media_table3,media_table4,media_table5,media_table6,media_table7,media_table8,media_table9,media_table10,sd_table1,sd_table2,sd_table3,sd_table4,sd_table5,sd_table6,sd_table7,sd_table8,sd_table9,sd_table10) #Agrega valores calculados
tabela<-c(media_table1,media_table2,media_table3,sd_table1,sd_table2,sd_table3) #Agrega valores calculados
tabela<-matrix(data = tabela, nrow = 3, ncol = 2) #Cria tabela com valores agregados

colnames(tabela) <- c("Media", "Standard Deviation") #Nomeia as colunas
rownames(tabela) <- c(name1, name2, name3) #, name3, name4, name5, name6, name7, name8, name9, name10) #Nomeia as linhas
tabela #Mostra tabela montada

plot.xbar = qcc(table1, type="xbar")
#plot.xbar = qcc(data, type="R")
#plot.xbar = qcc(table4, type="S")
plot.xbar = qcc(table1, type="xbar.one", title="", xlab="", ylab="")
#plot.xbar = qcc(table4, type="p", sizes = 10)
plot.xbar = qcc(table1, type="np", sizes = 10)
#plot.xbar = qcc(data, type="c")
#plot.xbar = qcc(data, type="u")
#plot.xbar = qcc(data, type="g")

xtable(tabela, caption="Tabela", label="teste", align=NULL, vsep=NULL, digits=NULL,
       display=NULL) #Realiza conversão para o Latex

