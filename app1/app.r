library(shiny)

#these are the variables i can make random to generate a new question
#example 
#x3 <- sample(1:10, 1)
#x3
const <- 24
sg <- 10
er <- 1/12
mi <- .000001
const2 <- 1000000
mw <- 5
cg <- 1

q <- (const*sg*er*mi*const2)/(mw*cg)
q

# Define UI ----
ui <- fluidPage(
 # titlePanel("title panel"),
  h1("solve for Q"),
  img(src = "q.jpg"),
  #h4("sg = input$const"),
 # actionButton("const", label = "const"),  
 # actionButton("second", label = "Second"),
  verbatimTextOutput("result"),
  # 
  # sidebarLayout(position = "right",
  #   sidebarPanel("sidebar panel"),
    mainPanel("variables are equal to:"),
 br(),
 textOutput("sg1"),
 textOutput("sg"),
 
 br(),
 textOutput("ER1"),
 textOutput("er"),
 
 br(),
 textOutput("mi1"),
 textOutput("mi"),
 
 
 br(),
 textOutput("MW1"),
 textOutput("mw"),
 
 br(),
 textOutput("cg1"),
 textOutput("cg"),
 
 textInput("solution",h3("Q =? (input to 2 decimal places)"), value = ""),
 actionButton("show", "Check your solution")
 # fluidRow(
 #   column(3, 
 #          textInput("text", h3("Text input"), 
 #                    value = "Enter text...")) 
 # )
 
 
 # br(),
 # textOutput("Q1"),
 # textOutput("q")
#)
)

# Define server logic ----
server <- function(input, output) {
  sg <- reactiveVal(10)
  output$sg1 <- renderText("SG =")
  output$sg <- renderText({
    sg() })
  
  er <- reactiveVal(1/12)
  output$ER1 <- renderText("ER =")
  output$er <- renderText({
    er()})
  
  mi <- reactiveVal(0.000001)
  output$mi1 <- renderText("mi =")
  output$mi <- renderText({
    mi()})
  
  mw <- reactiveVal(5)
  output$MW1 <- renderText("MW =")
  output$mw <- renderText({
    mw()})
  
  cg <- reactiveVal(1)
  output$cg1 <- renderText("Cg =")
  output$cg <- renderText({
    cg()})
  
  observeEvent(input$show, {
    showModal(modalDialog(
      title = "Important message",
      "You Are Correct!",
      easyClose = TRUE
    ))
  })
  
  # q <- (const*sg*er*mi*const2)/(mw*cg)
  # output$Q1 <- renderText("Q =")
  # output$cg <- renderText({
  #   q()})
}

# Run the app ----
shinyApp(ui = ui, server = server)