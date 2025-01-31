ventana1_UI <- function(id){
  tagList(
    includeCSS('www/01_estilo.css'),
    box(
      id = 'cajota',
      width = 12,
      title = 'Vista pestaña 1',
      solidHeader = T,
      tabBox(                         # total
        id = 'caja_principal',
        width = 12,
        tabPanel(  
          title = 'Ventana 1',
          id = 'ventana_1',
          fluidRow(
            align = 'center',
            h1('Histograma')
          ),
          fluidRow(
            align = 'center',
            splitLayout(
              cellWidths = c('10%','80%','10%'),
              column(12),
              column(12,
                     # p('texto equis')
                     echarts4rOutput(NS(id,'histograma'))
                     ),
              column(12)
            )
          )
        )
        
      )
    )
  )
}


ventana1_SERVER <- function(id,valores_pestana1){
  moduleServer(id,function(input, output, session){
    
    output$histograma <- renderEcharts4r({
      
      suppressMessages({
        valores_pestana1$datos_histograma %>% 
        e_charts() %>% 
        e_histogram_(valores_pestana1$variable_seleccionada, name = valores_pestana1$variable_seleccionada)
      
      })
      
    })
    
  })
}