###Curso LATAM Virtual Capacity Building Curriculum###
###Dataset managment and dplry###
###Instructor: Dr. Neftali Eduardo Antonio-Villa###
###24-Oct-2024

# Establecer el directorio de trabajo
setwd("/Users/nefoantonio/Library/CloudStorage/OneDrive-UNIVERSIDADNACIONALAUTÓNOMADEMÉXICO/Clases/Curso R Cardiologia/Curso 2024/Bases de Datos")

##### Sección 1: Instalación, carga y manual de paquetes #####
### ¿Cómo instalar paquetes? ##

## Método 1: Método más sencillo, descarga los paquetes desde CRAN (necesita conexión a internet),
##           paquete debe ir entre comillas
install.packages("gapminder")
install.packages("dplyr")
install.packages("tidyr")
install.packages("pacman")
install.packages("tidyverse")
install.packages("readr")
install.packages("haven")
install.packages("mice")

# Sugerencia: podrías mencionar que estos paquetes pueden instalarse todos juntos
# en una sola línea de código, por ejemplo:
# install.packages(c("gapminder", "dplyr", "tidyr", "pacman", "tidyverse", "readr", "haven", "mice"))

# Se pueden concatenar las líneas de código para correrlo de forma más rápida utilizando ;
install.packages("gapminder"); install.packages("dplyr"); install.packages("tidyr"); install.packages("pacman")
install.packages("tidyverse"); install.packages("readr"); install.packages("haven")

# Nota: Algunos paquetes ya están incluidos en tidyverse (como `dplyr`, `tidyr`, `readr`), 
# por lo que podrías no necesitar instalarlos por separado si ya has instalado `tidyverse`.

## Método 2: En caso de aparecer algún error al tratar de instalar paquetes con el Método 1 (ej. "Versión
##           incompatible de R") descarga paquete compatible con versión de R desde la fuente (GitHUB) 
install.packages("tidyverse", type = "source")

## Método 3: Directo de la pestaña de "Packages" en la ventana de visualización.

#1) Dar click en botón de instalar
#2) Seleccionar la opción de repositorio CRAN
#3) Buscar el paquete a descargar


### ¿Cómo puedo cargar paquetes? ###

## Método 1: Método más sencillo, útil cuando la función que deseamos utilizar no está repetida.
##           NO se pone paquete entre comillas
library(gapminder)
library(tidyverse)
library(dplyr)
library(tidyr)
library(pacman)
library(readr)
library(haven)
#library(xlsx)
library(mice)

# Igualmente se pueden concatenar las líneas de código
library(gapminder);library(dplyr);library(tidyr);library(pacman)
library(tidyverse);library(readr);library(haven);library(mice)

# Si hay un error en una de las funciones, la concatenación se detiene
library(tidyverse);library(redr);library(haven)
3+3; ufdu ;2+2

# El paquete "pacman" puede incluir la función de p_load para instalar aquellos paquetes que no se tengan.
# Sugerencia: Explicar brevemente qué hace `pacman::p_load()` y cómo facilita la gestión de paquetes.

pacman::p_load(gapminder, dplyr, tidyr, tidyverse, readr, haven, mice)

## Método 2: Útil cuando la función que deseamos utilizar está repetida entre paquetes:
##           [Nombre del paquete]::[función]

?filter

?dplyr::filter

dplyr::filter()
stats::filter()

# ¿Cómo saber qué funciones están repetidas entre paquetes?
library(dplyr)
?filter

### Si ya cargué un paquete ¿Puedo quitarlo sin tener que reiniciar R? ###
## Método 1: Dirígete al panel de Paquetes, da click en "Packages" y buscar el paquete que
##           queremos quitar y eliminar la palomita.

## Método 2: Uso de la función opuesta a library: detach()
detach("package:tidyverse", unload= TRUE)
detach("package:mice", unload= TRUE)
detach("package:gapminder", unload= TRUE)

# Sugerencia: Mencionar que el uso de detach() es menos común en la práctica diaria,
# pero es útil si se necesita liberar memoria o evitar conflictos entre paquetes.


##### Sección 2: Cargar bases de datos #####

### ¿Cómo cargar nuestros datos? ###

## Método 1: En la ventana de ambiente global
#         - Dar click en "Import DataSet" y seleccionar tipo de archivo deseado
#         - Poner dirección o dar click en "Browse", buscar el archivo deseado y dar en "open"
#         - Cambiar el nombre si se desea y dar click en "Import"

## Método 2: Uso de la función read

library(readr)
framingham <- read_csv("framingham.csv")
View(framingham)

# Consejo: Ajustar el directorio de trabajo desde el inicio
datos <- read_csv("framingham.csv")

# Otras funciones son read_sas, read_sav, read_excel

# Existen funciones por default que permitirán cargar bases de datos
# Cargar archivos Excel
library(readxl)
framingham <- read_excel("framingham.xls")
View(framingham)

# Cargar archivos SPSS
library(haven)
base.spss <- read_sav("framingham.sav")

# Cargar archivos CSV
library(readr)
base.csv <- read_csv("framingham.csv")

# Sugerencia: Podrías explicar la diferencia entre estos formatos y por qué uno podría
# elegir uno sobre otro (por ejemplo, CSV es más universal, Excel es más manejable en oficinas, etc.).

##### Sección 3: Explorar base de datos #####

base <- read_csv("framingham.csv")

## Función view(x, título). Genera una pestaña que muestra todos los datos
View(base) # También se puede dar clic en la tabla que aparece en global environment después del dataset
View(base, "Datos de Framingham")

## Función head(x = [Objeto], n= [# de observaciones]), por default muestra las primeras 6 observaciones
head(x = base)
head(x = base, n = 3)

## Función tail(x = [Objeto], n= [# de observaciones]), por default muestra las últimas 6 observaciones
tail(base)
tail(base, 10) #Podemos escribirlo sin especificar argumentos, pero en el mismo orden

#Submuestras específicas: usar corchetes [] (primero filas y después columnas)
base[7:15, 5]
base[1, 5] #Primera Fila, Cuarta Columna
base[5, 1] #Quinta Fila, Primera Columna

## Función str([Objeto]). Muestra de forma compacta la estructura de un objeto
#Recordatorio: Dataframe: Conjunto de vectores de distintas clases ordenadas en un arreglo matricial.

str(base)
glimpse(base)

## Función summary() Muestra un resumen de todas tus variables.
# En variables cuantitativas te genera algunas medidas de tendencia central
summary(datos)

# Nota: Aquí se utiliza `summary(datos)` pero `datos` parece no estar definido como el objeto base. 
# Cambiar a `summary(base)` para mayor coherencia.

##### Sección 4: Limpieza de variables con janitor#####

# Cargar el paquete janitor (si no se ha cargado ya)
library(janitor)

# Supongamos que tienes un dataset llamado `datos.dummy` con algunos nombres de variables desordenados
datos.dummy <- data.frame(
  `Nombres Estudiantes` = c("Juan", "Pedro", "Ana", "Rosa"),
  `Edades de Estudiantes` = c(24, 25, 26, 23),
  `Calificación Final` = c(10, 9, 10, 10)
)

# Visualizar el dataset original
print(datos.dummy)

### 1. Limpieza de nombres de variables con clean_names()
# Esta función convierte los nombres de las variables a minúsculas y reemplaza espacios con guiones bajos
datos.dummy <- janitor::clean_names(datos.dummy)

# Visualizar el dataset con nombres de variables limpios
print(datos.dummy)

### 1. Limpieza de nombres de variables con clean_names()
# Esta función convierte los nombres de las variables a minúsculas y reemplaza espacios con guiones bajos
base <- janitor::clean_names(base)

# Visualizar el dataset con nombres de variables limpios
print(base)

### 2. Identificación de duplicados con get_dupes()
# Si quieres identificar filas duplicadas en el dataset
# Supongamos que hay duplicados en alguna columna
datos.dummy$columna_duplicada <- c("A", "B", "C", "A") # Introducimos duplicados para el ejemplo
dupes <- janitor::get_dupes(datos.dummy, columna_duplicada)

# Visualizar los duplicados
print(dupes)

# # Creamos un id hipotético
# base$id <- paste0(base$male, base$age)
# base <- janitor::get_dupes(base, id)

### 3. Limpieza de filas y columnas vacías con remove_empty()
# Ejemplo hipotético de un dataset con filas y columnas completamente vacías
datos_hypotetico <- data.frame(
  ID = c(1, 2, 3, 4, NA),
  Nombre = c("Juan", "Pedro", NA, "Ana", NA),
  Edad = c(25, NA, 30, NA, NA),
  Ciudad = c("CDMX", "Guadalajara", NA, "Monterrey", NA),
  Columna_Vacia = c(NA, NA, NA, NA, NA),  # Columna completamente vacía
  stringsAsFactors = FALSE
)

# Usar remove_empty() para eliminar las filas y columnas que están completamente vacías
datos_limpios <- janitor::remove_empty(datos_hypotetico, which = c("cols"))

# Visualizar el dataset después de eliminar filas y columnas vacías
print(datos_limpios)

base <- janitor::remove_empty(base, which = c("rows", "cols"))


##### Sección 5: Evaluación de datos faltantes#####

# "NA" significa "No disponible" o "valor faltante"

# Identificar valores faltantes
is.na(base) # Muestra TRUE en las celdas con valores faltantes

# Contar valores faltantes por columna
colSums(is.na(base))

# Contar valores faltantes por fila
rowSums(is.na(base))

# Contar valores perdidos en total
sum(is.na(base))

#En este punto, se puede decidir si se tiene que realizar una imputacion de variables, 
# filtrar los datos perdidos o mantener el dataset completo

##### Sección 6: Introducción al Pipeline %>% en tidyverse ####

# El operador "%>%" se utiliza en tidyverse para encadenar funciones de manera concisa y legible.
# Es especialmente útil cuando se desean aplicar varias transformaciones de forma secuencial.

# Ejemplo básico de uso:

str(iris)
iris %>% str()

# En este ejemplo, primero utilizamos `str(datos1)` para ver la estructura de `datos1`.
# Luego, aplicamos el mismo `str()` utilizando el pipeline para demostrar cómo se encadenan las operaciones.
# Puedes secuenciar varias lineas de codigo en formato vertical

##### Sección 7: Cambiar nombre de variables ####

# `rename()` permite cambiar el nombre de una o más columnas en el dataframe.
# Nota: Primero especificar el nombre de la variable nueva y luego el de la variable que estaba previamente

iris %>% rename("S_Longitud" = Sepal.Length)

# Se puede añadir varias variables en una sola linea

iris %>% rename("S_Longitud" = Sepal.Length, 
                "S_Ancho" = Sepal.Width,
                "P_Longitud" = Petal.Length, 
                "P_Ancho" = Petal.Width) %>% str()

# Evitar el uso de espacios y comas

ejemplo_1<-iris %>% rename("S Longitud" = Sepal.Length, 
                           "P,Ancho" = Petal.Width,
                           "Especies-Flores"= Species)

ejemplo_1$`S Longitud`
ejemplo_1$`P,Ancho`
ejemplo_1$`Especies-Flores`

# Tip: La función "clean_names()" puede evitar cualquier typo en la variable
ejemplo_1<-iris %>% rename("S Longitud" = Sepal.Length, 
                           "P,Ancho" = Petal.Width) %>%
  clean_names()

ejemplo_1$sepal_width
ejemplo_1$petal_length
ejemplo_1$species

##### Sección 8: Filtrado de datos ####

## Filtrado de datos con `filter()` ##
# `filter()` se utiliza para seleccionar filas que cumplen con una o más condiciones.
library(stats)

# Ejemplo: Filtrar por una condición específica
iris %>% dplyr::filter(Species == "virginica")

# Ejemplo: Union de dos condiciones (OR)

iris %>% filter(Species == "virginica" | Species == "versicolor")


# Ejemplo: Combinacion de condiciones (AND)

iris %>% filter(Species == "virginica" & Petal.Width>=2.0)
iris %>% filter(Species == "virginica") %>% filter(Petal.Width>=2.0)

# Ejemplo: Exclusion de dos condiciones (NOT)

iris %>% filter(Species == "virginica" & Species!="versicolor")
iris %>% filter(Species == "virginica") %>% filter(Petal.Width!=2.0)

# Ejemplo: Filtrar por múltiples condiciones concatenadas
iris %>% filter((Petal.Width >=1.5) & (Species == "virginica" | Species == "versicolor"))


##### Sección 9: Selección de variables ####

## Selección de columnas con `select()` ##
# `select()` permite elegir columnas específicas para analizar.
iris %>% select(Sepal.Length, Petal.Length, Species)

#Note que le va a dar un nuevo dataframe con el orden que usted eligio 

iris %>% select(Species, Petal.Width, Petal.Length)

#Esto es especialmente util cuandos se tienen muchas variables


##### Sección 10: Creación de nuevas variables ####

## Creación de variables con `mutate()` 
# `mutate()` añade nuevas variables al dataframe, mientras que `transmute()` añade nuevas variables y elimina las originales.

# Ejemplo: Crear nuevas variables con `mutate()`
iris %>% mutate("Diferencia_Longitud" = Sepal.Length - Petal.Length,
                "Longitud_Total" = Sepal.Length + Petal.Length)

# Ejemplo: Eliminar las originales con `transmute()`
iris %>% transmute("Diferencia_Longitud" = Sepal.Length - Petal.Length,
                   "Longitud_Total" = Sepal.Length + Petal.Length)

# Ejemplo: Crear variables dicotomicas con if_else()

iris %>% mutate("Petal.Width.2.0" = ifelse(Petal.Width > 2.0, 1, 0))

# Ejemplo: Crear con varias categorias con case_when()

iris %>% mutate("Sepal.Width.Cat" = 
                  case_when(Sepal.Width < 2.5 ~ 1,
                            Sepal.Width >= 2.5 & Sepal.Width < 3.0 ~ 2,
                            Sepal.Width >= 3.0 ~ 3))


# Ejemplo: Combinar con factor()

iris %>% mutate("Petal.Width.2.0" = ifelse(Petal.Width >= 2.0, 1, 0),
                "Sepal.Width.Cat" = 
                  case_when(Sepal.Width < 2.5 ~ 1,
                            Sepal.Width >= 2.5 & Sepal.Width < 3.0 ~ 2,
                            Sepal.Width >= 3.0 ~ 3)) %>%
  mutate(Petal.Width.2.0 = factor(Petal.Width.2.0,labels = c("Menor a 2.0", "Mayor a 2.0")),
         Sepal.Width.Cat = factor(Sepal.Width.Cat,labels = c("Menor a 2.5", 
                                                             "Entre 2.5 a 3.0",
                                                             "Mayor a 3.0")))


##### Sección 11: Resumen de datos ####

## Resumen de datos con `summarise()` 
# `summarise()` se utiliza para calcular estadísticas resumen, mientras que `summarise_each()` permite aplicar múltiples funciones a todas las columnas.

# Ejemplo: Resumir algunas variables específicas
iris %>% summarise("meanLongitud_S" = mean(Sepal.Length),
                   "varLongitd_S" = var(Sepal.Length),
                   "sdLongitud_S" = sd(Sepal.Length))


##### Sección 12: Agrupación de datos ####
## Agrupación de datos con `group_by()` y resumen por grupos ##
# `group_by()` permite agrupar los datos según una o más variables. Luego, se pueden aplicar funciones resumen a cada grupo.

iris %>% group_by(Species)%>%
  summarise("meanLongitud_S" = mean(Sepal.Length),
            "varLongitd_S" = var(Sepal.Length),
            "sdLongitud_S" = sd(Sepal.Length))


##### Sección 13: Ejemplo con datos de Framinham ####

# Carga del dataset
fram <- read_csv("~/Library/CloudStorage/OneDrive-UNIVERSIDADNACIONALAUTÓNOMADEMÉXICO/Clases/Curso R Cardiologia/Curso 2024/Bases de Datos/framingham.csv")

# Seleccionamos cinco variables de la base 

fram <- fram %>% select(male,age,education,totChol,sysBP,diaBP,BMI)

# Cambiamos el nombre de las variables

fram <- fram %>%
  rename("Sexo_Masculino" = male,
         "Edad" = age,
         "Educacion" = education,
         "Colesterol_Total" = totChol,
         "Presion_Sistolica" = sysBP,
         "Presion_Diastolica" = diaBP,
         "Indice_Masa_Corporal" = BMI)

# Creación de variables categóricas
fram <- fram %>%
  mutate(Edad_65 = ifelse(Edad >= 65, 1, 0),
         HiperColesterolemia = ifelse(Colesterol_Total >= 200, 1, 0),
         HAS_Actual = ifelse(Presion_Sistolica >= 140 | Presion_Diastolica >= 90, 1, 0),
         IMC_Categorias = case_when(
           Indice_Masa_Corporal < 25 ~ 1,
           Indice_Masa_Corporal >= 25 & Indice_Masa_Corporal < 30 ~ 2,
           Indice_Masa_Corporal >= 30 ~ 3
         ))

# Asignación de etiquetas a las variables categóricas
fram <- fram %>%
  mutate(Sexo_Masculino = factor(Sexo_Masculino, levels = c(0, 1), labels = c("Femenino", "Masculino")),
         Edad_65 = factor(Edad_65, levels = c(0, 1), labels = c("<65 Años", "≥65 Años")),
         HiperColesterolemia = factor(HiperColesterolemia, levels = c(0, 1), labels = c("Sin Hipercolesterolemia", "Hipercolesterolemia")),
         HAS_Actual = factor(HAS_Actual, levels = c(0, 1), labels = c("Sin HAS Actual", "HAS Actual")),
         IMC_Categorias = factor(IMC_Categorias, levels = c(1, 2, 3), labels = c("Normopeso", "Sobrepeso", "Obesidad")))

# Vista rápida de la estructura del dataframe
fram %>% glimpse()
fram %>% summary()
fram %>% sjPlot::view_df()
