library(forecast)
library(dplyr)
library(readxl) #Inicia biblioteca para importação de planilhas
library(xtable) #Inicia biblioteca para conversão de tabelas para o Latex

PATH <- "~/Documentos/RCodes/Moto.xlsx" #Indica o endereço do arquivo da planilha
table_name <- "Planilha" #Indica o nome da planilha

table1 <- read_excel(PATH, range = paste(table_name,"2!C3:C15", sep = ""))

ts_passengers = ts(table1$id2,
                   start=10,
                   frequency=12)
plot(ts_passengers)

m_ets = ets(ts_passengers)
f_ets = forecast(m_ets, h=24) # forecast 24 months into the future
f_ets
plot(f_ets)

m_aa = auto.arima(ts_passengers)
f_aa = forecast(m_aa, h=7)
f_aa
plot(f_aa)

m_tbats = tbats(ts_passengers)
f_tbats = forecast(m_tbats, h=24)
plot(f_tbats)

barplot(c(ETS=m_ets$aic, ARIMA=m_aa$aic, TBATS=m_tbats$AIC),
        col="light blue",
        ylab="AIC")
