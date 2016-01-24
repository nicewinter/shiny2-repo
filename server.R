#server.R (prediction iris species)
library(caret)

irisSpecies<-function(sl,sw,pl,pw) {
  if (pl<2.45)
    prediction<-"setosa"
  
  if ((pl>=2.45)&&(pw<1.75))
    prediction<-"versicolor"
  
  if ((pl>=2.45)&&(pw>=1.75))
    prediction<-"virginica"
  
  prediction
}

shinyServer(
  function(input,output){
    output$inputValue_sl<-renderPrint({input$sepalLength})
    output$inputValue_sw<-renderPrint({input$sepalWidth})
    output$inputValue_pl<-renderPrint({input$petalLength})
    output$inputValue_pw<-renderPrint({input$petalWidth})
    
    output$prediction<-renderText({
      input$goButton
      isolate(irisSpecies(input$sepalLength,input$sepalWidth,input$petalLength,input$petalWidth))
    })
    
  }
)