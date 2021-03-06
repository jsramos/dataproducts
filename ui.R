# Libraries
library(shiny)
library(rCharts)

ui <- fluidPage(
        titlePanel("Videogames ratings in Metacritic for top 100 of all time"),
        helpText("Showing User's vs Critic's ratings from Metacritic for the top 100 games of all time by platform."),
        sidebarLayout(
                sidebarPanel(
                        h3('Top 100 of all time'),
                        helpText("Select the platform for which to display game ratings in the plot. We'll also display a regression line for each platform selected and one across all platforms in black."),
                        selectInput(inputId='selectedPlatform', 
                                    label='Choose platform', choices = c('All')),
                        h3('Predict rating from critics'),
                        helpText("To predict the critic's rating for a new game, select a user's rating. The platform will be taken from the selected one above. If 'All' is selected, the platform will not be considered for the prediction. The predicted rating will appear as a black dot along the regression line."),
                        sliderInput(inputId='userRating', label = "User's rating for prediction",min = 4.0, max=10.0, step=0.2, value=6.0),
                        img(src='metacritic_applenapps.png', width=230)
                ),
                mainPanel(
                        showOutput('ratingsPlot', lib = 'polycharts'),
                        h3(strong(textOutput('prediction')))
                )
        )
)
