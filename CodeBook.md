# CodeBook.md

## Descripción del Conjunto de Datos

Este conjunto de datos proviene del "Human Activity Recognition Using Smartphones" y contiene mediciones de acelerómetros y giroscopios. El objetivo del análisis es predecir las actividades humanas utilizando datos del smartphone.

### Variables

- `subject`: Identificador del sujeto que realizó la actividad.
- `activity_name`: Nombre de la actividad realizada.
- Características (561 columnas): Mediciones de acelerómetros y giroscopios, como `tBodyAcc-mean()-X`, `tBodyAcc-std()-Y`, etc. Estas mediciones están relacionadas con el movimiento del cuerpo humano durante las actividades.

### Transformaciones Realizadas

1. **Fusión de Datos**: Se combinaron los conjuntos de datos de entrenamiento y prueba en un único conjunto.
2. **Extracción de Mediciones de Interés**: Solo se seleccionaron las mediciones relacionadas con la media (`mean`) y la desviación estándar (`std`).
3. **Etiquetado Descriptivo de Actividades**: Se asignaron nombres descriptivos a las actividades.
4. **Ordenamiento por Actividad y Sujeto**: Se calculó la media de cada variable para cada actividad y sujeto.

### Detalles Adicionales

Cada medición corresponde a un valor recogido de los acelerómetros y giroscopios durante una actividad específica (como caminar, estar de pie, etc.).
