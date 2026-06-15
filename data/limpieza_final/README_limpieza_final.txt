## 📂 Limpieza Final

La carpeta `data/limpieza_final` contiene los archivos preprocesados, etiquetados, limpios y normalizados mediante el notebook LimpiezaDatos.ipynb. 
Considerando el preprocesamiento de los datos crudos.
 
---

## Estructura de los datos

### `infraestructura_limpio.csv`

Contiene comentarios relacionados con temas de infraestructura asociados al Mundial 2026, incluyendo:

**Número de registros:** 915 comentarios.

---

### `raw_seguridad.csv`

Contiene comentarios relacionados con temas de seguridad pública y percepción de riesgo, incluyendo:

**Número de registros:** 1000 comentarios.

---

### `raw_turismo.csv`

Contiene comentarios relacionados con turismo y percepción internacional del país, incluyendo:

**Número de registros:** 905 comentarios.

### `etiquetado_humano_unificado.csv`

Contiene comentarios relacionados con los tres ejes de evaluación de manera unificada, considerando la variable adicional de identificación *categoría*.

**Número de registros:** 2820 comentarios.


---

## Variables disponibles

| Variable | Descripción |
|-----------|-------------|
| `text` | Texto limpio y procesado del comentario publicado en TikTok. |
| `etiquetado_humano` |Etiqueta asignada por humanos a 200 comentarios por categoría|
| `categoria` | Categoría a la cual le corresponde el comentario dentro del archivo unificado |

---

## Características del conjunto de datos

Texto plano en español, lo cual puede incluir:

-signos de interrogación
-acentos
-ñ

---


## Uso dentro del proyecto

Los datos de esta carpeta constituyen el corpus principal a partir del cual se ejecutará el análisis:

```text
...
    ↓
Limpieza Final*
    ↓
Baseline
    ↓
FineTuning
    ↓
PoderPredictivo
    ↓
Escalamiento
```