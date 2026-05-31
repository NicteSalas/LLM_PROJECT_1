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

Este proyecto implementa un sistema de análisis de sentimientos y detección de polarización política en publicaciones de TikTok relacionadas con el Mundial de Fútbol 2026.

A partir de datos recolectados mediante Apify, se analizarán videos, descripciones y comentarios realizados por usuarios de distintos estados de México con el objetivo de identificar:

- Sentimientos predominantes hacia el Mundial de Fútbol.
- Diferencias regionales en la percepción del evento.
- Presencia de discursos políticamente polarizados.
- Menciones a partidos políticos y figuras públicas.
- Relación entre eventos deportivos y conversación política.

El proyecto combina técnicas modernas de Procesamiento de Lenguaje Natural (NLP), modelos Transformer y análisis exploratorio de datos para estudiar cómo un evento deportivo de alcance internacional puede convertirse en un espacio de discusión política en redes sociales.

---

# Objetivo

Construir un pipeline reproducible de procesamiento de lenguaje natural capaz de analizar sentimientos y detectar patrones de polarización política en publicaciones de TikTok relacionadas con el Mundial de Fútbol 2026 realizadas por usuarios mexicanos.

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
| 0 | Sin contenido político |
| 1 | Contenido político |

El modelo busca aproximar:

$$\[\hat{y} = \arg\max P(y|x;\theta)\]$$

---

# Problema de investigación

TikTok se ha convertido en una de las plataformas digitales más influyentes entre jóvenes y adultos jóvenes en México. Aunque originalmente fue diseñada para contenido de entretenimiento, actualmente funciona como un espacio donde los usuarios expresan opiniones sobre temas sociales, deportivos y políticos.

Durante eventos masivos como el Mundial de Fútbol es común observar:

- Apoyo o rechazo a selecciones nacionales.
- Opiniones sobre jugadores y entrenadores.
- Reacciones a decisiones arbitrales.
- Comentarios relacionados con el gobierno.
- Discusiones sobre partidos políticos.
- Narrativas nacionalistas o ideológicas.

Sin embargo, existe poca evidencia sobre cómo estas conversaciones se distribuyen geográficamente dentro de México y qué patrones de polarización política emergen durante eventos deportivos de gran escala.

---

# Motivación

El análisis de sentimientos permite transformar opiniones subjetivas en información estructurada útil para comprender fenómenos sociales.

En este contexto, el proyecto busca:

- Analizar la percepción pública del Mundial de Fútbol 2026.
- Estudiar diferencias regionales entre estados de México.
- Detectar menciones políticas dentro de conversaciones deportivas.
- Explorar posibles patrones de polarización política.
- Aplicar modelos de lenguaje modernos a problemas de análisis social.

Los resultados pueden ser de interés para investigadores en:

- Ciencia de datos.
- Procesamiento de lenguaje natural.
- Ciencias sociales.
- Comunicación política.
- Estudios sobre redes sociales.

---

# Arquitectura

El proyecto utiliza una arquitectura **encoder-only** basada en BERT Multilingüe, especializada en tareas de clasificación de texto.

Pipeline general:

```text
Comentario TikTok
        ↓
Preprocesamiento
        ↓
Tokenización
        ↓
BERT Multilingüe
        ↓
Clasificador
        ↓
Sentimiento / Contenido Político
```

La representación contextual se obtiene mediante:

$$\[h = BERT(x)\]$$

y la predicción final:

$$\[\hat{y}=softmax(W h_{CLS}+b)\]$$

La elección de BERT Multilingüe se fundamenta en:

- Alto desempeño en clasificación textual.
- Soporte para español.
- Capacidad de capturar contexto semántico.
- Facilidad de adaptación mediante fine-tuning.
- Amplio uso en tareas de análisis de sentimientos.

---

# Corpus

El corpus inicial está compuesto por aproximadamente 3000 comentarios de TikTok obtenidos mediante Apify, distribuidos en tres categorías temáticas: infraestructura, seguridad y turismo. Cada categoría se construyó a partir de videos virales relacionados con el Mundial de Fútbol 2026 en México. Esta división permite comparar cómo varían los sentimientos y las referencias políticas según el tema discutido por los usuarios.

Se recopilarán:

- Descripciones de videos.
- Comentarios.
- Hashtags.
- Fecha de publicación.
- Métricas de interacción.
- Información geográfica cuando esté disponible.

Las búsquedas estarán relacionadas con:

- Mundial 2026.
- FIFA.
- Selección Mexicana.
- Fútbol.
- Estadios sede en México.
- Hashtags oficiales del torneo.

Cada documento se representa como:

$$\[x_i=(w_1,w_2,\dots,w_T)\]$$

donde $$\(w_j\)$$ representa los tokens del texto.

---

# Obtención de datos

Fuente principal:

https://apify.com

Los datos se obtendrán mediante scrapers públicos de TikTok disponibles en Apify.

Los registros incluirán:

- Texto.
- Comentarios.
- Hashtags.
- Fecha.
- Número de likes.
- Número de respuestas.
- Información geográfica disponible.

---

# Preprocesamiento

El pipeline contempla:

- Conversión a minúsculas.
- Eliminación de URLs.
- Eliminación de emojis irrelevantes.
- Eliminación de caracteres especiales.
- Tokenización.
- Eliminación de ruido.
- Normalización de hashtags.
- Detección de idioma.

Además se realizará la detección de menciones a:

- Morena.
- PAN.
- PRI.
- Movimiento Ciudadano.
- Claudia Sheinbaum.
- Andrés Manuel López Obrador.
- Xóchitl Gálvez.
- Jorge Álvarez Máynez.
- Otras figuras políticas relevantes.

---

# Baseline

Como línea base para el proyecto se construyó un corpus inicial de comentarios obtenidos de TikTok mediante la plataforma Apify. Con el fin de analizar distintas dimensiones de la percepción pública sobre el Mundial de Fútbol 2026 en México, se seleccionaron tres categorías temáticas de interés:

- **Infraestructura**
- **Seguridad**
- **Turismo**

Para cada categoría se identificaron videos virales relacionados con el Mundial de Fútbol, las ciudades sede y los preparativos del evento en México. A partir de estos videos se extrajeron aproximadamente **1000 comentarios por categoría**, obteniendo un corpus inicial de alrededor de **3000 comentarios**.

La distribución del corpus se resume en la siguiente tabla:

| Categoría | Comentarios recopilados |
|------------|------------|
| Infraestructura | ~1000 |
| Seguridad | ~1000 |
| Turismo | ~1000 |
| **Total** | **~3000** |

Este corpus servirá como baseline para evaluar el comportamiento inicial de los usuarios de TikTok y establecer una referencia para etapas posteriores de análisis y experimentación.

Sobre este conjunto de datos se realizarán las siguientes tareas:

## 1. Análisis de sentimientos

Cada comentario será clasificado en una de las siguientes categorías:

| Clase | Significado |
|---------|---------|
| -1 | Sentimiento negativo |
| 0 | Sentimiento neutral |
| 1 | Sentimiento positivo |

El objetivo es identificar la percepción general de los usuarios respecto a temas relacionados con el Mundial de Fútbol y comparar los resultados entre las categorías de infraestructura, seguridad y turismo.

## 2. Detección de contenido político

Se identificarán menciones explícitas a partidos políticos y figuras públicas relevantes en México.

Las entidades consideradas inicialmente incluyen:

- Morena
- PAN
- PRI
- Movimiento Ciudadano
- Claudia Sheinbaum
- Andrés Manuel López Obrador
- Xóchitl Gálvez
- Jorge Álvarez Máynez

## 3. Análisis de polarización

A partir de las menciones políticas detectadas se analizarán:

- Frecuencia de menciones por categoría.
- Relación entre sentimiento y actor político mencionado.
- Presencia de discursos polarizados.
- Diferencias entre infraestructura, seguridad y turismo.

## 4. Resultados esperados

Se espera que este baseline permita:

- Identificar tendencias generales de opinión pública relacionadas con el Mundial de Fútbol 2026.
- Detectar temas que generan mayor aceptación o rechazo.
- Observar la presencia de discursos políticos dentro de conversaciones originalmente deportivas.
- Establecer una referencia cuantitativa para futuras etapas de ajuste y evaluación de modelos.

### Ejemplo de estructura del dataset

| id | categoría | comentario | sentimiento | mención_política |
|----|-----------|------------|------------|------------------|
| 1 | Infraestructura | El estadio quedó increíble | Positivo | No |
| 2 | Seguridad | Deberían invertir más en seguridad | Negativo | No |
| 3 | Turismo | Morena solo usa el Mundial para hacer campaña | Negativo | Sí |
| 4 | Turismo | Vendrán muchos turistas a México | Positivo | No |

### Métricas iniciales

Las métricas que se reportarán sobre el baseline incluyen:

- Distribución de sentimientos por categoría.
- Porcentaje de comentarios con contenido político.
- Frecuencia de menciones a partidos políticos.
- Frecuencia de menciones a figuras políticas.
- Comparación entre categorías temáticas.
- Visualizaciones descriptivas mediante gráficas y tablas.

# Detección de Polarización Política

Se construirá un sistema basado inicialmente en palabras clave para identificar menciones a:

| Categoría | Ejemplos |
|------------|------------|
| Morena | morena, 4T |
| PAN | pan, acción nacional |
| PRI | pri |
| Movimiento Ciudadano | movimiento ciudadano, MC |
| Figuras políticas | Sheinbaum, AMLO, Xóchitl, Máynez |

Sea:

$$\[X_P=\{x_i \in X : x_i \text{ contiene referencias políticas}\}\]$$

el subconjunto de publicaciones con contenido político.

Sobre este conjunto se analizarán:

- Frecuencia de menciones políticas.
- Distribución geográfica.
- Relación entre sentimiento y partido mencionado.
- Coocurrencia entre fútbol y política.

---

# Análisis Léxico mediante TF-IDF

Para identificar términos característicos asociados a cada categoría se utilizará TF-IDF.

La frecuencia de término se define como:

$$\[TF(t,d)=\frac{f_{t,d}}{\sum_{t'}f_{t',d}}\]$$

La frecuencia inversa de documento:

$$\[IDF(t)=\log\left(\frac{N}{df_t}\right)\]$$

Y la ponderación final:

$$\[TFIDF(t,d)=TF(t,d)\cdot IDF(t)\]$$

Este análisis permitirá detectar palabras asociadas con:

- Sentimientos positivos.
- Sentimientos negativos.
- Nacionalismo deportivo.
- Discursos políticos.
- Narrativas polarizadas.

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
| Detección política | ⬜ |
| TF-IDF | ⬜ |
| Visualización geográfica | ⬜ |
| Evaluación | ⬜ |
| Documentación final | ⬜ |

---

# Referencias principales

- Berdón-Prieto, Pablo; Herrero-Izquierdo, Jacobo; Reguero-Sanz, Itziar (2023). “Political polarization and politainment: Methodology for analyzing crypto hate speech on TikTok”. Profesional de la información, v. 32, n. 6, e320601. https://doi.org/10.3145/epi.2023.nov.01 

- Arce-García, S., & Fernández-Gómez, E. (2024). Deporte y polarización en X: análisis de sentimiento, emociones y posicionamiento aplicado a la entrevista #ObjetivoNadal. Revista Mediterránea de Comunicación, 15(2), 45–63.
- Cárdenas-Rica, M. L., & Sánchez-Castillo, S. (2024). Comunicación política en redes sociales: análisis de popularidad y sentimientos en X/Twitter mediante ciencia de datos. Revista Latina de Comunicación Social, 82, 1–22.

- Yu, H., Wang, X., & Joo, J. (2018). GOAALLL!: Using sentiment in the World Cup to explore theories of emotion. Proceedings of the International AAAI Conference on Web and Social Media, 12(1), 617–620.

- Maddock, J., O'Reilly, M., & Braghieri, L. (2024). What's political on TikTok? Perceptions, prevalence, and patterns of exposure to TikToks users perceive as political. New Media & Society.

---

# Licencia

Este proyecto tiene fines académicos y educativos.

---

# Agradecimientos

A la Universidad Nacional Autónoma de México, a la Facultad de Ciencias y a los profesores de la materia Proyecto I por el acompañamiento académico durante el desarrollo de este trabajo.
