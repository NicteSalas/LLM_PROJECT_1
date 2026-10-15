rm(list = ls(all.names = TRUE))
gc()
set.seed(61298)

setwd('C:/Users/inqui/OneDrive/Desktop/Clases/26-2/LLM_PROJECT_1/data/limpieza_final')

datos <- read.csv('etiquetado_humano_unificado.csv')
datos <- na.omit(datos)



indices <- caret::createDataPartition(datos$etiquetado_humano, p = 0.8, list = FALSE)
datos.fineTuning <- datos[indices, ]
datos.poderPred  <- datos[-indices, ]


write.csv(datos.fineTuning, 'etiquetado_humano_tuneo.csv',
          row.names = FALSE)
write.csv(datos.poderPred, 'etiquetado_humano_prueba.csv',
          row.names = FALSE)


