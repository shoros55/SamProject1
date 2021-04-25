# PlantsAvailabilities
My project is called PlantsAvailabilities.  It is a user friendly, streamlined program designed to be used by my work at an interior plant leasing company.  This App's function is to be able to call on local plant availability database for ordering purposes, as well as analysis of percentage of availability by region.  The user can search for the specific plant and size desired and quickly return a list of nurseries with availability.

library(shiny)

shiny::runGitHub("SamProject1", "shoros55", ref="main")

# How to start the app:
Enter the following code into your Rstudio console to launch the app:
library(shiny)

shiny::runGitHub("SamProject1", "shoros55", ref="main") <br />
<br />
Alternatively you can use the shinyapp.io link below to launch the App in your browser or smartphone.  <br />

# Tutorial:
To use the app: <br />
Use the First Tab labeled "Interior Plants Nursery Supply Availability" to search for specific plant availability: <br />
1.) For example select the Region radio button labeled "Miami-Dade".<br />
2.) Then select "Aglo (Siam)" in the drop down menu.<br />
3.) Then select "10"" in the drop down menu.<br />
4.) Then click "Enter".<br />
The results of your search will populate under the heading "Availability" in the main panel.<br />
<br />
Now try again for Region "Palm Beach". (Availability is much more limited here, so begin with the following search):<br />
1.) First select the Region radio button labeled "Palm Beach."<br />
2.) Select "Adonidia Palm (Single)" in the drop down menu.<br />
3.) Select "14"" in the drop down menu.<br />
4.) Click "Enter". <br />
<br />
Now Navigate to the Second Tab labeled "Overall Availability by Nursery".<br />
1.) Do this by clicking that tab at the top of the page. <br />
2.) Next select the desired region by clicking that radio button. <br />
The bar chart displaying that region's nurseries will populate in the main panel displaying what percentage of the overall plant types are available at their location during the current season.

# ShinyApp.io Link

https://shoros55.shinyapps.io/PlantsAvailabilities/
