# Análisis de Sentimientos y Polarización Política durante el Mundial de Fútbol en México usando LLMs y BERT Multilingüe

Análisis dentro del marco de la materia **Proyecto I - Introducción a los Large Language Models**  
Facultad de Ciencias, UNAM · Semestre 2026-2

---

# Autores

Licenciatura en Matemáticas Aplicadas

Facultad de Ciencias — UNAM

**Anetzy Fernanda García Compean**

**Sac-Nicté Damayanti Salas Reyes**

**Pedro Díaz López** 
---

# Descripción general

Este proyecto implementa un sistema de análisis de sentimientos y detección de polarización política en publicaciones de X (antes Twitter) relacionadas con el Mundial de Fútbol.

A partir de datos recolectados mediante la plataforma Apify, se analizarán publicaciones realizadas por usuarios ubicados en distintos estados de México para identificar:

- sentimientos predominantes hacia eventos relacionados con el Mundial,
- diferencias regionales en la percepción del evento,
- presencia de discursos políticamente polarizados,
- asociaciones entre temas deportivos y actores políticos.

El proyecto combina técnicas modernas de Procesamiento de Lenguaje Natural (NLP), modelos de lenguaje preentrenados y análisis exploratorio de datos para estudiar cómo un evento deportivo de alcance internacional puede convertirse en un espacio de expresión política dentro de redes sociales.

---

# Objetivo

Construir un pipeline reproducible de procesamiento de lenguaje natural capaz de analizar sentimientos y detectar patrones de polarización política en publicaciones relacionadas con el Mundial de Fútbol realizadas por usuarios mexicanos en la red social X.

Las tareas principales se modelan como:

$$\[f_s : X \rightarrow Y_s\]$$

donde:

$$\[Y_s = \{-1,0,1\}\]$$

con:

| Clase | Significado |
|---------|---------|
| 1 | Sentimiento negativo |
| 3 | Sentimiento neutral |
| 5 | Sentimiento positivo |

Asimismo, se plantea una segunda tarea:
$$\[f_p : X \rightarrow Y_p\]$$
donde:
$$\[Y_p = \{0,1\}\]$$

| Clase | Significado |
|---------|---------|
| 0 | No polarizado |
| 1 | Polarizado políticamente |

El objetivo final es aproximar:

$$\[\hat{y} = \arg\max P(y|x;\theta)\]$$

para ambas tareas.

---

# Problema de investigación

Las redes sociales se han convertido en espacios donde los usuarios no solo expresan opiniones sobre eventos deportivos, sino también posiciones ideológicas y políticas.

Durante eventos masivos como el Mundial de Fútbol, es común observar:

- apoyo o rechazo a selecciones nacionales,
- discusiones sobre organización del evento,
- críticas gubernamentales,
- mensajes de carácter partidista,
- narrativas nacionalistas o ideológicas.

Sin embargo, existe poca evidencia sobre cómo estas dinámicas se distribuyen entre los distintos estados de México y qué patrones de polarización emergen alrededor de un evento deportivo.

---

# Motivación

El análisis de sentimientos permite transformar opiniones subjetivas en información estructurada útil para comprender fenómenos sociales.

En este contexto, el proyecto busca:

- estudiar la percepción social del Mundial de Fútbol,
- identificar diferencias regionales en México,
- analizar la presencia de discursos políticos en conversaciones deportivas,
- explorar el potencial de los LLMs para el análisis social a gran escala.

Los resultados podrían ser de interés para investigadores en:

- ciencia de datos,
- ciencias sociales,
- comunicación política,
- análisis de redes sociales,
- procesamiento de lenguaje natural.

---

# Arquitectura

El proyecto utiliza una arquitectura **encoder-only** basada en BERT Multilingüe, especializada en tareas de clasificación de texto.

Pipeline general:

```text
Tweet → Preprocesamiento → Tokenización → BERT → Clasificador → Sentimiento / Polarización
```

La representación contextual se obtiene mediante:

$$\[h = BERT(x)\]$$

y la predicción final:

$$\[\hat{y}=softmax(W h_{CLS}+b)\]$$

La elección de BERT Multilingüe se fundamenta en:

- alto desempeño en clasificación textual,
- soporte para español,
- capacidad de capturar contexto semántico,
- facilidad de adaptación mediante fine-tuning.

---

# Corpus

El corpus estará compuesto por publicaciones extraídas mediante Apify desde la plataforma X.

Las búsquedas incluirán palabras clave relacionadas con:

- Mundial de Fútbol,
- Selección Mexicana,
- FIFA,
- partidos internacionales,
- hashtags oficiales del torneo.

Asimismo, se recopilarán publicaciones que contengan referencias a:

- partidos políticos mexicanos,
- actores políticos,
- temas gubernamentales vinculados indirectamente al Mundial.

Cada documento se representa como:

$$\[x_i=(w_1,w_2,\dots,w_T)\]$$

donde $$\(w_j\)$$ representa los tokens del texto.

---

# Obtención de datos

Fuente principal:

:contentReference[oaicite:0]{index=0}

Los datos recopilados incluirán:

- texto del tweet,
- fecha,
- ubicación cuando esté disponible,
- hashtags,
- número de interacciones,
- usuario anonimizado.

---

# Preprocesamiento

El pipeline contempla:

- normalización de texto,
- eliminación de URLs,
- eliminación de emojis irrelevantes,
- tokenización,
- eliminación de ruido,
- limpieza de caracteres especiales,
- detección de idioma,
- normalización de hashtags.

Además se incorporará:

- extracción de entidades políticas,
- detección de menciones a partidos políticos,
- identificación de actores públicos.

---

# Baseline

Como baseline inicial se evaluará:

- BERT Multilingüe sin fine-tuning,
- clasificación zero-shot,
- embeddings contextualizados.

Se espera obtener:

| Métrica | Estimación inicial |
|----------|----------|
| Accuracy sentimiento | 65%-75% |
| Accuracy polarización | 60%-70% |

Posteriormente se comparará contra versiones ajustadas mediante fine-tuning.

La función de pérdida considerada es:

$$\[L=-\sum_{i=1}^{n}\sum_{c\in Y}y_{i,c}\log(\hat y_{i,c})\]$$

---

# Análisis de polarización

Sea:

$$\[X_P=\{x_i\in X : \text{contiene referencias políticas}\}\]$$

el subconjunto de publicaciones con contenido político.

Sobre este conjunto se analizarán:

- menciones a partidos políticos,
- frecuencia de términos ideológicos,
- asociaciones entre deporte y política,
- distribución geográfica de la polarización.

---

# Análisis léxico mediante TF-IDF

Para identificar términos característicos asociados a cada categoría se utilizará TF-IDF.

La frecuencia de término se define como:

$$\[TF(t,d)=\frac{f_{t,d}}{\sum_{t'}f_{t',d}}\]$$

La frecuencia inversa de documento:

$$\[IDF(t)=\log\left(\frac{N}{df_t}\right)\]$$

Y la ponderación final:

$$\[TFIDF(t,d)=TF(t,d)\cdot IDF(t)\]$$

Este análisis permitirá detectar palabras asociadas con:

- apoyo a la selección,
- críticas al desempeño deportivo,
- discursos políticos,
- polarización ideológica,
- narrativas nacionalistas.

---

# Tecnologías utilizadas

| Área | Herramientas |
|---------|---------|
| NLP | HuggingFace Transformers |
| Deep Learning | PyTorch |
| Clasificación | BERT Multilingüe |
| Procesamiento de datos | pandas |
| Recolección de datos | Apify |
| Visualización | matplotlib |
| Análisis geográfico | geopandas |
| Experimentación | Jupyter Notebook |
| Hardware | Kaggle GPU T4 |

---

# Estructura del repositorio

```text
WORLD_CUP_SENTIMENT_PROJECT/
│
├── README.md
│
├── notebooks/
│   ├── 01_data_collection.ipynb
│   ├── 02_data_exploration.ipynb
│   ├── 03_preprocessing.ipynb
│   ├── 04_baseline.ipynb
│   ├── 05_finetuning.ipynb
│   ├── 06_polarization_analysis.ipynb
│   └── 07_visualization.ipynb
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
|----------|----------|
| Revisión bibliográfica | ✅ |
| Obtención de datos | 🟡 |
| Curación del corpus | 🟡 |
| Preprocesamiento | ⬜ |
| Baseline | ⬜ |
| Fine-tuning BERT | ⬜ |
| Clasificación de sentimientos | ⬜ |
| Detección de polarización | ⬜ |
| TF-IDF | ⬜ |
| Visualización geográfica | ⬜ |
| Evaluación | ⬜ |
| Deployment | ⬜ |

---

# Referencias principales



---

# Reproducibilidad

Todos los experimentos están diseñados para ejecutarse en:

- Google Colab
- Kaggle Notebooks
- GPUs NVIDIA con soporte CUDA

Cada notebook documentará:

- dependencias,
- hiperparámetros,
- configuración,
- métricas,
- resultados experimentales.

---

# Licencia

Este proyecto tiene fines académicos y educativos.

Los datasets, modelos y bibliotecas utilizadas mantienen las licencias originales de sus respectivos autores.

---

# Agradecimientos

A la Universidad Nacional Autónoma de México y a la Facultad de Ciencias por proporcionar el espacio académico para el desarrollo de este proyecto, así como a los docentes de la materia Proyecto I por sus observaciones y acompañamiento durante el proceso de investigación.

