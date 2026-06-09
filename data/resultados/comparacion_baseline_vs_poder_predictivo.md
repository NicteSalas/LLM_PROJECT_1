# Comparación directa: Baseline vs. Poder predictivo (modelo afinado)

Comparación **cara a cara** entre el modelo **sin ajustar** (`Baseline.ipynb`) y el modelo **afinado con LoRA** (`PoderPredictivo.ipynb`, mejor *fold* = `Modelo_fold_3`).

Es la comparación más limpia del proyecto porque **ambos se evalúan sobre exactamente los mismos 581 comentarios etiquetados**, con las mismas métricas y el mismo formato de matriz de confusión.

> ⚠️ Matiz: `PoderPredictivo` evalúa `fold_3` sobre los 581, y ese *fold* vio ~90 % de esos comentarios durante el entrenamiento, así que sus números son **optimistas (in-sample)**. La estimación de generalización insesgada (validación cruzada de 10 *folds*) es **balanced accuracy ≈ 0.46** — aun así, muy por encima del baseline.

---

## Métricas globales (mismos 581 comentarios)

| Métrica | Baseline (sin ajustar) | Poder predictivo (afinado) | Mejora |
|---------|:----------------------:|:--------------------------:|:------:|
| Accuracy | 0.29 | **0.67** | ×2.3 |
| Balanced accuracy | 0.30 | **0.70** | ×2.3 |
| F1 macro | 0.21 | **0.66** | ×3.1 |
| F1 weighted | 0.27 | **0.67** | ×2.5 |

---

## Desempeño por clase (F1-score)

| Clase | Baseline | Poder predictivo |
|-------|:--------:|:----------------:|
| 1 · Negativa | 0.51 | **0.77** |
| 2 · Parcialmente negativa | 0.17 | **0.59** |
| 3 · Neutral | 0.18 | **0.64** |
| 4 · Parcialmente positiva | 0.13 | **0.68** |
| 5 · Positiva | 0.08 | **0.62** |

El baseline solo funciona en la clase 1; el modelo afinado **levanta todas las clases**, incluidas las minoritarias 4 y 5 (de F1 ≈ 0.1 a ≈ 0.65).

---

## Matrices de confusión (lado a lado)

![Comparación de matrices de confusión](figuras/comparacion_baseline_vs_afinado.png)

**Baseline (izquierda) — polariza.** Acumula predicciones en los extremos 1 y 5 y casi no usa las clases intermedias. El caso más claro es la fila **neutral (3)**: de 204 neutrales, manda **78 a "muy negativo" y 75 a "muy positivo"**, y solo acierta 25. Comportamiento típico de un modelo de *estrellas* de reseñas que no entiende la neutralidad política.

**Poder predictivo (derecha) — diagonal fuerte.** Aciertos por clase: 153, 91, 112, 25, 10. Los errores caen casi siempre en **clases vecinas** (1↔2, 2↔3, 3↔4), nunca en el extremo opuesto. En una escala ordinal, equivocarse "por poco" es justo lo deseable.

---

## Conclusión

El fine-tuning con LoRA transforma un clasificador que **no servía** para aprobación política (apenas por encima del azar y polarizado) en uno **usable**: triplica el F1 macro y, sobre todo, deja de confundir extremos para distinguir gradientes de opinión. La mejora se logra entrenando solo los adaptadores LoRA (no los ~167M de parámetros base) y compensando el desbalance con pérdida ponderada.

*Archivos:* `figuras/comparacion_baseline_vs_afinado.png`, `comparacion_modelos.csv`.
