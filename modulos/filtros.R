filtros_UI <- function(id){
  tagList(
    includeCSS('www/01_estilo.css'),
    box(
      width = 12,
      title = 'Controles',
      
      # filtros colaboradores -----------------
      
      conditionalPanel(
        condition = 'input.menu == "01_pestana"',
        
        fluidRow(
          column(4),
          column(8,
                 actionBttn(
                   inputId = NS(id,"actualizar"),
                   label = "Actualizar", 
                   style = "bordered",
                   color = "success",
                   icon = icon("rotate-right")
                 )
                 )
        ),
        
        hr(),
        
        fluidRow(
          column(2),
          column(8,
                 fluidRow(column(3, p("Selecciona")),
                          column(9,
                                 pickerInput(
                                   inputId = NS(id,"sepal_petal"), 
                                   selected = 'sépalo', 
                                   label = NULL, 
                                   choices = c('sépalo','pétalo'),
                                   multiple = F,
                                   # width = 'fit',
                                   options = pickerOptions(
                                     actionsBox = TRUE,
                                     selectedTextFormat = paste0("count > 1"),
                                     countSelectedText = "{0} seleccionadas",
                                     # maxOptions = 10,
                                     dropdownAlignRight = 'auto'
                                     # width = 'fit'
                                   )
                                 )
                          )
                )
          )
        ),
        
        fluidRow(
          column(2),
          column(8,
                 fluidRow(column(3, p("Selecciona")),
                          column(9,
                                 pickerInput(
                                   inputId = NS(id,"tamanio"), 
                                   selected = 'ancho', 
                                   label = NULL, 
                                   choices = c('ancho','largo'),
                                   multiple = F,
                                   # width = 'fit',
                                   options = pickerOptions(
                                     actionsBox = TRUE,
                                     selectedTextFormat = paste0("count > 1"),
                                     countSelectedText = "{0} seleccionadas",
                                     # maxOptions = 10,
                                     dropdownAlignRight = 'auto'
                                     # width = 'fit'
                                   )
                                 )
                          )
                 )
          )
        )
        
        
      )
      
      # fin -------------
      
    )
  )
}


filtros_SERVER <- function(id,valores_pestana1){
  moduleServer(id,function(input, output, session){
    
    observeEvent(input$actualizar,priority = 100, {
      
      text <- paste0(input$sepal_petal,"_",input$tamanio)
      
      valores_pestana1$variable_seleccionada <- cambio_variable[text] %>% unname()  %>% unlist %>% as.character()
      
      valores_pestana1$datos_histograma <- datos %>% dplyr::select(valores_pestana1$variable_seleccionada)
      
      
    })
    
    
  })
}
