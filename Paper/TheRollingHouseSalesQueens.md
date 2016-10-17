
#**Paper Intro**

###This markdown writeup is meant to both link all project source code into one coherent project output and to also provide further details regarding all outputs.

#**Gathering the Data**

###By exploring the sale price and gross sqft data in histogram form, it is determined the data is heavily right skewed and that there are several outliers.

###When plotting the sale price with respect to gross sqft, it is difficult to determine the relationship. But, when comparing the log of each parameter, it is apparent they share an exponential relationship with one another. As gross sqft increases exponentially, sale price does as well.




```{r}
require(gdata)
## Loading required package: gdata


## gdata: Unable to locate valid perl interpreter
## gdata: 
## gdata: read.xls() will be unable to read Excel XLS and XLSX files
## gdata: unless the 'perl=' argument is used to specify the location
## gdata: of a valid perl intrpreter.
## gdata: 
## gdata: (To avoid display of this message in the future, please
## gdata: ensure perl is installed and available on the executable
## gdata: search path.)
## gdata: Unable to load perl libaries needed by read.xls()
## gdata: to support 'XLX' (Excel 97-2004) files.
## 
## gdata: Unable to load perl libaries needed by read.xls()
## gdata: to support 'XLSX' (Excel 2007+) files.
## 
## gdata: Run the function 'installXLSXsupport()'
## gdata: to automatically download and install the perl
## gdata: libaries needed to support Excel XLS and XLSX formats.
## 
## Attaching package: 'gdata'
```

```{r}
## 'data.frame':    20113 obs. of  21 variables:
##  $ BOROUGH                       : int  3 3 3 3 3 3 3 3 3 3 ...
##  $ NEIGHBORHOOD                  : Factor w/ 61 levels "","BATHGATE                 ",..: 2 2 2 2 2 2 2 2 
##  $ BUILDING.CLASS.CATEGORY       : Factor w/ 37 levels "","01  ONE FAMILY DWELLINGS                    
##  $ TAX.CLASS.AT.PRESENT          : Factor w/ 11 levels "","1","1A","1B",..: 2 2 2 2 2 2 2 2 2 2 ...
##  $ BLOCK                         : int  2905 2905 3035 3039 3039 3053 3053 2900 2912 2912 ...
##  $ LOT                           : int  28 28 2 36 36 86 102 61 117 118 ...
##  $ EASE.MENT                     : logi  NA NA NA NA NA NA ...
##  $ BUILDING.CLASS.AT.PRESENT     : Factor w/ 108 levels "","A0","A1","A2",..: 10 10 90 90 90 89 3 91 11 11 
##  $ ADDRESS                       : Factor w/ 5931 levels "","1 ANGELAS PLACE                          
##  $ APARTMENT.NUMBER              : Factor w/ 205 levels "","            ",..: 2 2 2 2 2 2 2 2 2 2 ...
##  $ ZIP.CODE                      : int  10457 10457 10457 10458 10458 10458 10458 10457 10457 10457 ...
##  $ RESIDENTIAL.UNITS             : int  1 1 1 1 1 1 1 2 2 2 ...
##  $ COMMERCIAL.UNITS              : int  0 0 1 1 1 2 0 1 0 0 ...
##  $ TOTAL.UNITS                   : int  1 1 2 2 2 3 1 3 2 2 ...
##  $ LAND.SQUARE.FEET              : int  4750 4750 1287 2500 2500 1911 919 1855 2000 2000 ...
##  $ GROSS.SQUARE.FEET             : int  2619 2619 2528 2452 2452 4080 1248 4452 2400 2400 ...
##  $ YEAR.BUILT                    : int  1899 1899 1899 1910 1910 1931 1901 1931 1993 1993 ...
##  $ TAX.CLASS.AT.TIME.OF.SALE     : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ BUILDING.CLASS.AT.TIME.OF.SALE: Factor w/ 109 levels "","A0","A1","A2",..: 10 10 91 91 91 90 3 92 11 11 
##  $ SALE.PRICE                    : Factor w/ 1555 levels ""," $-   "," $1 ",..: 2 2 2 2 903 2 2 869 1074 2 
##  $ SALE.DATE                     : Factor w/ 301 levels "","1/1/2016",..: 275 275 85 260 229 135 10 118 

```

 ![](C:\Users\GTX8WNS\Desktop\DoingDataScience\TheRollingHousingSalesQueens\Sale Price Histogram.PNG)


image: ![](C:\Users\GTX8WNS\Desktop\DoingDataScience\TheRollingHousingSalesQueens\Histogram less 1.8M.PNG)


image: ![](C:\Users\GTX8WNS\Desktop\DoingDataScience\TheRollingHousingSalesQueens\default plot.PNG)


image: ![](C:\Users\GTX8WNS\Desktop\DoingDataScience\TheRollingHousingSalesQueens\Plot Log.PNG)

#**Cleaning The Data** 

###After cleaning the data, only data related to 1, 2, and 3-family homes is assigned to a data frame for further analysis.

 ["C:/Users/GTX8WNS/Desktop/SMU/Doing Data Science/BK.RData"]

#**Analysis**

###By plotting the log of 1, 2, and 3-family dwelling data, it is observed there is an exponential relationship between sale price and gross sqft. As gross sqft increases exponentially, sale price does as well. The plots of log data also provide clear indication that the original data had many outliers. By removing the outliers, only valid data can be reviewed further. While the example code author chose to remove the outliers from the original data, we chose to leave the outliers to embarrass the individuals who originally collected the data.

image: ![](C:\Users\GTX8WNS\Desktop\DoingDataScience\TheRollingHousingSalesQueens\Plot with.PNG)


image: ![](C:\Users\GTX8WNS\Desktop\DoingDataScience\TheRollingHousingSalesQueens\Plot without.PNG)






