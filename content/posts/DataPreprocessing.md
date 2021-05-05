---
title: "Data Wrangling (Data Preprocessing)"
date: 2021-03-05T06:11:32+10:00
categories: [ "MATH2349" ]
---
## Module 1 - Data Preprocessing: From Raw Data to Ready to Analyse

### Summary
Module 1 will set the background for the entire course. Data preprocessing will be defined and the importance of data preprocessing inside the data analysis workflow will be explored. The module will define 5 major tasks for data preprocessing and will provide a quick overview of these tasks. Then, in the following modules of this course, we will unwrap each data preprocessing task by providing details of operations related to that task.

### Learning Objectives

The learning objectives of this module are as follows:

+ Define data preprocessing.
+ Identify steps for data analysis, understand the place of data preprocessing inside the data analysis workflow.
+ Understand the reasons why data preprocessing is important.
+ Identify major tasks in data preprocessing.
+ Understand main benefits of using R statistical programming language in data preprocessing.

### Data
“Data! Data! Data! I can’t make bricks without clay!” - Sir Arthur Conan Doyle.

Data. Our world has turned out to be increasingly dependent upon this resource. Sir Conan Doyle’s famous detective, Sherlock Holmes, wouldn’t shape any theories or draw any conclusions unless he had adequate data. Data is the fundamental building piece of all that we do in analytics such as the analyses we perform, the reports we build, and the decisions we made.

**“In God we trust. All others must bring data.”** – W. Edwards Deming.

This quote by [W. Edwards Deming] (https://en.wikipedia.org/wiki/W._Edwards_Deming) (statistician, professor, author, lecturer, and consultant), emphasizes the significance of data-driven decisions. Obviously, everyone has better bring (also understand and interpret) data to back up their claims.

### The rise of the Data Analyst
Today’s organizations have access to more data than ever before, but more data isn’t better data unless you know what to do with it. Organizations are struggling to find people who can turn their data into insights and value, which in turn has created a high demand across the world for data analysts. During an interview in 2009, Google’s Chief Economist Dr. Hal R. Varian stated, “The ability to take data - to be able to understand it, to process it, to extract value from it, to visualize it, to communicate it - that’s going to be a hugely important skill in the next decades.” [Read the full article here](https://www.forbes.com/sites/brentdykes/2016/03/31/data-storytelling-the-essential-data-science-skill-everyone-needs/?sh=626e8a3352ad)

### Data Analysis Steps
The statistical approach to data analysis is much broader than just analysing data. Data analysis process starts with defining problem statement, continues with planning and collecting data, preprocessing data, exploring data using descriptive statistics and data visualizations, analysing/modelling data, and finalizes with interpreting and reporting findings. This process is depicted in the following illustration.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615142917/MATH2349/DataAnalysisSteps_yihxuj.png)

+ **Defining Problem Statement**: This is the first step of data analysis. In this step, the problem statement is identified by the organizations/researchers. The data analyst should thoroughly understand the problem and the domain of the problem.

+ **Planning and Collecting Data**: In this step, the appropriate tools for data collection related to the problem statement will be identified. This step may include designing a survey for data collection, scraping data from web or accessing an Excel/a database file.

+ **Data Preprocessing**: The objective of this step is to make the data ready for the further statistical analysis. This step is one of the important phases in data analysis. The accuracy of the statistical analysis depends on the quality of the data gained in this step. Several operations such as importing data, reshaping data from long to wide format, filtering data, cleaning data, identifying outliers, and transforming variables can be applied to the data to make ready for the statistical analysis.

+ **Exploring Data via Descriptive Statistics/Visualizations**: The objective of this step is to understand the main characteristics of the data. Exploratory analyses are generally done using descriptive statistics (i.e. mean, median, standard deviation, frequencies, percentages etc.) and visualization tools (i.e. scatter plots, box plots, histograms, interactive data visualizations etc.). Exploratory analysis will show you the things that you didn’t expect or raise new questions about the data.

+ **Analysing/Modelling Data**: The statistical analysis/modelling step can include a broad range of techniques like statistical hypothesis testing, statistical modelling, and machine learning algorithms. Generally, the type of the variables in the data set and the purpose of the investigation will determine the appropriate analysis technique.

+ **Interpretation and Reporting**: The last step of the data analysis is the reporting and the interpretation of the results. This step is also critical as if you cannot understand and communicate your results to others, it doesn’t matter how well you conducted your analysis.

### What is Data Preprocessing?
Most statistical theory concentrates on data modelling, prediction, and statistical inference while it is usually assumed that data are in the correct state for the data analysis. However, in practice, a data analyst spends most of his/her time (usually 50%-80% of an analyst time) on making ready the data before doing any statistical operation (Dasu and Johnson (2003)). Despite the amount of time it takes, there has been surprisingly very little emphasis on how to preprocess data well (Wickham and others (2014)). Real-world data are commonly incomplete, noisy, inconsistent, and don’t have all the correct labels and codes that are required for the analysis. Data Preprocessing, which is also commonly referred to as data wrangling, data manipulation, data cleaning, etc., is a process and the collection of operations needed to prepare all forms of untidy data (incomplete, noisy and inconsistent data) for statistical analysis.

### Why Data Preprocessing is important
Data preprocessing may significantly influence the statistical conclusions based on the data. “Garbage in, garbage out (GIGO)” is a famous saying that is used to emphasis “the quality of the statistical analyses (output) always depends on the quality of the data (input)”. By preprocessing data, we can minimise the garbage that gets into our analysis so that we can minimise the amount of garbage that our analyses/models result.

### Why do you learn Data Preprocessing?
The road to becoming an expert in data analysis can be challenging and in fact, obtaining expertise in the broad range of data analysis is a career-long process. In this course, you will take a step closer to fluency in the early stages; namely in the data preprocessing step, as you need to be able to import, manage, manipulate and transform your data before performing any kind of data analysis.

### Major Tasks in Data Preprocessing
We will define 5 major tasks for data preprocessing framework, namely: **Get**, **Understand**, **Tidy** & **Manipulate**, **Scan** and **Transform**.

A typical data preprocessing process usually (but not necessarily) follows the following order of tasks given below:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615144175/MATH2349/DataPreprocessing_whuabu.png)

1. **Get**: A data set can be stored in a computer or can be online in different file formats. We need to get the data set into R by importing it from other data sources (i.e., .txt, .xls, .csv files and databases) or scraping from web. R provides many useful commands to import (and export) data sets in different file formats.

2. **Understand**: We cannot perform any type of data preprocessing without understanding what we have in hand. In this step, we will check the data volume (i.e., the dimensions of the data) and structure, understand the variables/attributes in the data set, and understand the meaning of each level/value for the variables.

3. **Tidy & Manipulate**: In this step, we will apply several important tasks to tidy up messy data sets. We will follow Hadley Wickham’s “Tidy Data” principles:

+ Each variable must have its own column.
+ Each observation must have its own row.
+ Each value must have its own cell.

We may also need to manipulate, i.e. filter, arrange, select, subset/split data, or generate new variables from the data set.

4. **Scan**: This step will include checking for plausibility of values, cleaning data for obvious errors, identifying and handling outliers, and dealing with missing values.

5. **Transform**: Some statistical analysis methods are sensitive to the scale of the variables and it may be necessary to apply transformations before using them. In this step we will introduce well-known data transformations, data scaling, centering, standardising and normalising methods.

There are also other steps related with preprocessing special types of data including dates, time and characters/strings. The last module of this course will introduce the special operations used for date, time and text preprocessing.

#### Tidy Data
Datasets can be created from a diverse ranges of sources including manually created spreadsheets, datasets scraped from the internet, previously collected or historical data, or complex databases and data warehouses. The Bicycle dataset above is an example of a previously collected dataset downloaded from an Open Access data repository. Regardless of a dataset’s origin, all must abide by the Tidy Data rules (Wickham 2014). As Wickham explains, tidy data allows easy manipulation, analysis and visualisation for data analysis purposes.

The basic structure of a dataset includes rows and columns. The three tidy dataset rules are as follows:

1. Each variable forms a column
2. Each observation forms a row
3. Each type of observational unit forms a table

We will use a sample dataset, expain this three rules at the below. The sample dataset you can download from [here](https://github.com/yanboyang713/RMIT-Data-Repository/blob/main/Bicycle.csv)

##### Each variable forms a column
The **Bicycle** data contains 23 columns. With the exception of **Unique_ID**, the other columns refer to variables. For example, the **NB_YEAR** column is a time variable that tells us the year an observation was recorded. If we select only the **CT_VOLUME**... variables, we can how the Bicycle dataset abides by Rule #1.

##### Each observation forms a row
The first row of the dataset, or the header row, includes the name of each column/variable. These names cannot contain as special characters or spaces, and their length should be as short as possible. This will reduce the amount of typing when you code!

An observation refers to the **units of sampling**. For example, this might be a person, a date, or a machine that comprise a “population”. The sampling unit for the bicyle data refers to daily bike traffic volume at different locations. Location is one unit of sampling, day is the second unit of sampling. This is an example of a nested dataset, where daily traffic volumes can be nested within different locations.

As you can see, the 55,967th observation relates to data recorded from Scotchman’s Creek Trail on the 27/12/2009. This confirms that each row with the dataset refers to an observation.

##### Each type of observational unit forms a table
There are two observational units in this dataset - survey location and day. You can see this in the repetition of the survey location identifiers. However, this dataset is still tidy because the table contains only information relating to daily bicycle traffic volume.

Had the dataset also contained details of a survey location’s variables repeated each time to the daily observations, the dataset would have violated rule 3.

Rule three is any interesting one, because in statistics it is often violated because many standard statistical functions require it to be broken. The two main issues related to violating rule three is increased file size (not good for computation) and increased risk of inconsistencies creeping into the dataset.

#### Messy data
Any datasets that do not abide by these rules is defined as messy. Wickham lists five common reasons:

+ Column headers are values, not variable names.
+ Multiple variables are stored in one column.
+ Variables are stored in both rows and columns.
+ Multiple types of observational units are stored in the same table.
+ A single observational unit is stored in multiple tables.
You can read all about them [here](http://vita.had.co.nz/papers/tidy-data.pdf).

## Module 2 - Get: importing, Scraping and Exporting Data with R
### Summary
All statistical work begins with data, and most data are stuck inside files and databases. Data are arriving from multiple sources at an alarming rate and analysts and organizations are seeking ways to leverage these new sources of information. Consequently, analysts need to understand how to get data from these sources.

Module 2 will cover the process of importing data, scraping data from the web, and exporting data. First we will cover the basics of importing tabular and spreadsheet data (i.e., .txt, .xls, .csv files). Then, we will cover how to acquire data sets from other statistical software (i.e., Stata, SPSS, or SAS) and databases. As the modern data analysis techniques often include scraping data files stored online, we will also cover the fundamentals of web scraping using R. Lastly, the equally important process of getting data out of R, in other words, exporting data will be covered.

### Learning objectives
The learning objectives of this module are as follows:

+ Understand how to get data from tabular and spreadsheet files.
+ Understand how to get data from statistical software and databases.
+ Learn how to scrape data files stored online.
+ Learn how to export to tabular and spreadsheet files.
+ Learn how to save R objects.

### Purpose
By completing the essential module reading, skill builders, and reviewing the recorded lecture, you will be able to work on worksheet questions and your assessments.

### Reading/Importing Data
The first step in any data preprocessing task is to “GET” the data. Data can come from many resources but two of the most common formats of the data sources include text and Excel files. In addition to text and Excel files, there are other ways that data can be stored and exchanged. Commercial statistical software such as SPSS, SAS, Stata, and Minitab often have the option to store data in a specific format for that software. In addition, analysts commonly use databases to store large quantities of data. R has good support to work with these additional options. In this section, we will cover how to import data into R by reading data from text files, Excel spreadsheets, commercial statistical software data files and databases. Moreover, we will cover how to load data from saved R object files for holding or transferring data that has been processed in R. In addition to the commonly used base R functions to perform data importing, we will also cover functions from the popular readr, readxl and foreign packages.

#### Reading Data from Text Files
Text files are a popular way to hold and exchange tabular data as almost any data application supports exporting data to the CSV (or other text file) formats. Text file formats use delimiters to separate the different elements in a line, and each line of data is in its own line in the text file. Therefore, importing different kinds of text files can follow a consistent process once you have identified the delimiter.

There are two main groups of functions that we can use to read in text files:

+ **Base R functions**: The Base R functions are the built-in functions that are already available when you download R and RStudio. Therefore, in order to use Base R functions, you do not need to install or load any packages before using them.

+ **readr package functions**: Compared to the equivalent base functions, readr functions are around 10× faster. In order to use readr package functions, you need to install and load the readr package using the following commands:

```R
##install.packages("readr")
library(readr)
```

##### Base R functions
read.table() is a multi-purpose function in base R for importing data. The functions read.csv() and read.delim() are special cases of read.table() in which the defaults have been adjusted for efficiency. To illustrate these functions let’s work with a CSV (.csv comma separated values) file called iris.csv which you can download from [here](https://github.com/yanboyang713/RMIT-Data-Repository/blob/main/iris.csv). Before running any command note that we need to save this data set into our working directory, or we need to explicitly define the location of this data set.
In the first example, let’s assume that we have already downloaded iris.csv data and saved it in our working directory. Then, the following command will read iris.csv data and store it in the iris1 object in R as a data frame:

```R
## The following command assumes that the iris.csv file is in the working directory

iris1 <- read.csv("iris.csv")
```

Note that the iris1 object has appeared in your Environment pane (probably located on the top-right of your RStudio window). If you click the arrow next to it, it will expand to show you the variables it contains, and clicking on it will open it to view, the same as using the View() function:

```R
View(iris1)
```

Now you can also observe the initial few rows of the iris1 object using head() function as follows:

```R
head(iris1)
```

```console
###   X Sepal.Length Sepal.Width Petal.Length Petal.Width Species
### 1 1          5.1         3.5          1.4         0.2  setosa
### 2 2          4.9         3.0          1.4         0.2  setosa
### 3 3          4.7         3.2          1.3         0.2  setosa
### 4 4          4.6         3.1          1.5         0.2  setosa
### 5 5          5.0         3.6          1.4         0.2  setosa
### 6 6          5.4         3.9          1.7         0.4  setosa
```

If you wish to observe more rows, you can use the n argument within the head() function:

```R
head(iris1, n = 15)
```

```console
###     X Sepal.Length Sepal.Width Petal.Length Petal.Width Species
### 1   1          5.1         3.5          1.4         0.2  setosa
### 2   2          4.9         3.0          1.4         0.2  setosa
### 3   3          4.7         3.2          1.3         0.2  setosa
### 4   4          4.6         3.1          1.5         0.2  setosa
### 5   5          5.0         3.6          1.4         0.2  setosa
### 6   6          5.4         3.9          1.7         0.4  setosa
### 7   7          4.6         3.4          1.4         0.3  setosa
### 8   8          5.0         3.4          1.5         0.2  setosa
### 9   9          4.4         2.9          1.4         0.2  setosa
### 10 10          4.9         3.1          1.5         0.1  setosa
### 11 11          5.4         3.7          1.5         0.2  setosa
### 12 12          4.8         3.4          1.6         0.2  setosa
### 13 13          4.8         3.0          1.4         0.1  setosa
### 14 14          4.3         3.0          1.1         0.1  setosa
### 15 15          5.8         4.0          1.2         0.2  setosa
```

You can also observe the final few rows by using the tail() function:

```R
tail(iris1)
```

```console
###       X Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
### 145 145          6.7         3.3          5.7         2.5 virginica
### 146 146          6.7         3.0          5.2         2.3 virginica
### 147 147          6.3         2.5          5.0         1.9 virginica
### 148 148          6.5         3.0          5.2         2.0 virginica
### 149 149          6.2         3.4          5.4         2.3 virginica
### 150 150          5.9         3.0          5.1         1.8 virginica
```

Note that when we used the View() function, it opened a new tab in RStudio, whereas the head() and tail() functions printed the output beneath the syntax. Using View() will not print the output in a report and will therefore not be available for readers of your report. Bear this in mind when providing outputs in your assignments.

In the second example, let’s assume that the iris.csv data is located in another file path (i.e. on desktop under data folder) “~/Desktop/data/iris.csv” (“./Desktop/data/iris.csv” for Windows users). Now we need to provide a direct path to our .csv file depending on where it is located:

```R
## The following command assumes that the iris.csv file is in the "~/Desktop/data/iris.csv" path

iris2 <- read.csv(file="~/Desktop/data/iris.csv")
```

Another suggested option is to set the working directory where the data is located. To illustrate, assume that the iris.csv is located on your desktop under data folder and you want to set this directory as the working directory. The setwd() function will set the working directory to the folder “data”:

```R
## Set the working directory to "~/Desktop/data"

setwd("~/Desktop/data")
```

Remember that you must use the forward slash / or double backslash \\ in R while specifying the file path. The Windows format of single backslash will not work.

After that you can read the iris.csv data using:

```R
iris3 <- read.csv("iris.csv")
```

Let’s check the header of the iris3 object:

```R
head(iris3)
```

```console
###   X Sepal.Length Sepal.Width Petal.Length Petal.Width Species
### 1 1          5.1         3.5          1.4         0.2  setosa
### 2 2          4.9         3.0          1.4         0.2  setosa
### 3 3          4.7         3.2          1.3         0.2  setosa
### 4 4          4.6         3.1          1.5         0.2  setosa
### 5 5          5.0         3.6          1.4         0.2  setosa
### 6 6          5.4         3.9          1.7         0.4  setosa
```

You can also compactly display the structure of an R object using str() function.

```R
str(iris3)
```

```console
### 'data.frame':    150 obs. of  6 variables:
###  $ X           : int  1 2 3 4 5 6 7 8 9 10 ...
###  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
###  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
###  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
###  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
###  $ Species     : chr  "setosa" "setosa" "setosa" "setosa" ...
```

Note that when we assess the structure of the iris data set that we read in, Species is a character variable.
However, we may want to read in Species as a factor variable rather than a character. We can take care of this by changing the stringsAsFactors argument. The default is stringsAsFactors = False; however, setting it equal to TRUE will read in the variable as a factor variable.

```R
iris4 <- read.csv("iris.csv", stringsAsFactors = TRUE)

str(iris4)
```

```console
### 'data.frame':    150 obs. of  6 variables:
###  $ X           : int  1 2 3 4 5 6 7 8 9 10 ...
###  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
###  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
###  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
###  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
###  $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
```

Now, you can see that the variable Species is a factor variable with three levels.

As previously stated read.csv is just a wrapper for read.table but with adjusted default arguments. Therefore, we can use read.table to read in this same data. The two arguments we need to be aware of are the field separator (sep) and the argument indicating whether the file contains the names of the variables as its first line (header). In read.table the defaults are sep = "" and header = FALSE whereas in read.csv the defaults are sep = "," and header = TRUE.

Therefore, we can also use the read.table function to read the iris.csv data. The extra thing we need to specify is the separator and the header arguments. As the data is comma separated and the first line contains the names of the variables, we will use sep = "," and header = TRUE options:

```R
## provides same results as read.csv above

iris5 <- read.table("iris.csv", sep=",", header = TRUE)
```

Sometimes, it could happen that the file extension is .csv, but the data is not comma separated; rather, a semicolon (;) or any other symbol is used as a separator. In that case, we can still use the read.csv() function, but in this case we have to specify the separator.

Let’s look at the example with a semicolon-separated file named iris_semicolon.csv which is located under [here](https://github.com/yanboyang713/RMIT-Data-Repository/blob/main/iris_semicolon.csv). After downloading and saving this data file in our working directory we can use:

```R
iris6 <- read.csv("iris_semicolon.csv", sep=";")
```

Similarly, if the values are tab separated (.txt file), which can download from [here](https://github.com/yanboyang713/RMIT-Data-Repository/blob/main/iris_tab.txt), we can use read.csv() with sep= "\t". Alternatively, we can use read.table(). The following is an example:

```R
iris7 <- read.csv("iris_tab.txt",sep="\t")

## provides same results as read.csv above

iris8 <- read.table("iris_tab.txt",header=TRUE)
```

Notice that here when we used read.table(), we had to specify whether the variable name is present or not, using the argument header=TRUE.

##### readr package functions
Compared to the equivalent base functions, readr functions are around 10× faster. This will make a remarkable difference in reading time if you have a very large data set. They bring consistency to importing functions, they produce data frames in a data.table format which are easier to view for large data sets. The default settings for readr function removes the hassles of stringsAsFactors, and they are more flexible in column specification.

read_csv() function is equivalent to base R ’s read.csv() function (note the distinction between these two function names!). The main difference between read_csv() and base R ’s read.csv() functions is:

read_csv() maintains the full variable name whereas, read.csv eliminates any spaces in variable names and fills it with ‘.’

Prior to R 4.0.0, read.csv() set stringsAsFactors = TRUE by default, whereas read_csv() sets stringsAsFactors = FALSE by default. Since R 4.0.0, both functions now set stringsAsFactors = FALSE by default so there is no longer any difference in this regard, however if you are working with an older version of R, read.csv() will automatically convert character strings to factors when reading csv files.

Let’s read the iris.csv file using read_csv function. Note that the readr package needs to be installed and loaded before using this function.

```R
##install.packages("readr")
library(readr)
```

```R
iris9 <- read_csv("iris.csv")
```

```console
### 
### -- Column specification --------------------------------------------------------
### cols(
###   X1 = col_double(),
###   Sepal.Length = col_double(),
###   Sepal.Width = col_double(),
###   Petal.Length = col_double(),
###   Petal.Width = col_double(),
###   Species = col_character()
### )
```

When we use read_csv function, “Parsed with column specification” information will be reported. Note that this is not a warning, and nothing is wrong with your code. You can use this information to check the variable types in your data set. If you want to adjust in the variable types, you can use additional arguments inside this function. For more information on read_csv function and its arguments type help(read_csv).

The good news is RStudio has the built in “Import Dataset” dialog box on the upper-right “Environment” pane. You can also use this dialog box to import a wide range of file types including csv, Excel, SPSS, SAS and Stata data files. The process of importing a csv data set into RStudio is explained briefly in R Bootcamp notes (taken from Dr. James Baglin’s).

More information on readr package can be found here: https://cran.r-project.org/web/packages/readr/readr.pdf

#### Reading Data from Excel files
Excel is the most commonly used spreadsheet software. Therefore, it’s important to be able to efficiently import and export data from Excel. Often, users prefer to export the Excel data file as a .csv file and then import into R using read.csv or read_csv. However, this is not an efficient way to import Excel files. In this section, you will learn how to import data directly from Excel using different packages, the xlsx, openxlsx and readxl packages.

##### The xlsx Package
If the dataset is stored in the .xls or .xlsx format, we have to use certain R packages to import those files; one of the packages is xlsxwhich has the function read.xlsx() to be used. However, Java and macOS (Version ≥ 10.12) do not play well due to some legacy issues. It has an adverse impact on the rJava package where a lot of R packages, including the xlsx package depends on. Unfortunately, for macOS users, installing xlsx package can be problematic as it requires rJava package and the rJava package installation may fail. In order to avoid this issue, we can use alternative packages.

##### The openxlsx Package
The openxlsx package, developed by Philipp Schauberger, Alexander Walker and Luca Braglia, can be used to import data from an Excel file into a data.frame. This package does not rely on Java (Java errors can occasionally be a problem for some users wishing to use some other packages). It is capable of reading dates and times, characters as characters (rather than factors), and can drop blank rows. It also provides the option for formatting outputs, allowing R data frames to be exported to attractive Excel workbooks for stakeholders such as management and clients, who may not be comfortable using R.

```R
##install.packages("openxlsx")
library(openxlsx)
```

```R
## read in xlsx worksheet via openxlsx package using sheet name

iris10<- read.xlsx("iris.xlsx", sheet = "iris")
```

```R
## read in xlsx worksheet starting from the third row

iris11<- read.xlsx("iris.xlsx", sheet = "iris", startRow = 3)
```

##### The readxl Package
readxl was developed by Hadley Wickham and the RStudio team who also developed the readr package. This package works with both .xls and .xlsx formats. Unlike xlsx package, the readxl package has no external dependencies (like Java or Perl), so you can use it to read Excel data on any platform. Moreover, readxl has the ability to load dates and times, it automatically drops blank columns, reads in character variables as characters, and returns outputs as data.table format which is more convenient for viewing large data sets.

To read in Excel data with readxl you can use the read_excel() function. Here are some examples:

```R
##install.packages("readxl")
library(readxl)
```

```R
## read in xlsx worksheet using a sheet index or name

iris13<- read_excel("iris.xlsx", sheet = "iris")
```

```console
### New names:
### * `` -> ...1
```

```R
## read in xlsx worksheet and change variable names by skipping the first row
## and using col_names to set the new names

iris14<- read_excel("iris.xlsx", sheet = "iris", skip = 1, col_names = paste ("Var", 1:6))
```

More information on read_excel function and readxl package can be found here: https://cran.r-project.org/web/packages/readxl/readxl.pdf.

#### Importing Data from statistical software
The foreign package provides functions that help you read data files from other statistical software such as SPSS, SAS, Stata, and others into R. To import an SPSS data file (.sav) into R, we need to call the foreign library and then use the read.spss() function. Similarly, if we want to import a STATA data file, the corresponding function will be read.dta(). Here is an example of importing an SPSS data file:

```R
##install.packages("foreign")
library(foreign)
```

```R
## read in spss data file and store it as data frame 

iris_spss <- read.spss("iris.sav", to.data.frame = TRUE)
```

```console
### re-encoding from UTF-8
```

Note that we set the to.data.frame = TRUE option in order to have a data frame format, otherwise, the defaults (to.data.frame = FALSE) will read in the data as a list.

More information on foreign package can be found here: https://cran.r-project.org/web/packages/foreign/foreign.pdf

Remember that you can also use the “Import Dataset” dialog box on the upper-right “Environment” pane to import SPSS, SAS and Stata data files instead of using the foreign package.

#### Reading from Databases
A data set can be stored in any format whereas large-scale data sets are generally stored in database software. Commonly, large organizations and companies keep their data in relational databases. Therefore, we may need to import and process large-scale data sets in R. 

One of the best approaches for working with data from a database is to export the data to a text file and then import the text file into R. According to Adler (2010), importing data into R at a much faster rate from text files than you can from database connections, especially when dealing with very large data sets (1 GB or more). This approach is considered to be the best approach if you plan to import a large amount of data once and then analyse. However, if you need to produce regular reports or to repeat an analysis many times, then it might be better to import data into R directly through a database connection.A

There are some packages in order to connect directly to a database from R. The packages you need to install would depend on the database(s) to which you want to connect and the connection method you want to use. There are two sets of database interfaces available in R:

+ RODBC: The RODBC package allows R to fetch data from Open DataBase Connectivity (ODBC) connections. ODBC provides a standard interface for different programs to connect to databases. Before using RODBC, you need to 
	+ i) install the RODBC package in R, 
	+ ii) install the ODBC drivers for your platform, 
	+ iii) configure an ODBC connection to your database. Adler (2010) provides a comprehensive list of where to find ODBC drivers for different databases and operating systems.

+ DBI: The DBI package allows R to connect to databases using native database drivers or JDBC drivers. This package provides a common database abstraction for R software. You must install additional packages to use the native drivers for each database(s).

The process of creating a connection is huge and beyond the scope of this course. Here, I will provide a list of additional resources to learn about data importing from these specific databases:
+ MySQL: [https://cran.r-project.org/web/packages/RMySQL/index.html](https://cran.r-project.org/web/packages/RMySQL/index.html)
+ Oracle: [https://cran.r-project.org/web/packages/ROracle/index.html](https://cran.r-project.org/web/packages/ROracle/index.html)
+ PostgreSQL: [https://cran.r-project.org/web/packages/RPostgreSQL/index.html](https://cran.r-project.org/web/packages/RPostgreSQL/index.html)
+ SQLite: [https://cran.r-project.org/web/packages/RSQLite/index.html](https://cran.r-project.org/web/packages/RSQLite/index.html)
+ Open Database Connectivity databases: [https://cran.rstudio.com/web/packages/RODBC](https://cran.rstudio.com/web/packages/RODBC)

Also, R data import/export manual https://cran.r-project.org/doc/manuals/R-data.html is a comprehensive source for configuring database connections and importing data from databases.

#### Scraping Data from Web
As a result of rapid growth of the World Wide Web, vast amount of information is now being stored online, both in structured and unstructured forms. Collecting data from the web is not an easy process as there are many technologies used to distribute web content (i.e., HTML, XML, JSON). Therefore, dealing with more advanced web scraping requires familiarity in accessing data stored in these technologies via R.
In this section, I will provide an introduction to some of the fundamental tools required to perform basic web scraping. This includes importing spreadsheet data files stored online and scraping HTML table data. In order to advance your knowledge in web scraping, I highly recommend getting copies of “XML and Web Technologies for Data Sciences with R” (by Deborah and Ducan (2014)) and “Automated Data Collection with R” (by Munzert et al. (2014)).

##### Importing Tabular and Excel files Stored Online
The most basic form of getting data from online is to import tabular (i.e. .txt , .csv) or Excel files that are being hosted online. Importing tabular data is especially common for the many types of government data available online.

To illustrate we will use “Domestic Airlines - On Time Performance” data which is available online at https://data.gov.au/dataset/29128ebd-dbaa-4ff5-8b86-d9f30de56452/resource/cf663ed1-0c5e-497f-aea9-e74bfda9cf44/download/otptimeseriesweb.csv. This .csv file covers monthly punctuality and reliability data of major domestic and regional airlines operating between Australian airports.
We can use read.csv or read.table functions to read online data depending upon the format of the data file. In fact, reading online .csv or .txt file is just like reading tabular data. The only difference is, we need to provide the URL of the data instead of the file name as follows:

```R
## the url for the online csv file

url <- "https://data.gov.au/dataset/29128ebd-dbaa-4ff5-8b86-d9f30de56452/resource/cf663ed1-0c5e-497f-aea9-e74bfda9cf44/download/otptimeseriesweb.csv"
```

Next, as the online data is a .csv file, we can read this data file using read.csv function.

```R
## use read.csv to import

ontime_data <- read.csv(url)

## display first six rows and four variables in the data

ontime_data[1:6,1:4]
```

```console
###                 Route Departing_Port Arriving_Port      Airline
### 1   Adelaide-Brisbane       Adelaide      Brisbane All Airlines
### 2   Adelaide-Canberra       Adelaide      Canberra All Airlines
### 3 Adelaide-Gold Coast       Adelaide    Gold Coast All Airlines
### 4  Adelaide-Melbourne       Adelaide     Melbourne All Airlines
### 5      Adelaide-Perth       Adelaide         Perth All Airlines
### 6     Adelaide-Sydney       Adelaide        Sydney All Airlines
```

Importing Excel spreadsheets hosted online can be performed just as easily. Recall that there is no base R function for importing Excel data; however, several packages exist to import .xls and .xlsx files. One package that works smoothly with pulling Excel data from URLs is gdata. With gdata we can use read.xls() to import Excel files hosted online.

To illustrate, we will use the “General Aviation, 2013” dataset available at http://www.ntsb.gov/investigations/data/Documents/datafiles/AnnualReview_2013_Public_4_GA_20150218.xls.

First, we need to install and load the gdata package, then we can read the online Excel file using read.xls function.

```R
## first install and load the gdata package

##install.packages("gdata")
library(gdata)
## the url for the online Excel file

aviation.url <- "http://www.ntsb.gov/investigations/data/Documents/datafiles/AnnualReview_2013_Public_4_GA_20150218.xls"

## use read.xls to import

aviation <- read.xls(aviation.url)

## display the first six rows in the data

head(aviation)
```

```console
###   This.spreadsheet.contains.the.following.workbooks.
### 1                                            Data_GA
### 2                                     GA_FlightHours
### 3                                       GA_Accidents
### 4                        GA_AircraftCategory_FlightP
### 5                                         GA_AccRate
### 6                            GA_Personal_FlightHours
###
X
### 1 This workbook contains NTSB accident data (one row per accident aircraft) for all United States civil aviation accidents in calendar year 2013 involving aircraft not operating under 14 CFR Parts 121, 135, or 129. The data dictionary for this workbook is shown below.
### 2
This workbook summarizes general aviation flight hours from 2004 through 2013, using FAA activity data.
### 3
This workbook summarizes total and fatal general aviation accidents from 2004 through 2013, using NTSB accident data.
### 4
This workbook summarizes general aviation accidents in 2013 by aircraft category and purpose of flight, using NTSB accident data.
### 5
This workbook summarizes total and fatal general aviation accident rates from 2004 through 2013, using NTSB accident data and FAA activity data.
### 6
This workbook summarizes general aviation personal flying hours from 2004 through 2013, using FAA activity data.
```

By default, the read.xls() will read the data from first sheet (first workbook) and first line in the xls file. As you have seen in the head(aviation) output given above, the first sheet includes the dataset information, not the actual data. Therefore, it is important to check the original xls file (download and open it using Excel) and note the location (i.e. Sheet name and the line number where the data starts) of the data that you want to import.

For this example, the actual dataset is in the second sheet (i.e. Data_GA) and starts from the second line (the first line is for the title of the data). We can easily specify the sheet name and skip the first line by using sheet and skip arguments as follows:

```R
## this time use sheet and skip arguments to locate the data properly
## Use sheet = 2 and skip= 1 as the data is in second sheet and starts from second line (skip first line)

aviation <- read.xls(aviation.url, sheet = 2, skip = 1)

## display the first six rows in the data

head(aviation)
```

```console
###      ntsb_no aircraft_key    ev_date latitude longitude         ev_city
### 1 WPR13CA079            1 2013-01-01  423428N  1215226W       Chiloquin
### 2 WPR13LA082            1 2013-01-02  361238N  1151140W North Las Vegas
### 3 WPR13FA083            1 2013-01-02  350358N  1203706W          Oceano
### 4 WPR13FA080            1 2013-01-02  354337N  1190945W          Delano
### 5 CEN13FA122            1 2013-01-02  430834N  0932858W      Clear Lake
### 6 ERA13FA101            1 2013-01-01  335310N  0871900W          Jasper
###   ev_state ev_country inj_tot_f inj_tot_s ev_highest_injury damage far_part
### 1       OR        USA        NA        NA              NONE   SUBS     091 
### 2       NV        USA        NA        NA              NONE   SUBS     091 
### 3       CA        USA         1        NA              FATL   SUBS     091 
### 4       CA        USA         1        NA              FATL   DEST     091 
### 5       IA        USA         3        NA              FATL   DEST     091 
### 6       AL        USA         3        NA              FATL   DEST     091 
###   oper_pax_cargo oper_dom_int oper_sched acft_category type_fly CICTTEvent
### 1                                                 AIR      INST      LOC-G
### 2                                                 AIR      INST      LOC-G
### 3                                                 AIR      PERS      LOC-I
### 4                                                 HELI     OWRK       UIMC
### 5                                                 HELI     POSI      LOC-I
### 6                                                 AIR      PERS       OTHR
###   CICTTPhase Synopsis
### 1        LDG Synopsis
### 2        LDG Synopsis
### 3        MNV Synopsis
### 4        MNV Synopsis
### 5        ENR Synopsis
### 6        UND Synopsis
```

Note that, you will get an error when you try to read from an URL starting with https as the read.xls function does not support https. If you simply replace the https with http in the url, read.xls function will be able to import the file.

##### Scraping HTML Table Data
Sometimes, web pages contain several HTML tables and we may want to read the data from that HTML table. The simplest approach to scraping HTML table data directly into R is by using the rvest package. Recall that. HTML tables are contained within <table> tags; therefore, to extract the tables, we need to use the html_nodes() function to select the <table> nodes.

To illustrate, I will use the example from the help page for rvest, which loads all tables from the U.S. Social Security webpage: https://www.ssa.gov/oact/babynames/numberUSbirths.html

First, we will install and load the rvest package:

```R
## first install and load the rvest package

##install.packages("rvest")
library(rvest)
```

We will use read_html to locate the URL of the HTML table. When we use read_html, all table nodes that exist on the webpage will be captured.

```R
births <- read_html("https://www.ssa.gov/oact/babynames/numberUSbirths.html")
```

In this example, using the length function we can see that the html_nodes captures 1 HTML table.

```R
length(html_nodes(births, "table"))
```

```console
### [1] 1
```

In this example the webpage included only one table and this first table on the webpage is the place where our data is located, thus, we will select the first element of the html_nodes.

```R
## select the second element of the html_nodes

births_data<- html_table(html_nodes(births, "table")[[1]])

## view the header of the births_data

head(births_data)
```

```console
###   Year of birth    Male  Female   Total
### 1          1880 118,399  97,606 216,005
### 2          1881 108,282  98,855 207,137
### 3          1882 122,031 115,695 237,726
### 4          1883 112,475 120,059 232,534
### 5          1884 122,738 137,585 260,323
### 6          1885 115,945 141,948 257,893
```

However, in some cases the webpage can include data from a few additional tables used to format other parts of the page (i.e. table of contents, table of figures, advertisements, etc.). If this is the case, one needs to scan the html source of the webpage and select the table(s) that the data are located.

I recommend using [Element Locator](https://chrome.google.com/webstore/detail/element-locator/pldlfgnilfdheajekfphjkjeooignhkc), this extension allows you to locate and save HTML elements for each page(url), And shows XPath and CSS-Selector for each saved element.

#### Exporting Data
Exporting data out of R is equally important as importing data into R. In this section, we will cover how to export data to text files, Excel files and save to R data objects. In addition to the commonly used base R functions to export data, we will also cover functions from the popular readr and xlsx packages.

##### Exporting Data to text files
Similar to the previous examples provided in the importing text files section, in this section I will introduce the base R and readr package functions to export data to text files.

###### Base R functions
write.table() is the multi-purpose function in base R for exporting data. The function write.csv() is a special case of write.table() in which the defaults have been adjusted for efficiency. To illustrate, let’s create a data frame and export it to a CSV file in our working directory.

```R
## create a data frame and assign it to an object named df

df <- data.frame (cost = c(10, 25, 40),
                  color = c ("blue", "red", "green"),
                  suv = c (TRUE, TRUE, FALSE),
                  row.names = c ("car1", "car2", "car3"))

df
```

```console
###      cost color   suv
### car1   10  blue  TRUE
### car2   25   red  TRUE
### car3   40 green FALSE
```

To export df to a CSV file we will use write.csv().

```R
## write to a csv file in our working directory

write.csv(df, file = "cars_csv")
```

If you want to save the data frame in a different directory, we will use:

```R
## write to a csv and save in a different directory (i.e., ~/Desktop)

write.csv(df, file = "~/Desktop/cars_csv")
```

This function has additional arguments which will allow you to exclude row/column names, specify what to use for missing values, add or remove quotations around character strings, etc.

```R
## write to a csv file without row names

write.csv(df, file = "cars_csv", row.names = FALSE)
```

In addition to CSV files, we can also write to other text formats using write.table() by specifying the sep argument.

```R
## write to a tab delimited text file

write.table(df, file = "cars_txt", sep="\t")
```

###### The readr Package
The readr package functions, write_csv and write_delim are twice as fast as base R functions and they are very similar in usage.

Let’s use the same example to illustrate the usage of write_csv and write_delim

```R
## load the library

library(readr)

## write to a csv file in the working directory

write_csv(df, file = "cars_csv2")
```

```R
## write to a csv and save in a different directory (i.e., ~/Desktop)

write_csv(df, file =  "~/Desktop/export_csv2")
```

```R
## write to a csv file without column names

write_csv(df, file =  "export_csv2", col_names = FALSE)
```

```R
## write to a txt file in the working directory

write_delim(df, file =  "export_txt2")
```

##### Exporting Data to Excel files
The xlsx and openxlsx packages can be used for exporting data to Excel. However, the readxl package which I demonstrated in the importing data section does not have a function to export to Excel, therefore I will skip it here.

We will use the write.xlsx() function in the openxlsx package to export the data to a xlsx file.

```R
## load the library

library(openxlsx)

## write to a .xlsx file in the working directory

write.xlsx(df, file = "cars.xlsx")
```

For the full functionality of the openxlsx package please refer to the [package documentation](https://cran.r-project.org/web/packages/openxlsx/openxlsx.pdf).

#### Saving Data as an R object File
Sometimes we may need to save data or other R objects outside of the workspace or may want to store, share, or transfer between computers.

Basically, we can use .rda or .RData file types when we want to save **several, or all, objects and functions** that exist in the global environment

On the other hand, if we only want to save a **single R object such as a data frame, function, or statistical model result**, it is best to use the .rds file type. 

Still, we can use .rda or .RData to save a single object but the benefit of .rds is it only saves a **representation of the object and not the name** whereas .rda and .RData save **both the object and its name**. As a result, with .rds the saved object can be loaded into a named object within R that is different from the name it had when originally saved.

To illustrate let’s create two objects named x and y and save them to a .RData file using save() function.

```R
## generate random numbers from uniform and normal distribution and assign them to objects named x and y, respectively.

x <- runif(10)
y <- rnorm(10, 0, 1)

## Save both objects in .RData format in the working directory

save(x, y, file = "xy.RData")
Also, the save.image() function will save your all current workspace as .RData.

## save all objects in the global environment

save.image()
```

```R
The following examples will illustrate how a single object will be saved using saveRDS()

## save a single object to file

saveRDS(x, "x.rds")

## restore it under a different name

x2 <- readRDS("x.rds")

## check if x and x2 are identical

identical(x, x2)
```

```console
### [1] TRUE
```

For further details on differences between rds and RData formats please read the article (thanks to Shane Smith for finding this) in [http://www.sthda.com/english/wiki/saving-data-into-r-data-format-rds-and-rdata](http://www.sthda.com/english/wiki/saving-data-into-r-data-format-rds-and-rdata).

### Additional Resources and Further Reading
R data import/export manual https://cran.r-project.org/doc/manuals/R-data.html (R Team (2000)) is a comprehensive source for all types of data importing and exporting tasks in R. Also, RStudio’s “Data Import Cheatsheet” is a compact resource for all importing functions available in the readr package.

### References
Adler, Joseph. 2010. R in a Nutshell: A Desktop Quick Reference. " O’Reilly Media, Inc.".

Deborah, Nolan, and TL Ducan. 2014. “XML and Web Technologies for Data Sciences with R.” N. Deborah, & TL Ducan, XML and Web Technologies for Data Sciences with R, 581–618.

Munzert, Simon, Christian Rubba, Peter Meißner, and Dominic Nyhuis. 2014. Automated Data Collection with R: A Practical Guide to Web Scraping and Text Mining. John Wiley & Sons.

Team, R Core. 2000. “R Data Import/Export.”

## Model 3 - Understand: Understanding Data and Data Structures
### Summary
Importing data successfully doesn’t mean that we have all the information about our data. Understanding data structures and variable types in the data set are also crucial for conducting data preprocessing. We shouldn’t be performing any type of data preprocessing without understanding what we have in hand. In this module, I will provide the basics of variable types and data structures. You will learn to check the types of the variables, dimensions and structure of the data, and levels/values for the variables. We will also cover how to manipulate the format of the data (i.e., data type conversions). Finally, the difference between wide and long formatted data will be explained.

### Learning objectives
The learning objectives of this module are as follows:

+ Understand R’s basic data types (i.e., character, numeric, integer, factor, and logical).
+ Understand R’s basic data structures (i.e., vector, list, matrix, and data frame) and main differences between them.
+ Learn to check attributes (i.e., name, dimension, class, levels etc.) of R objects.
+ Learn how to convert between data types/structures.
+ Understand the difference between wide vs. long formatted data.

### Purpose
By completing the essential module reading, skill builders and reviewing the recorded lecture, you will be able to finalise your Assignment 1.

### Types of variables
A data set is a collection of measurements or records which are often called as variables and there are two major types of variables that can be stored in a data set: qualitative and quantitative. The qualitative variable is often called as categorical and they have a non-numeric structure such as gender, hair colour, type of a disease, etc. The qualitative variable can be nominal or ordinal.

+ **Nominal variable**: They have a scale in which the numbers or letters assigned to objects serve as labels for identification or classification. Examples of this variable include binary variables (e.g., yes/no, male/female) and multinomial variables (e.g. religious affiliation, eye colour, ethnicity, suburb).

+ **Ordinal variable**: They have a scale that arranges objects or alternatives according to their ranking. Examples include the exam grades (i.e., HD, DI, Credit, Pass, Fail etc.) and the disease severity (i.e., severe, moderate, mild).

The second type of variable is called the quantitative variable. These variables are the numerical data that we can either measure or count. The quantitative variables can be either discrete or continuous.

+ **Continuous quantitative variable**: They arise from a measurement process. Continuous variables are measured on a continuum or scale. They can have almost any numeric value and can be meaningfully subdivided into finer and finer increments, depending upon the precision of the measurement system. For example: time, temperature, wind speed may be considered as continuous quantitative variables.

+ **Discrete quantitative variable**: They arise from a counting process. Examples include the number of text messages you sent this past week and the number of faults in a manufacturing process.

The following short video by Nicola Petty provides a great overview on the variable types. Note that, in some statistical sources, the “type of the data” and the “type of the variables” are used synonymously. In the following video, the term “types of data” are used to refer the “types of variables”.

{% youtube hZxnzfnt5v8 %}

### Data Structures in R
In the previous section, we defined the types of variables in a general sense. However, as R is a programming language it has own definitions of data types and structures. Technically, R classifies all the different types of data into four classes:

+ **Logical**: This class consists of TRUE or FALSE (binary) values. A logical value is often created via comparison between variables.

```R
x <- 10
y <- (x > 0)
y
```

```console
### [1] TRUE
```

We can use class() function to check the class of an object.

```R
## check the class of y

class(y)
```

```console
### [1] "logical"
```

+ **Numeric** (integer or double): Quantitative values are called as numeric in R. It is the default computational data type. Numeric class can be integer or double. Integer types can be seen as discrete values (e.g., 2) whereas, double class will have floating point numbers (e.g., 2.16).

Here is an example of a double numeric variable:

```R
## create a double-precision numeric variable

dbl_var <- c(4, 7.5, 14.5)

## check the class of dbl_var

class(dbl_var)
```

```console
### [1] "numeric"
```

To check whether a numeric object is integer or double, you can also use typeof().

```R
## check the type of dbl_var object

typeof(dbl_var)
```

```console
### [1] "double"
```

In order to create an integer variable, we must place an L directly after each number. Here is an example:

```console
## create an integer (numeric) variable

int_var <- c(4L, 7L, 14L)

## check the class of int_var

class(int_var)
```

```console
### [1] "integer"
```

+ **Character**: A character class is used to represent string values in R. The most basic way to generate a character object is to use quotation marks " " and assign a string/text to an object.

```R
## create a character variable using " " and check its class

char_var <- c("debit", "credit", "Paypal")

class(char_var)
```

```console
### [1] "character"
```

Factor: Factor class is used to represent qualitative data in R. Factors can be ordered or unordered. Factors store the nominal values as a vector of integers in the range [1…k] (where k is the number of unique values in the nominal variable), and an internal vector of character strings (the original values) mapped to these integers.
Factor objects can be created with the factor() function:

```R
## create a factor variable using factor()

fac_var1 <- factor( c("Male", "Female", "Male", "Male") )
fac_var1
```

```console
### [1] Male   Female Male   Male  
### Levels: Female Male
```

```R
## check its class 

class(fac_var1)
```

```console
### [1] "factor"
```

To see the levels of a factor object levels() function will be used:

```R
## check the factor levels

levels(fac_var1)
```

```console
### [1] "Female" "Male"
```

By default, the levels of the factors will be ordered alphabetically. Using the levels() argument, we can control the ordering of the levels while creating a factor:

```R
## create a factor variable using factor() and order the levels using levels() argument

fac_var2 <- factor( c("Male", "Female", "Male", "Male"), 
                    levels = c("Male", "Female") )
fac_var2
```

```console
### [1] Male   Female Male   Male  
### Levels: Male Female
```

```R
## check its levels 

levels(fac_var2)
```

```console
### [1] "Male"   "Female"
```

We can also create ordinal factors in a specific order using the ordered = TRUE argument:

```R
## create a ordered factor variable using factor() and order the levels using levels() argument

ordered_fac <-factor( c("DI", "HD", "PA", "NN", "CR", "DI", "HD", "PA"), 
                      levels = c("NN", "PA", "CR", "DI", "HD"), ordered=TRUE )

ordered_fac
```

```console
### [1] DI HD PA NN CR DI HD PA
### Levels: NN < PA < CR < DI < HD
```

The ordering will be reflected as NN < PA < CR < DI < HD in the output.

Factors are also created during the data import. Many import functions like read.csv(), read_cvs(), read.table() etc. have stringsAsFactors option that determines how the character data is read in R. For BaseR read.csv() function, the default setting is stringsAsFactors = False. However, if we set it to TRUE, then all columns that are detected to be character/strings are converted to factor variables.

Let’s read the [VIC_pet.csv](https://github.com/yanboyang713/RMIT-Data-Repository/blob/main/VIC_pet.csv) dataset available under data repository using read.csv():

```R
pets <- read.csv("data/VIC_pet.csv",stringsAsFactors = TRUE)
head(pets)
```

```console
###        id    State      Region                              Animal_Type
### 1  17819v Victoria Colac Otway Dog                                     
### 2 142785v Victoria     Wyndham                               Cat       
### 3  97268v Victoria    Ballarat                                      Cat
### 4  46906v Victoria     Geelong                                      Dog
### 5  35939v Victoria     Geelong                                      Dog
### 6 114898v Victoria    Ballarat                                      Dog
###                                Animal_Name
### 1 CHUBBY                                  
### 2                                         
### 3                                   Bailey
### 4                                    Shuko
### 5                                   Violet
### 6                                    Ralph
###                          Breed_Description Colour Animal_Desexed
### 1 Labrador                                   NULL               
### 2                                 Domestic                      
### 3                                  Burmese                      
### 4                          German Shepherd                      
### 5                   Labrador/Staffordshire                      
### 6                 German Wire Hair Pointer
```

```R
str(pets)
```

```console
### 'data.frame':    40 obs. of  8 variables:
###  $ id               : Factor w/ 40 levels "10396v","104515v",..: 15 9 39 21 18 4 30 6 14 25 ...
###  $ State            : Factor w/ 1 level "Victoria": 1 1 1 1 1 1 1 1 1 1 ...
###  $ Region           : Factor w/ 7 levels "Ballarat","Colac Otway",..: 2 7 1 3 3 1 3 5 7 3 ...
###  $ Animal_Type      : Factor w/ 7 levels "Cat","Cat       ",..: 7 2 1 4 4 4 4 5 6 1 ...
###  $ Animal_Name      : Factor w/ 28 levels "","Bailey","Blacky",..: 9 1 2 24 28 20 14 1 1 10 ...
###  $ Breed_Description: Factor w/ 34 levels "","American Staffordshire Terrier",..: 23 11 6 14 24 16 28 28 2 11 ...
###  $ Colour           : Factor w/ 3 levels "","NULL","WHI ": 2 1 1 1 1 1 1 1 1 1 ...
###  $ Animal_Desexed   : Factor w/ 4 levels "","N","y","Y": 1 1 1 1 1 1 1 4 1 1 ...
```

As seen from the str() output, all of the columns in pets data are read as factors due to containing strings and the data was imported using read.csv() with the default option. Now, let’s focus on Animal_Type variable and check its levels using:

```R
levels(pets$Animal_Type)
```

```console
### [1] "Cat"                                     
### [2] "Cat       "                              
### [3] "dog"                                     
### [4] "Dog"                                     
### [5] "DOG "                                    
### [6] "Dog       "                              
### [7] "Dog                                     "
```

Note that there are in fact two unique levels for the Animal_Type i.e. dog and cat. However, due to the automatic conversion of different strings to factors we observe seven different levels in Animal_Type, namely “Cat”, “Cat[whitespace]”, “dog”, “Dog”,“DOG[whitespace]”, “Dog[whitespace]”, “Dog[whitespace][whitespace]”. Again, it is a good practice to read such strings as characters and then apply string manipulations (which will be covered in Module 8) to standardize all strings to “dog” and “cat”.

Now let’s look at the levels of id variable which contains the unique identification number of the pets:

```R
levels(pets$id)
```

```console
###  [1] "10396v"  "104515v" "110188v" "114898v" "129666v" "13234v"  "137135v"
###  [8] "141587v" "142785v" "143032v" "151452v" "151569v" "151921v" "154462v"
### [15] "17819v"  "1828v"   "18714v"  "35939v"  "3654v"   "39333v"  "46906v" 
### [22] "49872v"  "51127v"  "54848v"  "55483v"  "5754v"   "61112v"  "64560v" 
### [29] "66701v"  "70244v"  "70794v"  "7089v"   "77361v"  "81001v"  "84561v" 
### [36] "88946v"  "92359v"  "93485v"  "97268v"  "97957v"
```

As seen in the above output, there is no need to factorize id variable as there are 40 observations and 40 different levels for the id level. Therefore, any factorization of id variable would be inefficient. For such cases, it is better to leave this column as character (stringsAsFactors = FALSE) during the data import.

As mentioned previously, a data set is a collection of measurements or records which can be in any class (i.e., logical, character, numeric, factor, etc.). Typically, data sets contain many variables of different length and type of values. In R, we can store data sets using vectors, lists, matrices and data frames. In R, vectors, lists, matrices, arrays and data frames are called “Data Structures”.

According to Wickham (2014), R’s base data structures can be organised by their dimensionality (i.e., one-dimension, two-dimension, or n-dimension) and whether they’re homogeneous (i.e., all contents/variables must be of the same type) or heterogeneous (i.e., the contents/variables can be of different types). Therefore, there are five data structures given in the following table (adapted from Advanced R, Wickham (2014).)

|   Dimension	|    Homogeneous     |    Heterogeneous    |
|---------------|--------------------|---------------------|
| one-dimension |   Atomic vector    |        List         |
| two-dimension |   Matrix           |      Data frame     |
| n-dimension   |   Array            |         –           |

In this section, we won’t cover the multi-dimensional arrays, but we will go into the details of vectors, lists, matrices, and data frames.

### Vectors
A vector is the basic structure in R, which consists of one-dimensional sequence of data elements of the same basic type (i.e., integer, double, logical, or character). Vectors are created by combining multiple elements into one dimensional array using the c() function. The one-dimensional examples illustrated previously are considered vectors.

```R
## a double numeric vector

dbl_var <- c(4, 7.5, 14.5)

## an integer vector

int_var <- c(4L, 7L, 14L)

## a logical vector

log_var <- c(T, F, T, T)

## a character vector

char_var <- c("debit", "credit", "Paypal")
```

All elements of a vector must be the same type, if you attempt to combine different types of elements, they will be coerced to the most flexible type possible. Here are some examples:

```R
## vector of characters and numerics will be coerced to a character vector

ex1 <- c("a", "b", "c", 1, 2, 3)

## check the class of ex1

class(ex1)
```

```console
### [1] "character"
```

```R
## vector of numerics and logical will be coerced to a numeric vector

ex2 <- c(1, 2, 3, TRUE, FALSE)

## check the class of ex2

class(ex2)
```

```console
### [1] "numeric"
```

```R
## vector of logical and characters will be coerced to a character vector

ex3 <- c(TRUE, FALSE, "a", "b", "c")

## check the class of ex3

class(ex3)
```

```console
### [1] "character"
```

In order to add additional elements to a vector we can use c() function.

```R
## add two elements (4 and 6) to the ex2 vector

ex4 <- c(ex2, 4, 6)

ex4
```

```console
### [1] 1 2 3 1 0 4 6
```

To subset a vector, we can use square brackets [ ] with positive/negative integers, logical values or names. Here are some examples:

```R
## take the third element in ex4 vector

ex4[3]
```

```console
### [1] 3
```

```R
## take the first three elements in ex4 vector

ex4[1:3]
```

```console
### [1] 1 2 3
```

```R
## take the first, third, and fifth element

ex4[c(1,3,5)]
```

```console
### [1] 1 3 0
```

```R
## take all elements except first

ex4[-1]
```

```console
### [1] 2 3 1 0 4 6
```

```R
## take all elements less than 3

ex4[ ex4 < 3 ]
```

```console
### [1] 1 2 1 0
```

### Lists
A list is an R structure that allows you to combine elements of different types and lengths. In order to create a list we can use the list() function.

```R
## create a list using list() function

list1 <- list(1:3, "a", c(TRUE, FALSE, TRUE), c(2.5, 4.2))

## check the class of list1

class(list1)
```

```console
### [1] "list"
```

To see the detailed structure within an object we can use the structure function str(), which provides a compact display of the internal structure of an R object.

### check the structure of the list1 object

str(list1)
```

```console
### List of 4
###  $ : int [1:3] 1 2 3
###  $ : chr "a"
###  $ : logi [1:3] TRUE FALSE TRUE
###  $ : num [1:2] 2.5 4.2
```
Note how each of the four list items above are of different classes (integer, character, logical, and numeric) and different lengths.

In order to add on to lists we can use the append() function. Let’s add a fifth element to the list1 and store it as list2:

```R
## add another list c("credit", "debit", "Paypal") on list1

list2 <- append(list1, list(c("credit", "debit", "Paypal")))

## check the structure of the list2 object

str(list2)
```

```console
### List of 5
###  $ : int [1:3] 1 2 3
###  $ : chr "a"
###  $ : logi [1:3] TRUE FALSE TRUE
###  $ : num [1:2] 2.5 4.2
###  $ : chr [1:3] "credit" "debit" "Paypal"
```

R objects can also have attributes, which are like metadata for the object. These metadata can be very useful in that they help to describe the object. Some examples of R object attributes are:
+ names, dimnames
+ dimensions (e.g. matrices, arrays)
+ class (e.g. integer, numeric)
+ length
+ other user-defined attributes/metadata

Attributes of an object (if any) can be accessed using the attributes() function. Let’s check if list2 has any attributes.

```R
attributes(list2)
```

```console
### NULL
```

We can add names to lists using names() function.

```R
## add names to a pre-existing list

names(list2) <- c ("item1", "item2", "item3", "item4", "item5")

str(list2)
```

```console
### List of 5
###  $ item1: int [1:3] 1 2 3
###  $ item2: chr "a"
###  $ item3: logi [1:3] TRUE FALSE TRUE
###  $ item4: num [1:2] 2.5 4.2
###  $ item5: chr [1:3] "credit" "debit" "Paypal"
```

Now, you can see that each element has a name and the names are displayed after a dollar $ sign.
In order to subset lists, we can use dollar $ sign or square brackets [ ]. Here are some examples:

```R
## take the first list item in list2

list2[1]
```

```console
### $item1
### [1] 1 2 3
## take the first list item in list2 using $
```

```console
list2$item1
```

```console
### [1] 1 2 3
```

```R
## take the third element out of fifth list item

list2$item5[3]
```

```console
### [1] "Paypal"
```

```R
## take multiple list items 

list2[c(1,3)]
```

```console
### $item1
### [1] 1 2 3
### 
### $item3
### [1]  TRUE FALSE  TRUE
```

### Matrices
A matrix is a collection of data elements arranged in a two-dimensional rectangular layout. In R, the elements of a matrix must be of same class (i.e. all elements must be numeric, or character, etc.) and all columns of a matrix must be of same length.
We can create a matrix using the matrix() function using nrow and ncol arguments.

```R
## create a 2x3 numeric matrix

m1 <- matrix(1:6, nrow = 2, ncol = 3)

m1
```

```console
###      [,1] [,2] [,3]
### [1,]    1    3    5
### [2,]    2    4    6
```

The underlying structure of this matrix can be seen using str() and attributes() functions as follows:

```R
str(m1)
```

```console
###  int [1:2, 1:3] 1 2 3 4 5 6
```

```R
attributes(m1)
```

```console
### $dim
### [1] 2 3
```

Matrices can also be created using the column-bind cbind() and row-bind rbind() functions. However, note that the vectors that are being binded must be of equal length and mode.

```R
## create two vectors

v1 <- c(1, 4, 5)
v2 <- c(6, 8, 10)

## create a matrix using column-bind

m2 <- cbind(v1, v2)
m2
```

```console
###      v1 v2
### [1,]  1  6
### [2,]  4  8
### [3,]  5 10
```

```R
## create a matrix using row-bind

m3 <- rbind(v1, v2)
m3
```

```console
###    [,1] [,2] [,3]
### v1    1    4    5
### v2    6    8   10
```

We can also use cbind() and rbind() functions to add onto matrices.

```R
v3 <- c(9, 8, 7)

m4 <- rbind(m3, v3)
m4
```

```console
###    [,1] [,2] [,3]
### v1    1    4    5
### v2    6    8   10
### v3    9    8    7
```

We can add names to the rows and columns of a matrix using rownames and colnames. Let’s add row names as subject1, subject2, and subject3 and column names as var1, var2, and var3 for m4:

```R
## add row names to m4

rownames(m4) <- c("subject1", "subject2", "subject3")

## add column names to m4

colnames(m4) <- c("var1", "var2", "var3")


## check attributes

attributes(m4)
```

```console
### $dim
### [1] 3 3
### 
### $dimnames
### $dimnames[[1]]
### [1] "subject1" "subject2" "subject3"
### 
### $dimnames[[2]]
### [1] "var1" "var2" "var3"
```

In order to subset matrices we use the [ operator. As matrices have two dimensions, we need to incorporate subsetting arguments for both row and column dimensions. A generic form of matrix subsetting looks like: matrix [rows, columns].

We can illustrate it using matrix m4:

```R
m4
```

```console
###          var1 var2 var3
### subject1    1    4    5
### subject2    6    8   10
### subject3    9    8    7
```

```R
## take the value in the first row and second column 

m4[1,2]
```

```console
### [1] 4
```

```R
## subset for rows 1 and 2 but keep all columns

m4[1:2, ]
```

```console
###          var1 var2 var3
### subject1    1    4    5
### subject2    6    8   10
```

```R
## subset for columns 1 and 3 but keep all rows

m4[ , c(1, 3)]
```

```console
###          var1 var3
### subject1    1    5
### subject2    6   10
### subject3    9    7
```

```R
## subset for both rows and columns

m4[1:2, c(1, 3)]
```

```console
###          var1 var3
### subject1    1    5
### subject2    6   10
```

```R
## use column names to subset

m4[ , "var1"]
```

```console
### subject1 subject2 subject3 
###        1        6        9
```

```R
## use row names to subset

m4["subject1" , ]
```

```console
### var1 var2 var3 
###    1    4    5
```

### Data Frames
A data frame is the most common way of storing data in R and, generally, is the data structure most often used for data analyses. A data frame is a list of equal-length vectors and they can store different classes of objects in each column (i.e., numeric, character, factor).

Data frames are usually created by importing/reading in a data set using the functions covered in Module 2. However, data frames can also be created explicitly with the data.frame() function or they can be coerced from other types of objects like lists.

In the following example, we will create a simple data frame df1 and assess its basic structure:

```R
##  create a data frame using data.frame()

df1 <- data.frame (col1 = 1:3,
                  col2 = c ("credit", "debit", "Paypal"),
                  col3 = c (TRUE, FALSE, TRUE),
                  col4 = c (25.5, 44.2, 54.9))

## inspect its structure

str(df1)
```

```console
### 'data.frame':    3 obs. of  4 variables:
###  $ col1: int  1 2 3
###  $ col2: chr  "credit" "debit" "Paypal"
###  $ col3: logi  TRUE FALSE TRUE
###  $ col4: num  25.5 44.2 54.9
```

In the example above, col2 is character. If we set stringsAsFactors = TRUE, then this variable will be converted to a column of factors.

```R
## use stringsAsFactors = TRUE

df1 <- data.frame (col1 = 1:3,
                  col2 = c ("credit", "debit", "Paypal"),
                  col3 = c (TRUE, FALSE, TRUE),
                  col4 = c (25.5, 44.2, 54.9),
                  stringsAsFactors = TRUE)

## inspect its structure

str(df1)
```

```console
### 'data.frame':    3 obs. of  4 variables:
###  $ col1: int  1 2 3
###  $ col2: Factor w/ 3 levels "credit","debit",..: 1 2 3
###  $ col3: logi  TRUE FALSE TRUE
###  $ col4: num  25.5 44.2 54.9
```

We can add columns (variables) and rows (items) on to a data frame using cbind() and rbind() functions. Here are some examples:

```R
## create a new vector

v4 <- c("VIC", "NSW", "TAS")

## add a column (variable) to df1

df2 <- cbind(df1, v4)
```

Adding attributes to data frames is very similar to what we have done in matrices. We can use rownames() and colnames() functions to add the row and column names, respectively.

```R
## add row names

rownames(df2) <- c("subj1", "subj2", "subj3")

## add column names 
colnames(df2) <- c("number", "card_type", "fraud", "transaction", "state")

## check the structure and the attributes

str(df2)
```

```console
### 'data.frame':    3 obs. of  5 variables:
###  $ number     : int  1 2 3
###  $ card_type  : Factor w/ 3 levels "credit","debit",..: 1 2 3
###  $ fraud      : logi  TRUE FALSE TRUE
###  $ transaction: num  25.5 44.2 54.9
###  $ state      : chr  "VIC" "NSW" "TAS"
```

```R
attributes(df2)
```

```console
### $names
### [1] "number"      "card_type"   "fraud"       "transaction" "state"      
### 
### $class
### [1] "data.frame"
### 
### $row.names
### [1] "subj1" "subj2" "subj3"
```

Data frames possess the characteristics of both lists and matrices. Therefore, they are subsetted with a single vector, they behave like lists and will return the selected columns with all rows and if you subset with two vectors, they behave like matrices and can be subset by row and column. Here are some examples:

```R
df2
```

```console
###       number card_type fraud transaction state
### subj1      1    credit  TRUE        25.5   VIC
### subj2      2     debit FALSE        44.2   NSW
### subj3      3    Paypal  TRUE        54.9   TAS
```

```R
## subset by row numbers, take second and third rows only

df2[2:3, ]
```

```console
###       number card_type fraud transaction state
### subj2      2     debit FALSE        44.2   NSW
### subj3      3    Paypal  TRUE        54.9   TAS
```

```R
## same as above but uses row names

df2[c("subj2", "subj3"),  ]
```

```console
###       number card_type fraud transaction state
### subj2      2     debit FALSE        44.2   NSW
### subj3      3    Paypal  TRUE        54.9   TAS
```

```R
## subset by column numbers, take first and forth columns only

df2[, c(1,4)]
```

```console
###       number transaction
### subj1      1        25.5
### subj2      2        44.2
### subj3      3        54.9
```

```R
## same as above but uses column names

df2[, c("number", "transaction")]
```

```console
###       number transaction
### subj1      1        25.5
### subj2      2        44.2
### subj3      3        54.9
```

```R
## subset by row and column numbers

df2[2:3, c(1, 4)]
```

```console
###       number transaction
### subj2      2        44.2
### subj3      3        54.9
```

```R
## same as above but uses row and column names

df2[c("subj2", "subj3"), c("number", "transaction")]
```

```console
###       number transaction
### subj2      2        44.2
### subj3      3        54.9
```

```R
## subset using $: take the column (variable) fraud

df2$fraud
```

```console
### [1]  TRUE FALSE  TRUE
```

```R
## take the second element in the fraud column

df2$fraud[2]
```

```console
### [1] FALSE
```

### Converting Data Types/Structures
In traditional programming languages, you need to specify the type of data a given variable can contain i.e. either integer, character, string or decimal. In R, this is not necessary. R is smart enough to “guess/create” the data type based on the values provided for a variable. However, R is not that smart (thanks to that! Otherwise why we need analysts!) to guess the correct data type within the context of analysis.

To illustrate this point, let’s import the [banksim.csv](https://github.com/yanboyang713/RMIT-Data-Repository/blob/main/banksim.csv) data set containing the following variables:

+ **id**: Customer ID number

+ **age**: Numerical variable

+ **marital**: Categorical variable with three levels (married, single, divorced where widowed counted as divorced)

+ **education**: Categorical variable with three levels (primary, secondary, tertiary)

+ **job**: Categorical variable containing type of jobs

+ **balance**: Numerical variable, balance in the bank account

+ **day**: Numerical variable, last contacted month of the day

+ **month**: Categorical variable, last contacted month

+ **duration**: Numerical variable, duration of the contact time

```R
library(readr)
bank <- read_csv("data/banksim.csv")

str(bank)
```

```console
### tibble [15 x 9] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
###  $ id       : num [1:15] 1 2 3 4 5 6 7 8 9 10 ...
###  $ age      : chr [1:15] "44" "88" "36" "25<=" ...
###  $ marital  : chr [1:15] "married" "married" "divorced" "single" ...
###  $ education: chr [1:15] "secondary" "secondary" "secondary" "secondary" ...
###  $ job      : chr [1:15] "blue-collar" "admin." "blue-collar" "technician" ...
###  $ balance  : chr [1:15] "16178" "330" "853" "616" ...
###  $ day      : num [1:15] 21 2 20 28 12 16 15 5 26 14 ...
###  $ month    : chr [1:15] "nov" "dec" "jun" "jul" ...
###  $ duration : num [1:15] 297 357 15 117 54 -268 129 156 168 216 ...
###  - attr(*, "spec")=
###   .. cols(
###   ..   id = col_double(),
###   ..   age = col_character(),
###   ..   marital = col_character(),
###   ..   education = col_character(),
###   ..   job = col_character(),
###   ..   balance = col_character(),
###   ..   day = col_double(),
###   ..   month = col_character(),
###   ..   duration = col_double()
###   .. )
```

The str() output reveals how R guesses the data types of each variable. Accordingly, id, day and duration are read as numeric values, and the rest are read as characters. However, according to the variable definitions given above, the correct data type for age and balance variables should be numeric (or integer).

Now’s lets investigate the reason for the incorrect data types.

```R
bank
```

```console
### # A tibble: 15 x 9
###       id age   marital  education job         balance   day month duration
###    <dbl> <chr> <chr>    <chr>     <chr>       <chr>   <dbl> <chr>    <dbl>
###  1     1 44    married  secondary blue-collar 16178      21 nov        297
###  2     2 88    married  secondary admin.      330         2 dec        357
###  3     3 36    divorced secondary blue-collar 853        20 jun         15
###  4     4 25<=  single   secondary technician  616        28 jul        117
###  5     5 33    single   secondary services    310        12 m           54
###  6     6 37    married  tertiary  management  0          16 jul       -268
###  7     7 42    married  tertiary  management  1205       15 mar        129
###  8     8 43    married  secondary blue-collar 130         5 may        156
###  9     9 58    married  primary   u           99999      26 aug        168
### 10    10 41    married  secondary admin.      3634       14 may        216
### 11    11 0     married  primary   management  92          2 feb        447
### 12    12 34    single   secondary services    528D        2 sep        121
### 13    13 28    single   secondary admin.      350        19 may          5
### 14    14 58    widowed  tertiary  management  136         8 jul        199
### 15    15 34    married  unknown   blue-collar 41          6 may         34
```

As seen from the output, row 4 of age column has “<=” and row 12 of balance column is “528D”, therefore these characters forced columns to be read as characters even if they have a numeric nature. **A good practice is always to check the definitions of variables, understand their types within the context, and then to apply proper type conversions if they are not in the correct data type.**

Data type and structure conversions can be done easily using as. functions. Essentially, as. functions will convert the object to a given type (whenever possible) and is. functions will test for the given data type and return a logical value (TRUE or FALSE).

|   as. Functions    |    Changes type to    |    is. Functions    |    Checks if the type is    |
|--------------------|-----------------------|---------------------|-----------------------------|
|    as.numeric()    |         numeric       |    is.numeric()     |           numeric           |
|    as.integer()    |         integer       |    is.integer()     |           integer           |
|    as.double()     |         double	     |    is.double()	   |           double            |
|    as.character()  |         character     |    is.character()   |           character         |
|    as.factor()     |         factor        |    is.factor()      |           factor            |
|    as.logical()    |         logical       |    is.logical()	   |           logical           |
|    as.vector()     |         vector        |    is.vector()	   |           vector            |
|    as.list()	     |         list	     |    is.list()	   |           list              |
|    as.matrix()     |         matrix        |    is.matrix()	   |           matrix            |
|    as.data.frame() |        data frame     |    is.data.frame()  |          data frame         |

Here are some examples on data type conversions:

```R
## create a numeric vector called num_vec

num_vec <- as.vector(8:17)

## check if it's a vector

is.vector(num_vec)
```

```console
### [1] TRUE
```

```R
## convert num_vec into a character

char_vec <-as.character(num_vec) 

## check if it's a character

is.character(char_vec)
```

```console
### [1] TRUE
```

```R
## create a logical vector

log_vec <- c(FALSE, FALSE, TRUE)

## convert log_vec into a numeric vector

num_vec2 <- as.numeric(log_vec)

## check if it's a numeric vector

is.numeric(num_vec2)
```

```console
### [1] TRUE
```

The as. functions are also useful to initialize data types. The following example illustrates how you can initialize data using vectors and turn multiple vectors into a data frame:

```R
## create different types of vectors

col1 <- 1:3
col2 <- c ("credit", "debit", "Paypal")
col3 <- c (TRUE, FALSE, TRUE)
col4 <- c (25.5, 44.2, 54.9)

## use cbind to combine vectors by columns 

colvec <- cbind(col1, col2, col3, col4)

## check its class

class(colvec)
```

```console
### [1] "matrix" "array"
```

```R
## convert matrix to a data frame

df <- as.data.frame(colvec)

df
```

```console
###   col1   col2  col3 col4
### 1    1 credit  TRUE 25.5
### 2    2  debit FALSE 44.2
### 3    3 Paypal  TRUE 54.9
```

### Long vs. wide format data
A single data set can be rearranged in many ways. One of the ways is called **“long format (a.k.a long layout)”**. In this layout, the data set is arranged in such a way that a single subject’s information is stored in multiple rows.

In the **wide format (a.k.a wide layout)**, a single subject’s information is stored in multiple columns. The main difference between a wide layout and a long layout is that the wide layout contains all the measured information in different columns.

An illustration of the same data set stored in wide vs. long format is given below:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615916437/MATH2349/Model3/LongVsWideFormatData_v6babh.png)

Fig1. The same data set presented in wide vs. long format

In Module 4, we will see how we can convert a long format to a wide one and vice versa using R.

### Additional Resources and Further Reading
Data Wrangling with R by Boehmke (2016) is a comprehensive source for all data types and structures in R. This book is also one the recommended texts in our course. It is available through RMIT Library.

Base R cheatsheet on http://github.com/rstudio/cheatsheets/raw/master/base-r.pdf is useful for remembering commonly used functions and arguments for data types and structures in R.

### References
Boehmke, Bradley C. 2016. Data Wrangling with R. Springer.

Wickham, Hadley. 2014. Advanced R. CRC Press.


## Module 4 - Tidy and Manipulate: Tidy Data Principles and Manipulating Data
### Overview
#### Summary
In this module, I will present Hadley Wickham’s “Tidy Data” principles (Hadley Wickham and others (2014)) and discuss the main benefits of following these principles. We will identify most common problems with messy data sets and explore the powerful tidyr package to tidy messy data sets. Lastly, we will cover the “Grammar of Data Manipulation” - the powerful dplyr package using examples.

In preparation of this section, I heavily used our recommended textbooks (Boehmke (2016) and Wickham and Grolemund (2016)), R Studio’s Data wrangling with R and RStudio webinar, tidyr and dplyr reference manuals (H Wickham (2014), Wickham et al. (2017)).


#### learning objectives
The learning objectives of this module are as follows:

+ Identify and understand the underlying tidy data principles.
+ Identify common problems with messy data sets.
+ Learn how to get your data into a tidy form using **tidyr** package tools.
+ Learn data manipulation tasks (i.e., select, filter, arrange, join, merge) using the powerful **dplyr** package functions.

### Tidy Data Principles
“Happy families are all alike; every unhappy family is unhappy in its own way.” —Leo Tolstoy
“Tidy datasets are all alike, but every messy dataset is messy in its own way.” —Hadley Wickham

Hadley Wickham wrote a stellar article called “Tidy Data” in Journal of Statistical Software to provide a standard way to organise data values within a dataset. In his paper, Wickham developed the framework of “Tidy Data Principles” to provide a standard and consistent way of storing data that makes transformation, visualization, and modelling easier. Along with the tidy data principles, he also developed the tidyr package, which provides a bunch of tools to help tidy up the messy data sets.

In this section, I will give you a practical introduction to tidy data and the accompanying tools in the tidyr package. If you’d like to learn more about the underlying theory, you might enjoy the Tidy Data paper published in the Journal of Statistical Software.

Once you’ve imported and understand the structure of your data, it is a good idea to tidy it. Tidying your data means storing it in a consistent form that matches the semantics of the data set with the way it is stored.

In brief, there are three interrelated rules which make a dataset tidy (Wickham and Grolemund (2016)). In tidy data:

+ Each variable must have its own column.
+ Each observation must have its own row.
+ Each value must have its own cell.

The following illustration taken from Wickham and Grolemund (2016) shows these three rules visually:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617030207/MATH2349/Model4/TidyDataPrinciples_v7sese.png)

Fig1. Tidy data rules: variables are in columns, observations are in rows, and values are in cells (taken from Wickham and Grolemund (2016))

To demonstrate these rules, we will use a simple data set:

| Student Name | Math | English |
|--------------|------|---------|
|   Anna       |  86  |   90    |
|   John       |  43  |   75    |
|  Catherine   |  80  |   82    |

In this simple data, there are in fact three variables illustrated in the following table:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617036542/MATH2349/Model4/exampleOne_isnnmf.png)

First variable is “Student Name”, the second is “Subject” that represents whether the subject is Maths or English, and the third one is the “Grade” information inside the data matrix.

When we arrange each variable in columns and each student in a row then we will get the tidy version of the same data as follows:

| No | Student Name | Subject | Grade |
|----|--------------|---------|-------|
| 1  |  Anna        |  Math   |  86   |
| 2  |  John        |  Math   |  43   |
| 3  |  Catherine   |  Math   |  80   |
| 4  |  Anna        | English |  90   |
| 5  |  John        | English |  75   |
| 6  |  Catherine   | English |  82   |

You can see that in this format, each variable forms a column and each student forms a row:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617036908/MATH2349/Model4/exampleTwo_kjyuwl.png)

**The main advantage of using tidy principles** is it allows R’s vectorized nature to shine. One can extract variables in a simple, standard way. Have a look at the following illustration. Which would you rather work with?

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617037139/MATH2349/Model4/exampleThree_ktt50a.png)

Tidy data is important because the consistent structure lets you focus on questions about the data, not fighting to get the data into the right form for different functions.

### Common problems with messy data sets

Real data sets can, and often do, violate the three principles of tidy data. This section describes most common problems with messy datasets:

+ Column headers are values, not variable names: A common problem is a dataset where some (or all) of the column names are not names of variables, but values of a variable. Here is an illustration of this problem:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617037383/MATH2349/Model4/CommonProblemOne_jekvaq.png)

In the example above, the column names 2011, 2012, and 2013 represent values of the year variable, and each row represents three observations, not one.

+ Multiple variables are stored in rows: The opposite of the first problem can also occur when the variables are stored in rows. In such cases, cells include the actual variables, not the observations. Here is an example:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617037561/MATH2349/Model4/CommonProblemTwo_hmqyrc.png)

+ Multiple variables are stored in one column: Sometimes, one column stores the information of two or more variables. Therefore, multiple variables can be extracted from one column. Here is an illustration of this problem:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617037681/MATH2349/Model4/CommonProblemThree_bnk7kb.png)

In the example above, date variable actually stores three new variable information, namely; year, month, and day.

+ Multiple columns forms a variable: You may need to combine multiple columns into a single column to form a new variable. Here is an illustration of this problem:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617037881/MATH2349/Model4/CommonProblemFour_og6y7t.png)

In this example, the year, month, and day variables are given separately in the original data but assume that we need to combine these three columns into a single variable called date for the time series analysis.

### The tidyr package

Most messy datasets can be tidied with a small set of tools. The tidyr package is a very useful package that reshapes the layout of data sets. In the next section you will be introduced the tidyr package and its functions with examples.

We will use the subset of the data contained in the World Health Organization Global Tuberculosis Report (also given in tidyr package documentation) to illustrate the functions in the tidyr package. Before loading this dataset, we need to install and load the package using:

```R
## install the tidyr package

##install.packages("tidyr")

## load the tidyr package

library(tidyr)
```

The following example shows the same data organized in four different ways (table1, table2, table3, table4a, table4b). Each dataset shows the same values of four variables, country, year, population, and cases, but each dataset organizes the values in a different way as follows:

```console
## load the example data organized in four different ways

table1
### # A tibble: 6 x 4
###   country      year  cases population
###   <chr>       <int>  <int>      <int>
### 1 Afghanistan  1999    745   19987071
### 2 Afghanistan  2000   2666   20595360
### 3 Brazil       1999  37737  172006362
### 4 Brazil       2000  80488  174504898
### 5 China        1999 212258 1272915272
### 6 China        2000 213766 1280428583
```

```console
table2
### # A tibble: 12 x 4
###    country      year type            count
###    <chr>       <int> <chr>           <int>
###  1 Afghanistan  1999 cases             745
###  2 Afghanistan  1999 population   19987071
###  3 Afghanistan  2000 cases            2666
###  4 Afghanistan  2000 population   20595360
###  5 Brazil       1999 cases           37737
###  6 Brazil       1999 population  172006362
###  7 Brazil       2000 cases           80488
###  8 Brazil       2000 population  174504898
###  9 China        1999 cases          212258
### 10 China        1999 population 1272915272
### 11 China        2000 cases          213766
### 12 China        2000 population 1280428583
```

```console
table3
### # A tibble: 6 x 3
###   country      year rate             
### * <chr>       <int> <chr>            
### 1 Afghanistan  1999 745/19987071     
### 2 Afghanistan  2000 2666/20595360    
### 3 Brazil       1999 37737/172006362  
### 4 Brazil       2000 80488/174504898  
### 5 China        1999 212258/1272915272
### 6 China        2000 213766/1280428583
```

```console
table4a
### # A tibble: 3 x 3
###   country     `1999` `2000`
### * <chr>        <int>  <int>
### 1 Afghanistan    745   2666
### 2 Brazil       37737  80488
### 3 China       212258 213766
```

```console
table4b
### # A tibble: 3 x 3
###   country         `1999`     `2000`
### * <chr>            <int>      <int>
### 1 Afghanistan   19987071   20595360
### 2 Brazil       172006362  174504898
### 3 China       1272915272 1280428583
```

#### pivot_longer() function
The function pivot_longer() is an updated approach to gather() function. When column names are values instead of variables, we need to gather or in other words, we need to transform data from wide to long format.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617038509/MATH2349/Model4/pivot_longer_co6mqf.png)

Fig2. gather() – tidyr by RStudio

To illustrate gather() function, let’s have a look at the data given in table4a:

```console
table4a
### # A tibble: 3 x 3
###   country     `1999` `2000`
### * <chr>        <int>  <int>
### 1 Afghanistan    745   2666
### 2 Brazil       37737  80488
### 3 China       212258 213766
```

To tidy a dataset like this, we need to gather those columns into a new pair of variables using gather() function. To describe that operation, we need three parameters:

+ The set of columns that represent values, not variables. In this example, those are the columns 1999 and 2000.
+ The name of the variable whose values form the column names. The argument name key stands for that variable. For this example, the key argument is year.
+ The name of the variable whose values are spread over the cells. The argument name value stands for that, in this example value argument is the number of cases.

```console
table4a %>% gather(`1999`, `2000`, key = "year", value = "cases")
### # A tibble: 6 x 3
###   country     year   cases
###   <chr>       <chr>  <int>
### 1 Afghanistan 1999     745
### 2 Brazil      1999   37737
### 3 China       1999  212258
### 4 Afghanistan 2000    2666
### 5 Brazil      2000   80488
### 6 China       2000  213766
```

OR using the pivot_longer function:

```console
table4a %>% pivot_longer(names_to = "year", values_to = "cases", cols = 2:3)
### # A tibble: 6 x 3
###   country     year   cases
###   <chr>       <chr>  <int>
### 1 Afghanistan 1999     745
### 2 Afghanistan 2000    2666
### 3 Brazil      1999   37737
### 4 Brazil      2000   80488
### 5 China       1999  212258
### 6 China       2000  213766
```

Here, the arguments names_to is a string specifying the name of the column to create from the data stored in the column names of data, values_to is a string specifying the name of the column to create from the data stored in cell values, and cols refers to those columns that should be pivot into longer format.

**Note** that in the R code below, I used the pipe (%>%) operator to take the data first, then use the gather function. The tidyr package functions can also be used along with the pipe operator %>% which is developed by Stefan Milton Bache in the R package magrittr. Remember that the functions in tidyr can be used without the pipe operator. For more information on the pipe operator, its pros and cons please refer to Dr. James Baglin’s R Bootcamp Course 1.

#### pivot_wider() function
The function pivot_wider() is an updated approach to spread() function. When multiple variables are stored in rows, the spread() function generates columns from rows. In other words, it transforms data from long to wide format. The spread() function is the opposite of gather() function.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617039276/MATH2349/Model4/pivot_wider_ehwiow.png)

Let’s look at table2 and assume that we are required to turn long formatted data into wide formatted data by generating columns from cases.

```console
table2
### # A tibble: 12 x 4
###    country      year type            count
###    <chr>       <int> <chr>           <int>
###  1 Afghanistan  1999 cases             745
###  2 Afghanistan  1999 population   19987071
###  3 Afghanistan  2000 cases            2666
###  4 Afghanistan  2000 population   20595360
###  5 Brazil       1999 cases           37737
###  6 Brazil       1999 population  172006362
###  7 Brazil       2000 cases           80488
###  8 Brazil       2000 population  174504898
###  9 China        1999 cases          212258
### 10 China        1999 population 1272915272
### 11 China        2000 cases          213766
### 12 China        2000 population 1280428583
```

To tidy this up, we first analyse the representation in a similar way to gather(). This time, however, we only need two parameters:

+ The column that contains variable names, the key column. Here, it’s type.
+ The column that contains values forms multiple variables, the value column. Here, it’s count.

Once we’ve figured that out, we can use spread():

```console
spread(table2, key = "type", value = "count")
### # A tibble: 6 x 4
###   country      year  cases population
###   <chr>       <int>  <int>      <int>
### 1 Afghanistan  1999    745   19987071
### 2 Afghanistan  2000   2666   20595360
### 3 Brazil       1999  37737  172006362
### 4 Brazil       2000  80488  174504898
### 5 China        1999 212258 1272915272
### 6 China        2000 213766 1280428583
```

OR equivalently, we have the following using the function pivot_wider() with the arguments names_from and values_from:

```console
pivot_wider(table2, names_from = "type", values_from = "count")
### # A tibble: 6 x 4
###   country      year  cases population
###   <chr>       <int>  <int>      <int>
### 1 Afghanistan  1999    745   19987071
### 2 Afghanistan  2000   2666   20595360
### 3 Brazil       1999  37737  172006362
### 4 Brazil       2000  80488  174504898
### 5 China        1999 212258 1272915272
### 6 China        2000 213766 1280428583
```

Now, cases and population are separate variables given in columns, therefore, generating a new variable from these two variables is super easy! Let’s calculate the Tuberculosis rate (rate = cases/population) using:

```console
rate = spread(table2, key = type, value = count)$cases / spread(table2, key = type, value = count)$population

rate
### [1] 0.0000372741 0.0001294466 0.0002193930 0.0004612363 0.0001667495
### [6] 0.0001669488
```

#### separate() function
The separate() and extract() functions both can be used when multiple variables are stored in one column and you want to split them according to the separator character. Take table3 for example:

```console
table3
### # A tibble: 6 x 3
###   country      year rate             
### * <chr>       <int> <chr>            
### 1 Afghanistan  1999 745/19987071     
### 2 Afghanistan  2000 2666/20595360    
### 3 Brazil       1999 37737/172006362  
### 4 Brazil       2000 80488/174504898  
### 5 China        1999 212258/1272915272
### 6 China        2000 213766/1280428583
```

The rate column contains both cases and population variables, and we need to split it into two variables.

```console
table3 %>% separate(rate, into = c("cases", "population"), sep = "/")
### # A tibble: 6 x 4
###   country      year cases  population
###   <chr>       <int> <chr>  <chr>     
### 1 Afghanistan  1999 745    19987071  
### 2 Afghanistan  2000 2666   20595360  
### 3 Brazil       1999 37737  172006362 
### 4 Brazil       2000 80488  174504898 
### 5 China        1999 212258 1272915272
### 6 China        2000 213766 1280428583
```

#### unite() function
unite() is the inverse of separate() function. One can use it to combine multiple columns into a single column.
Now let’s look at this data:

```console
table5
### # A tibble: 6 x 4
###   country     century year  rate             
###   <chr>       <chr>   <chr> <chr>            
### 1 Afghanistan 19      99    745/19987071     
### 2 Afghanistan 20      00    2666/20595360    
### 3 Brazil      19      99    37737/172006362  
### 4 Brazil      20      00    80488/174504898  
### 5 China       19      99    212258/1272915272
### 6 China       20      00    213766/1280428583
```

In this data, assume that we want to combine the century and year variables into one variable called new_year. We can use unite() for this purpose:

```console
table5 %>% unite(new_year, century, year)
### # A tibble: 6 x 3
###   country     new_year rate             
###   <chr>       <chr>    <chr>            
### 1 Afghanistan 19_99    745/19987071     
### 2 Afghanistan 20_00    2666/20595360    
### 3 Brazil      19_99    37737/172006362  
### 4 Brazil      20_00    80488/174504898  
### 5 China       19_99    212258/1272915272
### 6 China       20_00    213766/1280428583
```

In this case we also need to use the sep argument. The default will place an underscore (\_) between the values from different columns. Here we don’t want any separator, so we use sep="" as follows:

```console
table5 %>% unite(new_year, century, year, sep="")
### # A tibble: 6 x 3
###   country     new_year rate             
###   <chr>       <chr>    <chr>            
### 1 Afghanistan 1999     745/19987071     
### 2 Afghanistan 2000     2666/20595360    
### 3 Brazil      1999     37737/172006362  
### 4 Brazil      2000     80488/174504898  
### 5 China       1999     212258/1272915272
### 6 China       2000     213766/1280428583
```

### The dplyr package

Although there are many data manipulation packages/functions in R, most of them lack consistent coding and the ability to easily flow together. This leads to difficult-to-read nested functions and/or choppy code. Hadley Wickham developed the very popular dplyr package to make these data processing tasks more efficient along with a syntax that is consistent and easier to remember and read.

The dplyr package is regarded as the “Grammar of Data Manipulation” in R and it originates from the popular plyr package, also developed by Hadley Wickham. The plyr package covers data manipulation for a range of data structures (i.e., data frames, lists, arrays) whereas dplyr is focused on data frames. In this section, I will focus on dplyr. We will cover primary functions inside dplyr for data manipulation. The full list of capabilities can be found in the dplyr reference manual. I highly recommend going through it as there are many great functions provided by dplyr that I will not cover here.

I will use the nycflights13 package and the data sets to explore the basic data manipulation verbs of dplyr. First, we need to install and load the dplyr and nycflights13 packages using:

```R
## install the dplyr package

##install.packages("dplyr")

## load the dplyr package

library(dplyr)
```

```R
## install the nycflights13 package for the data set

##install.packages("nycflights13")

## load the nycflights13 package

library(nycflights13)
```

The nycflights13 package includes five data frames containing information on airlines, airports, flights, weather, and planes that departed from New York City in 2013. The data comes from the US Bureau of Transportation Statistics. Let’s look at the nycflights13::flights data set:

```console
## View the flights data set under the nycflights13 package

nycflights13::flights
### # A tibble: 336,776 x 19
###     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
###    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
###  1  2013     1     1      517            515         2      830            819
###  2  2013     1     1      533            529         4      850            830
###  3  2013     1     1      542            540         2      923            850
###  4  2013     1     1      544            545        -1     1004           1022
###  5  2013     1     1      554            600        -6      812            837
###  6  2013     1     1      554            558        -4      740            728
###  7  2013     1     1      555            600        -5      913            854
###  8  2013     1     1      557            600        -3      709            723
###  9  2013     1     1      557            600        -3      838            846
### 10  2013     1     1      558            600        -2      753            745
### # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
### #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
### #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>
```

You might notice that this data frame prints differently from other data frames you might have used in the past: it only shows the first few rows and all the columns that fit on one screen. It prints differently because it’s a tibble. Tibbles are a modern take on data frames. They are slightly tweaked to work better with tidyr and dplyr (and many others). For now, you don’t need to worry about the differences (you may refer to here to learn more on tibbles.

#### select() function
When working with a large data frame, often we want to only assess specific variables. The select() function allows us to select and/or rename variables.

In addition to the existing functions like : and c(), there are a number of special functions that can work inside select. Some of them are given in the following table.

|   Functions   |                         Usage                              |
|---------------|------------------------------------------------------------|
|      -        |  Select everything but                                     |
|      :        |  Select range                                              |
|  contains()   |  Select columns whose name contains a character string     |
|  ends_with()  |  Select columns whose name ends with a string              |
|  everything() |  Select every column                                       |
|  matches()    |  Select columns whose name matches a regular expression    |
|  num_range()  |  Select columns named x1, x2, x3, x4, x5                   |
|  one_of()     |  Select columns whose names are in a group of names        |
| starts_with() |  Select columns whose name starts with a character string  |

To illustrate we will use the flights data. Let’s select year, month and day columns using:

```console
## Select columns: year, month and day

select(flights, year, month, day)
### # A tibble: 336,776 x 3
###     year month   day
###    <int> <int> <int>
###  1  2013     1     1
###  2  2013     1     1
###  3  2013     1     1
###  4  2013     1     1
###  5  2013     1     1
###  6  2013     1     1
###  7  2013     1     1
###  8  2013     1     1
###  9  2013     1     1
### 10  2013     1     1
### # ... with 336,766 more rows
```

Like tidyr, dplyr can also work with the %>% operator. Therefore, we can use the following code to do the same selection:

```R
## Select columns by name using the pipe operator

flights %>%  select(year, month, day)
```

Here are other examples of using select():

```console
## Select all columns between year and day (inclusive)

flights %>% select(year:day)
### # A tibble: 336,776 x 3
###     year month   day
###    <int> <int> <int>
###  1  2013     1     1
###  2  2013     1     1
###  3  2013     1     1
###  4  2013     1     1
###  5  2013     1     1
###  6  2013     1     1
###  7  2013     1     1
###  8  2013     1     1
###  9  2013     1     1
### 10  2013     1     1
### # ... with 336,766 more rows
```

```console
## Select all columns except those from year to day (inclusive)

flights %>% select( -(year:day) )
### # A tibble: 336,776 x 16
###    dep_time sched_dep_time dep_delay arr_time sched_arr_time arr_delay carrier
###       <int>          <int>     <dbl>    <int>          <int>     <dbl> <chr>  
###  1      517            515         2      830            819        11 UA     
###  2      533            529         4      850            830        20 UA     
###  3      542            540         2      923            850        33 AA     
###  4      544            545        -1     1004           1022       -18 B6     
###  5      554            600        -6      812            837       -25 DL     
###  6      554            558        -4      740            728        12 UA     
###  7      555            600        -5      913            854        19 B6     
###  8      557            600        -3      709            723       -14 EV     
###  9      557            600        -3      838            846        -8 B6     
### 10      558            600        -2      753            745         8 AA     
### # ... with 336,766 more rows, and 9 more variables: flight <int>,
### #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
### #   hour <dbl>, minute <dbl>, time_hour <dttm>
```

For more information on available functions in select, type ?select.

#### filter() function
The filter() function allows us to identify or select observations in which a particular variable matches a specific value/condition. The condition in the filter() function can be any kind of logical comparison and Boolean operators, such as:

|  Symbol  |         Usage                |
|----------|------------------------------|
|  <       |  Less than                   |
|  >       |  Greater than                |
|  ==      |  Equal to                    |
|  <=      |  Less than or equal to       |
|  >=      |  Greater than or equal to    |
|  !=      |  Not equal to                |
|  %in%    |  Group membership            |
|  is.na   |  Is NA                       |
|  !is.na  |  Is not NA                   |
|  &       |  Boolean and                 |
|  |       |  Boolean or                  |
|  xor     |  exactly or                  |
|  !       |  not                         |
|  any     |  any true                    |
|  all     |  all true                    |

For example, we can select all flights on January 1st using the following:

```console
## Filter the flights on January 1st

flights %>%  filter( month == 1, day == 1)
### # A tibble: 842 x 19
###     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
###    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
###  1  2013     1     1      517            515         2      830            819
###  2  2013     1     1      533            529         4      850            830
###  3  2013     1     1      542            540         2      923            850
###  4  2013     1     1      544            545        -1     1004           1022
###  5  2013     1     1      554            600        -6      812            837
###  6  2013     1     1      554            558        -4      740            728
###  7  2013     1     1      555            600        -5      913            854
###  8  2013     1     1      557            600        -3      709            723
###  9  2013     1     1      557            600        -3      838            846
### 10  2013     1     1      558            600        -2      753            745
### # ... with 832 more rows, and 11 more variables: arr_delay <dbl>,
### #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
### #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>
```

When you run that line of code, dplyr executes the filtering operation and returns a new data frame. dplyr functions never modify their inputs, so if you want to save the result, you’ll need to use the assignment operator, <-:

```R
## Filter the flights on January 1st and save this result 

jan1 <- flights %>%  filter( month == 1, day == 1)
```

The following code finds all flights that departed in November or December:

```R
## Filter the flights departing in November or December

x <- flights %>%  filter( month == 11 | month == 12)
```

If we want to find flights that aren’t delayed (on arrival or departure) by more than two hours, we can use either of the following two filters:

```console
## Filter the flights that aren't delayed (on arrival or departure) by more than two hours

flights %>% filter( arr_delay <= 120, dep_delay <= 120 )
### # A tibble: 316,050 x 19
###     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
###    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
###  1  2013     1     1      517            515         2      830            819
###  2  2013     1     1      533            529         4      850            830
###  3  2013     1     1      542            540         2      923            850
###  4  2013     1     1      544            545        -1     1004           1022
###  5  2013     1     1      554            600        -6      812            837
###  6  2013     1     1      554            558        -4      740            728
###  7  2013     1     1      555            600        -5      913            854
###  8  2013     1     1      557            600        -3      709            723
###  9  2013     1     1      557            600        -3      838            846
### 10  2013     1     1      558            600        -2      753            745
### # ... with 316,040 more rows, and 11 more variables: arr_delay <dbl>,
### #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
### #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>
```

```R
## gives the same result as above

flights %>% filter( ! (arr_delay > 120 | dep_delay > 120) )
```

For more information on available functions in filter, type ?filter.

#### arrange() function
The arrange() function allows us to order data by variables in ascending or descending order.
Let’s order the flights data in an ascending order using year, month and day.

```console
## Order the data set according to three variables

flights %>% arrange( year, month, day )
### # A tibble: 336,776 x 19
###     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
###    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
###  1  2013     1     1      517            515         2      830            819
###  2  2013     1     1      533            529         4      850            830
###  3  2013     1     1      542            540         2      923            850
###  4  2013     1     1      544            545        -1     1004           1022
###  5  2013     1     1      554            600        -6      812            837
###  6  2013     1     1      554            558        -4      740            728
###  7  2013     1     1      555            600        -5      913            854
###  8  2013     1     1      557            600        -3      709            723
###  9  2013     1     1      557            600        -3      838            846
### 10  2013     1     1      558            600        -2      753            745
### # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
### #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
### #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>
```

We can also apply a descending argument to rank-order from highest to lowest. The following shows the same data but in descending order by applying desc() within the arrange() function.

```console
## Order the data set according to departure time in a descending order

flights %>% arrange( desc(dep_time) )
### # A tibble: 336,776 x 19
###     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
###    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
###  1  2013    10    30     2400           2359         1      327            337
###  2  2013    11    27     2400           2359         1      515            445
###  3  2013    12     5     2400           2359         1      427            440
###  4  2013    12     9     2400           2359         1      432            440
###  5  2013    12     9     2400           2250        70       59           2356
###  6  2013    12    13     2400           2359         1      432            440
###  7  2013    12    19     2400           2359         1      434            440
###  8  2013    12    29     2400           1700       420      302           2025
###  9  2013     2     7     2400           2359         1      432            436
### 10  2013     2     7     2400           2359         1      443            444
### # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
### #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
### #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>
```

Note that the missing values will always be sorted at the end.

#### mutate() function
The mutate() function allows us to add new variables while preserving the existing variables. Here is the list of some useful functions used inside the mutate().

|                       Functions                             |                   Usage                 |
|-------------------------------------------------------------|-----------------------------------------|
|  pmin(), pmax()                                             |  Element wise min and max               |
|  cummin(), cummax()                                         |  Cumulative min and max                 |
|  cumsum(), cumprod()                                        |	Cumulative sum and product              |
|  between()                                                  |	Are values between a and b?             |
|  cume_dist()                                                |	Cumulative distribution of values       |
|  cumall(), cumany()                                         | Cumulative all and any                  |
|  cummean()                                                  | Cumulative mean                         |
|  lead(), lag()                                              | Copy with values one position           |
|  ntile()                                                    | Bin vector into n buckets               |
|  dense_rank(), min_rank(), percent_rank(), row_number()     | Various ranking methods                 |

```console
## Select specific variables from the data and store them in a new data frame

flights_sub<- flights %>% select(arr_delay, dep_delay, air_time)


## Create new variables "gain", "hours", and "gain_per_hour"

mutate(flights_sub, gain = arr_delay - dep_delay, hours = air_time / 60, gain_per_hour = gain / hours)
### # A tibble: 336,776 x 6
###    arr_delay dep_delay air_time  gain hours gain_per_hour
###        <dbl>     <dbl>    <dbl> <dbl> <dbl>         <dbl>
###  1        11         2      227     9 3.78           2.38
###  2        20         4      227    16 3.78           4.23
###  3        33         2      160    31 2.67          11.6 
###  4       -18        -1      183   -17 3.05          -5.57
###  5       -25        -6      116   -19 1.93          -9.83
###  6        12        -4      150    16 2.5            6.4 
###  7        19        -5      158    24 2.63           9.11
###  8       -14        -3       53   -11 0.883        -12.5 
###  9        -8        -3      140    -5 2.33          -2.14
### 10         8        -2      138    10 2.3            4.35
### # ... with 336,766 more rows
```

Note that the new variables will appear at the end of the flights data frame.
An alternative to mutate() is transmute() which creates a new variable and then drops the other variables. Essentially, it allows you to create a new data frame with only the new variables created.

```console
transmute(flights, gain = arr_delay - dep_delay, hours = air_time / 60, gain_per_hour = gain / hours)
### # A tibble: 336,776 x 3
###     gain hours gain_per_hour
###    <dbl> <dbl>         <dbl>
###  1     9 3.78           2.38
###  2    16 3.78           4.23
###  3    31 2.67          11.6 
###  4   -17 3.05          -5.57
###  5   -19 1.93          -9.83
###  6    16 2.5            6.4 
###  7    24 2.63           9.11
###  8   -11 0.883        -12.5 
###  9    -5 2.33          -2.14
### 10    10 2.3            4.35
### # ... with 336,766 more rows
```

#### summarise() (or summarize() ) function
The summarise() (a.k.a. summarize() ) function allows us to perform the majority of summary statistics when performing exploratory data analysis. Here is the list of some useful functions that can be used inside summary().

|  Functions   |                          Usage                         |
|--------------|--------------------------------------------------------|
| min(), max() |  Minimum and maximum values                            |
| mean()       |  Mean value                                            |
| median()     |  Median value                                          |
| sum()        |  Sum of values                                         |
| var(), sd()  |  Variance and standard deviation of a vector           |
| first()      |  First value in a vector                               |
| last()       |  Last value in a vector                                |
| nth()        |  Nth value in a vector                                 |
| n()          |  The number of values in a vector                      |
| n_distinct() |  The number of distinct values in a vector             |

All functions in this list takes a vector of values and returns a single summary value. We can get the average delay using:

```console
## Take the average of departure delay

summarise(flights, delay = mean(dep_delay, na.rm = TRUE))
### # A tibble: 1 x 1
###   delay
###   <dbl>
### 1  12.6
```

The na.rm = TRUE argument in mean() function will allow us to ignore the missing values while computing the average. We will revisit na.rm = TRUE argument in the next section (in Module 5).

#### group_by() + summarise() function

If we want to take the summary statistics grouped by a variable, then we need to use another function called group_by(). group_by() along with summarise() functions will allow us to take and compare summary statistics grouped by a factor variable.

For example, if we applied the same code to a data frame grouped by destination, we can get the average delay for each destination.

```console
## Group by destination and use summarise to calculate the mean delay

flights %>% group_by(dest) %>% summarise(mean_delay = mean(dep_delay, na.rm = TRUE))
### `summarise()` ungrouping output (override with `.groups` argument)
### # A tibble: 105 x 2
###    dest  mean_delay
###    <chr>      <dbl>
###  1 ABQ        13.7 
###  2 ACK         6.46
###  3 ALB        23.6 
###  4 ANC        12.9 
###  5 ATL        12.5 
###  6 AUS        13.0 
###  7 AVL         8.19
###  8 BDL        17.7 
###  9 BGR        19.5 
### 10 BHM        29.7 
### # ... with 95 more rows
```

#### Joining data sets

Often, we have separate data frames that can have common and differing variables for similar observations. These types of data sets are referred as relational data sets.

We will revisit the nycflights13 package. The nycflights13 package contains the following data sets:

+ airlines includes the names of airline companies and their abbreviated code:

```console
airlines
### # A tibble: 16 x 2
###    carrier name                       
###    <chr>   <chr>                      
###  1 9E      Endeavor Air Inc.          
###  2 AA      American Airlines Inc.     
###  3 AS      Alaska Airlines Inc.       
###  4 B6      JetBlue Airways            
###  5 DL      Delta Air Lines Inc.       
###  6 EV      ExpressJet Airlines Inc.   
###  7 F9      Frontier Airlines Inc.     
###  8 FL      AirTran Airways Corporation
###  9 HA      Hawaiian Airlines Inc.     
### 10 MQ      Envoy Air                  
### 11 OO      SkyWest Airlines Inc.      
### 12 UA      United Air Lines Inc.      
### 13 US      US Airways Inc.            
### 14 VX      Virgin America             
### 15 WN      Southwest Airlines Co.     
### 16 YV      Mesa Airlines Inc.
```

+ airports gives information about each airport, identified by the airport code (faa):

```console
airports
### # A tibble: 1,458 x 8
###    faa   name                       lat    lon   alt    tz dst   tzone          
###    <chr> <chr>                    <dbl>  <dbl> <dbl> <dbl> <chr> <chr>          
###  1 04G   Lansdowne Airport         41.1  -80.6  1044    -5 A     America/New_Yo~
###  2 06A   Moton Field Municipal A~  32.5  -85.7   264    -6 A     America/Chicago
###  3 06C   Schaumburg Regional       42.0  -88.1   801    -6 A     America/Chicago
###  4 06N   Randall Airport           41.4  -74.4   523    -5 A     America/New_Yo~
###  5 09J   Jekyll Island Airport     31.1  -81.4    11    -5 A     America/New_Yo~
###  6 0A9   Elizabethton Municipal ~  36.4  -82.2  1593    -5 A     America/New_Yo~
###  7 0G6   Williams County Airport   41.5  -84.5   730    -5 A     America/New_Yo~
###  8 0G7   Finger Lakes Regional A~  42.9  -76.8   492    -5 A     America/New_Yo~
###  9 0P2   Shoestring Aviation Air~  39.8  -76.6  1000    -5 U     America/New_Yo~
### 10 0S9   Jefferson County Intl     48.1 -123.    108    -8 A     America/Los_An~
### # ... with 1,448 more rows
```

+ planes gives information about each plane, identified by its tail number (tailnum):

```console
planes
### # A tibble: 3,322 x 9
###    tailnum  year type          manufacturer   model  engines seats speed engine 
###    <chr>   <int> <chr>         <chr>          <chr>    <int> <int> <int> <chr>  
###  1 N10156   2004 Fixed wing m~ EMBRAER        EMB-1~       2    55    NA Turbo-~
###  2 N102UW   1998 Fixed wing m~ AIRBUS INDUST~ A320-~       2   182    NA Turbo-~
###  3 N103US   1999 Fixed wing m~ AIRBUS INDUST~ A320-~       2   182    NA Turbo-~
###  4 N104UW   1999 Fixed wing m~ AIRBUS INDUST~ A320-~       2   182    NA Turbo-~
###  5 N10575   2002 Fixed wing m~ EMBRAER        EMB-1~       2    55    NA Turbo-~
###  6 N105UW   1999 Fixed wing m~ AIRBUS INDUST~ A320-~       2   182    NA Turbo-~
###  7 N107US   1999 Fixed wing m~ AIRBUS INDUST~ A320-~       2   182    NA Turbo-~
###  8 N108UW   1999 Fixed wing m~ AIRBUS INDUST~ A320-~       2   182    NA Turbo-~
###  9 N109UW   1999 Fixed wing m~ AIRBUS INDUST~ A320-~       2   182    NA Turbo-~
### 10 N110UW   1999 Fixed wing m~ AIRBUS INDUST~ A320-~       2   182    NA Turbo-~
### # ... with 3,312 more rows
```

+ weather gives the weather conditions at each NYC airport for each hour:

```console
weather
### # A tibble: 26,115 x 15
###    origin  year month   day  hour  temp  dewp humid wind_dir wind_speed
###    <chr>  <int> <int> <int> <int> <dbl> <dbl> <dbl>    <dbl>      <dbl>
###  1 EWR     2013     1     1     1  39.0  26.1  59.4      270      10.4 
###  2 EWR     2013     1     1     2  39.0  27.0  61.6      250       8.06
###  3 EWR     2013     1     1     3  39.0  28.0  64.4      240      11.5 
###  4 EWR     2013     1     1     4  39.9  28.0  62.2      250      12.7 
###  5 EWR     2013     1     1     5  39.0  28.0  64.4      260      12.7 
###  6 EWR     2013     1     1     6  37.9  28.0  67.2      240      11.5 
###  7 EWR     2013     1     1     7  39.0  28.0  64.4      240      15.0 
###  8 EWR     2013     1     1     8  39.9  28.0  62.2      250      10.4 
###  9 EWR     2013     1     1     9  39.9  28.0  62.2      260      15.0 
### 10 EWR     2013     1     1    10  41    28.0  59.6      260      13.8 
### # ... with 26,105 more rows, and 5 more variables: wind_gust <dbl>,
### #   precip <dbl>, pressure <dbl>, visib <dbl>, time_hour <dttm>
```

Therefore, for nycflights13:

+ flights connects to planes via a single variable, tailnum.
+ flights connects to airlines through the carrier variable.
+ flights connects to airports in two ways: via the origin and dest variables.
+ flights connects to weather via origin (the location), and year, month, day, and hour (the time).

The following illustration (adapted from Wickham and Grolemund (2016)) shows the relationship between flights, airlines, airports and weather data sets, and the key variables connecting them.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617043188/MATH2349/Model4/joiningDatasets_bp5why.png)

Fig4. Chain of relations between the data sets in nycflights13 (taken from Wickham and Grolemund (2016))

The dplyr package offers three sets of joining functions to provide alternative ways to join data frames. These are:

+ Mutating joins: This group of functions add new variables to one data frame from matching observations in another.
+ Filtering joins: This group of functions filter observations from one data frame based on whether or not they match an observation in the other table.
+ Set operations: This group of functions treat observations as if they were set elements.

##### Mutating joins

The first set of functions to combine data sets is called “mutating joins”. left_join(), right_join(), inner_join(), and full_join() functions are in this group. The mutating join functions allow you to combine variables from two tables and add variables to the right (like mutate).

Note that, mutating join functions add variables to the right. Therefore, if you have a lot of variables already in the data, the new variables won’t get printed out. As flights data set has many variables, I will first create a narrower data set named flights2 to easily show you what’s going on in the examples.

```console
## Create a new data set named flights2 including year - day, hour, origin, destination, tailnum and carrier variables

flights2 <- flights %>% select(year:day, hour, origin, dest, tailnum, carrier)

flights2
### # A tibble: 336,776 x 8
###     year month   day  hour origin dest  tailnum carrier
###    <int> <int> <int> <dbl> <chr>  <chr> <chr>   <chr>  
###  1  2013     1     1     5 EWR    IAH   N14228  UA     
###  2  2013     1     1     5 LGA    IAH   N24211  UA     
###  3  2013     1     1     5 JFK    MIA   N619AA  AA     
###  4  2013     1     1     5 JFK    BQN   N804JB  B6     
###  5  2013     1     1     6 LGA    ATL   N668DN  DL     
###  6  2013     1     1     5 EWR    ORD   N39463  UA     
###  7  2013     1     1     6 EWR    FLL   N516JB  B6     
###  8  2013     1     1     6 LGA    IAD   N829AS  EV     
###  9  2013     1     1     6 JFK    MCO   N593JB  B6     
### 10  2013     1     1     6 LGA    ORD   N3ALAA  AA     
### # ... with 336,766 more rows
```

Imagine you want to add the full airline name (from airlines) to the flights2 data. You can combine the airlines and flights2 data frames using left_join(). Remember that we will need a key variable and the key variable will be the carrier variable to join these two data sets.

```console
## joining flights2 and airlines using the carrier name.

flights2 %>% left_join(airlines, by = "carrier")
### # A tibble: 336,776 x 9
###     year month   day  hour origin dest  tailnum carrier name                    
###    <int> <int> <int> <dbl> <chr>  <chr> <chr>   <chr>   <chr>                   
###  1  2013     1     1     5 EWR    IAH   N14228  UA      United Air Lines Inc.   
###  2  2013     1     1     5 LGA    IAH   N24211  UA      United Air Lines Inc.   
###  3  2013     1     1     5 JFK    MIA   N619AA  AA      American Airlines Inc.  
###  4  2013     1     1     5 JFK    BQN   N804JB  B6      JetBlue Airways         
###  5  2013     1     1     6 LGA    ATL   N668DN  DL      Delta Air Lines Inc.    
###  6  2013     1     1     5 EWR    ORD   N39463  UA      United Air Lines Inc.   
###  7  2013     1     1     6 EWR    FLL   N516JB  B6      JetBlue Airways         
###  8  2013     1     1     6 LGA    IAD   N829AS  EV      ExpressJet Airlines Inc.
###  9  2013     1     1     6 JFK    MCO   N593JB  B6      JetBlue Airways         
### 10  2013     1     1     6 LGA    ORD   N3ALAA  AA      American Airlines Inc.  
### # ... with 336,766 more rows
```

##### Controlling how the data sets are matched
Each mutating join takes an argument by that controls which variables are used to match observations in the two data sets. There are a few ways to specify it:
+ NULL: The default value. dplyr will will use all variables that appear in both tables, a natural join. For example, the flights and weather data sets match on their common variables: year, month, day, hour and origin.

```console
## joining flights2 and weather using the default key = NULL.

flights2 %>% left_join(weather)
### Joining, by = c("year", "month", "day", "hour", "origin")
### # A tibble: 336,776 x 18
###     year month   day  hour origin dest  tailnum carrier  temp  dewp humid
###    <int> <int> <int> <dbl> <chr>  <chr> <chr>   <chr>   <dbl> <dbl> <dbl>
###  1  2013     1     1     5 EWR    IAH   N14228  UA       39.0  28.0  64.4
###  2  2013     1     1     5 LGA    IAH   N24211  UA       39.9  25.0  54.8
###  3  2013     1     1     5 JFK    MIA   N619AA  AA       39.0  27.0  61.6
###  4  2013     1     1     5 JFK    BQN   N804JB  B6       39.0  27.0  61.6
###  5  2013     1     1     6 LGA    ATL   N668DN  DL       39.9  25.0  54.8
###  6  2013     1     1     5 EWR    ORD   N39463  UA       39.0  28.0  64.4
###  7  2013     1     1     6 EWR    FLL   N516JB  B6       37.9  28.0  67.2
###  8  2013     1     1     6 LGA    IAD   N829AS  EV       39.9  25.0  54.8
###  9  2013     1     1     6 JFK    MCO   N593JB  B6       37.9  27.0  64.3
### 10  2013     1     1     6 LGA    ORD   N3ALAA  AA       39.9  25.0  54.8
### # ... with 336,766 more rows, and 7 more variables: wind_dir <dbl>,
### #   wind_speed <dbl>, wind_gust <dbl>, precip <dbl>, pressure <dbl>,
### #   visib <dbl>, time_hour <dttm>
```

+ A character vector, by = "x". For example, flights and planes have tailnum in common.

```console
## joining flights2 and planes using the tailnum.

flights2 %>% left_join(planes, by = "tailnum")
### # A tibble: 336,776 x 16
###    year.x month   day  hour origin dest  tailnum carrier year.y type 
###     <int> <int> <int> <dbl> <chr>  <chr> <chr>   <chr>    <int> <chr>
###  1   2013     1     1     5 EWR    IAH   N14228  UA        1999 Fixe~
###  2   2013     1     1     5 LGA    IAH   N24211  UA        1998 Fixe~
###  3   2013     1     1     5 JFK    MIA   N619AA  AA        1990 Fixe~
###  4   2013     1     1     5 JFK    BQN   N804JB  B6        2012 Fixe~
###  5   2013     1     1     6 LGA    ATL   N668DN  DL        1991 Fixe~
###  6   2013     1     1     5 EWR    ORD   N39463  UA        2012 Fixe~
###  7   2013     1     1     6 EWR    FLL   N516JB  B6        2000 Fixe~
###  8   2013     1     1     6 LGA    IAD   N829AS  EV        1998 Fixe~
###  9   2013     1     1     6 JFK    MCO   N593JB  B6        2004 Fixe~
### 10   2013     1     1     6 LGA    ORD   N3ALAA  AA          NA <NA> 
### # ... with 336,766 more rows, and 6 more variables: manufacturer <chr>,
### #   model <chr>, engines <int>, seats <int>, speed <int>, engine <chr>
```

+ A named character vector: by = c("a" = "b"). This will match variable a in table x to variable b in table y. This is useful when the key variables in both data sets are not given the same name. For example, flights data set has the destination airport code (dest) and the airports data set has the faa code. Essentially these two are equivalent. Therefore, we can use the following to join these two data sets:

```console
flights2 %>% left_join(airports, c("dest" = "faa"))
### # A tibble: 336,776 x 15
###     year month   day  hour origin dest  tailnum carrier name    lat   lon   alt
###    <int> <int> <int> <dbl> <chr>  <chr> <chr>   <chr>   <chr> <dbl> <dbl> <dbl>
###  1  2013     1     1     5 EWR    IAH   N14228  UA      Geor~  30.0 -95.3    97
###  2  2013     1     1     5 LGA    IAH   N24211  UA      Geor~  30.0 -95.3    97
###  3  2013     1     1     5 JFK    MIA   N619AA  AA      Miam~  25.8 -80.3     8
###  4  2013     1     1     5 JFK    BQN   N804JB  B6      <NA>   NA    NA      NA
###  5  2013     1     1     6 LGA    ATL   N668DN  DL      Hart~  33.6 -84.4  1026
###  6  2013     1     1     5 EWR    ORD   N39463  UA      Chic~  42.0 -87.9   668
###  7  2013     1     1     6 EWR    FLL   N516JB  B6      Fort~  26.1 -80.2     9
###  8  2013     1     1     6 LGA    IAD   N829AS  EV      Wash~  38.9 -77.5   313
###  9  2013     1     1     6 JFK    MCO   N593JB  B6      Orla~  28.4 -81.3    96
### 10  2013     1     1     6 LGA    ORD   N3ALAA  AA      Chic~  42.0 -87.9   668
### # ... with 336,766 more rows, and 3 more variables: tz <dbl>, dst <chr>,
### #   tzone <chr>
```

To help you learn how different types of xxx_join() functions work, I’m going to use Hadley Wickham’s visual representation (Wickham and Grolemund (2016)):

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617043954/MATH2349/Model4/mutatingJoining_tpsksf.png)

##### Filtering Joins
Filtering joins match observations in the same way as mutating joins, but affect the observations, not the variables. There are two types of filtering joins: semi_join() and anti_join().

+ semi_join(x, y): keeps all observations in x that have a match in y.
+ anti_join(x, y): drops all observations in x that have a match in y.

Anti-joins are useful for diagnosing join mismatches. For example, when connecting flights and planes, you might be interested to know that there are many flights that don’t have a match in planes:

```console
flights %>% anti_join(planes, by = "tailnum") %>% count(tailnum, sort = TRUE)
### # A tibble: 722 x 2
###    tailnum     n
###    <chr>   <int>
###  1 <NA>     2512
###  2 N725MQ    575
###  3 N722MQ    513
###  4 N723MQ    507
###  5 N713MQ    483
###  6 N735MQ    396
###  7 N0EGMQ    371
###  8 N534MQ    364
###  9 N542MQ    363
### 10 N531MQ    349
### # ... with 712 more rows
```

Here is a visual representation of these two filtering joins.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617044759/MATH2349/Model4/filteringJoins_cn9efc.png)

##### When to use mutating or filtering joins
Suppose you have flights2 (X) and weather (Y) data sets. Recall, these data sets match on their common variables: year, month, day, hour and origin.

If you want to add/combine columns to/from data set X from/to data set Y, you need to use mutating joins.

**LEFT_JOIN**: Let’s say, you want to see the weather of flights departing at 6 in the morning. You will need to use left_join() to ADD the weather columns to the flights2 data set.

```console
flights2_h6 <- flights2 %>% filter(hour == 6)

## joining flights2 and weather using the default key = NULL.
flights2_h6 %>% left_join(weather)
### Joining, by = c("year", "month", "day", "hour", "origin")
### # A tibble: 25,951 x 18
###     year month   day  hour origin dest  tailnum carrier  temp  dewp humid
###    <int> <int> <int> <dbl> <chr>  <chr> <chr>   <chr>   <dbl> <dbl> <dbl>
###  1  2013     1     1     6 LGA    ATL   N668DN  DL       39.9  25.0  54.8
###  2  2013     1     1     6 EWR    FLL   N516JB  B6       37.9  28.0  67.2
###  3  2013     1     1     6 LGA    IAD   N829AS  EV       39.9  25.0  54.8
###  4  2013     1     1     6 JFK    MCO   N593JB  B6       37.9  27.0  64.3
###  5  2013     1     1     6 LGA    ORD   N3ALAA  AA       39.9  25.0  54.8
###  6  2013     1     1     6 JFK    PBI   N793JB  B6       37.9  27.0  64.3
###  7  2013     1     1     6 JFK    TPA   N657JB  B6       37.9  27.0  64.3
###  8  2013     1     1     6 JFK    LAX   N29129  UA       37.9  27.0  64.3
###  9  2013     1     1     6 EWR    SFO   N53441  UA       37.9  28.0  67.2
### 10  2013     1     1     6 LGA    DFW   N3DUAA  AA       39.9  25.0  54.8
### # ... with 25,941 more rows, and 7 more variables: wind_dir <dbl>,
### #   wind_speed <dbl>, wind_gust <dbl>, precip <dbl>, pressure <dbl>,
### #   visib <dbl>, time_hour <dttm>
```

**RIGHT_JOIN**: Let’s say, you want to see the flights that has weather visibility of 5. You will need to use right_join() to ADD the flights2 columns to the weather data set.

```console
weather_v5 <- weather %>% filter(visib == 5)

flights2 %>% right_join(weather_v5) %>% select(visib, everything())
### Joining, by = c("year", "month", "day", "hour", "origin")
### # A tibble: 4,916 x 18
###    visib  year month   day  hour origin dest  tailnum carrier  temp  dewp humid
###    <dbl> <int> <int> <int> <dbl> <chr>  <chr> <chr>   <chr>   <dbl> <dbl> <dbl>
###  1     5  2013     1     9     7 LGA    BOS   N947UW  US       37.0  33.1  85.4
###  2     5  2013     1     9     7 LGA    DCA   N712US  US       37.0  33.1  85.4
###  3     5  2013     1     9     7 LGA    MIA   N953DL  DL       37.0  33.1  85.4
###  4     5  2013     1     9     7 LGA    ORD   N466AA  AA       37.0  33.1  85.4
###  5     5  2013     1     9     7 LGA    MIA   N3CDAA  AA       37.0  33.1  85.4
###  6     5  2013     1     9     7 LGA    XNA   N730MQ  MQ       37.0  33.1  85.4
###  7     5  2013     1     9     7 LGA    ORD   N438UA  UA       37.0  33.1  85.4
###  8     5  2013     1     9     7 LGA    MCO   N506JB  B6       37.0  33.1  85.4
###  9     5  2013     1     9     7 LGA    MKE   N979AT  FL       37.0  33.1  85.4
### 10     5  2013     1     9     7 LGA    RSW   N593JB  B6       37.0  33.1  85.4
### # ... with 4,906 more rows, and 6 more variables: wind_dir <dbl>,
### #   wind_speed <dbl>, wind_gust <dbl>, precip <dbl>, pressure <dbl>,
### #   time_hour <dttm>
```

**INNER_JOIN**: Let’s say, you want to see the flights that departs at 6 in the morning and has weather visibility of 5. You will need to use inner_join() to COMBINE the flights2_h6 and weather_v5 columns into a single data set with hour = 6 and visib = 5.

```console
flights2_h6 %>% inner_join(weather_v5) %>% select(hour, visib, everything())
### Joining, by = c("year", "month", "day", "hour", "origin")
### # A tibble: 497 x 18
###     hour visib  year month   day origin dest  tailnum carrier  temp  dewp humid
###    <dbl> <dbl> <int> <int> <int> <chr>  <chr> <chr>   <chr>   <dbl> <dbl> <dbl>
###  1     6     5  2013     1    29 JFK    FLL   N588JB  B6       37.0  35.1  92.5
###  2     6     5  2013     1    29 JFK    IAD   N830AS  EV       37.0  35.1  92.5
###  3     6     5  2013     1    29 JFK    RSW   N516JB  B6       37.0  35.1  92.5
###  4     6     5  2013     1    29 JFK    PHL   N949UW  US       37.0  35.1  92.5
###  5     6     5  2013     1    29 JFK    LAX   N67134  UA       37.0  35.1  92.5
###  6     6     5  2013     1    29 JFK    SFO   N532UA  UA       37.0  35.1  92.5
###  7     6     5  2013     1    29 JFK    PBI   N768JB  B6       37.0  35.1  92.5
###  8     6     5  2013     1    29 JFK    SJU   N793JB  B6       37.0  35.1  92.5
###  9     6     5  2013     1    29 JFK    ATL   N197PQ  9E       37.0  35.1  92.5
### 10     6     5  2013     1    29 JFK    BOS   N775JB  B6       37.0  35.1  92.5
### # ... with 487 more rows, and 6 more variables: wind_dir <dbl>,
### #   wind_speed <dbl>, wind_gust <dbl>, precip <dbl>, pressure <dbl>,
### #   time_hour <dttm>
```

**FULL_JOIN**: Let’s say, you want to see the flights that departs at 6 in the morning or has weather visibility of 5. You will need to use full_join() to COMBINE the flights2_h6 and weather_v5 columns into a single data set with hour = 6 OR visib = 5.

```console
flights2_h6 %>% full_join(weather_v5) %>% select(hour, visib, everything())
### Joining, by = c("year", "month", "day", "hour", "origin")
### # A tibble: 26,315 x 18
###     hour visib  year month   day origin dest  tailnum carrier  temp  dewp humid
###    <dbl> <dbl> <int> <int> <int> <chr>  <chr> <chr>   <chr>   <dbl> <dbl> <dbl>
###  1     6    NA  2013     1     1 LGA    ATL   N668DN  DL         NA    NA    NA
###  2     6    NA  2013     1     1 EWR    FLL   N516JB  B6         NA    NA    NA
###  3     6    NA  2013     1     1 LGA    IAD   N829AS  EV         NA    NA    NA
###  4     6    NA  2013     1     1 JFK    MCO   N593JB  B6         NA    NA    NA
###  5     6    NA  2013     1     1 LGA    ORD   N3ALAA  AA         NA    NA    NA
###  6     6    NA  2013     1     1 JFK    PBI   N793JB  B6         NA    NA    NA
###  7     6    NA  2013     1     1 JFK    TPA   N657JB  B6         NA    NA    NA
###  8     6    NA  2013     1     1 JFK    LAX   N29129  UA         NA    NA    NA
###  9     6    NA  2013     1     1 EWR    SFO   N53441  UA         NA    NA    NA
### 10     6    NA  2013     1     1 LGA    DFW   N3DUAA  AA         NA    NA    NA
### # ... with 26,305 more rows, and 6 more variables: wind_dir <dbl>,
### #   wind_speed <dbl>, wind_gust <dbl>, precip <dbl>, pressure <dbl>,
### #   time_hour <dttm>
```

Meanwhile, if you want to filter records in data set X using data set Y retaining only columns of data set X, you need to use filtering joins.

**SEMI_JOIN**: Let’s say, you want to see flights with weather visibility of 5. You will need to use semi_join() to FILTER the flights2 data set using the weather_v5 data set.

```console
flights2 %>% semi_join(weather_v5)
### Joining, by = c("year", "month", "day", "hour", "origin")
### # A tibble: 4,809 x 8
###     year month   day  hour origin dest  tailnum carrier
###    <int> <int> <int> <dbl> <chr>  <chr> <chr>   <chr>  
###  1  2013     1     9     7 LGA    BOS   N947UW  US     
###  2  2013     1     9     7 LGA    DCA   N712US  US     
###  3  2013     1     9     7 LGA    MIA   N953DL  DL     
###  4  2013     1     9     7 LGA    ORD   N466AA  AA     
###  5  2013     1     9     7 LGA    MIA   N3CDAA  AA     
###  6  2013     1     9     7 LGA    XNA   N730MQ  MQ     
###  7  2013     1     9     7 LGA    ORD   N438UA  UA     
###  8  2013     1     9     7 LGA    MCO   N506JB  B6     
###  9  2013     1     9     7 LGA    MKE   N979AT  FL     
### 10  2013     1     9     7 LGA    RSW   N593JB  B6     
### # ... with 4,799 more rows
```

**ANTI_JOIN**: Let’s say, you want to see flights with weather visibility not equal to 5. You will need to use anti_join() to FILTER the flights2 data set using the weather_v5 dataset.

```console
flights2 %>% anti_join(weather_v5)
### Joining, by = c("year", "month", "day", "hour", "origin")
### # A tibble: 331,967 x 8
###     year month   day  hour origin dest  tailnum carrier
###    <int> <int> <int> <dbl> <chr>  <chr> <chr>   <chr>  
###  1  2013     1     1     5 EWR    IAH   N14228  UA     
###  2  2013     1     1     5 LGA    IAH   N24211  UA     
###  3  2013     1     1     5 JFK    MIA   N619AA  AA     
###  4  2013     1     1     5 JFK    BQN   N804JB  B6     
###  5  2013     1     1     6 LGA    ATL   N668DN  DL     
###  6  2013     1     1     5 EWR    ORD   N39463  UA     
###  7  2013     1     1     6 EWR    FLL   N516JB  B6     
###  8  2013     1     1     6 LGA    IAD   N829AS  EV     
###  9  2013     1     1     6 JFK    MCO   N593JB  B6     
### 10  2013     1     1     6 LGA    ORD   N3ALAA  AA     
### # ... with 331,957 more rows
```

##### Set operations
Set operations expect the x and y inputs to have the same variables and treat the observations like sets. There are three types of set operations:

+ intersect(x, y): return only observations in both x and y.
+ union(x, y): return unique observations in x and y.
+ setdiff(x, y): return observations in x, but not in y.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617045672/MATH2349/Model4/SetOperations_ru8lnr.png)

##### Merging data sets
Often you may just need to merge data frames by row and column. The bind_rows() and bind_cols() bind the multiple data frames by row and column, respectively.

+ bind_rows(x, y): Append y to x as new rows.
+ bind_cols(x, y): Append y to x as new columns.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617045837/MATH2349/Model4/MergingDatasets_fnoqva.png)

### Additional Resources and Further Reading
You can refer to the tidyr package manual (H Wickham (2014)) and the Tidy Data paper for a detailed information on tidy data principles and tidyr package.

Our recommended textbooks (Boehmke (2016) and Wickham and Grolemund (2016)), R Studio’s Data wrangling with R and RStudio webinar, and dplyr reference manual (H Wickham (2014), Wickham et al. (2017)) are great resources to excel your knowledge in Data Manipulation with dplyr.

If you are interested in improving your coding style, I would recommend using the tidyverse style guide. Note that a good coding style is like correct punctuation, you can manage without it, but a good coding style makes things easier to read for you and for the others who are gonna use your codes!

### References
Boehmke, Bradley C. 2016. Data Wrangling with R. Springer.

Wickham, H. 2014. “Tidyr: Easily Tidy Data with Spread () and Gather () Functions. R Package.” Version 0.2. 0. Available at Http://CRAN. R-Project. Org/Package= Tidyr [Verified 7 June 2016].

Wickham, Hadley, and Garrett Grolemund. 2016. R for Data Science: Import, Tidy, Transform, Visualize, and Model Data. " O’Reilly Media, Inc.".

Wickham, Hadley, and others. 2014. “Tidy Data.” Journal of Statistical Software 59 (10): 1–23.

Wickham, H, R Francois, L Henry, and K Müller. 2017. “Dplyr: A Grammar of Data Manipulation. R Package Version 0.7. 0.” URL https://CRAN. R-project. org/package= dplyr.

## Module 5 - Scan: Missing Values
### Introduction
Dealing missing values is an unavoidable task in the data preprocessing. For almost every data set, we will encounter some missing values. So, it is important to know how R handles missing values and how they are represented. In this module first, you will learn how the missing values and special values are represented in R. Then, you will learn how to identify, recode and exclude missing values. Moreover, we will cover missing value imputation techniques briefly. Note that the missing value analysis and the missing value imputation are broader concepts that would be a stand-alone topic of another course. Interested readers may refer to the books and resources in the additional resources and the further reading section for further details.

The analysts may also need to check and correct the obvious errors and/or inconsistencies in a data set. In this module, I also briefly introduced the deductive and deducorrect packages (in fact deducorrect is a former version of deductive package), and useful functions to correct the obvious errors and inconsistencies in a given data set. However, this part of module left as an optional reading for students.

### learning objectives

The learning objectives of this module are as follows:
+ Learn how missing and special values are represented in the data set.
+ Identify missing values in the data set.
+ Learn how to recode missing values.
+ Learn the functions for removing missing values.
+ Learn commonly used approaches to impute/replace missing value(s).
+ (Optional) Check and correct obvious inconsistencies and errors in the data set.

### Missing Data
In R, a numeric missing value is represented by NA (NA stands for “not available”), while character missing values are represented by <NA>. In addition to NA and <NA>, some other values may represent missing values (i.e. 99, ., .., just space, or NULL) depending on the software (i.e., Excel, SPSS etc.) that you import in your data.

Let’s have a look at the pet1.csv data:

```R
library(readr)

pet1 <- read_csv("https://raw.githubusercontent.com/yanboyang713/RMIT-Data-Repository/main/pet1.csv")
```

```console
### 
### -- Column specification --------------------------------------------------------
### cols(
###   id = col_double(),
###   State = col_character(),
###   Region = col_character(),
###   Reference = col_double(),
###   Animal_Name = col_character(),
###   Colour_primary = col_character()
### )
```

```R
head(pet1)
```

```console
### # A tibble: 6 x 6
###       id State    Region   Reference Animal_Name Colour_primary 
###    <dbl> <chr>    <chr>        <dbl> <chr>       <chr>          
### 1 118269 Victoria Ballarat        NA Jack Wilson Brown          
### 2 106347 Victoria Ballarat        NA Eva         Black And White
### 3 156347 Victoria Wyndham         NA <NA>        TRI            
### 4  63947 Victoria Geelong         NA Archie      White/Brown    
### 5  79724 Victoria Ballarat        NA Susie       Brown          
### 6  43442 Victoria Geelong         NA Pearl       Tri Colour
```

Note that, as we read this data from a .csv file, missing values are represented as NA for the integer reference variable where else <NA> for the character Animal_Name variable.
However, let’s look at another example SPSS data file named population_NA.sav:



```R
library(foreign)

population_NA <- read.spss("https://raw.githubusercontent.com/yanboyang713/RMIT-Data-Repository/main/population_NA.sav", to.data.frame = TRUE)
```

```console
### re-encoding from UTF-8
```

```console
population_NA
###                                 Region X.2013 X.2014 X.2015  X.2016
### 1  ISL                                   3.21   3.25   3.28 3.32   
### 2  CAN                                   3.87   3.91   3.94 3.99   
### 3  RUS                                   7.83   7.85   7.87 ..     
### 4  COL                                  41.27  41.74     NA ..     
### 5  ZAF                                  43.53  44.22     NA ..     
### 6  LTU                                  47.42  46.96  46.63 46.11  
### 7  MEX                                  60.43  61.10  61.76 62.41  
### 8  IND                                 394.85     NA     NA ..     
### 9  NLD                                 497.64 499.59 501.68 504.01 
### 10 KOR                                 504.92 506.97 508.91 510.77
```

As you see in the data frame, there are two different representations for the missing values: one is NA, the other is .. . Therefore, we need to be careful about different representations of the missing values while importing the data from other software.

### Identifying Missing Data
To identify missing values we will use is.na() function which returns a logical vector with TRUE in the element locations that contain missing values represented by NA. is.na() will work on vectors, lists, matrices, and data frames.
Here are some examples of is.na() function:

```R
## create a vector with missing data

x <- c(1:4, NA, 6:7, NA)
x
```

```console
### [1]  1  2  3  4 NA  6  7 NA
```

```R
is.na(x)
```

```console
### [1] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE
```

```R
## create a data frame with missing data

df <- data.frame(col1 = c(1:3, NA),
                 col2 = c("this", NA,"is", "text"), 
                 col3 = c(TRUE, FALSE, TRUE, TRUE), 
                 col4 = c(2.5, 4.2, 3.2, NA))

## identify NAs in full data frame

is.na(df)
```

```console
###       col1  col2  col3  col4
### [1,] FALSE FALSE FALSE FALSE
### [2,] FALSE  TRUE FALSE FALSE
### [3,] FALSE FALSE FALSE FALSE
### [4,]  TRUE FALSE FALSE  TRUE
```

```R
## identify NAs in specific data frame column

is.na(df$col4)
```

```console
### [1] FALSE FALSE FALSE  TRUE
```

To identify the location or the number of NAs we can use the which() and sum() functions:

```R
## identify location of NAs in vector

which(is.na(x))
```

```console
### [1] 5 8
```

```R
## identify count of NAs in data frame

sum(is.na(df))
```

```console
### [1] 3
```

More convenient way to compute the total missing values in each column is to use colSums():

```R
colSums(is.na(df))
```

```console
### col1 col2 col3 col4 
###    1    1    0    1
```

### Recode Missing Data

We can use normal subsetting and assignment operations in order to recode missing values; or recode specific indicators that represent missing values.
For instance, we can recode missing values in vector x with the mean values in x. To do this, first we need to subset the vector to identify NAs and then assign these elements a value. Here is an example:

```console
## create vector with missing data

x <- c(1:4, NA, 6:7, NA)
x
```

```console
### [1]  1  2  3  4 NA  6  7 NA
```

```R
## recode missing values with the mean (also see "Missing Value Imputation Techniques" section)

x[is.na(x)] <- mean(x, na.rm = TRUE)

x
```

```console
### [1] 1.000000 2.000000 3.000000 4.000000 3.833333 6.000000 7.000000 3.833333
```

Similarly, if missing values are represented by another value (i.e. ..) we can simply subset the data for the elements that contain that value and then assign a desired value to those elements.
Remember that population_NA data frame has missing values represented by ".." in the X.2016 column. Now let’s change ".." values to NA’s.

```R
## population_NA data frame has missing values represented by ".." in the X.2016 column.

population_NA$X.2016
```

```console
###  [1] "3.32   " "3.99   " "..     " "..     " "..     " "46.11  " "62.41  "
###  [8] "..     " "504.01 " "510.77 "
```

```R
## Note the white spaces after ..'s and  change  "..     " values to NAs

population_NA[population_NA == "..     " ] <- NA

population_NA
```
Or,

```R
population_NA[which(population_NA == "..     " )] <- NA
```

```console
###                                 Region X.2013 X.2014 X.2015  X.2016
### 1  ISL                                   3.21   3.25   3.28 3.32   
### 2  CAN                                   3.87   3.91   3.94 3.99   
### 3  RUS                                   7.83   7.85   7.87    <NA>
### 4  COL                                  41.27  41.74     NA    <NA>
### 5  ZAF                                  43.53  44.22     NA    <NA>
### 6  LTU                                  47.42  46.96  46.63 46.11  
### 7  MEX                                  60.43  61.10  61.76 62.41  
### 8  IND                                 394.85     NA     NA    <NA>
### 9  NLD                                 497.64 499.59 501.68 504.01 
### 10 KOR                                 504.92 506.97 508.91 510.77
```

If we want to recode missing values in a single data frame variable, we can subset for the missing value in that specific variable of interest and then assign it the replacement value. For example, in the following example, we will recode the missing value in col4 with the mean value of col4.

```R
## data frame with missing data

df <- data.frame(col1 = c(1:3, NA),
                 col2 = c("this", NA,"is", "text"), 
                 col3 = c(TRUE, FALSE, TRUE, TRUE), 
                 col4 = c(2.5, 4.2, 3.2, NA))

## recode the missing value in col4 with the mean value of col4

df$col4[is.na(df$col4)] <- mean(df$col4, na.rm = TRUE)

df
```

```console
###   col1 col2  col3 col4
### 1    1 this  TRUE  2.5
### 2    2 <NA> FALSE  4.2
### 3    3   is  TRUE  3.2
### 4   NA text  TRUE  3.3
```

Note that, replace_na() function from tidyr package can also be used to replace NA values. For more information and examples see [**here**](https://tidyr.tidyverse.org/reference/replace_na.html).

```console
## Replace NAs in a data frame
df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
df %>% replace_na(list(x = 0, y = "unknown"))
##> # A tibble: 3 x 2
##>       x y      
##>   <dbl> <chr>  
##> 1     1 a      
##> 2     2 unknown
##> 3     0 b      

## Replace NAs in a vector
df %>% dplyr::mutate(x = replace_na(x, 0))
##> # A tibble: 3 x 2
##>       x y    
##>   <dbl> <chr>
##> 1     1 a    
##> 2     2 NA   
##> 3     0 b    
## OR
df$x %>% replace_na(0)
##> [1] 1 2 0
df$y %>% replace_na("unknown")
##> [1] "a"       "unknown" "b"      

## Replace NULLs in a list: NULLs are the list-col equivalent of NAs
df_list <- tibble(z = list(1:5, NULL, 10:20))
df_list %>% replace_na(list(z = list(5)))
##> # A tibble: 3 x 1
##>   z         
##>   <list>    
##> 1 <int [5]> 
##> 2 <dbl [1]> 
##> 3 <int [11]>
```

### Excluding Missing Data
A common method of handling missing values is simply to omit the records or fields with missing values from the analysis. However, this may be dangerous, since the pattern of missing values may in fact be systematic, and simply deleting records with missing values would lead to a biased subset of the data.

Some authors recommend that if the amount of missing data is very small relatively to the size of the data set (up to 5%), then leaving out the few values with missing features would be the best strategy in order not to bias the analysis. When this is the case, we can exclude missing values in a couple different ways.
If we want to exclude missing values from mathematical operations, we can use the na.rm = TRUE argument. If you do not exclude these values, most functions will return an NA. Here are some examples:

```R
## create a vector with missing values

x <- c(1:4, NA, 6:7, NA)

## including NA values will produce an NA output when used with mathematical operations

mean(x)
```

```console
### [1] NA
```

```R
## excluding NA values will calculate the mathematical operation for all non-missing values

mean(x, na.rm = TRUE)
```

```console
### [1] 3.833333
```

We may also want to subset our data to obtain complete observations (those observations in our data that contain no missing data). We can do this a few different ways.

```R
## data frame with missing values

df <- data.frame(col1 = c(1:3, NA),
                 col2 = c("this", NA,"is", "text"), 
                 col3 = c(TRUE, FALSE, TRUE, TRUE), 
                 col4 = c(2.5, 4.2, 3.2, NA))

df
```

```console
###   col1 col2  col3 col4
### 1    1 this  TRUE  2.5
### 2    2 <NA> FALSE  4.2
### 3    3   is  TRUE  3.2
### 4   NA text  TRUE   NA
```

First, to find complete cases we can leverage the complete.cases() function which returns a logical vector identifying rows which are complete cases. So, in the following case rows 1 and 3 are complete cases. We can use this information to subset our data frame which will return the rows which complete.cases() found to be TRUE.

```R
complete.cases(df)
```

```console
### [1]  TRUE FALSE  TRUE FALSE
```

```R
## subset data frame with complete.cases to get only complete cases

df[complete.cases(df), ]
```

```console
###   col1 col2 col3 col4
### 1    1 this TRUE  2.5
### 3    3   is TRUE  3.2
```

```R
## or subset with `!` operator to get incomplete cases

df[!complete.cases(df), ]
```

```console
###   col1 col2  col3 col4
### 2    2 <NA> FALSE  4.2
### 4   NA text  TRUE   NA
```

A shorthand alternative approach is to simply use na.omit() to omit all rows containing missing values.

```R
## or use na.omit() to get same as above

na.omit(df)
```

```console
###   col1 col2 col3 col4
### 1    1 this TRUE  2.5
### 3    3   is TRUE  3.2
```

However, it seems like a waste to omit the information in all the other fields just because one field value is missing. Therefore, data analysts should carefully approach to excluding missing values especially when the amount of missing data is very large.
Another recommended approach is to replace the missing value with a value substituted according to various criteria. These approaches will be given in the next section.

### Basic Missing Value Imputation Techniques
Imputation is the process of estimating or deriving values for fields where data is missing. There is a vast body of literature on imputation methods and it goes beyond the scope of this course to discuss all of them. In this section I will provide basic missing value imputation techniques only.

#### Replace the missing value(s) with some constant, specified by the analyst
In some cases, a missing value can be determined because the observed values combined with their constraints force a unique solution. As an example, consider the following data frame listing the costs for staff, cleaning, housing and the total total for three months.

```R
df <- data.frame(month = c(1:3),
                 staff = c(15000 , 20000, 23000), 
                 cleaning = c(100, NA, 500), 
                 housing = c(300, 200, NA),
                 total = c(NA, 20500, 24000))

df
```

```console
###   month staff cleaning housing total
### 1     1 15000      100     300    NA
### 2     2 20000       NA     200 20500
### 3     3 23000      500      NA 24000
```

Now, assume that we have the following rules for the calculation of total cost: staff + cleaning + housing = total and all costs > 0. Therefore, if one of the variables is missing, we can clearly derive the missing values by solving the rule. For this example, first month’s total cost can be found as 15000 + 100 + 300 = 15400. Other missing values can be found in a similar way.
The deducorrect and validate packages have a number of functions available that can impute (and correct) the values according to the given rules automatically for a given data frame.

```R
##install.packages("deductive")
##install.packages("validate")

library(deductive)
library(validate)
## Define the rules as a validator expression

Rules <- validator( staff + cleaning + housing == total,
                              staff >= 0,
                              housing >= 0,
                              cleaning >= 0)

## Use impute_lr function

imputed_df <- impute_lr(df,Rules)

imputed_df
```

```console
###   month staff cleaning housing total
### 1     1 15000      100     300 15400
### 2     2 20000      300     200 20500
### 3     3 23000      500     500 24000
```

The deducorrect package together with validate provide a collection of powerful methods for automated data cleaning and imputing. For more information on these packages please refer to “Correction of Obvious Inconsistencies and Errors” section of the module notes and the deducorrect package manual and validate package manual.

#### Replace the missing value(s) with the mean, median or mode
Replacing the missing value with the mean, median (for numerical variables) or the mode (for categorical variables) is a crude way of treating missing values. The **Hmisc** package has a convenient wrapper function allowing you to specify what function is used to compute imputed values from the non-missing.
Consider the following data frame with missing values:

```R
x <- data.frame( no = c(1:6),
                 x1 = c(15000 , 20000, 23000, NA, 18000, 21000), 
                 x2 = c(4, NA, 4, 5, 7, 8),
                 x3 = factor(c(NA, "False", "False", "False", "True", "True")))
x
```

```console
###   no    x1 x2    x3
### 1  1 15000  4  <NA>
### 2  2 20000 NA False
### 3  3 23000  4 False
### 4  4    NA  5 False
### 5  5 18000  7  True
### 6  6 21000  8  True
```

For this data frame, imputation of the mean, median and mode can be done using Hmisc package as follows:

```R
##install.packages("Hmisc")
library(Hmisc)

## mean imputation (for numerical variables)

x1 <- impute(x$x1, fun = mean) 

x1
```

```console
###      1      2      3      4      5      6 
###  15000  20000  23000 19400*  18000  21000
```

```R
## median imputation (for numerical variables)

x2 <- impute(x$x2, fun = median) 

x2
```

```console
###  1  2  3  4  5  6 
###  4 5*  4  5  7  8
```

```R
## mode imputation (for categorical/factor variables)

x3 <- impute(x$x3, fun= mode)

x3
```

```console
###      1      2      3      4      5      6 
### False*  False  False  False   True   True
```

A nice feature of the impute function is that the resulting vector remembers what values were imputed. This information may be requested with is.imputed function as in the example below.

```console
## check which values are imputed

is.imputed(x1)
```

```console
### [1] FALSE FALSE FALSE  TRUE FALSE FALSE
```

```R
is.imputed(x2)
```

```console
### [1] FALSE  TRUE FALSE FALSE FALSE FALSE
```

```R
is.imputed(x3)
```

```console
### [1]  TRUE FALSE FALSE FALSE FALSE FALSE
```

#### More Complex Approaches to Missing Value Imputation
Another strategy is to use predictive models to impute the missing data. There are many different predictive models and algorithms to predict and impute the missing values. Regression analysis, multiple imputation methods, random forests, k nearest neighbours, last observation carried forward / next observation carried backward, etc. are only some of these techniques. In R, there are many different packages (e.g., mice, missForest, impute etc.) that can be used to predict and impute the missing data.

For the detailed information on the missing value imputation please refer to the “[Statistical analysis with missing data (Little and Rubin (2014))](https://primo-direct-apac.hosted.exlibrisgroup.com/primo-explore/fulldisplay?docid=RMIT_ALMA2137428490001341&context=L&vid=RMITU&search_scope=Books_articles_and_more&isFrbr=true&tab=default_tab&lang=en_US)” for the theory behind the missing value mechanism and analysis. For multiple imputation techniques and case studies using R, please refer to “[Flexible imputation of missing data (Van Buuren (2012))](https://primo-direct-apac.hosted.exlibrisgroup.com/primo-explore/fulldisplay?docid=RMIT_ALMA5159878830001341&context=L&vid=RMITU&search_scope=Books_articles_and_more&tab=default_tab&lang=en_US)”.

### Special values
In addition to missing values, there are a few special values that are used in R. These are **-Inf**, **Inf** and **NaN**.
If a computation results in a number that is too big, R will return **Inf** (meaning positive infinity) for a positive number and **-Inf** for a negative number (meaning negative infinity). Here are some examples:

```R
 3 ^ 1024
```

```console
### [1] Inf
```

```R
 -3 ^ 1024
```

```console
### [1] -Inf
```

This is also the value returned when you divide by 0:

```R
12 / 0
```

```console
### [1] Inf
```

Sometimes, a computation will produce a result that makes little sense. In these cases, R will often return NaN (meaning “not a number”):

```R
Inf - Inf
```

```console
### [1] NaN
```

```R
0/0
```

```console
### [1] NaN
```

### Identifying Special Values

Calculations involving special values often result in special values, thus it is important to handle special values prior to analysis. The **is.finite**, **is.infinite**, or **is.nan** functions will generate logical values (TRUE or FALSE) and they can be used to identify the special values in a data set.

```R
## create a vector with special values

m <- c( 2, 0/0, NA, 1/0, -Inf, Inf, (Inf*2) )
m
```

```console
### [1]    2  NaN   NA  Inf -Inf  Inf  Inf
```

```R
## check finite values

is.finite(m)
```

```console
### [1]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
```

```R
## check infinite (-inf or +inf) values

is.infinite(m)
```

```console
### [1] FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
```

```R
## check not a number (NaN) values

is.nan(m)
```

```console
### [1] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
```

```R
## create a data frame containing special values

df <- data.frame(col1 = c( 2, 0/0, NA, 1/0, -Inf, Inf),
                 col2 = c( NA, Inf/0, 2/0, NaN, -Inf, 4))

df
```

```console
###   col1 col2
### 1    2   NA
### 2  NaN  Inf
### 3   NA  Inf
### 4  Inf  NaN
### 5 -Inf -Inf
### 6  Inf    4
```

```R
## check whether dataframe has infinite (-inf or +inf) values

is.infinite(df)

## Error in is.infinite(df) : default method not implemented for type 'list'
```

These functions accept vectorial input, therefore you will receive an error when you try to use it with a data frame. In such cases, we can use apply family functions.

#### Remark: Useful apply family functions
The apply family functions will apply a specified function to a given data object (e.g. vectors, lists, matrices, data frames). Most common forms of apply functions are:

+ apply() for matrices and data frames
+ lapply() for lists (output as list)
+ sapply() for lists (output simplified)
+ tapply() for vectors
+ … many others

There is a very useful and [comprehensive tutorial on apply family functions](https://www.datacamp.com/community/tutorials/r-tutorial-apply-family) in DataCamp. Please read this tutorial for more information on the usage of apply family. You can also use swirl() to practice apply family functions. In swirl(), “R Programming Course” Lesson 10 and 11 cover the apply family functions. 

Among those apply functions, sapply and lapply functions can apply any function to a list. Remember from Module 3 that data frames possess the characteristics of both lists and matrices. Therefore, we can use sapply or lappy for data frames. 

Now for the previous example, let’s use sapply function:

```R
df
```

```console
###   col1 col2
### 1    2   NA
### 2  NaN  Inf
### 3   NA  Inf
### 4  Inf  NaN
### 5 -Inf -Inf
### 6  Inf    4
```

```R
## check whether dataframe has infinite (-inf or +inf) values using sapply

sapply(df, is.infinite)
```

```console
###       col1  col2
### [1,] FALSE FALSE
### [2,] FALSE  TRUE
### [3,] FALSE  TRUE
### [4,]  TRUE FALSE
### [5,]  TRUE  TRUE
### [6,]  TRUE FALSE
```

By using sapply we could see the infinite values in the data frame. Now remember that is.infinite function doesn’t check for NaN numbers. Therefore, we also need to check the data frame for NaN values. In order to do that, we can write a simple function to check every numerical column in a data frame for infinite values or NaN’s.

```R
## data frame

df
```

```console
###   col1 col2
### 1    2   NA
### 2  NaN  Inf
### 3   NA  Inf
### 4  Inf  NaN
### 5 -Inf -Inf
### 6  Inf    4
```

```R
## Check every numerical column whether they have infinite or NaN values using a function called is.special

is.special <- function(x){
if (is.numeric(x)) (is.infinite(x) | is.nan(x))
}

## apply this function to the data frame.

sapply(df, is.special)
```

```console
###       col1  col2
### [1,] FALSE FALSE
### [2,]  TRUE  TRUE
### [3,] FALSE  TRUE
### [4,]  TRUE  TRUE
### [5,]  TRUE  TRUE
### [6,]  TRUE FALSE
```

Here, the is.special function is applied to each column of df using sapply. is.special checks the data frame for numerical special values if the type is numeric. Using a similar approach you can also check for special values or NA’s at the same time using:

```R
## Check every numerical column whether they have infinite or NaN or NA values using a function called is.specialorNA

is.specialorNA <- function(x){
if (is.numeric(x)) (is.infinite(x) | is.nan(x) | is.na(x))
}

## apply this function to the data frame.

sapply(df, is.specialorNA)
```

```console
###       col1  col2
### [1,] FALSE  TRUE
### [2,]  TRUE  TRUE
### [3,]  TRUE  TRUE
### [4,]  TRUE  TRUE
### [5,]  TRUE  TRUE
### [6,]  TRUE FALSE
```

Especially for big datasets, the output of is.xxxx functions would be very long as it returns TRUE or FALSE values for each row and column in the data frame. To avoid such non-informative and long output you can use sum() function together with is.xxxx functions and apply it to a data frame using lapply or sapply. However, you cannot use (nested) functions inside apply family functions. One solution to this is to write a user defined function inside apply function.

Here is a good example on population_NA data frame:

```R
## a dataset with some NA values

population_NA
```

```console
###                                 Region X.2013 X.2014 X.2015  X.2016
### 1  ISL                                   3.21   3.25   3.28 3.32   
### 2  CAN                                   3.87   3.91   3.94 3.99   
### 3  RUS                                   7.83   7.85   7.87    <NA>
### 4  COL                                  41.27  41.74     NA    <NA>
### 5  ZAF                                  43.53  44.22     NA    <NA>
### 6  LTU                                  47.42  46.96  46.63 46.11  
### 7  MEX                                  60.43  61.10  61.76 62.41  
### 8  IND                                 394.85     NA     NA    <NA>
### 9  NLD                                 497.64 499.59 501.68 504.01 
### 10 KOR                                 504.92 506.97 508.91 510.77
```

```R
## let's check whether the data frame has NA values using sapply

sapply(population_NA, is.na)
```

```console
###       Region X.2013 X.2014 X.2015 X.2016
###  [1,]  FALSE  FALSE  FALSE  FALSE  FALSE
###  [2,]  FALSE  FALSE  FALSE  FALSE  FALSE
###  [3,]  FALSE  FALSE  FALSE  FALSE   TRUE
###  [4,]  FALSE  FALSE  FALSE   TRUE   TRUE
###  [5,]  FALSE  FALSE  FALSE   TRUE   TRUE
###  [6,]  FALSE  FALSE  FALSE  FALSE  FALSE
###  [7,]  FALSE  FALSE  FALSE  FALSE  FALSE
###  [8,]  FALSE  FALSE   TRUE   TRUE   TRUE
###  [9,]  FALSE  FALSE  FALSE  FALSE  FALSE
### [10,]  FALSE  FALSE  FALSE  FALSE  FALSE
```

We can avoid long output and calculate the total number of missing values for each column using sum() and is.na() functions.

```R
## Note that the code given below would throw an error

sapply(population_NA, sum(is.na()))

## Error in is.na() : 0 arguments passed to 'is.na' which requires 1
```

Instead you can write your own function inside sapply() and calculate the total missing values for each column:

```R
sapply(population_NA, function(x) sum( is.na(x) ))
```

```console
### Region X.2013 X.2014 X.2015 X.2016 
###      0      0      1      3      4
```

### Optional Reading: Checking for Obvious Inconsistencies or Errors
An obvious inconsistency occurs when a data record contains a value or combination of values that cannot correspond to a real-world situation. For example, a person’s age cannot be negative, a man cannot be pregnant, and an under-aged person cannot possess a drivers’ license. Such knowledge can be expressed as rules or constraints. In data preprocessing literature these rules are referred to as edit rules or edits, in short. Checking for obvious inconsistencies can be done straightforwardly in R using logical indices.
For example, to check which elements of x obey the rule: “x must be non-negative” one can simply use the following.

```R
## create a vector called x

x <- c( 0, -2, 1, 5)

## check the non-negative elements

x_nonnegative <- (x >= 0)

x_nonnegative
```

```console
### [1]  TRUE FALSE  TRUE  TRUE
```

However, as the number of variables increases, the number of rules may increase, and it may be a good idea to manage the rules separate from the data. For such cases, the **editrules** package allows us to define rules on categorical, numerical or mixed-type data sets which each record must obey. Furthermore, editrules can check which rules are obeyed or not and allows one to find the minimal set of variables to adapt so that all rules can be obeyed. This package also implements several basic rule operations allowing users to test rule sets for contradictions and certain redundancies.

To illustrate I will use a small data set (datawitherrors.csv) given below:

```R
datawitherrors <- read.csv("https://raw.githubusercontent.com/yanboyang713/RMIT-Data-Repository/main/datawitherrors.csv")

datawitherrors
```

```console
###   ï..no age agegroup height  status yearsmarried
### 1     1  21    adult    178  single           -1
### 2     2   2    child    147 married            0
### 3     3  18    adult    167 married           20
### 4     4 221  elderly    154 widowed            2
### 5     5  34    child   -174 married            3
```

As you noticed, there are many inconsistencies/errors in this small data set (i.e., age = 221, height = -174, years married = -1, etc.) . To begin with a simple case, let’s define a restriction on the age variable using editset functions. In order to use editset functions, we need to install and load the editrules package.

```R
##install.packages("editrules")
library(editrules)
```

In the first rule, we will define the restriction on the age variable as $ 0 age 150 $ using editset function.

```R
(Rule1 <- editset(c("age >= 0", "age <= 150")))
```

```console
### 
### Edit set:
### num1 : 0 <= age
### num2 : age <= 150
```

The editset function parses the textual rules and stores them in an editset object. Each rule is assigned a name according to its type (numeric, categorical, or mixed) and a number. The data set can be checked against these rules using the violatedEdits function.

```R
violatedEdits(Rule1, datawitherrors)
```

```console
###       edit
### record  num1  num2
###      1 FALSE FALSE
###      2 FALSE FALSE
###      3 FALSE FALSE
###      4 FALSE  TRUE
###      5 FALSE FALSE
```

violatedEdits returns a logical array indicating for each row of the data, which rules are violated. From the output, it can be understood that the 4th record violates the second rule (age <= 150).
One can also read rules, directly from a text file using the editfile function. As an example, consider the contents of the following text file (also available here):

```file
1 # numerical rules
2 age >= 0
3 height > 0
4 age <= 150
5 age > yearsmarried
6
7 # categorical rules
8 status %in% c(“married”,“single”,“widowed”)
9 agegroup %in% c(“child”,“adult”,“elderly”)
10 if ( status == “married” ) agegroup %in% c(“adult”,“elderly”)
11
12 # mixed rules
13 if ( status %in% c(“married”,“widowed”)) age - yearsmarried >= 17
14 if ( age < 18 ) agegroup == “child”
15 if ( age >= 18 && age <65 ) agegroup == “adult”
16 if ( age >= 65 ) agegroup == “elderly”
```

These rules are numerical, categorical and mixed (both data types). Comments are written behind the usual # character. The rule set can be read using editfile function as follows:

```R
Rules <- editfile("data/editrules.txt", type = "all")

Rules
```

```console
### 
### Data model:
### dat6 : agegroup %in% c('adult', 'child', 'elderly')
### dat7 : status %in% c('married', 'single', 'widowed') 
### 
### Edit set:
### num1 : 0 <= age
### num2 : 0 < height
### num3 : age <= 150
### num4 : yearsmarried < age
### cat5 : if( agegroup == 'child' ) status != 'married'
### mix6 : if( age < yearsmarried + 17 ) !( status %in% c('married', 'widowed') )
### mix7 : if( age < 18 ) !( agegroup %in% c('adult', 'elderly') )
### mix8 : if( 18 <= age & age < 65 ) !( agegroup %in% c('child', 'elderly') )
### mix9 : if( 65 <= age ) !( agegroup %in% c('adult', 'child') )
```

```R
violatedEdits(Rules, datawitherrors)
```

```console
###       edit
### record  num1  num2  num3  num4  dat6  dat7  cat5  mix6  mix7  mix8  mix9
###      1 FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
###      2 FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE
###      3 FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
###      4 FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
###      5 FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE
```

As the number of rules grows, looking at the full array produced by violatedEdits becomes complicated. For this reason, editrules offers methods to summarise or visualise the result as follows:

```R
Violated <- violatedEdits(Rules, datawitherrors)

## summary of violated rules

summary(Violated)
```

```console
### Edit violations, 5 observations, 0 completely missing (0%):
### 
###  editname freq rel
###      cat5    2 40%
###      mix6    2 40%
###      num2    1 20%
###      num3    1 20%
###      num4    1 20%
###      mix8    1 20%
### 
### Edit violations per record:
### 
###  errors freq rel
###       0    1 20%
###       1    1 20%
###       2    2 40%
###       3    1 20%
```

```R
## plot of violated rules

plot(Violated)
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1619040108/MATH2349/Module5/ViolatedFrequency_cs8twl.png)

Using the functions available in editrules package, users can detect the obvious errors and/or inconsistencies in the data set and define edit rules to identify the inconsistent records.
Moreover, analysts may need to correct the obvious errors and/or inconsistencies in a data set. In the next section, I will introduce the deducorrect package (it is a former version of deductive package) functions to correct the obvious errors and inconsistencies.

### Optional Reading: Correction of Obvious Inconsistencies or Errors
When the data you are analysing is generated by people rather than machines or measurement devices, certain typical human-generated errors are likely to occur. Given that data must obey certain edit rules, the occurrence of such errors can sometimes be detected from raw data with (almost) certainty. Examples of errors that can be detected are typing errors in numbers, rounding errors in numbers, and sign errors.

The deducorrect package has several functions available that can correct such errors. Consider the following data frame (datawitherrors2.csv):

```R
datawitherrors2 <- read.csv("https://raw.githubusercontent.com/yanboyang713/RMIT-Data-Repository/main/datawitherrors2.csv")

datawitherrors2
```

```console
###   no height unit
### 1  1 178.00   cm
### 2  2   1.47    m
### 3  3  70.00 inch
### 4  4 154.00   cm
### 5  5   5.92   ft
```

The task here is to standardise the lengths and express all of them in meters. The deducorrect package can correct this inconsistency using correctionRules function. For example, to perform the above task, one first specifies a file with correction rules as follows.

```file
1 # convert centimeters
2 if ( unit == “cm” ){
3 height <- height/100
4 }
5 # convert inches
6 if (unit == “inch” ){
7 height <- height/39.37
8 }
9 # convert feet
10 if (unit == “ft” ){
11 height <- height/3.28
12 }
13 # set all units to meter
14 unit <- “m”
```

With correctionRules we can read these rules from the txt file using .file argument.

```R
##install.packages("deducorrect")

library(deducorrect)
## read rules from txt file using validate

Rules2 <- correctionRules("data/editrules2.txt")

Rules2
```

```console
### Object of class 'correctionRules'
### ##  1-------
###   if (unit == "cm") height <- height/100 
### ##  2-------
###   if (unit == "inch") height <- height/39.37 
### ##  3-------
###   if (unit == "ft") height <- height/3.28 
### ##  4-------
###   unit <- "m"
```

Now, we can apply them to the data frame and obtain a log of all actual changes as follows:

```R
cor <- correctWithRules(Rules2, datawitherrors2)

cor
```

```console
### $corrected
###   no   height unit
### 1  1 1.780000    m
### 2  2 1.470000    m
### 3  3 1.778004    m
### 4  4 1.540000    m
### 5  5 1.804878    m
### 
### $corrections
###   row variable  old      new                                        how
### 1   1   height  178     1.78     if (unit == "cm") height <- height/100
### 2   1     unit   cm        m                                unit <- "m"
### 3   3   height   70 1.778004 if (unit == "inch") height <- height/39.37
### 4   3     unit inch        m                                unit <- "m"
### 5   4   height  154     1.54     if (unit == "cm") height <- height/100
### 6   4     unit   cm        m                                unit <- "m"
### 7   5   height 5.92 1.804878    if (unit == "ft") height <- height/3.28
### 8   5     unit   ft        m                                unit <- "m"
```

The returned value, cor$corrected will give a list containing the corrected data as follows:

```R
cor$corrected
```

```console
###   no   height unit
### 1  1 1.780000    m
### 2  2 1.470000    m
### 3  3 1.778004    m
### 4  4 1.540000    m
### 5  5 1.804878    m
```

### Additional Resources and Further Reading
As mentioned before, the missing value analysis and the missing value imputation are broader concepts that would be a standalone topic of another course. Interested readers may refer to the “[Statistical analysis with missing data (Little and Rubin (2014))](https://primo-direct-apac.hosted.exlibrisgroup.com/primo-explore/fulldisplay?docid=RMIT_ALMA2137428490001341&context=L&vid=RMITU&search_scope=Books_articles_and_more&isFrbr=true&tab=default_tab&lang=en_US)” and “[Flexible imputation of missing data (Van Buuren (2012))](https://primo-direct-apac.hosted.exlibrisgroup.com/primo-explore/fulldisplay?docid=RMIT_ALMA5159878830001341&context=L&vid=RMITU&search_scope=Books_articles_and_more&tab=default_tab&lang=en_US)” for the theory behind the missing value mechanism and analysis.

There are many good R tutorials for handling missing data using R. “[Missing Data: To impute or note to impute?](http://www.jordicasanellas.com/data-science-blog/missing-data-impute-or-do-not-impute-r-examples)” and “[Data Science Live Book](https://livebook.datascienceheroes.com/data-preparation.html#missing_data)” are only two of them. Moreover, the missForest and mice packages’ manuals provide detailed information on the missing value imputation using random forest algorithm and multiple imputation techniques, respectively.

For checking and correcting errors and inconsistencies in the data, users can refer to the [deducorrect](https://cran.r-project.org/web/packages/deducorrect/deducorrect.pdf) , [deductive](https://cran.r-project.org/web/packages/deductive/deductive.pdf) and [validate](https://cran.r-project.org/web/packages/validate/validate.pdf) packages’ manuals and “[An introduction to data cleaning with R (De Jonge and Loo (2013))](https://cran.r-project.org/doc/contrib/de_Jonge+van_der_Loo-Introduction_to_data_cleaning_with_R.pdf)” discussion paper.

### References
De Jonge, Edwin, and Mark van der Loo. 2013. “An Introduction to Data Cleaning with R.” Heerlen: Statistics Netherlands.

Little, Roderick JA, and Donald B Rubin. 2014. Statistical Analysis with Missing Data. Vol. 333. John Wiley & Sons.

Van Buuren, Stef. 2012. Flexible Imputation of Missing Data. CRC press.

## Module 6 - Scan: Outliers
### Overview
#### Summary
In statistics, an outlier is defined as an observation which stands far away from the most of other observations. An outlier can be a result of a measurement error and the inclusion of that error would have a great impact on the analysis results. Therefore, every data set should be scanned for possible outliers before conducting any statistical analysis. Like missing values, detecting outliers and dealing with them are also crucial in the data preprocessing. In this module, first you will learn how to identify univariate and multivariate outliers using descriptive, graphical and distance-based methods. Then, you will learn different approaches to deal with these values using R.

#### Learning Objectives
The learning objectives of this module are as follows:
+ Identify the outlier(s) in the data set.
+ Apply descriptive methods to identify univariate outliers.
+ Apply graphical approaches to scan for univariate or multivariate outliers.
+ Apply distance-based metrics to identify univariate or multivariate outliers.
+ Learn commonly used approaches to handle outliers.

### Outliers
In statistics, an outlier is defined as an observation which stands far away from most of the other observations. An outlier deviates so much from other observations as to arouse suspicion that is was generated by a different mechanism (Hawkins (1980)). Let’s take an example. Assume that we are interested in customer profiling and we find out that the average annual income of our customers is 800K. But there are two customers having annual income of 3 and 3.2 million dollars. These two customers’ annual income is much higher than rest of the customers (see the boxplot below). These two observations will be seen as outliers.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620190535/MATH2349/Module6/incomeOutliers_mbh02m.png)

#### Types of Outliers
Outlier can be univariate and multivariate. Univariate outliers can be found when looking at a distribution of values in a single variable. The example given above is an example of a univariate outlier as we only look at the distribution of income (i.e., one variable) among our customers. On the other hand, multivariate outliers can be found in a n-dimensional space (of n-variables). In order to find them, we need to look at distributions in multi-dimensions.

To illustrate multivariate outliers, let’s assume that we are interested in understanding the relationship between height and weight. Below, we have univariate and bivariate distribution for Height and Weight. When we look at the univariate distributions of Height and Weight (i.e., using boxplots) separately, we don’t spot any abnormal cases (i.e. above and below the $$ 1.5 × IQR $$ fence). However, when we look at the bivariate (two dimensional) distribution of Height and Weight (using scatter plot), we can see that we have one observation whose weight is 45.19 kg and height is 185.09 (on the upper-left side of the scatter plot). This observation is far away from most of the other weight and height combinations thus, will be seen as a multivariate outlier.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620190943/MATH2349/Module6/multivariateOutliers_va7ifj.png)
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620190983/MATH2349/Module6/multivariateOutliersTwo_htth3e.png)

#### Most Common Causes of Outliers
Often an outlier can be a result of data entry errors, measurement errors, experimental errors, intentional errors, data processing errors or due to the sampling (i.e., sampling error). The following are the most common causes of outliers (taken from: https://www.analyticsvidhya.com/blog/2016/01/guide-data-exploration/)

+ **Data Entry Error**: Outliers can arise because of the human errors during data collection, recording, or entry.
+ **Measurement Error**: It is the most common source of outliers. This is caused when the measurement instrument used turns out to be faulty.
+ **Experimental Error**: Another cause of outliers is the experimental error. Experimental errors can arise during data extraction, experiment/survey planning and executing errors.
+ **Intentional Error**: This type of outlier is commonly found in self-reported measures that involves sensitive data. For example, teens would typically under report the amount of alcohol that they consume. Only a fraction of them would report actual value. Here actual values might look like outliers because rest of the teens are under reporting the consumption.
+ **Data Processing Error**: Often, due to the data sets are extracted from multiple sources, it is possible that some manipulation or extraction errors may lead to outliers in the data set.
+ **Sampling Error**: Sometimes, outliers can arise due to the sampling (taking samples from population) process. Typically, this type of outliers can be seen when we take a few observations as a sample.

### Detecting Outliers
Outliers can drastically change the results of the data analysis and statistical modelling. Some of the unfavourable impacts of outliers are as follows:
+ They increase the error variance.
+ They reduce the power of statistical tests.
+ They can bias or influence the estimates of model parameters that may be of substantive interest.

Therefore, one of the most important tasks in data preprocessing is to identify and properly handle the outliers.

There are many methods developed for outlier detection. Majority of them deal with numerical data. This module will introduce the most basic ones with their application using R packages.

#### Univariate Outlier Detection Methods
One of the simplest methods for detecting univariate outliers is the use of boxplots. A boxplot is a graphical display for describing the distribution of the data using the median, the first (Q1) and third quartiles (Q3), and the inter-quartile range (IQR = Q3 − Q1). Below is an illustration of a typical boxplot (taken from [Dr. James Baglin’s Intro to Stats website] (https://astral-theory-157510.appspot.com/secured/MATH1324_Module_02.html#box_plots)).

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620191501/MATH2349/Module6/UnivariateOutlierDetectionBoxplot_owyyes.png)

In the boxplot, the "Tukey’s method of outlier detection" is used to detect outliers. According to this method, outliers are defined as the values in the data set that fall beyond the range of $$ −1.5 × IQR $$ to $$ 1.5 × IQR $$. These $$ −1.5 × IQR $$ and $$ 1.5 × IQR $$ limits are called "outlier fences" and any values lying outside the outlier fences are depicted using an "o" or a similar symbol on the boxplot.

**Note** that Tukey’s method is a **nonparametric** way of detecting outliers, therefore it is mainly used to test outliers in **non-symmetric / non-normal** data distributions.
In order to illustrate the boxplot, we will use the [Diamonds.csv](https://raw.githubusercontent.com/yanboyang713/RMIT-Data-Repository/main/Diamonds.csv) data set available under the data repository.

```R
Diamonds <- read.csv("https://raw.githubusercontent.com/yanboyang713/RMIT-Data-Repository/main/Diamonds.csv")
head(Diamonds)
```

```console
##   carat       cut color clarity depth table price    x    y    z
## 1  0.23     Ideal     E     SI2  61.5    55   326 3.95 3.98 2.43
## 2  0.21   Premium     E     SI1  59.8    61   326 3.89 3.84 2.31
## 3  0.23      Good     E     VS1  56.9    65   327 4.05 4.07 2.31
## 4  0.29   Premium     I     VS2  62.4    58   334 4.20 4.23 2.63
## 5  0.31      Good     J     SI2  63.3    58   335 4.34 4.35 2.75
## 6  0.24 Very Good     J    VVS2  62.8    57   336 3.94 3.96 2.48
```

We can use boxplot() function (under Base graphics) to get the boxplot of the carat variable:

```R
Diamonds$carat %>%  boxplot(main="Boxplot of Diamond Carat", ylab="Carat", col = "grey")
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620192006/MATH2349/Module6/boxplot-outliers_hqrxre.png)

According to the Tukey’s method, the carat variable seems to have many outliers. In the next section, we will discuss different approaches to handle these outliers.
There are also distance based methods to detect univariate outliers. One of them is to use the z- scores (i.e., normal scores) method. In this method, a standardised score (z-score) of all observations are calculated using the following equation:

$$ z_i = \frac{X_i - \bar{X}}{S} $$

In the equation below, $ X_i $ denotes the values of observations, $ \bar{X} $ and $ S $ are the sample mean and standard deviation, respectively. An observation is regarded as an outlier based on its z-score, if the absolute value of its **z-score is greater than 3**.

**Note** that, z-score method is a parametric way of detecting outliers and assumes that the underlying data is normally distributed. Therefore, if the distribution is not approximately normal, this method shouldn’t be used. 

In order to illustrate the z-score approach, we will use the "outliers package". The outliers package provides several useful functions to systematically extract outliers. Among those, the scores() function will calculate the z-scores (in addition to the t, chi-square, IQR, and Median absolute deviation scores) for the given data. Note that, there are many alternative functions in R for calculating z-scores. You may also use these functions and detect the outliers.
Let’s investigate any outliers in the depth variable using z-score approach. First, we will make sure that the depth distribution is approximately normal. For this purpose we can use histogram (or boxplot()) to check the distribution:

```R
hist(Diamonds$depth)
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620195380/MATH2349/Module6/histogramOutliers_ffx21h.png)

After confirming the depth variable has an approximately normal distribution, we can calculate z scores using outliers package:

```R
library(outliers)
z.scores <- Diamonds$depth %>%  scores(type = "z")
z.scores %>% summary()
```

```console
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
## -13.08748  -0.52310   0.03532   0.00000   0.52393  12.04128
```

From the summary() output, we can see that the minimum z score is -13.08 and the maximum is 12.04. 

Using which(), we can also find the locations of the z-scores whose absolute value is greater than 3.

```R
# Finds the locations of outliers in the depth variable

which(abs(z.scores) >3 )
```

```R
# Finds the total number of outliers according to the z-score

length (which(abs(z.scores) >3 ))
```

According to the z-score method, the depth variable has 685 outliers.
There are also many statistical tests to detect outliers. Some of them are the Chi-square test for outliers, the Cochran’s test, the Dixon test and the Grubbs test. In this course, we won’t cover these statistical testing approaches used for detecting outliers. You may refer to the [outliers package manual] (https://cran.r-project.org/web/packages/outliers/outliers.pdf) which includes useful functions for the commonly used outlier tests as well as the distance-based approaches.

#### Multivariate Outlier Detection Methods
When we have only two variables, the bivariate visualisation techniques like bivariate boxplots and scatter plots, can easily be used to detect any outliers.
To illustrate the bivariate, we will assume that we are only interested in one numerical carat variable and a one factor (quantitative) cut variable in the Diamonds data set.

```R
boxplot(Diamonds$carat ~ Diamonds$cut, main="Diamond carat by cut", ylab = "Carat", xlab = "Cut")
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620195865/MATH2349/Module6/bivariateBoxplots_u5k2t4.png)

Using the univariate boxplot approach, we can easily detect outliers in carat for a given cut.
Another bivariate visualisation method is the scatter plots. These plots are used to visualise the relationship between two quantitative variables. They are also very useful tools to detect obvious outliers for the two-dimensional data (i.e., for two continuous variables).
The plot() function will be used to get the scatter plot and detect outliers in carat and depth variables:

```R
Diamonds %>% plot(carat ~ depth, data = ., ylab="Carat", xlab="Depth", main="Carat by Depth")
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620196026/MATH2349/Module6/scatterPlots_w3gsp5.png)

According to the scatter plot, there are some possible outliers on the lower left (the data points where both carat and depth is small) and lower right-hand side of the scatter (the data points with larger depth but small carat values).

Scatter plots are useful methods to detect abnormal observations for a given pair of variables. However, when there are more than two variables, scatter plots can no longer be used. For such cases, multivariate distance-based methods of outlier detection can be used.

**The Mahalanobis distance** is the most commonly used distance metric to detect outliers for the multivariate setting. The Mahalanobis distance is simply an extension of the univariate z-score, which also accounts for the correlation structure between all the variables. Mahalanobis distance follows a Chi-square distribution with n (number of variables) degrees of freedom, therefore **any Mahalanobis distance greater than the critical chi-square value is treated as outliers.**

I will not go into details of calculation of the Mahalanobis distance. We will use the MVN package to get these distances as it will also provide us the useful Mahalanobis distance vs. Chi-square quantile distribution plot (QQ plot) and contour plots. For more information on this package and its capabilities please refer to the paper on https://cran.r-project.org/web/packages/MVN/vignettes/MVN.pdf.

To illustrate the usage of the MVN package to detect multivariate outliers, we will use a subset of the Iris data, which is versicolor flowers, with the first three variables (Sepal.Length, Sepal.Width and Petal.Length).

First let’s read the data using:

```R
# load iris data and subset using versicolor flowers, with the first three variables

iris <- read.csv("https://raw.githubusercontent.com/yanboyang713/RMIT-Data-Repository/main/iris.csv")
versicolor <- iris %>%  filter(Species == "versicolor" ) %>%  dplyr::select(Sepal.Length, Sepal.Width, Petal.Length)
head(versicolor)
```

```console
##   Sepal.Length Sepal.Width Petal.Length
## 1          7.0         3.2          4.7
## 2          6.4         3.2          4.5
## 3          6.9         3.1          4.9
## 4          5.5         2.3          4.0
## 5          6.5         2.8          4.6
## 6          5.7         2.8          4.5
```

The **mvn()** function under MVN package (Korkmaz, Goksuluk, and Zararsiz (2014)) lets us to define the multivariate outlier detection method using the ***multivariateOutlierMethod*** argument. When we use **multivariateOutlierMethod = "quan"** argument, it detects the multivariate outliers using the chi-square distribution critical value approach mentioned above. The **showOutliers = TRUE** argument will depict any multivariate outliers and show them on the QQ plot.

```R
# Multivariate outlier detection using Mahalanobis distance with QQ plots

results <- mvn(data = versicolor, multivariateOutlierMethod = "quan", showOutliers = TRUE)
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620196659/MATH2349/Module6/QQplotOutlier_ol5fk9.png)

As we can see on the QQ plot, the Mahalonobis distance suggests existence of two outliers for this subset of the iris data. 

If we would like to see the list of possible multivariate outliers, we can use **result$multivariateOutliers** to select only the results related to outliers as follows:

```R
results$multivariateOutliers
```

```console
##    Observation Mahalanobis Distance Outlier
## 34          34               10.974    TRUE
## 49          49                9.580    TRUE
```

This output is very useful in terms of providing the locations of outliers in the data set. In our example the 34st and 49th observations are the suggested outliers for this subset of iris data.
The mvn() function has also different plot options to help discovering possible multivariate outliers. For example, to get the bivariate contour plots, we can use multivariatePlot = "contour" argument. However, note that contour plots can only be used for two variables.
Let’s illustrate the contour plots on the subset of setosa flowers, with the first two variables, Sepal.Length and Sepal.Width.

```R
# load iris data and subset using setosa flowers, with the first two variables

setosa <- iris %>%  filter( Species == "setosa" ) %>%  dplyr::select(Sepal.Length, Sepal.Width)
head(setosa)
```

```console
##   Sepal.Length Sepal.Width
## 1          5.1         3.5
## 2          4.9         3.0
## 3          4.7         3.2
## 4          4.6         3.1
## 5          5.0         3.6
## 6          5.4         3.9
```

```R
# Multivariate outlier detection using Mahalanobis distance with contour plots

results <- mvn(data = setosa, multivariateOutlierMethod = "quan", multivariatePlot = "contour")
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620197011/MATH2349/Module6/contourPlotsOutlier_sdu7d3.png)
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620197100/MATH2349/Module6/chi-squareQQplotOutlier_uwxdrr.png)

From the contour plot, we can see one anomality on the left-hand side of the plot, however, according to the QQ plot, this abnormal case doesn’t seem to be an outlier as its Mahanolobis distance didn’t exceed the threshold chi-square value.
Some applications of univariate and multivariate outlier detection can extend from fraud detection (i.e., unusual purchasing behaviour of a credit card owner), medicine (i.e. detection of unusual symptoms of a patient), sports statistics (i.e., abnormal performance for players may indicate doping), measurement errors (i.e., abnormal values could provide an indication of a measurement error), etc. Like missing value analysis, univariate and multivariate outlier analyses are also broader concepts. There are also different distance-based and probabilistic methods (like clustering analysis, genetic algorithm, etc.) that can be used to detect outliers in the high dimensional data sets. There is a huge theory behind the outlier detection methods and outlier analysis would be a standalone topic of another course. Interested readers may refer to the "Outlier analysis, by Charu C. Aggarwal" for the theory behind the outlier detection methods (Aggarwal (2015)).

### Approaches to Handling Outliers
Most of the ways to deal with outliers are similar to the methods of missing values like deleting them or imputing some values (i.e., mean, median, mode) instead. There are also other approaches specific to dealing with outliers like capping, transforming, and binning them. Here, we will discuss the common techniques used to deal with outliers. Some of the methods mentioned in this Module (like transforming and binning) will be covered in the next module (Module 7: Transform), therefore I won’t go into the details of transforming and binning here.

#### Excluding or Deleting Outliers
Some authors recommend that if the outlier is due to data entry error, data processing error or outlier observations are very small in numbers, then leaving out or deleting the outliers would be used as a strategy. When this is the case, we can exclude/delete outliers in a couple different ways.

To illustrate, let’s revisit the outliers in the carat variable. Remember that we already found the locations of the outliers in the carat variable using which() function. Intuitively, we can exclude these observations from the data using:

```R
Carat_clean<- Diamonds$carat[ - which( abs(z.scores) >3 )]
```

Let’s see another example on the previous versicolor data:

```R
versicolor <- iris %>%  filter(Species == "versicolor" ) %>%  dplyr::select(Sepal.Length, Sepal.Width,Petal.Length)
head(versicolor)
```

```console
##   Sepal.Length Sepal.Width Petal.Length
## 1          7.0         3.2          4.7
## 2          6.4         3.2          4.5
## 3          6.9         3.1          4.9
## 4          5.5         2.3          4.0
## 5          6.5         2.8          4.6
## 6          5.7         2.8          4.5
```

```R
results <- mvn(data = versicolor, multivariateOutlierMethod = "quan", showOutliers = TRUE)
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620196659/MATH2349/Module6/QQplotOutlier_ol5fk9.png)

```R
results$multivariateOutliers
```

```console
##    Observation Mahalanobis Distance Outlier
## 34          34               10.974    TRUE
## 49          49                9.580    TRUE
```

The Mahalonobis distance method provided us the locations of outliers in the data set. In our example the 34st and 49th observations are the suggested outliers. Using the basic filtering and subsetting functions, we can easily exclude these two outliers:

```R
# Exclude 34st and 49th observations

versicolor_clean <- versicolor[ -c(34,49), ]

# Check the dimension and see outliers are excluded

dim(versicolor_clean)
```

```console
## [1] 48  3
```

Note that, the mvn() function also has an argument called showNewData = TRUE to exclude the outliers. One can simply detect and remove outliers using the following argument:

```R
versicolor_clean2 <- mvn(data = versicolor, multivariateOutlierMethod = "quan", showOutliers = TRUE, showNewData = TRUE)
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620196659/MATH2349/Module6/QQplotOutlier_ol5fk9.png)

```R
# Prints the data without outliers

dim(versicolor_clean2$newData)
```

```console
## [1] 48  3
```

### Imputing
Like imputation of missing values, we can also impute outliers. We can use mean (need to be used with caution!), median imputation or capping methods to replace outliers. Before imputing values, we should analyse the distribution carefully, and investigate whether the suggested outlier is a result of data entry/processing error. If the outlier is due to a data entry/processing error, we can go with imputing values.
For the illustration purposes, let’s replace the two outlier values in carat variable with its mean by using Base R functions:

```R
Diamonds <- read.csv("data/Diamonds.csv")
Diamonds$carat[ which( abs(z.scores) >3 )] <- mean(Diamonds$carat, na.rm = TRUE)
```

Replacing outliers with the median or a user specified value can also be done using a similar approach. Note that, you may also prefer to write your own functions to deal with outliers.

### Capping (a.k.a Winsorising)
Capping or winsorising involves replacing the outliers with the nearest neighbours that are not outliers. For example, for outliers that lie outside the outlier fences on a boxplot, we can cap it by replacing those observations outside the lower limit with the value of 5th percentile and those that lie above the upper limit, with the value of 95th percentile.

In order to cap the outliers we can use a user-defined function as follows (taken from: Stackoverflow):

```R
# Define a function to cap the values outside the limits

cap <- function(x){
    quantiles <- quantile( x, c(.05, 0.25, 0.75, .95 ) )
    x[ x < quantiles[2] - 1.5*IQR(x) ] <- quantiles[1]
    x[ x > quantiles[3] + 1.5*IQR(x) ] <- quantiles[4]
    x}
```

To illustrate capping we will use the Diamond data set. In order to cap the outliers in the carat variable, we can simply apply our user-defined function to the carat variable as follows:

```R
Diamonds <- read.csv("https://raw.githubusercontent.com/yanboyang713/RMIT-Data-Repository/main/Diamonds.csv")
carat_capped <- Diamonds$carat %>% cap()
```

We can also apply this function to a data frame using sapply function. Here is an example of applying cap() function to a subset of the Diamonds data frame:

```R
# Take a subset of Diamonds data using quantitative variables

Diamonds_sub <- Diamonds %>%  dplyr::select(carat, depth, price)

# See descriptive statistics

summary(Diamonds_sub)
```

```console
##      carat            depth           price      
##  Min.   :0.2000   Min.   :43.00   Min.   :  326  
##  1st Qu.:0.4000   1st Qu.:61.00   1st Qu.:  950  
##  Median :0.7000   Median :61.80   Median : 2401  
##  Mean   :0.7979   Mean   :61.75   Mean   : 3933  
##  3rd Qu.:1.0400   3rd Qu.:62.50   3rd Qu.: 5324  
##  Max.   :5.0100   Max.   :79.00   Max.   :18823
```

```R
# Apply a user defined function "cap" to a data frame

Diamonds_capped <- sapply(Diamonds_sub, FUN = cap)

# Check summary statistics again

summary(Diamonds_capped)
```

```console
##      carat            depth           price      
##  Min.   :0.2000   Min.   :58.80   Min.   :  326  
##  1st Qu.:0.4000   1st Qu.:61.00   1st Qu.:  950  
##  Median :0.7000   Median :61.80   Median : 2401  
##  Mean   :0.7821   Mean   :61.75   Mean   : 3812  
##  3rd Qu.:1.0400   3rd Qu.:62.50   3rd Qu.: 5324  
##  Max.   :2.0000   Max.   :64.70   Max.   :13107

```

#### Transforming and binning values
Transforming variables can also eliminate outliers. Natural logarithm of a value reduces the variation caused by outliers. Binning is also a form of variable transformation. Transforming and binning will be covered in detail in the next module (Module 7: Transform).

#### Outliers can also be valuable!
The outlier detection methods (i.e. Tukey’s method, z-score method) provide us ‘suggested outliers’ in the data which tend to be far away from the rest of observations. Therefore, they serve as a reminder of possible anomalies in the data.

For some applications, those anomalies would be problematic (especially for the statistical tests) and usually be handled using omitting, imputing, capping, binning or applying transformations …etc. as they can bias the statistical results.

On the other hand, for some other applications like anomaly detection or fraud detection, these anomalies could be valuable and interesting. For such cases you may choose to leave (and investigate further) those values as they can tell you an interesting story about your data.

To wrap-up: We don’t always remove, impute, cap or transform suggested outliers in the data, for some applications outliers can provide valuable information or insight therefore analysts may choose to keep those values for further investigation.

### Additional Resources and Further Reading
As mentioned before, univariate and multivariate outlier analysis are broader concepts. Interested readers may refer to the “Outlier analysis, by Charu C. Aggarwal” for the theory behind the outlier detection methods (Aggarwal (2015)). Another useful resource is “R and Data Mining: Examples and Case Studies” by Yanchang Zhao (also available [here](https://cran.r-project.org/doc/contrib/Zhao_R_and_data_mining.pdf)). Chapter 7 of this book covers univariate and multivariate outlier detection methods, outlier detection using clustering and outlier detection in time series.

The [outliers package manual] (https://cran.r-project.org/web/packages/outliers/outliers.pdf) includes useful functions for the commonly used outlier tests and the distance-based approaches. This package can be used to detect univariate outliers.

I find the MVN package useful for detecting multivariate outliers as it provides many alternative visualizations in addition to the distance-based metrics. The MVN package also includes different types of univariate and multivariate tests for normality. For more information and capabilities of the MVN package please refer to the paper by Korkmaz, Goksuluk, and Zararsiz (2014), which is available [here](https://cran.r-project.org/web/packages/MVN/vignettes/MVN.pdf).

There are also other R packages for outlier detection, and all might give different results. [This blog by Antony Unwin] (http://blog.revolutionanalytics.com/2018/03/outliers.html) compares different outlier detection methods available in R using the OutliersO3 package.

References
Aggarwal, Charu C. 2015. “Outlier Analysis.” In Data Mining, 237–63. Springer.

Hawkins, Douglas M. 1980. Identification of Outliers. Vol. 11. Springer.

Korkmaz, Selcuk, Dincer Goksuluk, and Gokmen Zararsiz. 2014. “MVN: An R Package for Assessing Multivariate Normality.” The R Journal 6 (2): 151–62.


## Cheatsheet
### Modele 2

#### Reading/Importing Data

##### from CSV files
###### Base R

+ Import
```R
Iris1 <- read.csv(file= “~/Desktop/data/iris.csv”) (.csv eliminates any spaces in variable names and fills it with ‘.’)
Iris2 <- read.csv("iris.csv", stringsAsFactors = FALSE)
```

**NOTE:**
1. Set Working directory
```R
setwd("~/Desktop/data")
```
2. Check Structure
```R
str(iris1)
```
+ Using table to read csv file.

```R
iris5 <- read.table( "iris.csv" , sep="," or \t, header = TRUE, stringsAsFactors = FALSE)
```

+ readr (10 times faster)

```R
##  (maintain full name, auto set stringasfactor=FALSE)
iris9 <- read_csv("iris.csv")
```

**NOTE:**
Display 1st to 6th rows and 1st to 4th variables iris9[1:6,1:4]

##### from Excel files
+ xlsx
```R
## Using sheet index or name: 
iris11<- read.xlsx("iris.xlsx", sheetName = "iris", startRow = 3)

## Row column index: 
iris12<- read.xlsx("iris.xlsx", sheetName = "iris", rowIndex = 3:5, colIndex = 1:4)
(keepFormulas (use on which any platform, allows you no to external see the dependencies, text of any formulas)
```

+ Readxl 
use on which any platform, no external dependencies, load date and times
```R
iris13<- read_excel("iris.xlsx", sheet = "iris",skip = 1, col_names = paste ("Var", Data 1:6))
```

+ gdata (to read excel, Base R cannot read excel)
```R
science_data <- read.xls(url)
```

##### from statistical software
+ Foreign

```R
iris_spss <- read.spss("iris.sav", to.data.frame = TRUE)
```

##### Scraping HTML Table Data
+ rvest

```R
births <- read_html("link here")

## show select no. of tables:
length(html_nodes(births, "table")) ## [1] 1

## select the of second tables element of the html_nodes
births_data<- html_table(html_nodes(births, "table")[[1]])
```

#### Write data
##### to text files
+ Base R
To csv: 
```R
write.csv(df, file = "cars_csv", row.names = FALSE)
```

To text: 
```R
write.table(df, file = "cars_txt", sep="\t")
```

+ readr
To csv: 
```R
write_csv(df, path = "export_csv2", col_names = FALSE)
```

To text:
```R
write_delim(df, path = "export_txt2")
```

##### to Excel files
+ xlsx
```R
write.xlsx(df, file= "cars.xlsx", row.names = FALSE)
```
+ create workbook:
```R
multiple_df <- createWorkbook()
```

+ create sheet in workbook:
```R
car_df <- createSheet(wb = multiple_df, sheetName = "Cars")
```

+ add Data frame: 
```R
addDataFrame(x = iris, sheet = iris_df)
```

#### R object File
+ Saving Data as an R object File:
```R
save (x, y, file = "xy.RData")
save.image() (saves all current workspace as .RData)
```

+ save a single object to file:
```R
saveRDS (x, "x.rds")
```

+ restore it under a different name:
```R
x2 <- readRDS ("x.rds")
```

+ check if x and x2 are identical:
```R
identical (x, x2)
```

### Module 3

#### Data Types and levels
+ Check class: Class()
+ Numeric object integer or double: typeof()
+ Level of factor: levels()
+ Creating character class: var1 <- c("debit", "credit")
+ Creating integer variable: var2 <- c(4L, 7L, 14L)

#### Factor
Createing factor variable: var4 <- factor (c("Male", "Female", "Male", "Female"), level = c("Male", "Female"), ordered = True)
auto sets the levels alphabetically if not stated Result ## [1] Male Female Male Male ## Levels: Male Female

#### Vectors
+ Creating a vector ex1<- c(“a”, “b”, 1, 2, 3) 
elements of vector must be same type otherwise coerced
+ Order of coercion logical < integer < numeric < character (best)
+  Add vectors to existing one ex4<- c(ex2, 4, 6) ## [1] 1 2 3 1 0 4 6
+ Subsetting vector ex4[3] take3rd element ex4[c(1,3,5)] 1st 3rd & 5th
 ex4[c(1:3)] 1 to 3 ex4 [-1] all except first ex4[ex4<3] all elements less than 3

####  Lists allows combination of different data types and lengths
+ Creating a list list1 <- list(1:3, “a”, c(TRUE, FALSE, TRUE), c(2.5, 4.2))
+ Check Structure str(list1) shows a list of 4 with different classes
+  Add onto existing list list2<- append(list1, list(c(“credit”, “debit”, “paypay”) shows list of 5
+ Checking Attributes attributes ( list2 ) metadata of object
+ Add name: 
 names(list2) <- c(“item1”, item2”, “item3”, “item4”,“item5”) gives name for each element 
+ Subsetting lists:
  + list2[1]: takes 1st item in list2
  + List2 [ [ 1 ] ]: take 1st item in list2 without attributes (name)
  + List2$item1: take 1st list item using name
  + List2$item5 [ 3 ]: take 3rd element out of 5th list item

#### Matrices
+ Creating matrices:

```R
m1<- matrix(1:6, nrow=2, ncol=3) 
```
elements inside must be same class, all columns must be same length, [row,col]

+ Creating matrices using bind
eg. V1, V2 vectors with same length, can also use different data structure as long as they are  same length.

```R
m2 <- cbind(v1, v2) #col bind
m2 <- rbind(v1, v2) #row bind
```

+ Add  name to matrice
```R
rownames(m4) <- c("subject1","subject2","subject3")
colnames (m4) <- c(“var1, “var2, “var3”) check with attributes(m4)
```

+ Subsetting matrice:
  + m4 [1, 2] # value of 1st row 2nd col
  + m4 [1:2, ] # subset for rows 1 and 2 but keep all columns
  + m4 [, c(1, 3)] # subset for columns 1 and 3 but keep all rows
  
#### Data Frames
```R
df1 <- data.frame(col1=1:3,col2 = c("credit","debit","Paypal"),
col3 = c (TRUE, FALSE, TRUE),col4 = c (25.5, 44.2, 54.9),
stringsAsFactors=FALSE)
```

+ Adding to  data frame df2<-cbind(df1, v4) can add col or rows(item)
+ Add name df same as matrices attributes(df2) shows col & row names
+ Subsetting df df behaves like both lists and matrices
  + df[2:3, ]
  + df [c("subj1", "subj3"), ]
  + df [2:3, c(1,4)]
  + df2$fraud[2] # 2nd element in the fraud column

#### Convert Data Types/ Structures
+ as.numeric() as.matrix() num_v<- as.vector(8:17) convert to vec
+ is.numeric() is.matrix() is.vector(num_vec) # check if vector

### Module 4
#### Tidy Data Principles
1. Each variable must have its own column.
2. Each observation must have its own row.
3. Each value must have its own cell.

#### Common problems with messy data sets
1. Column headers are values, not variable names
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617037383/MATH2349/Model4/CommonProblemOne_jekvaq.png)
gather(): [wide to long](###pivot_longer() function)
Or
pivot_longer
2. Multiple variables are stored in rows (no primary key)
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617037561/MATH2349/Model4/CommonProblemTwo_hmqyrc.png)
spread: [long to wide](###pivot_wider() function)
Or
pivot_wider

3. Multiple variables are stored in one column
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617037681/MATH2349/Model4/CommonProblemThree_bnk7kb.png)
separate() [col having too many variables](###separate() function)

4. Multiple columns forms a variable
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617037881/MATH2349/Model4/CommonProblemFour_og6y7t.png)
unite() [inverse of separate() function](###unite() function)


#### dplyr package
1. select() function:
+ -: Select everything but
+ :: Select range
+ contains(): Select columns whose name contains a character string
+ ends_with(): Select columns whose name ends with a string
+ everything(): Select every column
+ matches(): Select columns whose name matches a regular expression
+ num_range(): Select columns named x1, x2, x3, x4, x5
+ one_of(): Select columns whose names are in a group of names
+ starts_with(): Select columns whose name starts with a character string
2. filter() function
uses operators such as < > == != %in% is.na any all
3. arrange() function allows us to order data by variables in ascending or descending order.
4. mutate() function allows us to add new variables while preserving the existing variables.
5. summarise() (a.k.a. summarize() ) function allows us to perform the majority of summary statistics when performing exploratory data analysis. 
+ min(), max()
+ mean()
+ median()
+ sum()
+ var(), sd()
+ first()
+ last()
+ nth()
+ n()
+ n_distinct()
6. group_by() + summarise(): summary statistics grouped by a variable

##### Example
```R
flights %>% group_by(dest) %>% summarise(mean_delay = mean(dep_delay, na.rm = TRUE))
```

+ How would you find the names of people who was born and deceased at the same place?
```R
step1 <- death_registration %>% left_join(birth_registration, by="name") # 5 points
step1 %>% filter(place.death == place.born) # 5 points
```

+ Suppose you want to sort the flights that departed from New York City according to their seating (seats) capacity (i.e. from highest seating capacity to less seating capacity). How would you do that?
```R
flights %>% left_join(planes, by="tailnum") %>% arrange(desc(seats))
```

+ How would you calculate the average distance covered by each plane manufacturer?
```R
flights %>% left_join(planes, by="tailnum") %>% 
  group_by(manufacturer) %>%  
  summarise(mean_distance = mean(distance, na.rm=TRUE))
```


#### Mutating joins
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617043954/MATH2349/Model4/mutatingJoining_tpsksf.png)

##### Example
+ Create new table with required values, join new table to match another table with data.
Eg. right_join - about the flights that has weather visibility of 5

```R
weather_v5 <- weather %>% filter(visib == 5)
flights2 %>% right_join(weather_v5) %>% select(visib, everything())
```
+ How would you find the ages of people (in years) when they deceased?
```R
died <- death_registration %>% left_join(birth_registration, by = "name")  # 5 points
died %>% mutate (age.at.death = year.death - year.born) # 5 points
```

#### Filtering Joins
Anti-joins are useful for diagnosing join mismatches. For example, when connecting flights and planes, you might be interested to know that there are many flights that don’t have a match in planes
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617044759/MATH2349/Model4/filteringJoins_cn9efc.png)

##### Example
+ How would you find the names of people who are still alive?
```R
birth_registration %>% anti_join(death_registration, by="name")
```

### Module 5
#### Missing Data
+ a numeric missing value is represented by NA (NA stands for “not available”)
+ character missing values are represented by .
+ some other values may represent missing values (i.e. 99, ., .., just space, or NULL) depending on the software (i.e., Excel, SPSS etc.

#### Identifying Missing Data
+ Result: is.na(df$col4) gives logical result TRUE or FALSE
+ Location: which(is.na(x)) gives location of NA
+ Total in whole: sum(is.na(df))
+ Total in each column: colSums(is.na(df))

#### Recode Missing Data
+ recode missing values with mean:
```R
x[is.na(x)] <- mean(x, na.rm = TRUE)

##  Replace NAs in a data frame
df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
df %>% replace_na(list(x = 0, y = "unknown"))
```

+ Define what's NA:

```R
population_NA[population_NA == "..     " ] <- NA
population_NA[which(population_NA == "..     " )] <- NA
```

+ Excluding Missing Data:
```R
## excluding NA values
mean(x, na.rm = TRUE)

complete.cases(df)
### [1]  TRUE FALSE  TRUE FALSE

## subset data frame with complete.cases to get only complete cases

df[complete.cases(df), ]
df[!complete.cases(df), ]
na.omit(df)
```

#### Basic Missing Value Imputation Techniques
+ Replace the missing value(s) with some constant, specified by the analyst
```R
library(deductive)
library(validate)
## Define the rules as a validator expression

Rules <- validator( staff + cleaning + housing == total,
                              staff >= 0,
                              housing >= 0,
                              cleaning >= 0)

## Use impute_lr function

imputed_df <- impute_lr(df,Rules)

library(Hmisc)

## mean imputation (for numerical variables)

x1 <- impute(x$x1, fun = mean)

## check which values are imputed

is.imputed(x1)
```

#### ID Special Values
+ -Inf Inf: is.infinite( vector) true ; is.finite(vector) false **vector only func**
+ NaN: is.nan( ) retuns true

#### apply() Functions - df list and matrices also vectors
+ apply() matrices & df
+ lapply() for lists (output as list)
+ sapply() for lists (output simplified)
+ tapply() for vectors
+ Write own function:

```R
is.special <- function(x){
if (is.numeric(x)) (is.infinite(x) | is.nan(x))
}

## apply this function to the data frame.

sapply(df, is.special)
```










