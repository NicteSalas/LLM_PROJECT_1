## 📂 Raw Data

La carpeta `data/raw` contiene los tres conjuntos de datos originales utilizados en este proyecto para analizar la aceptación política pública desde el desarrollo del torneo internacional de futbol a llevarse a cabo durante Junio 2026 en México a partir de comentarios publicados en TikTok.

Los datos fueron recopilados de videos asociaodos con el evento y posteriormente organizados en tres ejes temáticos para facilitar su análisis mediante técnicas de Procesamiento de Lenguaje Natural (NLP) y modelos de análisis de sentimientos.

---

## Estructura de los datos

### `raw_infraestructura.csv`

Contiene comentarios relacionados con temas de infraestructura asociados al Mundial 2026, incluyendo:

- Construcción y remodelación de estadios.
- Transporte público.
- Movilidad urbana.
- Espacios públicos.
- Inversión gubernamental.
- Mantenimiento de instalaciones.

**Número de registros:** 915 comentarios.

---

### `raw_seguridad.csv`

Contiene comentarios relacionados con temas de seguridad pública y percepción de riesgo, incluyendo:

- Criminalidad.
- Violencia.
- Desapariciones.
- Seguridad de turistas.
- Seguridad durante eventos masivos.
- Confianza en las autoridades.

**Número de registros:** 1000 comentarios.

---

### `raw_turismo.csv`

Contiene comentarios relacionados con turismo y percepción internacional del país, incluyendo:

- Atractivos turísticos.
- Imagen de México.
- Experiencias de visitantes.
- Hospitalidad.
- Impacto económico del turismo.
- Opiniones de usuarios extranjeros.

**Número de registros:** 905 comentarios.

---

## Variables disponibles

| Variable | Descripción |
|-----------|-------------|
| `text` | Texto original del comentario publicado en TikTok. |
| `diggCount` | Número de "likes" recibidos por el comentario. |
| `replyCommentTotal` | Número de respuestas asociadas al comentario. |
| `createTimeISO` | Fecha y hora de publicación en formato ISO 8601. |
| `uniqueId` | Nombre público del usuario que publicó el comentario. |
| `videoWebUrl` | URL del video asociado al comentario. |
| `uid` | Identificador único del usuario. |
| `cid` | Identificador único del comentario. |
| `avatarThumbnail` | URL de la imagen de perfil del usuario. |

---

## Características del conjunto de datos

Los comentarios reflejan lenguaje real de redes sociales y pueden contener:

- Emojis.
- Errores ortográficos.
- Abreviaturas.
- Spanglish.
- Expresiones coloquiales.
- Sarcasmo.
- Repetición de caracteres.
- Variaciones regionales del español.

---

## Uso dentro del proyecto

Los datos de esta carpeta constituyen la entrada principal del pipeline de análisis:

```text
Raw Data
    ↓
Preprocesamiento
    ↓
Etiquetado humano
    ↓
Limpieza y normalización *
    ↓
Extracción de características
    ↓
Entrenamiento de modelos
    ↓
Evaluación
    ↓
Análisis de resultados
```
