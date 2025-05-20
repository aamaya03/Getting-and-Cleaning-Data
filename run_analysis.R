setwd("C:/Users/AAmaya/Downloads/getdata_projectfiles_UCI HAR Dataset")

# Cargar las bibliotecas necesarias
library(dplyr)

# Cargar las etiquetas de actividades y características
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activity", "activity_name"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))

# Cargar los datos de prueba y entrenamiento
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")

# Fusionar los conjuntos de datos de prueba y entrenamiento
subject_data <- rbind(subject_test, subject_train)
X_data <- rbind(X_test, X_train)
y_data <- rbind(y_test, y_train)

# Asignar nombres descriptivos a las columnas de X_data
names(X_data) <- features$feature

# Etiquetar las actividades con nombres descriptivos
y_data$activity_name <- activity_labels$activity_name[match(y_data$activity, activity_labels$activity)]

# Combinar los datos en un único conjunto
merged_data <- cbind(subject_data, y_data[, "activity_name"], X_data)
names(merged_data)[2] <- "activity_name"  # Renombrar la columna de actividades

# Filtrar las columnas que contienen "mean" o "std"
mean_std_columns <- grep("mean|std", names(merged_data), value = TRUE)
mean_std_data <- merged_data[, c("subject", "activity_name", mean_std_columns)]

# Crear un conjunto de datos ordenado con la media de cada variable para cada actividad y sujeto
tidy_data <- mean_std_data %>%
  group_by(subject, activity_name) %>%
  summarise_all(list(mean = ~mean(.)))

# Guardar el conjunto de datos ordenado
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
