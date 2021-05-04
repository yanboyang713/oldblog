# Getting Started with R language

## Summary
This course will get you started with learning R and using the RStudio IDE. The course will cover installation of R and RStudio and using RStudio’s basic features and the basics of R programming.

## Learning Objectives
By the end of this course, you will have covered the following:

+ Installing R and RStudio
+ An overview of the RStudio interface
+ Basic programming in R

## Why we learn R
In this blog, you won’t learn anything about Excel, SPSS, SQL, SAS, Python, Julia, or any other statistical package/programming language useful for data preprocessing. This isn’t because I think that these tools are bad or redundant. They’re not. In practice, most data analytics teams use a mixture of these tools and programming languages. I strongly believe that R is a great place to start your data analysis journey as it is a comprehensive language for data analysis. You can use R effectively in almost each step of data analysis, from data collection to reporting. You can collect, preprocess, visualise and analyse your data using R functions, report and publish your findings using RMarkdown.

Since any typical data preprocessing actions like missing value imputation or outlier handling obviously influence the results of statistical analyses, data preprocessing should be viewed as a statistical operation and should be performed in a reproducible way. The R software provides us a good environment for reproducible data preprocessing as all actions can be scripted and therefore reproduced.

There are many reasons why R is a good solution for the problems that are covered in this course. According to Munzert et al. (2014), the most important points are:

+ R is freely and easily accessible. You can download, install, and use it wherever and whenever you want.

+ For a software environment with a primarily statistical focus, R has a large community that continues to flourish. R is used by various disciplines, such as social scientists, medical scientists, psychologists, biologists, geographers, linguists, and in business.

+ R is open source. This means that you can easily retrace how functions work and modify them with little effort.

+ R is reasonably fast in ordinary tasks.

+ R is powerful in creating data visualizations. Although this not an obvious plus for data collection, you would not want to miss R’s graphics facilities in your daily workflow.

+ Work in R is mainly command line based. This might sound like a disadvantage to R rookies, but it is the only way to allow to produce reproducible results compared to point-and-click programs.

+ R is not picky about operating systems. It can generally be run under Windows, Mac OS, and Linux.

Finally, R is the entire package from start to finish.

## Installion - Prerequisite
RStudio is an integrated development environment (IDE) for R. It will allow you to use R in a more efficient manner. RStudio provides the user with a streamlined user interface and access to many powerful tools to make working with R more efficient.

There are two versions of RStudio:
1. RStudio Desktop (Run RStudio on your desktop)
2. RStudio Server (Centralize access and computation) - Recommendation

RStudio server offers a free version and Pro version, which comes at a cost, adds many useful advanced features including real-time collaboration. However, I think free version is totally enought for us.

I recommend you launching RStudio Server in Docker. The link at the below.
{% post_link rstudio %}A

Once installed, load RStudio. RStudio is an integrated development environment (IDE) for R. It will allow you to use R in a more efficient manner. RStudio provides the user with a streamlined user interface and access to many powerful tools to make working with R more efficient.

## An Overview of the RStudio Interface
The videos provide a run-down of basic and most important features of the RStudio Interface.

{% youtube JlkKGDHUKeY %}

### Basic Scripts
Scripts are plain text files, with the .R extension, which acts as recipe book for your R code. You can type and edit your code in the script file and then issue parts or all of your code to the R console to be executed. You can create a new script in RStudio by going to File –> New File –> R Script. Ensure you save and name your script so you can come back to it later.

{% youtube 5T82DS5xLRo %}

### Projects
RStudio Projects associate all your files with a common directory (e.g. scripts and data). When you exit or change projects the environment variables are saved so you can come back to your project later without having to re-run all your code. Projects are the best way to organise your R files.

{% youtube mH-FLEO-TcQ %}

## Programming Basics
In the following sections you will learn the basics of programming in R. If you haven’t programmed before, now is a great opportunity to start. Fortunately, R is fairly intuitive to learn. We will start with the fundamentals for now and get heaps of practice. Its a great skill to possess and can even be a lot of fun if you like problem solving. Let’s get started.

### How to read these notes
The following code box refers to commands submitted to the console. You can copy this code directly and paste it into a script of run it directly from the RStudio console.

```R
x <- c(1,2,3,4,5,6,7,8,9,10)
mean(x)
```
The following code box refers to output produced by the console:
```console
### [1] 5
```

### Code, Commands and Syntax
We get R to do stuff by running commands from our script files or by typing directly into the R Console. Commands can be a whole range of different things, like basic arithmetic, loading data, producing plots or running statistical functions. To issue commands to R, we write code. The code we write is governed by “syntax” or a set of rules used by a programming language. If we don’t use the right syntax, we will get an error. You will make heaps of errors when you’re learning to use R. Don’t worry about it. Its a normal part of learning. Let’s start looking at the basics of R syntax.

#### Case Sensitivity
R is case sensitive so “A” and “a” are two different characters.

```R
x <- "A" # Assign x as "A"
y <- "a" # Assign y as "a"

##Does x = y?
x == y
```
```console
### [1] FALSE
```

#### Command Separation and Grouping
Commands are separated using a new line:

```R
x <- rnorm(10000,0,1) # Randomly generate 10,000 normally distributed values

mean(x) #Calculate the mean of x
```

```console
### [1] -0.01520157
```

```R
sd(x) #Calculate the standard deviation of x
```

```
### [1] 0.9937938
```
…or row, or by using a semi-colon “;”

```R
mean(x); sd(x)
```

```
### [1] -0.01520157
### [1] 0.9937938
```

#### Comments
Use # to add comments to your code. Any code proceeding the # symbol is ignored by the console. Comments are useful to remind yourself and others what your code does. Get into the habit of commenting. Look back at the previous code chunks to see examples of commenting.

#### Objects and Object Assignment
R objects can be variables, values, datasets, text or functions. R Studio lists the objects in the Environment window (top right). Stored objects are saved to the R session and can be recalled at any time by typing the object’s name in the console. For example, the following codes assign the value of the mean of x to an object named “m”. We use “<-” to make an assignment. You can also use the “=” symbol, but this should be avoided because it may be confused with the equals sign used as a logical operator. The RStudio keyboard shortcut for writing “<-” is to hit the ALT and “-” key.

```R
m<-mean(x) #Assign the mean of x to variable m
##Print the mean of x
m
```

```console
### [1] -0.01520157
```

#### Vectors
A vector is a simple sequence of stored data. We can store a simple dataset in a vector using the c() function. For example, let’s say we have five random peoples’ heights (cm): 166, 177, 164, 167, 177. We can store them in a vector, named “heights” to make it easy to do statistical calculations.

```R
heights<-c(166, 177, 164, 167, 177) 
mean(heights) #Calculate the mean height of the sample 
```

```console
### [1] 170.2
```

```R
sd(heights) #Calculate the standard deviation of the sample's heights
```

```console
### [1] 6.300794
```

Shortly you will learn to store datasets as data frame objects which is an even more powerful way to work with data.

#### Functions
Functions are the workhorse of R. R has many built in functions that do a whole host of different things. R’s functionality can be greatly enhanced by installing packages (see below). You will learn to use a whole range of different functions as the course unfolds. This course has already introduced a number of very useful statistical functions. Recall the use of mean(), sd() and hist().

#### Packages - Installation and Loading
Packages are compilations of functions. For example, the ggplot2 packages provide access to functions designed to create beautiful graphs. Packages are why R is so powerful. Most statisticians develop packages to freely implement their cutting edge statistical methods that are not available in commercial packages. Others develop packages to fill the many gaps of commercial packages. There are an overwhelming number of packages available on the [Comprehensive R Archive Network (CRAN)](https://cran.r-project.org/), as well as other unofficial packages (many available from [GitHub](https://github.com/). As of Nov 2016, the CRAN website listed 9,535 available packages!

Packages can be installed through RStudio by going to Tools –> Install Packages. You will need to know the name of the package you want to install. The following video shows an example of installing the ggplot2 package which will be introduced in Course 2. Most packages require other packages to be installed to function properly. These are called dependencies. If these are missing when you try to install a new package, they will be installed by default. As you will discover, ggplot2 has many dependencies.

{% youtube KmEJGNl2uKg %}

Alternatively, you can use the **install.packages()** function:

```R
install.packages("ggplot2")
```

After installing the package, you need to load it before you can access its functions. This is easy in RStudio. Select the Packages tab in the bottom right corner and tick the box next to the package name. RStudio will load the package. You need to load packages each time you start a new session. If you work from a different computer, you will need to install the package as well.

Alternatively, you can use either of the following functions to load an installed package:

```R
library(ggplot2)
require(ggplot2)
```

#### Mathematical Operations
R can be used to do all types of mathematics. Try the following code to get an idea of basic operations.

```R
## Addition
7 + 4
```

```console
### [1] 11
```

```R
## Subtraction
7 - 4
```

```console
### [1] 3
```

```R
## Multiplication
7 * 4
```

```console
### [1] 28
```

```R
## Division
4/7
```

```console
### [1] 0.5714286
```

```R
## Square root
sqrt(9)
```

```console
### [1] 3
```

```R
## Power
9^2
```

```console
### [1] 81
```

```R
## Natural logarithm
log(2.718) 
```

```console
### [1] 0.9998963
```

```R
## Exponent 
exp(1)
```

```console
### [1] 2.718282
```

#### Logical Operators
The following table explains the logical operators used in R. These operators are used for many different reasons. For example, sub-setting your data, filtering out particular values, or checking if certain conditions are true or false, or counting specific values. You will learn more as you progress.

```R
## Less than
4 < 5
```

```console
### [1] TRUE
```

```R
## Greater than
5 > 4
```

```console
### [1] TRUE
```

```R
## Equal to or less than
5 <= 5
```

```console
### [1] TRUE
```

```R
## Equal to or greater than
5 >= 4
```

```console
### [1] TRUE
```

```R
## Equal  to
5 == 4
```

```console
### [1] FALSE
```

```R
## Not equal to
5 != 4
```

```console
### [1] TRUE
```

```R
## and
5 == 5 & 4 == 4
```

```console
### [1] TRUE
```

```R
## or
5 == 5 | 4 == 3
```

```console
### [1] TRUE
```

```R
## Not
x <- c(0,1,2,3,4,5)
!x==4
```

```console
### [1]  TRUE  TRUE  TRUE  TRUE FALSE  TRUE
```

#### Missing Values
When missing values are present in datasets, R represents them using NA (not available). NaN represents impossible values, such as dividing 1/0. Sometimes missing values can cause errors. For example:

```R
heights<-c(166, 177, 164, 167, NA) #Note missing value
mean(heights) #Calculate the mean height of the sample, ERROR!
```

```console
### [1] NA
```

Sometimes we need to tell R how to deal with the missing values…

```R
mean(heights, na.rm=TRUE) #Calculate the mean height of the sample, removing missing values
```

```console
### [1] 168.5
```

The na.rm=TRUE option tells R to remove missing values from the mean() function.

#### Characters
Character variables or “string” variables are usually associated with categorical or nominal variables, but may also refer to labels, plot titles and other types of textual input. When characters or text strings are used in R, they must be enclosed in quotation marks.

```R
Gender<-c(male,female) #Create a character vector, ERROR!
```

```console
### Error in eval(expr, envir, enclos): object 'male' not found
```

```R
Gender<-c("male","female") #Create a character vector, fixed...
```
If you don’t enclose in quotation marks, R thinks you’re referring to an object.

#### Pipes
In recent years, the clarity of R coding has been substantially improved with the introduction of the magrittr package. This package overcomes the cumbersome nested coding typically required to join multiple functions. For example, the following “traditional” code performs the following computations:

+ Generate 1000 data data points from a uniform distribution between 0 and 1
+ Log transform the data
+ Plot histogram of resulting distribution

```R
hist(log(runif(1000,0,1)))
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1614924412/MATH1324/ModelOne/pipes1_h0mzq5.png)

As you can see, the functions hist(), log() and runif() are nested within each other. There are lots of side-by-side parentheses, which give you a headache when trying to identify errors. You have to read the code backwards to understand the order in which these functions are applied. This might be OK for three functions, but statistical computations gets a lot more complex.

In order to improve the readability of this code, we can use the pipeline or “pipe”" operator %>% from the magrittr package, hit Ctrl + shift + m in RStudio as a shortcut, to link these functions together in the order of their computation. When you see %>% think of the word “then”. For example, runif() then log() then hist():

```R
library(magrittr)
runif(1000, 0, 1) %>% log() %>% hist()
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1614924412/MATH1324/ModelOne/pipes1_h0mzq5.png)

I think most people will agree that this code is easier to read. However, the “traditional” nested code is absolutely acceptable and you will come across both styles.

Pipes are really powerful when paired with compatible packages such as dplyr (covered in Course 2).

So what is really going on? Essentially, the pipe operating passes a preceding function as the first argument to the following function. Therefore, the following two lines of code are equivalent:

```R
log(4)
```

```console
### [1] 1.386294
```

```R
4 %>% log()
```

```console
### [1] 1.386294
```

Pipes work best when functions are optimised to take the first argument from a preceding function. However, preceding functions can still be passed to second, third or fourth arguments quite easily using a .. For example, the rnorm() function can be used to generate normally distributed data. The first argument is always the number of values to generate and the second and third values are the population mean and standard deviation, rnorm(x, mu, sd). Let’s say we want to pass a value of 15 to the third argument using a pipe. This is how we would do it:

```R
sd <- 15
sd %>% rnorm(100,100,.) %>% hist()
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1614924412/MATH1324/ModelOne/pipes2_dy6cf9.png)

Or, if we want to pass a value of 10 as the mean:

```R
x <- 10
x %>% rnorm(100,.,15) %>% hist()
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1614924412/MATH1324/ModelOne/pipes3_usuyip.png)

The **.** pipes the preceding function to the required argument.

As the use of pipes has spread like a virus for R coding, this course will predominantly use pipes. However, you will also come across the more traditional nested code from time to time. A proficient use of R will need to understand both styles.

#### Getting Help
If you ever forget how to use a function, you can bring up the help file in RStudio using the help() function,

```R
help(mean)
```

This will display the help files associated with the mean() function. You can also browse the help files in the RStudio Help tab (Bottom right window).

Sometimes the help files aren’t much help and what you really need to see are some examples. Use Google instead.

#### Data Frames
R has many different types of objects capable of storing data. These include objects such as vectors: **c()**, lists: **list()**, matrices: **matrix()**, tables: **table()** and data frames: **data.frame()**. Data frames are by far the most versatile and easy to work with. Let’s take a look at a quick example of how R builds a data frame. We start with toy dataset comprise of an ID, Group and Score variable. The data are in a tidy format. We can create a series of vectors, c(), that store the data for each column.

```R
x <- c(1,2,3,4,5,6,7,8,9,10)
y <- c("A","A","A","A","A","B","B","B","B","B")
z <- c(-0.88,1.11,0.69,0.92,0.41,0.24,-0.47,-0.30,1.22,-1.59)
```

Now we can build the dataset by assigning data.frame() to an object named df.

```R
df <- data.frame(ID = x, Group = y, Score = z)
```

We build the header row by assigning variables names as ID = or Group =. This is what the data.frame() will look like:
```console
### # A tibble: 10 x 3
###       ID Group Score
###    <dbl> <fct> <dbl>
###  1     1 A     -0.88
###  2     2 A      1.11
###  3     3 A      0.69
###  4     4 A      0.92
###  5     5 A      0.41
###  6     6 B      0.24
###  7     7 B     -0.47
###  8     8 B     -0.3 
###  9     9 B      1.22
### 10    10 B     -1.59
```

Data frames are easy to work with and also recognise matrix commands.

```R
##Select a variable
df$Score
```

```console
###  [1] -0.88  1.11  0.69  0.92  0.41  0.24 -0.47 -0.30  1.22 -1.59
```

```R
##Select a variable using matrix code
df[,2]
```

```console
### # A tibble: 10 x 1
###    Group
###    <fct>
###  1 A    
###  2 A    
###  3 A    
###  4 A    
###  5 A    
###  6 B    
###  7 B    
###  8 B    
###  9 B    
### 10 B
```

```R
##Select a specific row
df[ID == 5,]
```

```console
### # A tibble: 1 x 3
###      ID Group Score
###   <dbl> <fct> <dbl>
### 1     5 A      0.41
```

Data imported into R defaults to data.frames. Data frames can also be readily converted to other object types. The best data manipulation packages also assume you are using data frames.

#### Importing and Exporting Data
The following slides will take your through the process of importing a .csvdataset into R using RStudio. RStudio also allows you to open data stored in a wide range of file types including Excel, SPSS, SAS and Stata. All datasets must follow the Tidy Data rules.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615203956/Rlanguage/ImportingData-1_idhbwu.png)

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615203957/Rlanguage/ImportingData-2_scc5pd.png)

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615203958/Rlanguage/ImportingData-3_uo6hs1.png)

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615203958/Rlanguage/ImportingData-4_ibvifw.png)

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615203958/Rlanguage/ImportingData-5_kcyq6k.png)

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615203958/Rlanguage/ImportingData-6_prwiqn.png)

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615203959/Rlanguage/ImportingData-7_dkskmf.png)

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615203958/Rlanguage/ImportingData-8_kjjjis.png)

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615203958/Rlanguage/ImportingData-9_wuaell.png)

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615203959/Rlanguage/ImportingData-10_kdxaiw.png)

You can also import data directly using code. The code depends on the type of dataset being imported. To import a .csv file we can use the **read.csv()** function. You may need to provide a direct path to your .csv file depending on where it is located. For example…

```R
Bicycle <- read.csv("C:/OneDrive/Data Repository/Bicycle.csv")
```

Note the use of forward slashes. If you are working from an RStudio Project and the dataset is located in the project folder, the code changes to…

```R
Bicycle <- read.csv("Bicycle.csv")
```

This is one of the major advantages of using projects. When you move to another computer, the relative path will still work.

If the file was tab delimited, txt, we can change to the more general **read.table()** function. We have to instruct R how the dataset is delimited using sep = and also to treat the first row of data as the header row, header = TRUE.

```R
Bicycle <- read.table("Bicycle.txt", header = TRUE, sep = "\t")
```

If the data was in Excel format, we can use the readxl package.

```R
library(readxl)
Bicycle <- read_excel("Bicycle.xls")
```

Once again, the dataset must be in a Tidy Data format for these importation methods to work. If these methods fail, re-check your data.

If the importation is successful, you can use the View() function or click on the dataset object name

Sometimes you need to get data out of R. You can use the write.table function for this purpose.

```R
write.table(df, file = "experiment.csv", sep = ",", col.names = TRUE, row.names = FALSE)
```

**col.names** ensures a header row is included, **row.names** suppressed the printing of row numbers (you don’t tend to need this) and sep determines the file type, in this example comma-delimited. The file argument names and locates where the file will be saved.

There are also shortcut functions for common data file types:

```R
write.csv(df, file = "experiment.csv")
```

#### Factors
##### Assigning Factors
Categorical variables (qualitative, nominal and ordinal) are referred to as Factors in R. Factors are comprised of levels. For example, the factor **DS_LOCATION** has 34 levels corresponding to 34 different survey sites.

```R
Bicycle$DS_LOCATION %>% levels()
```

```console
###  [1] "(BIKE LANE)BRIGHTON RD N BD 50M S OF MOZART ST"                                  
###  [2] "(BIKE LANE)BRIGHTON RD S BD 50M N OF DICKENS ST"                                 
###  [3] "(BIKE LANE)FLEMINGTON RD NW BD 10M SE OF DRYBURGH ST"                            
###  [4] "(BIKE LANE)FLEMINGTON RD SE BD 25M NW OF ABBOTSFORD ST"                          
###  [5] "(BIKE LANE)ROYAL PDE N BD 10M N OF GATEHOUSE ST"                                 
###  [6] "(BIKE LANE)ROYAL PDE S BD 20M S OF GATEHOUSE ST"                                 
###  [7] "(BIKE LANE)ST. KILDA RD N BD 25M N OF CONVENTRY ST"                              
###  [8] "(BIKE LANE)ST. KILDA RD S BD 30M S OF ANZAC AVE"                                 
###  [9] "(BIKE PATH)ANN TRAIL NO:1 2WAY 104M SOUTH OF OF WHITEHORSE RD"                   
### [10] "(BIKE PATH)ANN TRAIL NO:2 2WAY 300M EAST OF PRINCESS ST"                         
### [11] "(BIKE PATH)BAY TRAIL 2WAY 100M N BLESSINGTON ST OPP NO 20 MARINE PDE"            
### [12] "(BIKE PATH)CANNING ST 2WAY PRINCESS ST OUTSIDE DAN O'CONNELL"                    
### [13] "(BIKE PATH)CAPITAL CITY TRAIL 2WAY 25M W OF BOWEN CRES"                          
### [14] "(BIKE PATH)CAPITAL CITY TRAIL 2WAY FOOTSCRAY RD SE OF EXIT RAMP FROM CITY LINK"  
### [15] "(BIKE PATH)GARDINERS CREEK TRAIL 2WAY 66M W OF CITYLINK OVERPASS"                
### [16] "(BIKE PATH)GARDNERS CREEK TRAIL NO.2 2WAY ADJ ESTELLA ST"                        
### [17] "(BIKE PATH)KOONUNG TRAIL 2WAY 44M NE OF CLIFTON ST"                              
### [18] "(BIKE PATH)MAIN YARRA TRAIL NO:1 2WAY ALONG YARRA BVD 66M W OF OF C'LINK OPASS"  
### [19] "(BIKE PATH)NORTH BANK 2WAY 14M E OF MORRELL BRIDGE OF ADJACENT TO PUNT RD O"     
### [20] "(BIKE PATH)NORTH BANK 2WAY 75M W OF MORELL BRIDGE ADJACENT TO PUNT RD OVERPASS"  
### [21] "(BIKE PATH)SCOTCHMANS CREEK TRAIL 52M E OF 61 SMYTH ST"                          
### [22] "(BIKE PATH)SOUTH BANK 2WAY UNDER PUNT RD BRIDGE"                                 
### [23] "(BIKE PATH)ST. GEORGES RD 2WAY 28M S OF SUMNER AV"                               
### [24] "(BIKE PATH)ST. GEORGES RD NO.2 2W N OF BELL ST"                                  
### [25] "(BIKE PATH)ST. GEORGES ST 2WAY 50M S OF HAWTHORN RD TEST SITE"                   
### [26] "(BIKE PATH)TRAM 109 TRAIL 2WAY 10M NE OF ACCESS PATH CNR WOODGATE & BOUNDARY STS"
### [27] "(BIKE PATH)UPFIELD RAILWAY LIN 2WAY 10M S OF PARK ST"                            
### [28] "(BIKELANE) ALBERT ST EB 50M E OF MORRISON PL"                                    
### [29] "(BIKELANE) ALBERT ST WB 50M W OF LANSDOWN ST"                                    
### [30] "(BIKEPATH) FEDERATION TRAIL 170M SE OF PRINCESS HWY BTW CYPRESS AV & CONIFER AV" 
### [31] "(BIKEPATH) MERRIE CREEK TRAIL 2WAY S OF MORELAND RD"                             
### [32] "(BIKEPATH) MORELAND ST PATH 2WAY 50 M N OF PARKER ST"                            
### [33] "(BIKEPATH) NAPIER ST PATH 2WAY 100M N OF GREEVES ST"                             
### [34] "(BIKEPATH) PHILLIP ISLAND RD PATH BTW BUNVEGAN CR & GLEN ST"
```

Sometimes R imports data without knowing what it really means. For example, **NB_TRAFFIC_SURVEY** has been imported as an integer, **int**.

```R
Bicycle$NB_TRAFFIC_SURVEY %>% class()
```

```console
### [1] "integer"
```

However, this variable corresponds to a survey identifier, or nominal variable. The nominal scale of this variable is not meaningful, in the same way as a credit card number. We cannot meaningfully apply mathematical operations. We can tell R to treat this variable as a factor using the following code:

```R
Bicycle$NB_TRAFFIC_SURVEY <- Bicycle$NB_TRAFFIC_SURVEY %>% as.factor()
Bicycle$NB_TRAFFIC_SURVEY %>% class
```

```console
### [1] "factor"
```

The first part of the code selects the Bicycle object and we use the $ sign to signal the selection of a variable, in this case **NB_Traffic_Survey**. We then instruct R to copy over this variable using the same values from **Bicycle$NB_TRAFFIC_SURVEY** columns, but as a factor, using the as.factor() function. If you’re successful, the **NB_TRAFFIC_SURVEY** variable will be updated as a Factor with 29 levels. Now R will treat this variable as a numeric label and not a meaningful integer.

R will convert factors to numeric levels based on numeric/alphabetical order. Let’s consider the **day** variable:

```R
levels(Bicycle$day)
```

```console
### [1] "Fri" "Mon" "Sat" "Sun" "Thu" "Tue" "Wed"
```

So, R will treat Fri = 1, Mon = 2, Sat = 3 etc. This isn’t good and this is why you need to pay careful attention to factors in your dataset.

##### Re-order Factor
We can reorder factor levels using the factor() function. Here’s how:

```R
Bicycle$day <- Bicycle$day %>%  factor(
  levels=c('Sun','Mon','Tue','Wed','Thu','Fri','Sat'),
  ordered=TRUE)
Bicycle$day %>% levels
```

```console
### [1] "Sun" "Mon" "Tue" "Wed" "Thu" "Fri" "Sat"
```

So, Sun = 1, Mon = 2, etc. Nice work. The ordered = TRUE option ensures the ordering of days is meaningful.

We can also use the extremely useful functions for dealing with factors from the forcats package. For example, if we wanted Monday first:

```R
library(forcats)
Bicycle$day <- Bicycle$day %>% fct_relevel('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
Bicycle$day %>% levels
```

```console
### [1] "Mon" "Tue" "Wed" "Thu" "Fri" "Sat" "Sun"
```

##### Assigning Labels
Sometimes we need to assign different labels to factors. Let’s look at the weekend variable. This is a logical/binary variable where **TRUE** indicates a Saturday or Sunday observation, otherwise for weekdays it’s **FALSE**. Let’s change this variable to a more descriptive version using base code.

```R
Bicycle$weekend <- Bicycle$weekend %>% as.factor
Bicycle$weekend %>% levels
```

```console
### [1] "FALSE" "TRUE"
```

```R
Bicycle$weekend <- Bicycle$weekend %>% factor(levels = c("FALSE","TRUE"), 
                                              labels=c("Weekday","Weekend"))
Bicycle$weekend %>% levels
```

```console
### [1] "Weekday" "Weekend"
```

Had we used the forcats package instead (don’t run this code if you ran the previous):

```R
Bicycle$weekend <- Bicycle$weekend %>% as.factor
Bicycle$weekend <- Bicycle$weekend %>% fct_recode("Weekend" = "TRUE", 
                                                  "Weekday"  = "FALSE")
```

You can see how fct_recode does not require levels to be specified.

#### Converting Numeric Values to Factors
Sometimes we need to store numeric values as factors. Let’s look at the Quarter variable. This variable records the quarter of year as 1, 2, 3, or 4. Let’s convert this variable to a factor and label the factor accordingly.

```R
Bicycle$Quarter <- Bicycle$Quarter %>% factor(levels=c(1,2,3,4),
    labels=c("1st Quarter","2nd Quarter","3rd Quarter", "4th Quarter"),
    ordered = TRUE)
```

Levels refer to the numeric values defining each quarter. Labels define a descriptive label for each level. Order ensures R treats the factor as an ordinal variable.

#### Filtering and Sub-setting Data
We will use the powerful and intuitive functions from the dplyr package to demonstrate sub-setting and filtering data. This is one of the most common data manipulation techniques that you need to master.

For example, you might want to select and analyse only the data pertaining to summer. We can use the filter() function from the dplyr package for this purpose:

```R
library(dplyr)
Bicycle_Summer <- Bicycle %>% filter(Season == "Summer")
Bicycle_Summer$Season %>% summary
```

```console
### Autumn Spring Summer Winter 
###      0      0  13757      0
```

This code will create a new data frame object, called **Bicycle_Summer** by selecting only the cases where season is equal to “Summer”. Note the use of the logical operator “==”, which means “equal to”.

We can quickly build more complete filters by joining logical operators. This time, let’s select observations from summer and spring:

```R
Bicycle_Summer_Spring <- Bicycle %>% filter(Season=="Summer" | Season =="Spring")

## Check

Bicycle_Summer_Spring$Season %>% summary
```

```console
### Autumn Spring Summer Winter 
###      0  15254  13757      0
```

**Note** the use of the “|” logical operator which means “or”.

We can also add more complex filters by referring to other variables. The following code selects all observations from Summer or Spring after the Year 2009.

```R
Bicycle_Summer_Spring_2009 <- Bicycle %>% filter((Season=="Summer" | Season =="Spring")
                                                 & NB_YEAR >= 2009)
```

Here is a frequency table of the original and filtered datasets

```R
table(Bicycle$Season, Bicycle$NB_YEAR)
```

```console
###         
###          2005 2006 2007 2008 2009 2010 2011 2012 2013
###   Autumn   14 1028 1480 1566 1781 1557 2457 3317    0
###   Spring   40 1335 1508 1815 1597 1671 3697 3591    0
###   Summer  238 1244 1472 1578 1669 1671 2574 3059  252
###   Winter   20 1020 1518 1868 1643 1765 3592 3366    0
```

```R
## Check

table(Bicycle_Summer_Spring_2009$Season, Bicycle_Summer_Spring_2009$NB_YEAR)
```

```console
###         
###          2009 2010 2011 2012 2013
###   Autumn    0    0    0    0    0
###   Spring 1597 1671 3697 3591    0
###   Summer 1669 1671 2574 3059  252
###   Winter    0    0    0    0    0
```

Always confirm your filter by checking the new data frame object.

#### Adding New Variables
You can create new variables in a dataset by recoding or manipulating existing variables. For example, if we did not have the **weekend** variable, we could use the **day** variable to create it. There are many ways to do this. We will take a look at using **fct_recode** function to do this quickly. To add a new variable, we assign a new variable name to the **data.frame**:

```R
Bicycle$New_weekday_variable <- Bicycle$day %>% fct_recode("weekday" = "Mon",
                                                           "weekday" = "Tue",
                                                           "weekday" = "Wed",
                                                           "weekday" = "Thu",
                                                           "weekday" = "Fri",
                                                           "weekend" = "Sat",
                                                           "weekend" = "Sun")

## Check

table(Bicycle$New_weekday_variable, Bicycle$day)
```

```console
###          
###            Mon  Tue  Wed  Thu  Fri  Sat  Sun
###   weekday 8109 8125 8131 8087 8098    0    0
###   weekend    0    0    0    0    0 8267 8186
```

You can also add new variables as transformation of existing variables. For example we can create a total “peak” proportion tragic variable by adding the **CT_VOLUME_AMPEAK** and **CT_VOLUME_PM_PEAK** values and dividing by **CT_VOLUME_24HOUR**. Or…

Peak=\frac{AM Peak + PM Peak}{24 Total}

This variable will tell us the proportion of daily traffic that occurred during morning and evening peak times.

We can use **mutate()** function from the **dplyr** package.

```R
Bicycle <- Bicycle %>% mutate(peak = (CT_VOLUME_AMPEAK + CT_VOLUME_PMPEAK)/CT_VOLUME_24HOUR)
```

Why use **mutate**? If we didn’t this is how the code would look.

```R
Bicycle$peak <- (Bicycle$CT_VOLUME_AMPEAK + Bicycle$CT_VOLUME_PMPEAK)/Bicycle$CT_VOLUME_24HOUR
```

The constant reference to the **Bicycle** data object seems redundant.

You can read more about the advantages of using the **dplyr** package [here](https://cran.r-project.org/web/packages/dplyr/vignettes/dplyr.html).

#### Selecing Variables
Sometimes we want to narrow the focus of our dataset by considering only a subset of variables. For example, in the **bicycle** dataset we might need to extract only the location, date and 24 hour traffic volume variables. We can achieve this using the **select()** function from the **dplyr** package.

```R
Bicycle_volume <- Bicycle %>% dplyr::select(Sort.Des, DT_ANALYSIS_SUMMARY, CT_VOLUME_24HOUR)
Bicycle_volume %>% head()
```

```console
### # A tibble: 6 x 3
###   Sort.Des                    DT_ANALYSIS_SUMMARY CT_VOLUME_24HOUR
###   <fct>                       <fct>                          <int>
### 1 St Georges St Hawthorn      09/06/2007                       480
### 2 Flemington Rd NW Bound Lane 17/03/2008                       654
### 3 Flemington Rd NW Bound Lane 19/03/2008                       794
### 4 Flemington Rd NW Bound Lane 20/03/2008                       732
### 5 Flemington Rd NW Bound Lane 21/03/2008                       221
### 6 Flemington Rd NW Bound Lane 22/03/2008                       271
```

#### Ordering Datasets
Ordering a dataset facilitate easy searching and be necessary for certain statistical functions. To order a dataset we can use the **arrange()** function from the dplyr package. Let’s order the bicycle dataset by **Sort.Des**, **NB_YEAR** and **NB_MONTH**.

```R
Bicycle_sorted <- Bicycle %>% arrange(Sort.Des,NB_YEAR,NB_MONTH)
Bicycle_sorted %>% head()
```

```console
### # A tibble: 6 x 25
###   Unique_ID NB_TRAFFIC_SURV~ NB_LOCATION_TRA~ Sort.Des DS_LOCATION
###       <int> <fct>                       <int> <fct>    <fct>      
### 1     17386 9316                            1 Albert ~ (BIKELANE)~
### 2     17387 9316                            1 Albert ~ (BIKELANE)~
### 3     17388 9316                            1 Albert ~ (BIKELANE)~
### 4     17389 9316                            1 Albert ~ (BIKELANE)~
### 5     17390 9316                            1 Albert ~ (BIKELANE)~
### 6     17391 9316                            1 Albert ~ (BIKELANE)~
### # ... with 20 more variables: DT_ANALYSIS_SUMMARY <fct>, NB_YEAR <int>,
### #   NB_MONTH <int>, NB_WEEKDAY_NONHOL_QTR <int>, CT_VOLUME_AMPEAK <int>,
### #   CT_VOLUME_PMPEAK <int>, CT_VOLUME_4HOUR_OFFPEAK <int>,
### #   CT_VOLUME_12HOUR <int>, CT_VOLUME_24HOUR <int>, DS_HOLIDAY <fct>,
### #   NB_SEASONALITY_PERIOD <int>, NB_TYPE_PERIOD <int>, Primary <lgl>,
### #   weekend <fct>, Quarter <ord>, Season <fct>, Cyclying.Season <fct>,
### #   day <ord>, New_weekday_variable <ord>, peak <dbl>
```

#### Working with Dates and Times
Working with dates and times in R can be a little tricky, however, with the use of some useful packages and functions things can remain relatively straight forward. Let’s take a look at the **DT_ANALYSIS_SUMMARY** variable.

```R
Bicycle$DT_ANALYSIS_SUMMARY %>% class
```

```console
### [1] "factor"
```
This is wrong because the values refer to dates:

```R
Bicycle$DT_ANALYSIS_SUMMARY %>% head
```

```console
### [1] 09/06/2007 17/03/2008 19/03/2008 20/03/2008 21/03/2008 22/03/2008
### 2637 Levels: 01/01/2006 01/01/2007 01/01/2008 01/01/2009 ... Thursday, 24 February 2011
```

The dates are in dd/mm/yyyy. The lubridate package provides a powerful set of functions for working with dates. Let’s fix the **DT_ANALYSIS_SUMMARY** variable.

```R
library(lubridate)
Bicycle$DT_ANALYSIS_SUMMARY <- Bicycle$DT_ANALYSIS_SUMMARY %>% dmy
Bicycle$DT_ANALYSIS_SUMMARY %>%  class
```

```console
### [1] "Date"
```

Excellent. As you can see, the dmy() function tells R the format of the date according to dd/mm/yyyy. You can use other combination like ymd, mdy, etc.

You can also apply other useful functions to extract important information once the data class has been applied. Check out the following:

```R
## Extract day or week

Bicycle$DT_ANALYSIS_SUMMARY %>% wday(label = TRUE) %>%  head
```

```console
### [1] Sat Mon Wed Thu Fri Sat
### Levels: Sun < Mon < Tue < Wed < Thu < Fri < Sat
```

```R
## Extract month

Bicycle$DT_ANALYSIS_SUMMARY %>% month(label = TRUE) %>%  head
```

```console
### [1] Jun Mar Mar Mar Mar Mar
### 12 Levels: Jan < Feb < Mar < Apr < May < Jun < Jul < Aug < Sep < ... < Dec
```

```R
## Extract year

Bicycle$DT_ANALYSIS_SUMMARY %>% year %>%  head
```

```console
### [1] 2007 2008 2008 2008 2008 2008
```

**lubridate** is also excellent at handling time. For example, let’s consider the following top 5, marathon times in a common **hh:mm:ss** format.

```R
times <- c("02:02:57","02:03:03","02:03:05","02:03:13","02:03:13")
times %>% class
```

```console
### [1] "character"
```

Now we can convert them to time format:

```R
times <- times %>% hms
times %>% class
```

```console
### [1] "Period"
### attr(,"package")
### [1] "lubridate"
```

We can do a wide range of useful transformations of time once we have the data in a time format.

```R
## Extract seconds
times %>% second
```

```console
### [1] 57  3  5 13 13
```

```R
## Extract minutes

times %>% minute
```

```console
### [1] 2 3 3 3 3
```

```R
## Convert to seconds

times %>% seconds
```

```console
### [1] "7377S" "7383S" "7385S" "7393S" "7393S"
```

```R
## Calculate difference between top two times in seconds

times[2] %>% seconds - times[1] %>% seconds
```

```console
### [1] "6S"
```

## R Markdown
This section will introduce you to the basics of R Markdown and RStudio Notebooks. These documents enable you to create professional and reproducible reports through RStudio.

### Learning Objectives
By the end of this section, you will have completed the following:

+ Understand the importance of reproducibility and the role of R Markdown.
+ Install and create an R Markdown document in RStudio.
+ Knit/preview and save an R Markdown document in HTML or PDF.
+ Use basic R Markdown syntax to create reproducible reports.
+ Know where to find further information for using R Markdown.

### Reproducibility
Your statistical analysis must be reproducible, not only for yourself, but more importantly for others. Each stage of your analysis must be documented and explainable to others. The ultimate test of reproducibility is to give someone your R Markdown file and data and for them to replicate all of your analysis by running it through R. In practice, things are never this simple, but that’s certainly the goal we should have in mind.

### Creating an R Markdown Document in R Studio
In RStudio go to File –> New File –> R Notebook. You could also select R Markdown (R Notebooks are a type of Markdown file), but for this section, we will stick to the Notebook output type. Allow RStudio to install or update any necessary packages. If you have trouble, run the following installation which will force all the required packages to also install:

```R
install.packages("rmarkdown")
```

A new notebook will appear in the RStudio script window. This usually forces your console window to disappear, so don’t worry. As we will discover, we won’t need it.
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615315169/Rmarkdown/Rmarkdown1_xczc3x.png)

Save your Notebook. It will save with an **.Rmd** extension which tells you it is an R Markdown file. The template includes some basic examples of R Markdown.
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615315233/Rmarkdown/Rmarkdown2_kuekks.png)

An RStudio Notebook, or any other R Markdown file, can be both published, e.g. as a HTML, or run like an ordinary R script file. Most of the file looks like a word document. The screenshot above shows the R Notebook template included when you create a new R Notebook. The first paragraph is descriptive text. However, you can also see R code. R code is written in “Chunks”. You can see the R code chunk in the screenshot above. It’s highlighted in grey and sits in between {r} and syntax. performs a plot function on the dataset object cars. If we want to run the R code in an R Notebook, we press the green arow “run”" button that appears in the top right-hand side of the chunk. Or, we place the cursor in the chunk and click on the Chunks menu (top right hand corner of the script screen). This menu gives us plenty of options. We can use Insert chunk to automatically type out the **```{r} and ```** syntax, jump to different chunks, and run previous code, current chunk or next chunk. You also have the option to run all chunks together in the R Notebook Document. This is what we would do if we wanted to replicate someone elses’ analysis.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615315464/Rmarkdown/Rmarkdown3_tt8fux.png)

Let’s run the first R chunk above.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615315588/Rmarkdown/Rmarkdown4_smugdv.png)

Chunks are sent to the console and executed like a script. The fantastic thing about Notebooks is that output appears underneath the chunk instead of in the console or in the plot window. This significantly improves RStudio workflow and the enjoyment of using R. In the screenshot above you can see the plot of the car data.

R Markdown documents are fully reproducible. This means you could send the data and the R Markdown report to another investigator and they should be able to reproduce everything you did. Reproducibility is crucial in statistics, analytics and data science. However, in practice, it is never that simple. Due to a multitude of different factors, you will always have some issues with reproducing someone else’s report. A common issue is different versions of packages.

If we’ve finished analysing our data and writing our report, we click the Preview button to create a HTML report (see the screenshot below). Things like R output and plots will be automatically added and scaled to the document. This can save you a lot of editing time. It also includes the option to hide the code. This is a nice touch if you are sharing your report with stakeholders that might not want to see your code. There are many other output options available including PDF and Microsoft Word, but these formats lose interactive feature and can be tricky to compile.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615315825/Rmarkdown/Rmarkdown5_xhiojv.png)

A HTML document will be saved to your working directory where you saved your R Markdown file and a preview will appear in the RStudio browser. You can open this file in any web browser or word processor and save in a different format (e.g. PDF or .doc).

You also have the option to **Publish** this document directly to a hosting service. This allows you to publish your Notebooks online or provide secure access to your team or clients.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615315464/Rmarkdown/Rmarkdown3_tt8fux.png)

RStudio offers a few different options:

+ [RPubs](http://rpubs.com/): Free, open access. Only use this for open data projects.
+ [Shiny Apps](https://www.shinyapps.io/): A free account include 5 applications (notebooks) that can be public or secured. Paid accounts get more. Shiny Apps can also host interactive Shiny Applications.
If you run your own server, you can use the following products to securely host and share your notebooks online.

+ [R Shiny Server](https://www.rstudio.com/products/shiny/shiny-server/): Free open source server application for hosting R Markdown and Shiny apps online. RStudio also offers a Pro version with lots of extra goodies.
+ [RStudio Connect](https://www.rstudio.com/products/connect/): Premium, paid hosting server for R Markdown reports, dashboards, Shiny apps and more.

There is a example for publish your work to RPubs. Click **Publish**.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615316234/Rmarkdown/Rmarkdown6_fmqetq.png)

Select RPubs.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615316295/Rmarkdown/Rmarkdown7_fslaex.png)

Click **Publish**

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615316374/Rmarkdown/Rmarkdown8_gjbrzk.png)

Sign-in or create a new account. Your R Notebook will be published in no time. Once published, you can copy the URL from the published report to share the report with others. RPubs can also publish slides (see the links at the bottom of this page).

### R Markdown Syntax Basics
R Markdown is a powerful, light markup language. Using simple code, you can learn to format and present beautiful reports that integrate with your R code and statistical analysis. For detailed guides please see the [Reference Guide](http://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf) and [Cheatsheet](http://www.rstudio.com/wp-content/uploads/2016/03/rmarkdown-cheatsheet-2.0.pdf) produced by RStudio.

The following code will demonstrate some of the basics of R Markdown.

#### YAML Header
Start your documents with a YAML Header. There a many options that can be changed. The following header includes the basics. Note the use of --- to start and finish the header.

```yaml
---
title: "R Bootcamp: Course 4"
author: "James Baglin"
date: "Tuesday, March 28, 2017"
output: html_notebook
---
```

#### Headings
Using different levels of headings is a great way to structure your reports.

```markdown
## Header 1

### Header 2

#### Header 3

##### Header 4 etc...
```

#### Text Formatting, Links, and Math Yype
There are simple markdown codes used to format text, add hyperlinks and write mathematical formulas.

```
To write a paragraph, use plain text. You can use the following syntax to *italicise*, **bold**, superscript^2^, hyperlink, [link](http://www.rmit.edu.au/), and write inline equations using Latex code, $z = \frac{x -\mu}{\sigma}$.
```

Which will render as…

To write a paragraph, use plain text. You can use the following syntax to *italicise*, **bold**, superscript^2^, hyperlink, [link](http://www.rmit.edu.au/), and write inline equations using Latex code, $z = \frac{x -\mu}{\sigma}$.

#### Lists
Here are some examples of lists. To get second levels working, ensure you use a double tab indent.

```
* Unordered list
* Item 2
     + Sub-item 1
     + Sub-item 2

1. Ordered list
2. Item 2
     + Sub-item 1
     + Sub-item 2
```

Which will appear as…

* Unordered list
* Item 2
     + Sub-item 1
     + Sub-item 2

1. Ordered list
2. Item 2
     + Sub-item 1
     + Sub-item 2

#### Tables
Tables can be manually entered.

```
**Table 1:** Mean and Median for Speed and Distance

Variable|Mean |Median 
--------|-----|------ 
Speed   |15.40|15.0 
Distance|42.98|36.0
```

Renders as…

**Table 1:** Mean and Median for Speed and Distance

Variable|Mean |Median 
--------|-----|------ 
Speed   |15.40|15.0 
Distance|42.98|36.0

You can also use the knitr::kable() function to convert tables and data frames from R into nicely formatted HTML tables.

```console
```{r}
library(knitr)
knitr::kable(anscombe, caption = "Anscombe's Quartet Data")
```
```

**NOTE:** {r, echo=FALSE} - to report output without the R code

#### In-line Code
Using R code in-line allows you to create dynamic documents that can update values in your report by re-running the analysis. Here’s an example…

```
You can also use R Markdown syntax to report R code inline. For example, the mean speed was 15.4, *SD* = 5.29, *n* = 50. Ensure you enclose the syntax using two backward single quotes `.
```

This will render as follows:

You can also use R Markdown syntax to report R code inline. For example, the mean speed was 15.4, *SD* = 5.29, *n* = 50. Ensure you enclose the syntax using two backward single quotes `.

Very handy if you have dynamic reports that are updated on a regular basis. Re-rendering the Markdown files will automatically update all the values.

### Further Reading
There is a lot of amazing things you can do with [RStudio and R Markdown](http://rmarkdown.rstudio.com/formats.html). Here are some links to help you learn more.

[R Markdown Cheatsheet](https://www.rstudio.com/wp-content/uploads/2016/03/rmarkdown-cheatsheet-2.0.pdf)
[R Markdown Websites](http://rmarkdown.rstudio.com/rmarkdown_websites.html) - This website is an example of R Markdown Website.
[R Markdown Presentations](http://rmarkdown.rstudio.com/lesson-11.html). A variety of formats are offered including beamer, ioslides, slidy and revealjs.
[Shiny Applications](https://shiny.rstudio.com/): Interactive applications and data visualisations.
[Dashboards](http://rmarkdown.rstudio.com/lesson-12.html): Create beautiful dashboards quickly using the power of R and Markdown.
[Interactive Documents](http://rmarkdown.rstudio.com/lesson-14.html): Embed a wide range of interactive features into your HTML R Markdown pages.
[Plotly](https://plot.ly/r/getting-started/): Embed interactive, web-based, D3.js driven plots into your R Markdown reports.



