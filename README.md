# Clasificación de sentimientos e interpretación léxica en reseñas de cafeterías usando BERT multilingue y TF-IDF

> Proyecto académico de NLP y Large Language Models  
> Facultad de Ciencias, UNAM · Semestre 2026-2

---

# Autora

**Sac-Nicté Damayanti Salas Reyes**  
Licenciatura en Matemáticas Aplicadas  
Facultad de Ciencias — UNAM

---

# Descripción

Este proyecto implementa un sistema de análisis de sentimientos en español sobre reseñas de tres cafeterías con formatos en una misma zona Ciudad de México utilizando modelos de lenguaje basados en transformers.

El objetivo principal es estudiar y comparar estrategias modernas de clasificación de texto mediante:

- modelos preentrenados,
- fine-tuning supervisado,
- técnicas eficientes como LoRA y QLoRA,
- y métodos de interpretación léxica mediante TF-IDF.

Además de clasificar reseñas como positivas, neutrales o negativas, el proyecto incorpora una etapa de análisis interpretativo sobre comentarios negativos para identificar causas recurrentes de insatisfacción y traducirlas en propuestas de mejora.

Este trabajo forma parte del seminario:

> *Proyecto I: Introducción a Large Language Models*

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

El proyecto utiliza una arquitectura **encoder-only tipo BERT**, especializada en tareas discriminativas de clasificación de texto.

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

Los modelos encoder-only fueron seleccionados debido a:

- eficiencia en entrenamiento e inferencia,
- alto desempeño en clasificación,
- capacidad de capturar dependencias semánticas complejas,
- mejor adecuación para tareas discriminativas frente a modelos encoder-decoder.

---

# Corpus

El corpus consiste en reseñas de cafeterías en español obtenidas desde datasets públicos de Kaggle y posteriormente adaptadas al dominio específico del proyecto.

Cada texto se representa como:

```math
x_i = (w_1, w_2, ..., w_T)
```

---

# Preprocesamiento

El pipeline de limpieza contempla:

- normalización de texto,
- tokenización,
- eliminación de URLs,
- eliminación de símbolos aislados,
- reducción de ruido,
- limpieza de repeticiones,
- manejo de lenguaje informal,
- procesamiento de expresiones coloquiales del español mexicano.

---

# Baseline

Como baseline inicial se evaluará:

- un modelo preentrenado sin fine-tuning,
- embeddings contextualizados,
- clasificación zero-shot.

Se espera un desempeño moderado capaz de capturar tendencias generales de polaridad.

La función de pérdida considerada es la entropía cruzada:

```math
L = -\sum_{i=1}^{n}\sum_{c \in Y} y_{i,c}\log \hat{y}_i
```

---

# Análisis interpretativo con TF-IDF

Además del análisis de sentimiento, el proyecto incorpora una etapa de análisis léxico sobre las reseñas clasificadas como negativas.

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

- servicio,
- tiempos de espera,
- calidad del producto,
- atención al cliente,
- precio,
- ambiente del establecimiento.

A partir de ello será posible generar propuestas de mejora focalizadas basadas en datos reales.

---

# Tecnologías utilizadas

| Área | Herramientas |
|---|---|
| NLP | HuggingFace Transformers |
| Deep Learning | PyTorch |
| Fine-tuning | LoRA, QLoRA |
| Procesamiento de datos | pandas, datasets |
| Visualización | matplotlib, seaborn |
| Experimentación | Jupyter Notebook |
| Hardware | Kaggle GPU T4 |

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

