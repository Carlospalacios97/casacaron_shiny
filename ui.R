
library(shinydashboardPlus)

header <- dashboardHeader(
  # disable = T,
  title = tagList(
    span(class = 'logo-lg',"Ingrese texto"),
    img(src = "ICONO BLANCO_Mesa de trabajo 1(1).svg",width = '35px',height = '40px')
  )
)

sidebar <- dashboardSidebar(
  collapsed = T,
  sidebarMenu(
    id = 'menu',
    menuItem(
      text = 'pestaña 1',
      tabName = '01_pestana',
      icon = icon('school-flag')
    )
  )
)

body <- dashboardBody(
  # useShinyjs(),
  tabItems(
    tabItem(
      tabName = '01_pestana',
      ventana1_UI('pestana1')
    )
  ) 
)

controlbar <- dashboardControlbar(
  collapsed = F,
  overlay = F,
  filtros_UI('filtros'),
  width = 400
)


dashboardPage(skin = 'blue-light',#'midnight',
              title = 'CambiarTituloDashbaord',
              md = FALSE,
              header, 
              sidebar, 
              body, 
              controlbar = controlbar)
