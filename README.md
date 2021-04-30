# PlantsAvailabilities
My project is called PlantsAvailabilities.  It is a user friendly, streamlined program designed to be used at the interior plant leasing company where I work.  This App's function is to be able to call on local plant availability database for ordering purposes, as well as regression analysis of expected price per plant by size, and bar plot of percentage of availability by region.  The user can search for the specific plant and size desired and quickly return a list of nurseries with availability.

library(shiny)

shiny::runGitHub("SamProject1", "shoros55", ref="main")

# How to start the app:
Enter the following code into your Rstudio console to launch the app:<br />
library(shiny)

shiny::runGitHub("SamProject1", "shoros55", ref="main") <br />
<br />
Alternatively you can use the shinyapp.io link at the bottom of this page to launch the App in your browser or smartphone.  <br />

# Tutorial:
To use the app: <br />
Use the First Tab labeled "Interior Plants Nursery Supply Availability" to search for specific plant availability: <br />
1.) For example select the Region radio button labeled "Miami-Dade".<br />
2.) Then select "Aglo (Mary Ann/Maria)" in the drop down menu (the plants are in alphabetical order by type).<br />
3.) Then select "10"" in the drop down menu.<br />
4.) Then click "Enter".<br />
The results of your search will populate under the heading "Availability" in the main panel.<br />
As well as the regression inferential and model will update with that particular plant's expected price determined by size.  The user can use the regression summary to analyze how closely price and size are correlated for the selected plant for all nurseries.  Also, the user can use the regression model as a tool to estimate how the price of a particular plant will change as the size increases or decreases.<br />
<br />
Now try again for Region "Palm Beach". (Availability is much more limited here, so begin with the following search):<br />
1.) First select the Region radio button labeled "Palm Beach."<br />
2.) Select "Aglo (Mary Ann/Maria)" in the drop down menu.<br />
3.) Select "10"" in the drop down menu.<br />
4.) Click "Enter". <br />
<br />
Now Navigate to the Second Tab labeled "Overall Availability by Nursery".<br />
1.) Do this by clicking the furthest right tab at the top of the page labeled "Overall Availability by Nursery". <br />
2.) Next select the desired region by clicking that radio button. <br />
3.) Click "GO!"<br />
The bar chart displaying that region's nurseries will update in the main panel displaying what percentage of the overall plant varieties are available at the selected region's nurseries during the current season. In order to optimize plant pick up, the user should consider ordering plants from the nursery with the most availability, unless there is a major price discrepancy which may indicate that nursery is brokering that particular plant (revisit the first tab to inspect price discrepancies between nurseries).<br />
<br />
For further examples I recommend the following plant queries on the first tab under "Miami-Dade" region with "10"" size :<br />
"Aglo (Silver Bay)"<br />
"Art"<br />
"Green Jewel"<br />
"Janet Craig"<br />
"JC Compacta"<br />
"Marginata (Cut-Back)"<br />
"Mass Cane"<br />

# ShinyApp.io Link
Run app using shinyapps.io at:<br />
https://shoros55.shinyapps.io/PlantsAvailabilities/
