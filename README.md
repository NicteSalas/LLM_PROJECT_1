# Clasificación de sentimientos e interpretación léxica en reseñas de cafeterías usando BERT multilingue y TF-IDF

> Análisis dentro del marco de la materia *Proyecto I - Introducción a los Large Lenguage Models*

---

# Autora

**Sac-Nicté Damayanti Salas Reyes**  
Licenciatura en Matemáticas Aplicadas  
Facultad de Ciencias — UNAM

---

# Descripción general

Este proyecto implementa un sistema de análisis de sentimientos en español utilizando BERT multilingüe trabajando sobre reseñas de tres cafeterías con formatos distintos en una misma zona de Ciudad de México. A partir de los resultados del análisis de sentimientos, se realiza una clasificación y análisisis utilizando TF-IDF.

El objetivo principal de este proyecto es estudiar y comparar estrategias de clasificación de texto mediante:

- Modelos preentrenados
- Fine-tuning supervisado
- Métodos de interpretación léxica mediante TF-IDF.

Además de clasificar reseñas como positivas, neutrales o negativas, el proyecto incorpora una etapa de análisis interpretativo sobre comentarios clasificados como negativos para identificar causas recurrentes de insatisfacción y traducirlas en propuestas de mejora.

---

# Objetivo

Construir un pipeline reproducible de procesamiento de lenguaje natural capaz de clasificar reseñas de cafeterías en español y analizar patrones de insatisfacción mediante técnicas modernas de NLP.

La tarea de clasificación se modela como:

```math
f : X \rightarrow Y
```

donde:

```math
Y = \{-1,0,1\}
```

con:

| Clase | Significado |
|---|---|
| `-1` | Sentimiento negativo |
| `0` | Sentimiento neutral |
| `1` | Sentimiento positivo |

El modelo busca aproximar:

```math
\max_{\theta}\prod_{i=1}^{n} P(y_i \mid x_i; \theta)
```

---

# Arquitectura

El proyecto utiliza una arquitectura **encoder-only tipo BERT multilingüe**, especializada en tareas discriminativas de clasificación de texto.

Pipeline general:

```text
Texto → Tokenización → BERT → [CLS] → Clasificador → Sentimiento
```

La representación contextual se obtiene mediante:

```math
h = BERT(x)
```

y la predicción final:

```math
\hat{y} = softmax(W h_{[CLS]} + b)
```

Los modelos encoder-only fueron seleccionados con base en:

- Eficiencia en entrenamiento
- Alto desempeño en clasificación
- Capacidad de capturar dependencias semánticas complejas,
- Adecuación para tareas discriminativas frente a modelos encoder-decoder.

---

# Corpus

El corpus consiste en reseñas de tres cafeterías que se encuentraen español obtenidas desde datasets públicos de Kaggle y posteriormente adaptadas al dominio específico del proyecto.

Cada texto se representa como:

```math
x_i = (w_1, w_2, ..., w_T)
```

---

# Preprocesamiento

El pipeline de limpieza contempla:

- Normalización de texto desde el formato .csv
- Tokenización.
- Eliminación de símbolos.
- Eliminación de duplicados.
- Procesamiento de expresiones coloquiales.

---

# Baseline

Como baseline inicial se evaluará:

- Modelo preentrenado sin fine-tuning.
- Embeddings contextualizados.

Se espera que nuestro modelo sea capaz de capturar tendencias generales de polaridad.

La función de pérdida considerada es la entropía cruzada determinada por:

```math
L = -\sum_{i=1}^{n}\sum_{c \in Y} y_{i,c}\log \hat{y}_i
```

---

# Análisis interpretativo con TF-IDF

Sea:

```math
X^{-} = \{x_i \in X \mid y_i = -1\}
```

el subconjunto de comentarios negativos.

Sobre este conjunto se calcula una representación TF-IDF para resaltar términos relevantes asociados con experiencias negativas.

La frecuencia de término se define como:

```math
TF(t,d)=\frac{f_{t,d}}{\sum_{t'}f_{t',d}}
```

mientras que la frecuencia inversa de documento se calcula mediante:

```math
IDF(t)=\log\left(\frac{N}{df_t}\right)
```

La ponderación final queda dada por:

```math
TFIDF(t,d)=TF(t,d)\cdot IDF(t)
```

Este análisis permitirá detectar patrones recurrentes relacionados con:

- Servicio.
- Tiempos de espera.
- Calidad de productos.
- Precio.
- Ambiente del negocio.

A partir de ello será posible generar propuestas de mejora focalizadas basadas en datos reales.

---

# Tecnologías utilizadas

| Área | Herramientas |
|---|---|
| Control de versiones | Github, VSCodium, Terminal |
| Procesamiento de datos | pandas, datasets |
| NLP | HuggingFace Transformers |
| Deep Learning | PyTorch |
| Fine-tuning | LoRA, QLoRA |
| Visualización | matplotlib, seaborn |
| Experimentación | Jupyter Notebook, VSCodium |
| Hardware | Google Colab, GPU |

---

# Estructura del repositorio

```text
LLM_PROJECT_1/
│
├── README.md
│
├── notebooks/
│   ├── 01_dataset_exploration.ipynb
│   ├── 02_preprocessing.ipynb
│   ├── 03_baseline.ipynb
│   ├── 04_finetuning.ipynb
│   └── 05_tfidf_analysis.ipynb
│
├── data/
│   ├── raw/
│   └── processed/
│
├── models/
│
├── results/
│
├── docs/
│
└── papers/
```

---

# Roadmap

| Fase | Estado |
|---|---|
| Revisión bibliográfica | ✅ |
| Construcción de repositorio github | ✅ |
| Curación del corpus | 🟡 |
| Preprocesamiento | 🟡 |
| Baseline | ⬜ |
| Fine-tuning BERT | ⬜ |
| LoRA | ⬜ |
| QLoRA | ⬜ |
| Evaluación | ⬜ |
| Análisis TF-IDF | 🟡 |
| Interpretabilidad | 🟡 |
| Visualización de resultados | ⬜ |
| Deployment | ⬜ |

---

# Motivación

El análisis de sentimiento permite transformar opiniones subjetivas en información estructurada útil para la toma de decisiones.

En el contexto de cafeterías, este enfoque puede emplearse para:

- detectar áreas críticas del servicio,
- identificar patrones de insatisfacción,
- analizar percepción del cliente,
- diseñar estrategias de mejora,
- generar recomendaciones basadas en datos.

La incorporación de TF-IDF fortalece la interpretabilidad del proyecto, ya que permite no solo detectar si una reseña es negativa, sino también comprender las causas lingüísticas asociadas con dicha percepción.

---

# Papers y referencias principales

## Transformers y BERT

- Devlin, J., et al.  
  *BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding*  
  NAACL-HLT, 2019.

## Sentiment Analysis

- Liu, B.  
  *Sentiment Analysis and Opinion Mining*  
  Morgan & Claypool Publishers, 2012.

## NLP General

- Jurafsky, D., & Martin, J. H.  
  *Speech and Language Processing*  
  Stanford University, 2023.

## Fine-Tuning eficiente

- Hu, E. J., et al.  
  *LoRA: Low-Rank Adaptation of Large Language Models*  
  ICLR, 2022.

- Dettmers, T., et al.  
  *QLoRA: Efficient Finetuning of Quantized LLMs*  
  NeurIPS, 2023.

---

# Reproducibilidad

Todos los experimentos están diseñados para ejecutarse en hardware accesible:

- Kaggle Free Tier (GPU T4)
- Google Colab
- GPUs NVIDIA con soporte CUDA

Cada notebook documenta:

- dependencias,
- hiperparámetros,
- métricas,
- configuración,
- resultados,
- observaciones experimentales.

---

# Licencia

Este proyecto tiene fines académicos y educativos.

Los modelos, datasets y bibliotecas utilizadas mantienen las licencias originales de sus respectivos autores.

---

# Agradecimientos

A la Universidad Nacional Autónoma de México y a la Facultad de Ciencias por proporcionar el espacio académico para el desarrollo de este proyecto. A mis compañeros de clase por proporcionarme su apoyo durante el desarrollo de este proyecto. 

