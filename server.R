server <- function(input,output,session){
  
  valores_pestana1 <- reactiveValues(
    
    datos_histograma = datos %>% dplyr::select('sepal_width'),
    
    variable_seleccionada = 'sepal_width'
    
  )
  
  
  filtros_SERVER('filtros',valores_pestana1)
  ventana1_SERVER('pestana1',valores_pestana1)
  

}

