library(shiny)
choices_text<- c("Low Income - All Races",
                 "Poor Locale - All Races",
                 "Limited Education - All Races",
                 "No Health Insurance - All Races",
                 "Unemployment - All Races",
                 "At Least Doubly Disadvantaged - All Races",
                 "Low Income and Poor Locale - All Races",
                 "Low Income and Limited Education - All Races",
                 "Low Income and No Health Insurance - All Races",
                 "Low Income and Unemployment - All Races",
                 "Low Income - Black",
                 "Poor Locale - Black",
                 "Limited Education - Black",
                 "No Health Insurance - Black",
                 "Unemployment - Black",
                 "At Least Doubly Disadvantaged - Black",
                 "Low Income and Poor Locale - Black",
                 "Low Income and Limited Education - Black",
                 "Low Income and No Health Insurance - Black",
                 "Low Income and Unemployment - Black",
                 "Low Income - Hispanic",
                 "Poor Locale - Hispanic",
                 "Limited Education - Hispanic",
                 "No Health Insurance - Hispanic",
                 "Unemployment - Hispanic",
                 "At Least Doubly Disadvantaged - Hispanic",
                 "Low Income and Poor Locale - Hispanic",
                 "Low Income and Limited Education - Hispanic",
                 "Low Income and No Health Insurance - Hispanic",
                 "Low Income and Unemployment - Hispanic",
                 "Low Income - White",
                 "Poor Locale - White",
                 "Limited Education - White",
                 "No Health Insurance - White",
                 "Unemployment - White",
                 "At Least Doubly Disadvantaged - White",
                 "Low Income and Poor Locale - White",
                 "Low Income and Limited Education - White",
                 "Low Income and No Health Insurance - White",
                 "Low Income and Unemployment - White",
                 "Years of Potential Life Lost Rate",
                 "Percent in Fair or Poor Health",
                 "Physically unhealthy days",
                 "Mentally unhealthy days",
                 "Female Life Expectancy - Low Income",
                 "Male Life Expectancy - Low Income",
                 "Smoking Percent - Low Income",
                 "Obesity Rate - Low Income",
                 "Exercise in last 30 days - Low Income",
                 "Hospital Mortality Rate Index",
                 "Social Capital Index",
                 "Income Segregation",
                 "Poverty Segregation",
                 "Segregation of Affluence",
                 "Racial Segregation",
                 "Inequality - Gini Index",
                 "Fraction Middle Class",
                 "Labor Force Participation",
                 "Median House Value",
                 "Economic Mobility",
                 "Percent Black",
                 "Percent Hispanic",
                 "Percent White")
shinyUI(fluidPage(
  img(src = "GLP_logo.png", align= "right"),
  titlePanel("Poverty Data Explorer"),
  p("An online data visualization tool from the", a("Greater Louisville Project.", href="http://greaterlouisvilleproject.com/", target="_blank")),
  p("To download an image, right-click and select 'Save image as...' and save it to your computer."),
  sidebarLayout(
    sidebarPanel(
      h4("Peer City Rankings"),
      helpText("Select two variables to rank"),
      
      selectInput("var1", "Variable 1:",choices = choices_text, 
                  selected="Low Income - All Races"),
      
      selectInput("var2", "Variable 2:", choices = choices_text,
                  selected="Poor Locale - Black"),
      h4("Calculating the Race Gap"),
      helpText("The next two variables will be subtracted from each other, allowing the user to calculate racial gaps in poverty statistics."),
      
      selectInput("var3", "Difference Between Variable 3:", choices = choices_text,
                  selected="At Least Doubly Disadvantaged - Black"),
      
      selectInput("var4", "And Variable 4:", choices = choices_text,
                  selected="At Least Doubly Disadvantaged - White"),
      br(),
      selectInput("peer_list","Peer City List:", choices=c("Current", "Baseline"),
                  selected= "Current"),
      
      p("Data is from the", a("Brookings Institution,", href="http://www.brookings.edu/research/interactives/2016/five-evils-multidimensional-poverty-race"), a("Robert Wood Johnson Foundation,", href="http://www.countyhealthrankings.org/"), "and", a("Health Inequality Project.", href="https://healthinequality.org/"), "St. Louis is a population-weighted average of St. Louis County and St. Louis City.")
      
    ),
    
    mainPanel(
      tabsetPanel(type="tabs",
                  tabPanel("Variable 1 Rankings", plotOutput("rank1"),
                           p("Cities are sorted into green, yellow, and red using natural breaks to group cities together on similar levels, such that green represents a group of cities that are above average, yellow a group clustering around average, and red those substantially below average.")),
                  tabPanel("Variable 2 Rankings", plotOutput("rank2"),
                           p("Cities are sorted into green, yellow, and red using natural breaks to group cities together on similar levels, such that green represents a group of cities that are above average, yellow a group clustering around average, and red those substantially below average.")),
                  tabPanel("Race Gap Rankings", plotOutput("rank3"),
                           p("Cities are sorted into green, yellow, and red using natural breaks to group cities together on similar levels, such that green represents a group of cities that are above average, yellow a group clustering around average, and red those substantially below average.")),
                  tabPanel("Variables 1 and 2 Scatterplot", plotOutput("scatter1")),
                  tabPanel("Variable 1 and Race Gap Scatterplot", plotOutput("scatter2")),
                  tabPanel("Codebook",
                           h4("Additional details on each variable and their sources can be found below:"),
                           p("Data is from the", a("Brookings Institution Multi-Dimensional Poverty Index", href="http://www.brookings.edu/research/interactives/2016/five-evils-multidimensional-poverty-race"), "(MPI),",a("Robert Wood Johnson Foundation County Health Rankings", href="http://www.countyhealthrankings.org/"), "(CHR), and", a("Health Inequality Project.", href="https://healthinequality.org/"), "(HIP). St. Louis is a population-weighted average of St. Louis County and St. Louis City."),
                           p("When data is specific to a race, it is noted clearly in the variable name. The measure is the same for each race, so to prevent duplication the codebook below only includes each entry once. Variables that are clearly labeled as combinations of previously defined variables (e.g. 'Low Income and Poor Locale') refer to the percentage of the population with both disadvantages and are not given their own codebook entries. Definitions of the variables are taken directly from their sources."),
                           p(strong("Low Income:"), "Living in a household below 150% of the federal poverty line. Year: 2014, Source: MPI"),
                           p(strong("Poor Locale:"), "Living in an area where more than one in five are poor. Year: 2014, Source: MPI"),
                           p(strong("Limited Education:"), "Lacking - at minimum - a high school diploma. Year: 2014, Source: MPI"),
                           p(strong("No Health Insurance:"),"Lacking health insurance coverage (public or private). Year: 2014, Source: MPI"),
                           p(strong("Unemployment:"), "Living in a household where nobody is employed. Year: 2014, Source: MPI"),
                           p(strong("At Least Doubly Disadvantaged:"),"Living in a household with at least two of the above disadvantages. Year: 2014, Source: MPI"),
                           p(strong("Years of Potential Life Lost Rate:"), "Years of potential life lost before age 75 per 100,000 population (age-adjusted). Years: 2011-2013, Source: CHR"),
                           p(strong("Percent in Fair or Poor Health:"), "Adults reporting fair or poor health (age-adjusted). Year: 2014, Source: CHR"),
                           p(strong("Physically Unhealthy Days:"), "Average number of physically unhealthy dats reported in past 30 days (age-adjusted). Year: 2014, Source: CHR"),
                           p(strong("Mentally Unhealthy Days:"), "Average number of mentally unhealthy dats reported in past 30 days (age-adjusted). Year: 2014, Source: CHR"),
                           p(strong("Hospital Mortality Rate Index:"),"Standardized index combining 30-day mortality rates for heart attack, heart failure, and pneumonia patients. Source: HEP"),
                           p(strong("Social Capital Index:"),"Standardized index combining measures of voter turnout rates, the fraction of people who return their census forms, and measures of participation in community organizations. Source: HEP"),
                           p(strong("Income Segregation:"),"Rank-Order index estimated at the census-tract level using equation (13) in Reardon (2011). See Appendix D of Chetty et al (2014) for further details. Source: HEP"),
                           p(strong("Poverty Segregation:"),"H(p25) estimated following Reardon (2011); we compute H(p) for 16 income groups defined by the 2000 census. Source: HEP"),
                           p(strong("Segregation of Affluence:"),"H(p25) estimated following Reardon (2011); we compute H(p) for 16 income groups defined by the 2000 census. Source: HEP"),
                           p(strong("Racial Segregation:"),"Multi-group Theil Index calculated at the census-tract level over four gorups. White alone, Black alone, Hispanic, and Other. Source: HEP"),
                           p(strong("Inequality - Gini Index:"),"Gini coefficient minus top 1% income share. Source: HEP"),
                           p(strong("Fraction Middle Class:"),"Fraction of parents in the Chetty et al (2014) core sample whose income falls between the 25th and 75th percentile of the national parent income distribution. Source: HEP"),
                           p(strong("Labor Force Participation:"),"Fraction of people at least 16 years old that are in the labor force.  Source: HEP"),
                           p(strong("Median House Value:"),"Median value of housing units at the county level. Source: HEP"),
                           p(strong("Economic Mobility:"),"Expected income rank of child born to parents at 25th percentile. Source: HEP"),
                           p(strong("Percent Black:"),"Based on Brookings figures for metro population. Source: MPI"),
                           p(strong("Percent Hispanic:"),"Based on Brookings figures for metro population. Source: MPI"),
                           p(strong("Percent White:"),"Based on Brookings figures for metro population. Source: MPI")
                        ))
  )
)))