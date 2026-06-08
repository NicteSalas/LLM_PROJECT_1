## 📂 Human-Labeled Data 

La carpeta `data/etiquetado_humano` contiene los conjuntos de datos preprocesados. Contiene una columna adicional respecto al `data/raw`, la cual corresponde al etiquetado realizado manualmente a 200 comentarios de cada eje. Esta muestra es utilizadas como referencia para el entrenamiento, validación y evaluación de los modelos de análisis de sentimientos desarrollados en este proyecto.

La estructura de los documentos es la siguiente

| Variable | Descripción |
|-----------|-------------|
| `comentario` | Texto original publicado por el usuario. |
| `etiquetado_humano` | Etiqueta de sentimiento asignada manualmente. |

---

## Escala de Etiquetado

La variable `etiquetado_humano` utiliza una escala ordinal de cinco niveles que permite capturar diferentes intensidades emocionales:

| Valor | Interpretación |
|---------|---------|
| 1 | Negativo |
| 2 | Parcialmente negativo |
| 3 | Neutral |
| 4 | Parcialmente positivo |
| 5 | Positivo |

Esta escala permite modelar gradientes de opinión y no únicamente clasificaciones binarias o ternarias.

---

## Ejemplos de Etiquetado

| Comentario | Etiqueta |
|------------|-----------|
| "Qué vergüenza la inseguridad que hay en el país." | 1 |
| "Todavía faltan muchas mejoras para que funcione bien." | 2 |
| "¿Cuál será la sede más cercana?" | 3 |
| "Parece una buena oportunidad para atraer visitantes." | 4 |
| "Será excelente para el turismo y la economía." | 5 |

Los comentarios detectados como sarcasmo por los evaluadores humanos fueron automáticamente etiquetados con *3* -> Neutral.

