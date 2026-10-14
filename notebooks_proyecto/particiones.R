rm(list = ls(all.names = TRUE))
gc()
set.seed(61298)
library(caret)

setwd('C:/Users/inqui/OneDrive/Desktop/Clases/26-2/LLM_PROJECT_1/data/limpieza_final')

datos <- read.csv('etiquetado_humano_unificado.csv')
datos <- na.omit(datos)



indices <- createDataPartition(datos$etiquetado_humano, p = 0.8, list = FALSE)
datos.fineTuning <- datos[indices, ]
datos.poderPred  <- datos[-indices, ]