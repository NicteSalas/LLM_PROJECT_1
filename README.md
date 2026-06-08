# Análisis de Sentimientos y Aprobación Política en TikTok durante el torneo internacional de Fútbol 2026 en México usando BERT Multilingüe

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

Este proyecto analiza la percepción ciudadana sobre la gestión del gobierno mexicano en el contexto de los preparativos para el torneo internacional de futbol 2026 a llevarse a cabo en México. Para ello se recopilaron comentarios de TikTok relacionados con tres problemáticas frecuentemente asociadas con la organización del evento:

* Infraestructura
* Seguridad
* Turismo

A partir de estos comentarios, se realiza un análisis de sentimiento con el objetivo de identificar si las opiniones expresadas reflejan aprobación, desaprobación o neutralidad respecto de las acciones implementadas por el gobierno.

El proyecto busca estudiar si las inversiones y los cambios asociados al Mundial de Fútbol 2026 influyen en la aceptación ciudadana del gobierno actual.

---

# Objetivo

Construir un sistema de análisis de sentimientos capaz de evaluar la percepción pública sobre las acciones del gobierno mexicano relacionadas con la preparación del torneo internacional de fútbol 2026.

A partir de comentarios publicados en videos de TikTok asociados con el mundial y enfocados en alguno de los ejes de clasificación a considerar (infraestructura,seguridad,turismo), el sistema clasificará las opiniones en una escala de cinco niveles para medir el grado de aceptación o rechazo hacia la administración actual.

La tarea se modela como:

$$[f : X \rightarrow Y]$$

donde:

$$[Y = {1,2,3,4,5}]$$

| Clase | Significado  |
| -------- | ------------ |
| 1        | Muy negativo |
| 2        | Negativo     |
| 3        | Neutral      |
| 4        | Positivo     |
| 5        | Muy positivo |

---

# Problema de investigación

La organización de la Copa Mundial de la FIFA 2026 representa uno de los eventos deportivos más importantes para México en las últimas décadas. Su preparación implica inversiones significativas en infraestructura urbana, estrategias de seguridad pública y programas de promoción turística.

Estas acciones pueden influir en la percepción que la ciudadanía tiene sobre la gestión gubernamental. Sin embargo, los métodos tradicionales para medir opinión pública, como encuestas y entrevistas, suelen requerir grandes recursos económicos y presentan limitaciones temporales.

Las redes sociales ofrecen una fuente alternativa de información donde los usuarios expresan opiniones de manera espontánea. En particular, TikTok se ha convertido en una de las plataformas con mayor crecimiento en México y concentra una gran cantidad de discusiones relacionadas con temas sociales, políticos y deportivos.

Este proyecto busca utilizar técnicas de Procesamiento de Lenguaje Natural (NLP) para analizar comentarios de TikTok relacionados con infraestructura, seguridad y turismo durante la preparación del Mundial de Fútbol 2026.

El objetivo es identificar patrones de aprobación o desaprobación hacia las acciones gubernamentales y estudiar cómo estas percepciones varían entre las diferentes temáticas analizadas.

La pregunta central del proyecto es:

> Los cambios asociados a la organización del Mundial de Fútbol 2026 ¿están mejorando la aceptación del gobierno mexicano según las opiniones expresadas en TikTok?

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
* Estrategias de seguridad y percepción general.
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

* Qué temática genera mayor aceptación ciudadana
* Qué temática genera mayor descontento
* Si existe una tendencia positiva asociada a las inversiones relacionadas con el Mundial
* Cómo varía la percepción pública entre las distintas áreas analizadas

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
