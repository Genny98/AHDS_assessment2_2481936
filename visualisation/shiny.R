#SHINY SCRIPT FOR VISUALISATION


#Load the merged data
data <- read_csv("/path/to/merged_clean_data.csv")

# necesaary libraries
library(shiny)
library(ggplot2)
library(dplyr)

# Basic Statistical Analysis
# Summary statistics for BMI by gender
bmi_stats_by_gender <- merged_data %>%
  group_by(RIAGENDR) %>%
  summarise(
    Count = n(),
    Mean_BMI = mean(BMXBMI, na.rm = TRUE),
    Median_BMI = median(BMXBMI, na.rm = TRUE),
    SD_BMI = sd(BMXBMI, na.rm = TRUE)
  )

print(bmi_stats_by_gender)

##Data visualization 


# Recode gender
merged_data$RIAGENDR <- factor(merged_data$RIAGENDR, levels = c(1, 2), labels = c("Male", "Female"))

# Define UI
ui <- fluidPage(
  titlePanel("BMI and Gender Visualization"),
  
  sidebarLayout(
    sidebarPanel(
      # Slider input for BMI range
      sliderInput("bmiRange",
                  "Select BMI Range:",
                  min = min(merged_data$BMXBMI, na.rm = TRUE),
                  max = max(merged_data$BMXBMI, na.rm = TRUE),
                  value = c(min(merged_data$BMXBMI, na.rm = TRUE), max(merged_data$BMXBMI, na.rm = TRUE)))
    ),
    
    mainPanel(
      plotOutput("bmiBoxplot"),
      plotOutput("bmiDensityPlot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Filter data based on slider input
  filteredData <- reactive({
    merged_data %>% filter(BMXBMI >= input$bmiRange[1], BMXBMI <= input$bmiRange[2])
  })
  
  # Render a Boxplot of BMI by Gender
  output$bmiBoxplot <- renderPlot({
    ggplot(filteredData(), aes(x = RIAGENDR, y = BMXBMI)) +
      geom_boxplot() +
      labs(x = "Gender", y = "BMI", title = "BMI Distribution by Gender") +
      theme_minimal()
  })
  
  # Render a Density Plot of BMI by Gender
  output$bmiDensityPlot <- renderPlot({
    ggplot(filteredData(), aes(x = BMXBMI, fill = RIAGENDR)) +
      geom_density(alpha = 0.7) +
      labs(x = "BMI", y = "Density", title = "Density Plot of BMI by Gender") +
      scale_fill_discrete(name = "Gender") +
      theme_minimal()
  })
}


# Run the application 
shinyApp(ui = ui, server = server)
