#1. Reading the data 
PATH = "//home//muriloleal//Documentos//aula2407//"#Caminho de pastas ateh chegar no arquivo
FILE_NAME = "atuacaoProfissional_2018_2" # nome do arquivo (de extens?o "csv")
FILE_NAME = "corpus" # nome do arquivo (de extens?o "csv")
myDataTable = read.csv(file=paste(PATH, FILE_NAME, ".txt", sep=""), sep="\t", quote="", stringsAsFactors=FALSE)# lendo o conjunto de corpus
View(myDataTable)#visualizando o conjunto de corpus
#2. Function for converting from table structure to the Iramuteq corpus structure
get_nDigits = function(n){
  nDigits =1;
  while((n/(10^nDigits))>=1){
    nDigits =nDigits+1;
  }
  #print(nDigits)
  return(nDigits)
}
#get_nDigits(9999)-get_nDigits(9)
getCleanedText = function(content){
  content = gsub(pattern='[*$%"#"]', replacement='', x=content)#"aspas; 
  content = gsub(pattern="\\.{3}", replacement="", x=content)#retic?ncias;  
  content = gsub(pattern="\\.{2}", replacement="", x=content)#retic?ncias;  
  content = gsub(pattern="'", replacement="", x=content)#ap?strofo; 
  content = gsub(pattern="-", replacement=" ", x=content)#travess?o
  content = gsub(pattern="  ", replacement="", x=content)#tabulacao
  return(content)
}
convertFromTableToIrmuteqDataStructure = function(dataTable = myDataTable
                                                  , longTextVariableIndex=2
                                                  , shortAnswerVariablesIndexes=NULL){
  nDocuments = nrow(dataTable)
  nDigits = get_nDigits(nDocuments)
  nVariables = ncol(dataTable)
  colNames = colnames(dataTable)
  longTextVariable = colNames[longTextVariableIndex]
  IramuteqFilePath = paste(PATH, FILE_NAME, "_",longTextVariable, "_FromTableToIramuteqDataStructure.txt", sep="")
  cat("", file = IramuteqFilePath, append = FALSE, sep="\n")
  for(i in 1:nDocuments){#i=1
    #text = "**** "
    #cat(text, file = IramuteqFilePath, append = TRUE, sep=" ")
    nZeros = nDigits - get_nDigits(i)
    zeros = paste(rep(x = "0", nZeros), sep="", collapse = "")
    prefix = paste("**** *doc_", zeros, i, sep="")
    cat(prefix, file = IramuteqFilePath, append = TRUE, sep=" ")
    doc_i = dataTable[i,]
    nShortAnswers = length(shortAnswerVariablesIndexes)
    for(l in 1:nShortAnswers){#j=6
      j = shortAnswerVariablesIndexes[l]
      var_j = colNames[j]
      content_ij = as.character(doc_i[j])
      #suppressing 
      content_ij = getCleanedText(content_ij)
      
      text = paste(" *", var_j, "_", content_ij, sep="")
      cat(text, file = IramuteqFilePath, append = TRUE, sep=" ")
    }
    j = longTextVariableIndex
    content_ij = as.character(doc_i[j])
    content_ij = getCleanedText(content_ij)
    cat("", file = IramuteqFilePath, append = TRUE, sep="\n")
    cat(content_ij, file = IramuteqFilePath, append = TRUE, sep="\n")
  }
}

#3. Identifying the index of the open-text variable of interest and the short-answer ones
cbind(colnames(myDataTable))
longTextVariableIndex = 4#especifique o indice da coluna da variavel textual
shortAnswerVariablesIndexes = c(1,2,3) #especifique os indices das colunas das variaveis nao textuais de interesse
#4. Executing the convertion from table structure to the Iramuteq corpus structure
#A ".txt" file is saved in the PATH folder.
convertFromTableToIrmuteqDataStructure(dataTable = myDataTable, longTextVariableIndex, shortAnswerVariablesIndexes)

