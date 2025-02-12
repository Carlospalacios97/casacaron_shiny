library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(shinyWidgets)
library(shinyglide)
library(dplyr)
library(janitor)
library(echarts4r)
library(htmlwidgets)

# esto es una modificacion
source('modulos/filtros.R',encoding = 'UTF-8')
source('modulos/01_pestana.R',encoding = 'UTF-8')


datos <- iris %>% clean_names()


cambio_variable <- list('sepal_length','sepal_width','petal_length','petal_width')

names(cambio_variable) <- c('sépalo_largo','sépalo_ancho','pétalo_largo','pétalo_ancho')
