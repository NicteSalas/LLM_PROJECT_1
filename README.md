# Análisis de Sentimientos y Polarización Política en TikTok durante el Mundial de Fútbol 2026 en México usando BERT Multilingüe

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

Este proyecto analiza la percepción ciudadana sobre la gestión del gobierno mexicano en el contexto de los preparativos para la Copa Mundial de la FIFA 2026. Para ello se recopilaron comentarios de TikTok relacionados con tres problemáticas frecuentemente asociadas con la organización del evento:

* Infraestructura
* Seguridad
* Turismo

A partir de estos comentarios se realiza un análisis de sentimiento con el objetivo de identificar si las opiniones expresadas reflejan aprobación, desaprobación o neutralidad respecto a las acciones implementadas por el gobierno.

El proyecto busca estudiar si las inversiones y cambios asociados al Mundial de Fútbol 2026 influyen en la aceptación ciudadana del gobierno actual.

---

# Objetivo

Construir un sistema de análisis de sentimientos capaz de evaluar la percepción pública sobre las acciones del gobierno mexicano relacionadas con la preparación del Mundial de Fútbol 2026.

A partir de comentarios publicados en TikTok, el sistema clasificará las opiniones en una escala de cinco niveles para medir el grado de aceptación o rechazo hacia la administración actual.

La tarea se modela como:

$$[f : X \rightarrow Y]$$

donde:

$$[Y = {1,2,3,4,5}]$$

| Clase | Interpretación                    |
| ----- | --------------------------------- |
| 1     | Muy en desacuerdo con el gobierno |
| 2     | En desacuerdo con el gobierno     |
| 3     | Neutral                           |
| 4     | De acuerdo con el gobierno        |
| 5     | Muy de acuerdo con el gobierno    |

---

# Problema de investigación

La organización de eventos internacionales suele implicar inversiones importantes en infraestructura, turismo y seguridad. Estas acciones pueden modificar la percepción ciudadana sobre el desempeño gubernamental.

Sin embargo, medir dicha percepción mediante encuestas tradicionales resulta costoso y lento. Las redes sociales ofrecen una alternativa para estudiar opiniones expresadas de manera espontánea por los usuarios.

La pregunta central del proyecto es:

> ¿Los cambios asociados a la organización del Mundial de Fútbol 2026 están mejorando la aceptación del gobierno mexicano según las opiniones expresadas en TikTok?

---

# Corpus

El corpus está compuesto por aproximadamente 3000 comentarios obtenidos mediante TikTok y recolectados utilizando Apify.

Los comentarios se distribuyen en tres categorías temáticas:

| Categoría       | Número aproximado de comentarios |
| --------------- | -------------------------------- |
| Infraestructura | 1000                             |
| Seguridad       | 1000                             |
| Turismo         | 1000                             |
| Total           | 3000                             |

Los videos seleccionados corresponden a publicaciones virales relacionadas con:

* Construcción y remodelación de infraestructura.
* Estrategias de seguridad para el Mundial.
* Impacto turístico y económico esperado.

---

# Baseline

Como línea base se construyó un conjunto de datos etiquetado manualmente utilizando una escala ordinal de cinco niveles.

Cada comentario se clasifica según el grado de aceptación o rechazo hacia el gobierno actual:

| Etiqueta | Significado  |
| -------- | ------------ |
| 1        | Muy negativo |
| 2        | Negativo     |
| 3        | Neutral      |
| 4        | Positivo     |
| 5        | Muy positivo |

Sobre este corpus se realizarán las siguientes tareas:

## Análisis de sentimientos

Clasificar automáticamente los comentarios según la escala definida.

## Comparación por categoría

Analizar diferencias entre:

* Infraestructura
* Seguridad
* Turismo

## Evaluación de aceptación gubernamental

Calcular la distribución de sentimientos para estimar el nivel de aceptación del gobierno en cada temática.

## Resultados esperados

Se espera identificar:

* Qué temática genera mayor aceptación ciudadana.
* Qué temática genera mayor descontento.
* Si existe una tendencia positiva asociada a las inversiones relacionadas con el Mundial.
* Cómo varía la percepción pública entre las distintas áreas analizadas.

La hipótesis principal es que los proyectos asociados al Mundial de Fútbol 2026 generan una mejora observable en la percepción ciudadana del gobierno, particularmente en temas de infraestructura y turismo.

---

# Tecnologías utilizadas

| Área | Herramientas |
|---------|---------|
| NLP | HuggingFace Transformers |
| Deep Learning | PyTorch |
| Modelo base | BERT Multilingüe |
| Recolección de datos | Apify |
| Procesamiento de datos | pandas |
| Visualización | matplotlib |
| Análisis geográfico | geopandas |
| Experimentación | Jupyter Notebook |
| Hardware | Kaggle GPU T4 |

---

# Estructura del repositorio

```text
WORLD_CUP_TIKTOK_ANALYSIS/
│
├── README.md
│
├── notebooks/
│   ├── 01_data_collection.ipynb
│   ├── 02_data_exploration.ipynb
│   ├── 03_preprocessing.ipynb
│   ├── 04_baseline.ipynb
│   ├── 05_finetuning.ipynb
│   ├── 06_sentiment_analysis.ipynb
│   ├── 07_political_detection.ipynb
│   └── 08_visualization.ipynb
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
| Obtención de datos TikTok | 🟡 |
| Curación del corpus | 🟡 |
| Preprocesamiento | ⬜ |
| Baseline BERT | ⬜ |
| Fine-tuning | ⬜ |
| Análisis de sentimientos | ⬜ |
| Evaluación | ⬜ |
| Documentación final | ⬜ |



# Consideraciones éticas

Los datos utilizados provienen de contenido públicamente accesible en TikTok y se emplean exclusivamente con fines académicos y de investigación.

Este proyecto no busca identificar individuos ni analizar usuarios específicos, sino estudiar tendencias generales de opinión 
pública relacionadas con el torneo internacional de futbol a llevarse a cabo durante Junio 2026 en México.

---

<<<<<<< HEAD
=======
# Instalación

## Requisitos

- Python 3.10 o superior
- Git
- Clonar el repositorio


---

# Ejecucion

---

# Métricas de evaluación

El desempeño del modelo se evaluará mediante:

- Accuracy
- Balanced Accuracy
- F1 Weighted
- F1-score
- Matriz de confusión

Estas métricas permitirán comparar el desempeño del baseline contra el modelo ajustado mediante fine-tuning.

>>>>>>> 0c273f1df8f49e056987858c455a6a9bee5e29e5
# Agradecimientos

A la Universidad Nacional Autónoma de México, a la Facultad de Ciencias y a los investigadores que impartieron *Proyecto I* por el acompañamiento académico y moral durante el desarrollo de este trabajo.