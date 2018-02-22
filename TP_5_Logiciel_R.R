library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Ma première application"),
  tabsetPanel(
    tabPanel("Le jeu de données Matable",
             titlePanel(""),
             sidebarLayout(
               sidebarPanel(
                 selectInput("id", "Variable", c("NIVSCOLMERE"))
               ),
               mainPanel(
                 plotOutput(outputId = "graphe")
               )
             )
)))


server <- function(input, output){
  output$graphe <- renderPlot({
    #plot(Matable$NIVSCOLMERE, col='red')
    p <- ggplot(Matable, aes(NIVSCOLMERE)) 
    p <- p + geom_bar(aes(fill=NIVSCOLMERE)) 
    p <- p + scale_fill_brewer(palette="Blues")
    p <- p + labs(x="Niveau scolaire de la mère", y="Effectif", title="Diagramme en barre", 
                  subtitle="Distribution en fonction \n des niveaux scolaires\n des mères")
    p
  })
}


shinyApp(ui = ui, server = server)

