# Introduction to Geographical Time Series Prediction with Crime Data in R, SQL, and Tableau

In this tutorial you will learn how to prepare geographical data for time series predictions. When reviewing geographical data, you can group data points together in a grid over time to allow for easy modeling. This does create an issue with the size of the data. A five year crime data set can easily consist of 250,000 records. Once that is extrapolated into a time series grid on a map, it can easily hit 75 million records. When dealing with data of this size, it is helpful to use a database to cleanse the data before sending it to our script. The steps we will follow are listed below:
* Importing data into a SQL Server database.
* Cleansing and grouping data into a map grid.
* Adding time data points to the set of grid data and filling in the gaps where no crimes occurred.
* Importing the data into R
* Running an XGBoost model to determine where crimes will occur on a specific day

At the end, we will discuss the next steps for making the predictions more usable to end users.
 
## Getting Started

This tutorial is written as a R Jupyter notebook with code to run SQL statements. All instructions and code is self-contained within the notebook file itself. That file can be found in the top directory of the repository: Crime Prediction.ipynb.

### Prerequisites

Before beginning this tutorial, you will need:
* SQL Server Express installed
* SQL Management Studio or similar IDE to interface with SQL Server
* R installed
* R Studio, Jupyter notebook, or other IDE to interface with R
* A general working knowledge of SQL and R

If you just want to view the notebook, click on the ipynb file and GitHub will display the contents within the browser for you.

## Deployment

When running the code on your own system, make sure to point the SQL imports to the correct directory and the R imports to the correct SQL Server location.

## Authors

* **Jason Wittenauer** - *All work* - [Jason's Repos](https://github.com/jasonwi1202)

## License

This project is licensed under the GNU General Public License v3.0 - see the [license.md](license.md) file for details.
