# Análisis de Sentimientos y Aprobación Política en TikTok durante el Torneo Internacional de Futbol 2026 en México usando BERT Multilingüe

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

Este proyecto analiza la percepción ciudadana sobre la gestión del gobierno mexicano en el contexto de los preparativos para el Torneo Internacional de Futbol 2026 a llevarse a cabo en México. Para ello se recopilaron comentarios de TikTok relacionados con tres problemáticas frecuentemente asociadas con la organización del evento:

* Infraestructura
* Seguridad
* Turismo

A partir de estos comentarios, se realiza un análisis de sentimiento con el objetivo de identificar si las opiniones expresadas reflejan aprobación, desaprobación o neutralidad respecto de las acciones implementadas por el gobierno.

El proyecto busca estudiar si las inversiones y los cambios asociados al Torneo Internacional de Futbol 2026 influyen en la aceptación ciudadana del gobierno actual.

---

# Descripción del problema

La organización del Torneo Internacional de Futbol 2026 representa uno de los eventos deportivos más importantes para México en las últimas décadas. De acuerdo a Gilberto Fragoso Peralta en _Así se hizo el Mundial_,  preparación implica inversiones significativas en infraestructura urbana, estrategias de seguridad pública y programas de promoción turística desde el mundial realizado en México en 1986. 

Del mismo modo, podemos establecer a partir de dicho artículo que estas acciones pueden influir en la percepción que la ciudadanía tiene sobre la gestión gubernamental. Desde quienes lo financian, se busca que sea de forma positiva. [2] Sin embargo, los métodos tradicionales para medir opinión pública, como encuestas y entrevistas, suelen requerir grandes recursos económicos y presentan limitaciones temporales.

Las redes sociales ofrecen una fuente alternativa de información donde los usuarios expresan opiniones de manera espontánea. En particular, TikTok se ha convertido en una de las plataformas con mayor crecimiento en México y concentra una gran cantidad de discusiones relacionadas con temas sociales, políticos y deportivos.

Este proyecto utiliza técnicas de Procesamiento de Lenguaje Natural (NLP) para analizar comentarios de TikTok relacionados con infraestructura, seguridad y turismo durante la preparación del Torneo Internacional de Futbol 2026, con el fin de identificar patrones de aprobación o desaprobación hacia las acciones gubernamentales y estudiar cómo varían entre las distintas temáticas.

La pregunta central del proyecto es:

> Los cambios asociados a la organización del Torneo Internacional de Futbol 2026 ¿están mejorando la aceptación del gobierno mexicano según las opiniones expresadas en TikTok?

---

# Objetivo

Construir un sistema de análisis de sentimientos capaz de evaluar la percepción pública sobre las acciones del gobierno mexicano relacionadas con la preparación del Torneo Internacional de Futbol 2026.

A partir de comentarios publicados en videos de TikTok asociados con el evento y enfocados en alguno de los ejes de clasificación a considerar (infraestructura, seguridad, turismo), el sistema clasifica las opiniones en una escala ordinal de cinco niveles para medir el grado de aceptación o rechazo hacia la administración actual.

La tarea se modela como:

$$f : X \rightarrow Y, \qquad Y = \{1,2,3,4,5\}$$

donde cada nivel se interpreta así:

| Clase | Significado            |
| ----- | ---------------------- |
| 1     | Negativa               |
| 2     | Parcialmente negativa  |
| 3     | Neutral                |
| 4     | Parcialmente positiva  |
| 5     | Positiva               |

---

# Corpus

El corpus está compuesto por aproximadamente 2,820 comentarios recolectados de TikTok mediante **Apify**, distribuidos en tres ejes temáticos:

| Categoría       | Comentarios (crudos) |
| --------------- | -------------------- |
| Infraestructura | 915                  |
| Seguridad       | 1000                 |
| Turismo         | 905                  |
| **Total**       | **2,820**            |

De cada eje se etiquetaron manualmente **200 comentarios** (≈600 en total) que sirven como referencia (*gold set*) para entrenar, validar y evaluar los modelos. Cada registro crudo conserva metadatos relevantes como: `diggCount` (likes), `replyCommentTotal`, `createTimeISO` (fecha), `uniqueId` (usuario), entre otros. Sin embargo, dichos metadatos fueron descartados para la ejecución del presente proyecto. Conservamos las siguientes columnas:

| comentario | etiquetado_humano | categoria |

A partir de la cual se iniciará el procesamiento para posterior análisis.

---

# Baseline

Como línea base se evalúa el modelo preentrenado **sin ajustar** (`nlptown/bert-base-multilingual-uncased-sentiment`) contra el etiquetado humano, usando la misma escala ordinal de cinco niveles:

| Etiqueta | Significado            |
| -------- | ---------------------- |
| 1        | Negativa               |
| 2        | Parcialmente negativa  |
| 3        | Neutral                |
| 4        | Parcialmente positiva  |
| 5        | Positiva               |

Sobre este corpus se realizan: clasificación automática de sentimiento, comparación por categoría (infraestructura/seguridad/turismo) y estimación del nivel de aceptación gubernamental por temática.

---

# Tecnologías utilizadas

| Área | Herramientas |
|------|--------------|
| NLP | Hugging Face Transformers |
| Deep Learning | PyTorch |
| Fine-tuning eficiente | PEFT / LoRA |
| Datasets | Hugging Face Datasets |
| Modelo base | **`nlptown/bert-base-multilingual-uncased-sentiment`** |
| Recolección de datos | Apify |
| Procesamiento de datos | pandas, numpy, regex, ftfy |
| Métricas | scikit-learn |
| Visualización | matplotlib |
| Experimentación | Jupyter Notebook |
| Hardware | **NVIDIA GeForce RTX 4060 Laptop GPU** |

- **Modelo usado:** `nlptown/bert-base-multilingual-uncased-sentiment`
- **Modelo de GPU:** NVIDIA GeForce RTX 4060 Laptop GPU

---

# Estructura del repositorio

```text
LLM_PROJECT_1/
│
├── README.md
├── LICENSE
├── requirements.txt
├── .gitignore
│
├── data/
│   ├── raw/                          # datos crudos de TikTok (Apify)
│   │   ├── README_raw.md
│   │   ├── raw_infraestructura.csv
│   │   ├── raw_seguridad.csv
│   │   └── raw_turismo.csv
│   ├── etiquetado_humano/            # gold set (200 por eje)
│   │   ├── README_etiquetado_humano.md
│   │   ├── infraestructura_etiquetado_humano.csv
│   │   ├── seguridad_etiquetado_humano.csv
│   │   └── turismo_etiquetado_humano.csv
│   ├── limpieza_final/               # comentarios limpios + archivo unificado
│   │   ├── README_limpieza_final.md
│   │   ├── infraestructura_limpio.csv
│   │   ├── seguridad_limpio.csv
│   │   ├── turismo_limpio.csv
│   │   └── etiquetado_humano_unificado.csv
│   ├── pruebas_limpieza/                          # pruebas de preprocesamiento  (v1, v2, v3)
│   │   ├── processed_v1
|   |   |   ├── tiktok_infraes_limpio.csv
|   |   |   ├── tiktok_seguridad_limpio.csv
│   │   |   └── tiktok_turismo_limpio.csv
│   │   ├── processed_v2
|   |   |   ├── infraestructura_limpio.csv
│   │   |   └── turismo_limpio.csv
│   │   └── processed_v3
|   |   |   ├── infraestructura_limpio.csv
|   |   |   ├── seguridad_limpio.csv
│   │   |   └── turismo_limpio.csv
│   └── resultados/          # archivos de resultados del repositorio
|   |   ├── imagenes
|   |   |   ├── comparacion_baseline_vs_afinado.png
|   |   ├── escalamiento_resultados.csv
|   |   ├── comparacion_baseline_vs_poder_predictivo.md
│   |   └── baseline_resultados_procesamiento.csv
│
├── notebooks_proyecto/              # pipeline del proyecto
│   ├── LimpiezaDatos.ipynb           # limpieza y normalización del texto
│   ├── Baseline.ipynb                # evaluación del modelo sin ajustar
│   ├── FineTuning.ipynb              # ajuste con LoRA + validación cruzada
│   ├── proyecto1.ipynb               # notebook misteriosa
│   └── FineTuning_Foto_No_Correr.ipynb
│
├── modelos/                         # adaptadores LoRA por fold + checkpoints
│   ├── Modelo_fold_1/ ... Modelo_fold_10/   # adapter_config.json + metricas.json
│   └── checkpoint-*/
│
├── notebooks_clase/                 # material de clase (Fases 1-4)
├── notebooks_ayudantia/             # tutoriales de ayudantía (RAG, limpieza PDFs)
├── presentaciones/                  # presentaciones HTML proporcionadas en clase
└── bibliografia/                    # artículos de referencia y liga a repositorio Drive.
│   ├── articulos_referencia.md

```

---

# Instalación

## Requisitos previos

- **Python 3.10 o superior**
- **Git**
- GPU NVIDIA con CUDA (recomendado para el fine-tuning; el equipo de referencia es una **NVIDIA GeForce RTX 4060 Laptop GPU**). El baseline y la limpieza pueden correr en CPU.

## Pasos

```bash
# 1. Clonar el repositorio
git clone <URL_DEL_REPOSITORIO>
cd LLM_PROJECT_1

# 2. (Recomendado) crear y activar un entorno virtual
python -m venv .venv
source .venv/bin/activate        # En Windows: .venv\Scripts\activate

# 3. Instalar dependencias
pip install -r requirements.txt
```

## Dependencias principales

Estas son las librerías que usa el pipeline (derivadas de los *imports* reales de
`notebooks_proyecto/`). Asegúrate de que `requirements.txt` las contenga:

```text
# Núcleo de datos y métricas
pandas>=2.0
numpy>=1.24
scipy>=1.10
scikit-learn>=1.3
matplotlib>=3.7
regex>=2023.0
ftfy>=6.0

# Modelo, fine-tuning e inferencia
torch>=2.0
transformers>=4.40
peft>=0.10
datasets>=2.18
accelerate>=0.30

# Entorno de ejecución
jupyter
```

> Nota: en plataformas como **Kaggle** o **Google Colab**, `torch`, `transformers`,
> `datasets` y `accelerate` suelen venir preinstalados, por lo que basta con instalar
> el resto.

---

# Ejecución

El pipeline se ejecuta en orden a través de los notebooks de `notebooks_proyecto/`:

| Orden | Notebook | Qué hace |
|-------|----------|----------|
| 1 | `LimpiezaDatos.ipynb` | Lee `data/etiquetado_humano/`, normaliza el texto (encoding, emojis→texto, emoticonos), unifica las tres categorías y exporta a `data/limpieza_final/`. |
| 2 | `Baseline.ipynb` | Evalúa el modelo **sin ajustar** contra el etiquetado humano y guarda predicciones en `data/baseline_resultados/`. |
| 3 | `FineTuning.ipynb` | Ajusta el modelo con **LoRA** usando validación cruzada *K-Fold* y pérdida ponderada por clase; guarda los adaptadores y métricas por *fold* en `modelos/`. |

Para reproducir el flujo completo:

```bash
jupyter notebook        # o: jupyter lab
```

1. Abre y ejecuta `LimpiezaDatos.ipynb` de principio a fin.
2. Ejecuta `Baseline.ipynb` para obtener la línea base.
3. Ejecuta `FineTuning.ipynb` (requiere GPU) para el ajuste fino y la evaluación.

> Las rutas de los notebooks son relativas a la raíz del repositorio
> (`Path(os.getcwd()).parent`), por lo que deben ejecutarse desde
> `notebooks_proyecto/`.

---

# Métricas de evaluación

El desempeño de los modelos se evalúa con métricas adecuadas para una escala **ordinal y desbalanceada**:

- **Accuracy** — proporción de aciertos exactos.
- **Balanced Accuracy** — promedio del *recall* por clase; relevante por el desbalance (las clases 4 y 5 son escasas).
- **F1-score (macro y weighted)** — equilibrio entre precisión y *recall*.
- **Matriz de confusión** — distribución de errores entre clases vecinas.

Estas métricas permiten comparar el **baseline** (modelo sin ajustar) contra el modelo ajustado mediante **fine-tuning con LoRA**.

---

# Interpretación de resultados

## Baseline (modelo sin ajustar)

Evaluado sobre los 581 comentarios con etiqueta humana:

| Métrica | Valor |
|---------|-------|
| Accuracy | 0.287 |
| Balanced Accuracy | 0.298 |
| F1 macro | 0.213 |
| F1 weighted | 0.268 |

El modelo preentrenado, pensado para reseñas de productos, **traslada mal su noción de "estrellas" a la aprobación política**: tiende a confundir clases vecinas y rinde apenas por encima del azar. Por categoría, la *balanced accuracy* es más baja en **infraestructura (0.21)** que en **seguridad (0.33)** y **turismo (0.31)**, lo que sugiere que el lenguaje sobre obras públicas es más ambiguo para el modelo base.

## Fine-tuning con LoRA (validación cruzada de 10 folds)

| Métrica | Promedio (± desv.) |
|---------|--------------------|
| Accuracy | 0.523 (± 0.050) |
| Balanced Accuracy | 0.464 (± 0.101) |
| F1 macro | 0.407 (± 0.079) |
| F1 weighted | 0.521 (± 0.053) |

El ajuste con LoRA **casi duplica el desempeño del baseline** (accuracy 0.29 → 0.52; F1 macro 0.21 → 0.41), confirmando que adaptar el modelo al dominio y a la escala de aprobación política aporta una mejora sustancial con un costo de entrenamiento bajo (solo se ajustan los adaptadores LoRA, no los ~167M de parámetros del modelo base).

La **variabilidad entre folds** es notable (la *balanced accuracy* va de ~0.31 a ~0.66), lo que refleja el tamaño reducido del *gold set* y el fuerte desbalance de clases: las clases **4 (parcialmente positiva)** y **5 (positiva)** tienen muy pocos ejemplos, por lo que el modelo acierta mejor en las clases negativas y neutrales. La pérdida ponderada por clase mitiga parcialmente este efecto.

## Lectura para la pregunta de investigación

Los comentarios analizados muestran una **predominancia de sentimiento negativo y neutral**, especialmente en el eje de **seguridad**. Esto matiza la hipótesis inicial: más que una mejora clara en la aceptación del gobierno, las inversiones asociadas al Torneo Internacional de Futbol 2026 conviven con un descontento ciudadano visible, sobre todo cuando el gasto del evento se contrasta con demandas sociales (seguridad). La conclusión definitiva requiere ampliar el *gold set* y reforzar las clases positivas.

---

# Consideraciones éticas

Los datos utilizados provienen de contenido públicamente accesible en TikTok y se emplean exclusivamente con fines académicos y de investigación.

Este proyecto no busca identificar individuos ni analizar usuarios específicos, sino estudiar tendencias generales de opinión pública relacionadas con el Torneo Internacional de Futbol a llevarse a cabo durante junio de 2026 en México.

---

# Agradecimientos

A la Universidad Nacional Autónoma de México, a la Facultad de Ciencias y a los investigadores que impartieron *Proyecto I* por el acompañamiento académico y moral durante el desarrollo de este trabajo.
