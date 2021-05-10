# Introduction to Statistics (Applied Analytics)

## What is Statistics?
Statistics is the science of collecting, organizing, analyzing, and interpreting data in order to make decisions.

Some informal definitions of statistics, provided by various well-known statisticians, are
+ The science of learning from (or making sense out of) data (J. Kettenring).
+ The theory and methods of extracting information from observational data for solving real-world problems (C.R. Rao).
+ The science of uncertainty (D.J. Hand).
+ The art of telling a story with data (L. Gaines).

## Statistics vs. Mathematics
Statistics and Mathematics differ in a number of fundamental ways:

+ Mathematics:
	+ Problems can exist without context
	+ Measurements are assumed to be exact
	+ No variability
	+ Deterministic answers
+ Statistics:
	+ The use of context and data collection
	+ Measurement decisions
	+ Omnipresence of variability
	+ Dealing with uncertainty

## Orientation
This article will introduce you to fundamental statistical concepts and modern statistical practice:

+ Study statistical data investigations, summary statistics, data visualisation and probability as a measure for uncertainty.
+ Then build upon these topics and learn about sampling, sampling distributions and confidence intervals as the basis for statistical inference.
+ The course will finish with a series of modules looking at common hypothesis testing methods for different types of data.

## Why statistics are important?
+ Very useful to be able to estimate business value in your head – employers highly regard the ability to use stats in business logic (e.g. estimate a market size to know if a new product is feasible before investing in detailed market research)

+ Often this acts as a good error check on our own biases/misconceptions Fundamental to many analytics challenges and encompasses a wide range of stats methods from descriptive statistics to hypothesis testing and control group design (all of which we cover in this course).

+ Experience how statistics can improve the quality of your decision-making.

{% youtube wV0Ks7aS7YI %}

## Module One - Dealing Confidently with Uncertainty
 
### The learning objectives:

+ Define and understand the omnipresence of variability by stating major sources and types of variation.
+ Define the discipline and science of statistics, and distinguish it from mathematics.
+ Define a variable, their major types, and levels of measurement.
+ Understand the basics stages of the statistical data investigation process.
+ Understand the major types of statistical data investigations, namely, surveys, observational studies and experiments.
+ Discuss the idea of statistical inference and how the use of samples give rise to uncertainty.
+ Explore the central concepts of variability in a simple statistical data investigation.
 
{% youtube y3A0lUkpAko %}

### Random Variables and Sources of Variation

**Statistics**, as defined by MacGillivray, Utts and Heckard (2014), is the “discipline and science of obtaining, understanding, modelling, interpreting, and using data in all real and complex systems and processes that involve uncertainty and variation” (p.15).

**Data**, **variation**, and **uncertainty** are at the core of statistics.
1. What is data?
Observations coded as categories or numeric values
2. What is uncertainty?
The situation resulting from randomness or some form of unpredictability
3. What is variation?
observations or measurements that are not determined and can take on more than one value.

Variation leads to uncertainty and is the reason why the field of statistics emerged.

+ Statistical data refer to **variables**, which are defined as any characteristic or value of a unit that can change or vary. The idea of a unit is very broad and can refer to a person, a time point, a device, or system.
+ **Variation** is all around us. This idea is referred to as the “omnipresence of variability” and is the reason why the field of statistics emerged. There are many forms of variation that you need understand. These can be summarised into four main categories.

	+ **Natural or Real Variation**: This refers to inherent, natural variability that is left over when all the other sources of variability are accounted for. Take, for example, a person’s height. Height varies greatly in the population, but there a many other variables that can explain why one person is taller than another. Males tend to be taller than females. Adults are taller than children. However, even if we compared males of a similar age, height will still vary. This is the natural or “real” variability that statistics seeks to measure and understand. Natural variability is what makes the world an interesting place.

	+ **Explainable Variation**: This is the variation in one variable that we can explain by considering another variable. The statistical tests and models that you will learn in this course seek to test relationships and effects that different variables have on each other. You already know heaps of examples of variables that “explain” other variables. For example, you know that height can help explain variation in weight, smoking can help us understand why some people are at a greater risk of lung cancer, gender can explain variation in the risk of heart disease, and the amount of hours spent studying can help explain exam scores.

	+ **Sampling Error**: Take a sample from a population, make a measurement and record the result. Now, repeat the process many times. The sample results will all differ to a certain degree. This type of variability is known as sampling variability. Statistical inference and hypothesis testing, to be introduced in later modules, deals with this specific form of variability and the implications it has on drawing conclusions from our studies. We will also consider this important source of variation in an interesting demonstration at the end of this module.

	+ **Non-sampling Variation**: This refers to any artificial variability induced by the research process. As researchers, you try to understand real variability, while acknowledging, accounting or controlling for induced variability. Induced variability can come from many factors. The following are some common examples:
Study statistical data investigations, summary statistics, data
visualisation and probability as a measure for uncertainty.
Then build upon these topics and learn about sampling, sampling
distributions and confidence intervals as the basis for statistical
inference.
The course will finish with a series of modules looking at common
hypothesis testing methods for different types of data.

		(1). **Measurement**: Sometimes referred to as observational error, this is the variability associated with how we have measured our variables. All measures of a variable are imperfect. We need to understand the reliability and validity of our measurements to account for measurement variability. Measurement variability can come from two main sources:
			1. **Measures**: There are usually many different ways to measure a variable. Different measures have different levels of reliability and validity. You should always use the most reliable and valid measure available. However, practical constraints may prevent this (e.g. time and money). All good measures will report their reliability and validity. If you create your own measure during the course of your research, you will need to test the reliability and validity yourself.
			2. **Devices**: You may use the same type of measure, but use different devices to record your results. For example, using two different weighing scales to measure your samples. The problem is that different devices may introduce variability due to calibration, or natural variability between devices.
		(2). **Accident**: This is exactly what it sounds like, just silly mistakes that can invalidate your data. As researcher, we must do everything we can to reduce such mistakes. Accidents can happen at different levels.
			1. During collection: You might write down the wrong measurement, make a typo, miss a question on a questionnaire or lose participant records.
			2. Processing: Errors can be made when entering and saving data, when manipulating data, and when cleaning up the data. This is very annoying and is why you should include checks when processing your data.

### Types of Variables and Levels of Measurement
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1614952481/MATH1324/ModelOne/TypesOfVariablesAndLevelsOfMeasurement-1_hztqlq.png)
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1614952481/MATH1324/ModelOne/TypesOfVariablesAndLevelsOfMeasurement-2_cyhvdt.png)

A **measurement** occurs when a variable is actually measured or recorded. For example, you measure a person’s heart rate (measurement). Heart rate is measured on a scale, or the unit of measurement, for example, beats per minute (BPM). A set of measurement or records from a variable is called data and can come from either a sample, a sub group of a population, or the population itself. When an entire population is measured, this is referred to as a census.

#### Major Types of Variables
The two major types of variables are **qualitative** and **quantitative**. The type of variables you collect and analyse have a direct bearing on the type of statistical summaries and analyses you can perform.

+ **Qualitative** - Qualitative variables have different qualities, characteristics or categories, e.g. hair colour (black, brown, blonde,…), disease (cancer, heart disease,…), gender (male, female), country of birth (New Zealand, Japan,…). Qualitative variables are used to categorise quantitative data into groups or to tally frequencies of categories that can be converted to proportions and percentages.

+ **Quantitative** - Quantitative variables measure a numerical quantity on each unit. Quantitative variables can be either discrete - can only assume a finite or countable number of values, e.g. marks on a test, birthday, number of people in a lecture, or continuous - the value can assume any value corresponding to the points on a number line, e.g. time (seconds), height (cm), weight (kg), age etc.

#### Levels of Measurement
When you measure a variable, qualitative and quantitative variables can take on different scales or levels of measurement. Levels of measurement have a direct bearing on the quantitative data analysis techniques you will need to use. We need to understand the language used to describe different scales. The following short video by Nicola Petty provides a great overview.

{% youtube hZxnzfnt5v8 %}

+ **Categorical or Nominal (Qualitative)**. Categorical variables are group variables or categories if you will. There are no meaningful measurement differences such as rankings or intervals between the different categories. Categorical or nominal variables include binary variables (e.g. yes/no, male/female) and multinomial variables (e.g. religious affiliation, hair colour, ethnicity, suburb).

+ **Ordinal (Qualitative)**. Ordinal data has a rank order by which it can be sorted but the differences between the ranks are not relative or measurable. Therefore, ordinal data is not strictly quantitative. For example, consider the 1st, 2nd and 3rd place in a race. We know who was faster or slower, but we have no idea by how much. We need to look at the race times.

+ **Interval (Quantitative)**: An interval variable is similar to an ordinal variable except that the intervals between the values of the interval scale are equally spaced. Interval variables have an arbitrary zero point and therefore no meaningful ratios. An example is our calendar year. 1000 AD is not half of 2000 AD, and 20 degrees Celsius is not twice as “hot” as 10 degrees Celsius. This is because our calendar and Celsius scale have an arbitrary value for zero. Zero AD and zero degrees Celsius do not imply the presence of zero time or zero heat energy.

Study statistical data investigations, summary statistics, data
visualisation and probability as a measure for uncertainty.
Then build upon these topics and learn about sampling, sampling
distributions and confidence intervals as the basis for statistical
inference.
The course will finish with a series of modules looking at common
hypothesis testing methods for different types of data.
+ **Ratio (Quantitative)**: A ratio variable is similar to an interval variable; however there is an absolute zero point and ratios are meaningful. An example is time given in seconds, length in centimeters, or heart beats per minute. A value of 0 implies the absence of a variable. We can also make statements like 30 seconds is twice the time of 15 seconds, 10 cm is half the height of 20 cm, and during exercise a person’s resting heart beat almost doubles. Zero heart rate, call 000!

### Statistical Inference - The Big Idea of Statistics

The idea of the following sections is to give you a glimpse into the big picture of this course, that is, statistical inference. What is statistical inference?

***“Statistical inference moves beyond the data in hand to draw conclusions about some wider universe, taking into account that variation is everywhere and the conclusions are uncertain” (Moore 2007, xxviii)***

As such, statistics has been referred to as the discipline involved with dealing confidently with uncertainty. Wild, Pfannkuch and Horton (2011) provided the analogy to help explain the big idea behind statistical inference.

![](https://astral-theory-157510.appspot.com/secured/images/Wild_2011_Statistical_Inference.png)

Throughout this course you will develop a deeper understanding of statistical inference and the uncertainty associated with the use of samples. You will learn how samples impact data and the conclusions you draw. You will also learn how to measure and express your statistical uncertainty and confidently draw appropriate conclusions.

### The Statistical Data Investigation Process
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1614952818/MATH1324/ModelOne/DataInvestigationCycle_jjljuh.png)

Statistical practice is much broader than analysing data. The statistical data investigation process describes how real problems are tackled from a statistical problem solving approach. It is how statistics is applied to investigate questions in science, medicine, agriculture, business, engineering, psychology, or anywhere data are needed and the data exhibit variation.

As discussed previously, variation is omnipresent. At almost all levels of government, industry, and science, data are measured, quantified, and interpreted in order to understand variation. By asking statistical questions of the data, taking observations and performing experiments, data can be used by investigators to seek patterns amongst great variation.

The entire process of a statistical data investigation involves everything from initial thoughts, through to planning, collecting and exploring data, and reporting findings. The process is depicted and summarised in the following slideshow, along with a brief description and key considerations at each stage. Click on each stage to read more.

1. [](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1614825208/MATH1324/ModelOne/MATH1324-ModelOne-1_hzvtqy.png)
2. [](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1614825208/MATH1324/ModelOne/MATH1324-ModelOne-2_ytbcc7.png)
3. [](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1614825208/MATH1324/ModelOne/MATH1324-ModelOne-3_wynr4p.png)
4. [](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1614825208/MATH1324/ModelOne/MATH1324-ModelOne-4_oe3yjb.png)
5. [](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1614825208/MATH1324/ModelOne/MATH1324-ModelOne-5_sgysux.png)

As you work through the statistical data investigation process, its useful to apply statistical habits of mind. Some useful examples proposed by [Hollylynne Lee and Dung Tran](https://place.fi.ncsu.edu/local/catalog/course.php?id=4) include:

+ Always consider the context of data
+ Ensure the best measure of an attribute of interest is used
+ Anticipate, look for, and describe variation
+ Attend to sampling issues
+ Embrace uncertainty, but build confidence in interpretations
+ Use several visual and numerical representations to make sense of data
+ Be a skeptic throughout an investigation

Sometimes a data investigation starts with a question, sometimes a hypothesis, sometimes a problem, and sometimes just a general situation to be explored. Statistical questions and problems are not the same as mathematical questions and problems. Don’t confuse the two. Tukey (1953), a world famous statistician, best explained this when he wrote:

**“Statistics is a science in my opinion, and it is no more a branch of mathematics than are physics, chemistry, and economics; for if its methods fail the test of experience – not the test of logic – they are discarded.”**

Furthermore, statistical questions can be differentiated based on the following:

+ The use of context and data collection
+ Measurement decisions
+ Omnipresence of variability
+ Dealing with uncertainty

In contrast, mathematics questions are characterised by the following:

+ Problems can exist without context
+ Measurements are assumed to be exact.
+ No variability
+ Deterministic answers

The following video from the Khan Academy explores how statistical questions are fundamentally different to maths questions.

{% youtube qyYSQDcSNlY %}

### Major Types of Statistical Data Investigations
There are three major types of statistical data investigations that can be distinguished based on their aims and methods of data collection. We must understand the strengths and weaknesses of each types as these have an impact on the conclusions you draw. We will learn more about different research designs throughout the course when we look at different statistical methods.

#### Surveys
**Surveys** aim to gather data from the population, in the form of responses, in order to investigate or understand some type of phenomenon. For example, you might have had experience filling out course evaluation surveys, product surveys, customer satisfaction surveys, the Australian Census, and job evaluation surveys. Surveys are typically done using samples, but may also be completed by an entire population. When this happens, this is known as a census. The Australian Census seeks to count and describe the characteristics of the Australian population in order to help Australia plan for the future. Surveys are typically administered using paper-based or online questionnaires completed by the participant, but may also involve face-to-face or telephone interviews. Surveys may seem like the easiest and most cost effective way to gather large amounts of data from a population, but that is far from the truth. Surveys have many challenges, including selecting a good sample, poor response rates, response bias, and designing good questions.

#### Experiments

In the simplest **experimental** design, participants or some other unit are randomised to a **control** group or a **treatment** group. The investigator’s manipulation of exposure to the treatment is what defines a true experiment. The treatment is referred to as an **independent** variable. **Randomisation** is used to maximise the chance of the groups being considered equivalent, in terms of their characteristics, at the start of the experiment, thus **minimising systematic bias** between groups. The control group does not receive the actual treatment, and may instead, receive an inert form of the treatment called a placebo. **Blinding** is used to prevent the results being influenced by participant expectations, by ensuring the participants are unaware of their allocated research group or the true nature behind the experiment. The investigator seeks to keep all other factors and variables constant throughout the experiment. At the end of the experiment, the investigator will measure the two groups on a dependent or outcome variable. Because of randomisation of participants and tight control, it is assumed that by the end of the experiment, any significant difference between groups on the dependent variable could ONLY be due to the treatment. Therefore, if a difference between groups is evident at the end of the experiment, its assumed to be the effect of the treatment. Thus, experiments seek to test cause and effect hypotheses. However, experiments are also the most difficult and time consuming of investigation types.

![](https://astral-theory-157510.appspot.com/secured/images/Basic%20Experimental%20Design.png)

#### Observational or Correlational Studies
Observational or correlational research designs look for a relationship between at least two variables. Observational or correlational research do not attempt to manipulate or control an independent variable, which distinguishes it from an experiment. Therefore, these types of studies cannot test cause and effect. Instead, they are used to establish evidence of relationships, associations or correlations between variables that may suggest evidence of causal effects. Conclusions from observational and correlational investigations are always interpreted with this limitation in mind. On the plus side, these types of investigations allow researchers to study relationships between variables that cannot be manipulated in experiments. For example, ethically, you cannot randomise people to smoke cigarettes to test if it increases risk of cancer. However, you can observe and compare the incidence of cancer in people who voluntarily smoke to those who don’t.

### References
MacGillivray, H., J. M. Utts, and R. F Heckard. 2014. Mind on statistics. 2nd ed. South Melbourne, VIC: Cengage Learning Australia.

Moore, D. S. 2007. The basic practice of statistics. 4th ed. New York, NY: W. H. Freeman; Company.

Tukey, J. W. 1953. “The growth of experimental design in a research laboratory.” In Research Operations in Industry, 303–13. New York: King’s Crown Press.

Wild, C., M. Pfannkuch, M. Regan, and N. J. Horton. 2011. “Towards more accessible conceptions of statistical inference.” Journal of the Royal Statistical Society 174: 247–95. https://doi.org/10.1111/j.1467-985X.2010.00678.x.

### Exercise (Model One)
1. If two researchers gather two random samples in the same circumstances, these two samples are likely to vary. Which of the following statements best explains why?
- [ ] The researchers have not sampled correctly. 
- [x] Different samples are made up of different combinations of units from a population, and will therefore always vary to some degree.
- [ ] The researchers have collected their samples at different time points.
- [ ] Because no matter how careful they are, the researchers could not use the same method.

2. Which of the following characteristics is unique to a statistical problem and helps differentiate it from a mathematical problem? 
- [ ] Measurements are assumed to be exact.
- [ ] The problem can be expressed without a context. 
- [ ] The problem has a unique answer.
- [x] The anticipation of variation. 

3. During data collection and prior to data exploration, what should you be checking?
- [ ] Consistency of data collection 
- [ ] Obvious error or issues 
- [ ] Accuracy of data collection
- [x] All of the above

4. Variation is all around us, and this is the main reason why statistics is needed. Variation exists on many different levels. Which of the following is something that does NOT vary?
- [ ] Students' attitudes towards maths.
- [ ] The mean age calculated from different samples of a population.
- [x] The ratio of a circle's circumference to its diameter.
- [ ] Measurement of an individual's blood pressure.

5. Match the scale of measurement with the correct example.
+ Nominal - Credit card number
+ Ratio - Forced expiratory volume
+ Ordinal - Energy star ratings
+ Interval - IQ Scores

6. Which of the following is an example of real or natural variability?
- [ ] You notice variability in your body weight measurement when using your bathroom scale and the scale in your gym.
- [ ] Driving to your workplace after leaving home at 10am tends to be faster than leaving at 8am.
- [ ] Monday train commuting times between your home station and work is around 24 minutes, but it can be as quick as 21 minutes and as long as 27.
- [ ] Two investigators gather a small sample of 30 adults each and measure their body mass indexes (BMI). The mean BMI for each sample is different.

7. Which of the following is a qualitative variable?
- [x] Bank account number 
- [ ] Travel time
- [ ] Energy intake
- [ ] Wireless signal strength

8. Which of the following is an interval level measure?
- [ ] Mass
- [x] Degrees Fahrenheit 
- [ ] Distance
- [ ] Length

9. Statistical inference refers to:
- [ ] Measuring the population. 
- [ ] Drawing conclusions about a sample using census data. 
- [x] Drawing conclusions about a population using sample data. 
- [ ] Analysing your sample data.

10. Larger random samples have less sampling error.
- [x] True
- [ ] False

11. Order the stages, from first to last, of the statistical data investigation process.
1 - Initial questions
2 - Issues and planning
3 - Collecting, handling and checking data
4 - Exploring, interpreting data in contect

12. Thinking statistically is required during which stages of the statistical data investigation process? Select all that apply.
- [x] Initial questions 
- [x] Issues and planning 
- [x] Collecting, handling and checking data
- [x] Exploring, interpreting data in context 

13. Which of the following is a major challenge for surveys?
- [ ] Can only be done online 
- [ ] Unethical
- [ ] Expensive and time-consuming
- [x] Response rate

14. Why do experimental investigations use placebos?
- [x] People need to think they're getting the treatment because peoples' beliefs and biases can impact results.
- [ ] Because they are cheaper than the real treatment. 
- [ ] Because placebos are an effective treatment. 
- [ ] So participants don't feel they're missing out.

15. Why do experimental investigations use randomisation?
- [ ] To ensure participants are blinded to their allocated group. 
- [x] To help establish baseline equivalence between groups. 
- [ ] To fairly allocate people to the treatment. 
- [ ] To ensure the investigator is blinded.

## Model Two - Descriptive Statistics through Visualisation
### Learning Objectives
The learning objectives associated with this module are:

+ Basic descriptive statistics and visualisations for qualitative variables:
	+ frequencies
	+ cross-tabulations
	+ bar charts
	+ clustered bar charts

+ Basic descriptive statistics and visualisations for quantitative variables:
	+ Dot plots
	+ Histograms
	+ Mean and standard deviation
	+ Quartiles, median, and IQR
	+ Box plots
	+ Side-by-side box plots
	+ Scatter plots to visualise the relationship between two quantitative variables

+ Understand and apply the basic principles of producing good plots.

### Descriptive Statistics
Descriptive statistics are methods by which complex, noisy or vast amounts of data can be converted into insightful, bite-sized, pieces of usable information. Descriptive statistics summarise characteristics of data using numbers. These include things like the mean, range, mode or percentage. Statistical visualisations are visual displays of descriptive statistics or data, most commonly graphs or plots, that summarise important features or trends. Visualisations make use of our visual sense to assist with interpreting data beyond reading tables of numbers from a page. Visualisations offer a more exciting and pleasing way to summarise data. The following sections will introduce common visualisations used in statistics to summarise difference types of variables. Often these visualisations report descriptive statistics. Therefore, these visualisations will be used to introduce common descriptive statistics.

This module is for the romantics. We will consider a large dataset of around 54,000 diamond prices and characteristics, you can download Diamonds dataset from [here](https://github.com/yanboyang713/RMIT-Data-Repository/blob/main/Diamonds.csv). Before popping the question to your significant other, ensure you know a little about diamonds… 
Here’s some information about the dataset, Diamonds. The dataset includes the prices and other attributes of almost 54,000 diamonds. The variables are as follows:

+ **price**: price in US dollars ($326 - $18,823)
+ **carat**: weight of the diamond (0.2 - 5.01)
+ **cut**: quality of the cut (Fair, Good, Very Good, Premium, Ideal)
+ **colour**: diamond colour, from J (worst) to D (best)
+ **clarity**: a measurement of how clear the diamond is (I1 (worst), SI2, SI1, VS2, VS1, VVS2, VVS1, IF (best))
+ **x**: length in mm (0–10.74)
+ **y**: width in mm (0–58.9)
+ **z**: depth in mm (0–31.8)
+ **depth**: total depth percentage = z / mean(x, y) = 2 * z / (x + y) (43–79)
+ **table**: width of top of diamond relative to widest point (43–95)

This module will also show you how to use R to summarise and plot your data. Open RStudio, load the Diamonds data (ensure you call the object Diamonds) and reproduce the R code and output below to get further practice with using R. Ensure you save your R script so you can come back to it later. Also ensure you define your factors correctly. The following code ensures that cut, colour and clarity variables are treated correctly as ordered factors.

```R
Diamonds$cut<- factor(Diamonds$cut, levels=c('Fair','Good','Very Good','Premium','Ideal'), 
                      ordered=TRUE)

Diamonds$color<- factor(Diamonds$color, levels=c('J','I','H','G','F','E','D'), 
                        ordered=TRUE)

Diamonds$clarity<- factor(Diamonds$clarity, 
                          levels=c('I1','SI2','SI1','VS2','VS1','VVS2','VVS1','IF'), 
                           ordered=TRUE)
```

54,000 is a lot of data. The only way we can get some useful information from a dataset of this size will be to use descriptive statistics. Let’s start with looking at summarising some qualitative variables.

### Qualitative Variables
#### Frequency Distributions
Cut quality is a qualitative variable, measured on an ordinal scale, ranging from fair to ideal. A frequency table can be used to tally/count the number of times a particular cut quality appears in the dataset. We can use the table() function to generate a basic frequency distribution.

```R
library(dplyr) # Required for data management and pipes

Diamonds$cut %>% table()
```

```console
### .
###      Fair      Good Very Good   Premium     Ideal 
###      1610      4906     12082     13791     21551
```

Reading the output, we find the “ideal”, 21,551, cut is the most frequently occurring value. The most frequently occurring qualitative value for a variable is called the **mode**. There, we just covered two types of descriptive statistics in no time.

Counts or tallies don’t allow comparison between different datasets. For example, what if we wanted to compare the counts of the Diamonds variable to another smaller dataset? We need to use proportions, f/n, where f = the count or frequency or a value, and n = sample size. We can also readily convert proportions to percentages using f/n * 100. I’ll assume we’re all intimately familiar with percentages. You only have to walk into any shopping centre to be bombarded…

In R, we can report the proportions for cuts using:

```R
Diamonds$cut %>% table() %>% prop.table()
```

```console
### .
###       Fair       Good  Very Good    Premium      Ideal 
### 0.02984798 0.09095291 0.22398962 0.25567297 0.39953652
```

or, percentages:

```R
Diamonds$cut %>% table() %>% prop.table()*100
```

```console
### .
###      Fair      Good Very Good   Premium     Ideal 
###  2.984798  9.095291 22.398962 25.567297 39.953652
```

#### Bar Charts
A simple and effective visualisation of qualitative data is the humble bar chart. Here’s how to get one in R. First we assign the table object name. Let’ asign the percentages to an object named perc.

```R
perc <- Diamonds$cut %>% table() %>% prop.table()*100
```

Now, call the bar plot using the following function. Note how the code defines a title, x axis label and sets the height of the y axis:

```R
perc %>% barplot(main = "Diamond Cut Quality - Percentage",ylab="Percent", ylim=c(0,50))
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615222237/MATH1324/ModelTwo/barCharts_hrjir0.png)

The height of each bar represents the percentage of cut quality in the data set. This is much quicker to interpret than written tallies. Bars can also represent raw counts/tallies or proportions. Ensure you label your axes correctly to help the reader interpret your scales. It’s also a good idea to start your y-axis at 0, so as not to distort the scale and to allow relative comparisons across levels.

**Note One:** If you want to draw color bar chart, please, set the col, there is a example at the below.

```R
barplot(freq, main = "Diamond Cut Quality - Percentage", 
        ylab="Percent", xlab="Colour", col="deepskyblue")
```

**Note Two:** If you want to **Order by frequency**, there is a example at the below.

```R
barplot(freq[order(freq, decreasing = TRUE)], main = "Diamond Cut Quality - Percentage", 
        ylab="Percent", xlab="Colour", col="deepskyblue")
```

#### Contingency Tables (Cross-tabulations)
When we need to explore the relationship between two categorical variables, we can create contingency tables, also known as cross-tabulations. These tables present one categorical variable as the rows and the other categorical variable as the columns. These tables make it easy for us to calculate conditional probabilities or percentages, which makes it easier for us to explore potential associations between variables. In the following example, we will consider the relationship between the cut of a diamond and its clarity. To get the contingency table for raw counts, we use:

```R
table(Diamonds$cut,Diamonds$clarity)
```

```console
###            
###               I1  SI2  SI1  VS2  VS1 VVS2 VVS1   IF
###   Fair       210  466  408  261  170   69   17    9
###   Good        96 1081 1560  978  648  286  186   71
###   Very Good   84 2100 3240 2591 1775 1235  789  268
###   Premium    205 2949 3575 3357 1989  870  616  230
###   Ideal      146 2598 4282 5071 3589 2606 2047 1212
```

However, because there are differences between the row and column totals for each category, it makes looking at trends difficult. We can calculate the conditional column percentages using the following code. Notice how the round() function has been included to reduce the size of the probabilities in the table cells. Otherwise, R will round to six decimal places and the table will be too large.

```R
table(Diamonds$cut,Diamonds$clarity) %>% prop.table(margin = 2) %>% round(3)
```

```console
###            
###                I1   SI2   SI1   VS2   VS1  VVS2  VVS1    IF
###   Fair      0.283 0.051 0.031 0.021 0.021 0.014 0.005 0.005
###   Good      0.130 0.118 0.119 0.080 0.079 0.056 0.051 0.040
###   Very Good 0.113 0.228 0.248 0.211 0.217 0.244 0.216 0.150
###   Premium   0.277 0.321 0.274 0.274 0.243 0.172 0.169 0.128
###   Ideal     0.197 0.283 0.328 0.414 0.439 0.514 0.560 0.677
```

These are conditional column probabilities, determined by margin = 2, because if we add all the probabilities for a column together, they will equal 1, e.g. sum(0.283, 0.130, 0.113, 0.227, 0.197) = 1.00. Let me prove it:

```R
tbl <- table(Diamonds$cut,Diamonds$clarity) %>% prop.table(margin = 2) %>% round(3)
tbl[,1]
```

```console
###      Fair      Good Very Good   Premium     Ideal 
###     0.283     0.130     0.113     0.277     0.197
```

```R
tbl[,1] %>% sum()
```

```console
### [1] 1
```

If we had set margin = 1 we would get row proportions:

```R
table(Diamonds$cut,Diamonds$clarity) %>% prop.table(margin = 1) %>% round(3)
```

```console
###            
###                I1   SI2   SI1   VS2   VS1  VVS2  VVS1    IF
###   Fair      0.130 0.289 0.253 0.162 0.106 0.043 0.011 0.006
###   Good      0.020 0.220 0.318 0.199 0.132 0.058 0.038 0.014
###   Very Good 0.007 0.174 0.268 0.214 0.147 0.102 0.065 0.022
###   Premium   0.015 0.214 0.259 0.243 0.144 0.063 0.045 0.017
###   Ideal     0.007 0.121 0.199 0.235 0.167 0.121 0.095 0.056
```

If we had left margin blank, we would get cell proportions:

```R
table(Diamonds$cut,Diamonds$clarity) %>% prop.table() %>% round(3)
```

```console
###            
###                I1   SI2   SI1   VS2   VS1  VVS2  VVS1    IF
###   Fair      0.004 0.009 0.008 0.005 0.003 0.001 0.000 0.000
###   Good      0.002 0.020 0.029 0.018 0.012 0.005 0.003 0.001
###   Very Good 0.002 0.039 0.060 0.048 0.033 0.023 0.015 0.005
###   Premium   0.004 0.055 0.066 0.062 0.037 0.016 0.011 0.004
###   Ideal     0.003 0.048 0.079 0.094 0.067 0.048 0.038 0.022
```

Summing all the cells together would now equal 1. We will spend more time in Module 3 looking at the interpretation of large contingency tables. Now, let’s interpret the column probabilities. Recall:

```R
table(Diamonds$cut,Diamonds$clarity) %>% prop.table(margin = 2) %>% round(3)
```

```console
###            
###                I1   SI2   SI1   VS2   VS1  VVS2  VVS1    IF
###   Fair      0.283 0.051 0.031 0.021 0.021 0.014 0.005 0.005
###   Good      0.130 0.118 0.119 0.080 0.079 0.056 0.051 0.040
###   Very Good 0.113 0.228 0.248 0.211 0.217 0.244 0.216 0.150
###   Premium   0.277 0.321 0.274 0.274 0.243 0.172 0.169 0.128
###   Ideal     0.197 0.283 0.328 0.414 0.439 0.514 0.560 0.677
```

Let’s contrast the worst clarity I1 with the best, IF (Flawless). For I1, we find that the probability for a fair, good, very good, premium and ideal cut are 0.283, 0.130, 0.113, 0.227, and 0.197 respectively. However, for IF, the same probabilities are 0.005, 0.040, 0.150, 0.128 and 0.677 respectively. We can see that IF diamonds are far more likely to have superior cuts, which makes perfect sense. You don’t give the best diamonds to the cutting apprentice!

Interpreting associations and trends from large contingency tables such as this can take a considerable amount of brain power. We can make this process easier and more enjoyable using a visualisation. We can use an extension of the bar chart for this purpose.

#### Clustered Bar Charts
Clustered bar charts are a great way to visualise two qualitative variables. Let’s plot the conditional column proportions of the cut by clarity contingency table using R. First, we need to save the conditional proportions in an object called **table_1**. This will make it easy for us to create the clustered bar chart.

```R
table_1 <- table(Diamonds$cut,Diamonds$clarity) %>% prop.table(margin = 2)
```

Next we can plot the probabilities. Note the various options used to change the plot title, y axis label, y axis range, legend and x axis label.

```R
table_1 %>% barplot(main = "Diamond Cut Quality by Clarity", ylab="Proportion within Clarity",
                    ylim=c(0,.8), legend=rownames(table_1), beside=TRUE,
                    args.legend=c(x = "top", horiz=TRUE, title="Cut"),
                    xlab="Clarity")
grid()
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615224038/MATH1324/ModelTwo/ClusteredBarCharts_s2auq4.png)

Notice how grid() was added after the plot was produced in R. Grid lines can help the viewer quickly read off and compare values on the plot axes.
Looking at this clustered bar chart, it becomes quickly apparent that as the clarity of a diamond increases, the quality of the cut also tends to increase. Perfect! See how simple statistics can be. You just interpreted your first categorical association. We will dig deeper into categorical associations again in Module 3 and 8.

**NOTE One:** If you have NOT set **beside=TRUE**, the bar chart will looks like a "stack". There is a example at the below.
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615312286/MATH1324/ModelTwo/ClusteredBarChartStack_qrjnrj.png)

**NOTE Two:** If the legend overlaps the bars! Let’s adjust the y-axis to increase the white space in the top of the plot, using the ylim option.

```R
barplot(color_cut, main = "Diamond Colour by Cut Quality",ylab="Proportion within Cut",
        xlab="Cut", beside=TRUE, legend=rownames(color_cut), 
        args.legend=c(x = "top",horiz=TRUE,title="Cut"), ylim = c(0,.30))
grid()
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615312779/MATH1324/ModelTwo/ClusteredBarChartWithYlim_n65lln.png)

**NOTE Three:** Better, but it’s hard to differentiate between the grey colours! Let’s use some more discernible colours. We can use a colour Brewer palette from the RColorBrewer package (ensure you install this package first). For example, we can set a diverging blue-red palette using col=brewer.pal(n = 7, name = "RdBu").

```R
library(RColorBrewer)
barplot(color_cut, main = "Diamond Colour by Cut Quality",ylab="Proportion within Cut",
        xlab="Cut", beside=TRUE, 
        legend=rownames(color_cut), 
        args.legend=c(x = "top",horiz=TRUE,title="Color"),
        ylim = c(0,.30),
        col=brewer.pal(7, name = "RdBu"))
grid()
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615313079/MATH1324/ModelTwo/ClusteredBarChartWithColor_djetpm.png)

### Quantitative Variables
Quantitative variables require different types of statistical summaries and visualisations. Let’s start with a small sample of the diamond data to make the calculations manageable, and then we will scale-up to the full 54,000 for some awesome plotting later in the module.

The [Diamonds_sample.csv](https://github.com/yanboyang713/RMIT-Data-Repository/blob/main/Diamonds_sample.csv) dataset contains a small random sample of 30 diamonds’ mass measured in carats.

```R
Diamonds_sample <- read.csv("data/Diamonds_sample.csv")
```

#### Dot Plots
Dot plots are a nice visual representation of small quantitative datasets. Each dot is arranged into bins on the x-axis and stacked on top of each other to report the frequency. Dot plots represent the distribution of a quantitative variable, and granularity of the small sample. We can use dot plots to quickly see where values are clustering and tending towards, as well as unusual cases known as outliers. To get a dot plot in R, you first must install and load the ggplot2 package.

```R
install.packages("ggplot2")
library(ggplot2)
```

We can use a **ggplot2** quick plot function to produce the dot plot.

```R
Diamonds_sample %>% qplot(data = ., x = depth, geom = "dotplot", binwidth = .25)
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615226573/MATH1324/ModelTwo/DotPlots1_obcrjt.png)

The dot plot of 30 random diamond depths are arranged into bins with widths of .25 mm. For example, three values were between 63.75 mm and 64mm, five values between 61 and 61.25, etc. It’s a little hard to tell, which is where we encounter some of the issues with dot plots. The main drawback of dot plots is that they don’t show the actual values. So, we can’t tell exactly what they are. They are also sensitive to the number of bins or internals used in the plot. Setting the right bin widths is tricky.

Let’s set a larger number of intervals, or bins, in the plot, by making the intervals smaller.

```R
Diamonds_sample %>% qplot(data = ., x = depth, geom = "dotplot", binwidth = .1)
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615226573/MATH1324/ModelTwo/DotPlots2_ohnqjl.png)

By increasing the number of internals or bins to nint=10, the dot plot drastically changes appearance. This is a drawback to visualising small samples. Often the choice of parameters used in the plot can change interpretations. Be mindful.

They are also problematic for large datasets…

```R
Diamonds %>% qplot(data = ., x = depth, geom = "dotplot", binwidth = .25)
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615226573/MATH1324/ModelTwo/DotPlots3_j6sdnf.png)

#### Histograms
When dealing with large amounts of quantitative data, we can use histograms to explore the distributions of interval and ratio data. Let’s use R to create some histograms of diamond prices:

```R
Diamonds$price %>%  hist(col="grey",xlim=c(0,20000),
                         xlab="Diamond Price",
                         main="Histogram of Diamond Prices")
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615227098/MATH1324/ModelTwo/Histograms1_jkc0zk.png)

Take note of how the code limits the x axis to values between $0 and $20,000, we have also set the colour of the bars to grey and a plot title.

Histograms break the data into bins, or intervals, depicted using bars, where the height of the bar typically refers to the frequency. Due to the large amount of data, the bars are joined together to form a continuous wall. This is the drawback of using histograms for small samples. The continue wall of bars can give the viewer a false sense of the data’s density. Dot plots are much better for small samples as each dot depicts the granularity of the data. The histogram of prices is interesting. We can quickly lean the following:

+ Prices range goes all the way up to $19,000 U.S.
+ Most diamond prices are below $5,000
+ The most common diamond prices are between 0 to $1,000.

The price distribution is an example of what we would call a positively, or right skewed, distribution. You will see examples of other distributions shortly.

We can use R to find the bin intervals used to construct the plot:

```R
bins <- Diamonds$price %>% hist()
bins$breaks
```

```console
###  [1]     0  1000  2000  3000  4000  5000  6000  7000  8000  9000 10000 11000
### [13] 12000 13000 14000 15000 16000 17000 18000 19000
```

```R
bins$counts
```

```console
###  [1] 14524  9683  6129  4225  4665  3163  2278  1668  1307  1076   934   825
### [13]   701   603   504   513   425   405   312
```

Using this information, we can create the table to the below which explains how the data were plotted in the histogram above.

```R
binstable <- data.frame(Breaks = bins$breaks, Counts = c(0,bins$counts))
binstable
```

```console
###    Breaks Counts
### 1       0      0
### 2    1000  14524
### 3    2000   9683
### 4    3000   6129
### 5    4000   4225
### 6    5000   4665
### 7    6000   3163
### 8    7000   2278
### 9    8000   1668
### 10   9000   1307
### 11  10000   1076
### 12  11000    934
### 13  12000    825
### 14  13000    701
### 15  14000    603
### 16  15000    504
### 17  16000    513
### 18  17000    425
### 19  18000    405
### 20  19000    312
```

Even with histograms and large data, we must be careful with how the choice of bins can change the appearance of a histogram. Consider the following histogram to see how much change can occur when reducing or increasing the number of bins from the default values.

```R
Diamonds$price %>% hist(col="grey", xlim=c(0,20000), xlab="Diamond Price", 
                        main="Histogram of Diamond Prices", breaks=10)
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615227098/MATH1324/ModelTwo/Histograms2_mmgkwt.png)

```R
Diamonds$price %>% hist(col="grey", xlim=c(0,20000), xlab="Diamond Price",
                        main="Histogram of Diamond Prices", breaks=50)
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615227098/MATH1324/ModelTwo/Histograms3_cwybcp.png)

Histograms are a great way to compare different distributions. We can panel a series of histograms together on a common scale to help comparisons. The following code panels together histograms of diamond prices across different cuts.

We have to use a slightly different **histogram()** function from the lattice package:

```R
library(lattice)
Diamonds %>% histogram(~ price|cut, col="dodgerblue3",
                       layout=c(1,5), data=., xlab="Price")
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615227099/MATH1324/ModelTwo/Histograms4_peokcx.png)

As you can see, the histograms look largely the same and it’s difficult to see a distinct relationship between cut and price. Cut, alone, is probably not a good indicator of price.

#### Distribution Shapes
Statisticians have an entire language dedicated to articulating the shape of quantitative variables’ distributions. The following info-graphic introduces some of the common terms. These are important terms to understand, as the shape of a distribution often determines our choice of descriptive statistics and statistical tests. You will learn more as the course goes on.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615228664/MATH1324/ModelTwo/DistributionShapes_at3gjf.png)

#### Measures of Central Tendency
We’ve looked at dot plots and histograms for visualising quantitative variables. Now we will consider some basic descriptive statistics used to summarise the essential features of data distributions, including both measures of central tendency and variation. We will focus our attention on the mean and standard deviation.

##### Mean and Standard Deviation
Let’s step back to the small sample of diamond data, Diamonds_sample, to calculate the mean depth of the data depicted in the dot plot. The mean of a dataset, x¯ is calculated as:

$$x¯ = \frac{\sum_{n}^{i=1} x_i }{n}$$

where $$x_i$$ is a sample value and n is the sample size. The formula is simply the sum of all the data points divided by the sample size. In R, we could code:

```R
sum(Diamonds_sample$depth)/length(Diamonds_sample$depth)
```

```console
### [1] 61.77667
```

Fortunately, R has statistical functions that make this easier.

```R
Diamonds_sample$depth %>% mean()
```

```console
### [1] 61.77667
```

The mean is a measure of central tendency that can be used to describe the average or typical value for a dataset. It takes all values into account and is therefore sensitive to all values in a dataset. This can create problems in **skewed distributions** or **distributions with unusual or outlying values**.

The mean is also a single measure of centre. It tells us nothing about spread or variation. Variation is the essence of statistics, so we need summary statistics that can convey variation. A crude measure of variation includes the **range**:

$$Range = Max - Min$$

The range is simply the maximum value of a dataset, minus the minimum value. Using R:

```R
max(Diamonds_sample$depth)-min(Diamonds_sample$depth)
```

```console
### [1] 5.7
```

```R
range(Diamonds_sample$depth)
```

```console
### [1] 58.2 63.9
```

The **range** is not very useful. It is based on only two data points and misses all the interesting stuff happening in between. A better indicator of variation is the sample variance, $$s^2$$ and sample standard deviation, **s**. The sample variance is calculated using the following formula:

$$s^2 = (1/(n−1() /sum_{i=1}^n (x_i − \bar{x})^2$$

You may also wonder why the equation divides by n−1 and not just n. This is known as [Bessel’s correction](https://en.wikipedia.org/wiki/Bessel%27s_correction). A sample’s variance is known to underestimate the population variance, σ2. Dividing by n−1 corrects for this bias.

The standard deviation is simply the square-root of the variance:

$$ s = sqrt{s^2} $$

To calculate this, we can use the var() and sd() functions:

```R
Diamonds_sample$depth %>% var()
```

```console
### [1] 2.106678
```

```R
Diamonds_sample$depth %>% sd()
```

```console
### [1] 1.45144
```

The following code walks through the computational steps of these two formulae. First we compute the variance, var().

Calculate the deviations x_i − bat{x}

```R
dev <- Diamonds_sample$depth - mean(Diamonds_sample$depth)
sd.table <- data.frame(Depth = Diamonds_sample$depth, 
                       Mean = mean(Diamonds_sample$depth), Deviation = dev)
sd.table
```

```console
###    Depth     Mean   Deviation
### 1   61.9 61.77667  0.12333333
### 2   59.3 61.77667 -2.47666667
### 3   59.6 61.77667 -2.17666667
### 4   59.5 61.77667 -2.27666667
### 5   61.6 61.77667 -0.17666667
### 6   62.2 61.77667  0.42333333
### 7   61.6 61.77667 -0.17666667
### 8   62.5 61.77667  0.72333333
### 9   63.4 61.77667  1.62333333
### 10  63.4 61.77667  1.62333333
### 11  60.6 61.77667 -1.17666667
### 12  63.9 61.77667  2.12333333
### 13  61.2 61.77667 -0.57666667
### 14  62.5 61.77667  0.72333333
### 15  62.2 61.77667  0.42333333
### 16  59.8 61.77667 -1.97666667
### 17  61.8 61.77667  0.02333333
### 18  58.2 61.77667 -3.57666667
### 19  63.7 61.77667  1.92333333
### 20  62.7 61.77667  0.92333333
### 21  61.2 61.77667 -0.57666667
### 22  63.8 61.77667  2.02333333
### 23  62.5 61.77667  0.72333333
### 24  61.0 61.77667 -0.77666667
### 25  62.8 61.77667  1.02333333
### 26  61.0 61.77667 -0.77666667
### 27  62.3 61.77667  0.52333333
### 28  62.6 61.77667  0.82333333
### 29  61.2 61.77667 -0.57666667
### 30  63.3 61.77667  1.52333333
```

Now square the deviations, $$ (x_i − bar{x}) ^ 2:

```R
dev2 <- dev^2
sd.table$DevSq <- dev2
sd.table
```

```console
###    Depth     Mean   Deviation        DevSq
### 1   61.9 61.77667  0.12333333 1.521111e-02
### 2   59.3 61.77667 -2.47666667 6.133878e+00
### 3   59.6 61.77667 -2.17666667 4.737878e+00
### 4   59.5 61.77667 -2.27666667 5.183211e+00
### 5   61.6 61.77667 -0.17666667 3.121111e-02
### 6   62.2 61.77667  0.42333333 1.792111e-01
### 7   61.6 61.77667 -0.17666667 3.121111e-02
### 8   62.5 61.77667  0.72333333 5.232111e-01
### 9   63.4 61.77667  1.62333333 2.635211e+00
### 10  63.4 61.77667  1.62333333 2.635211e+00
### 11  60.6 61.77667 -1.17666667 1.384544e+00
### 12  63.9 61.77667  2.12333333 4.508544e+00
### 13  61.2 61.77667 -0.57666667 3.325444e-01
### 14  62.5 61.77667  0.72333333 5.232111e-01
### 15  62.2 61.77667  0.42333333 1.792111e-01
### 16  59.8 61.77667 -1.97666667 3.907211e+00
### 17  61.8 61.77667  0.02333333 5.444444e-04
### 18  58.2 61.77667 -3.57666667 1.279254e+01
### 19  63.7 61.77667  1.92333333 3.699211e+00
### 20  62.7 61.77667  0.92333333 8.525444e-01
### 21  61.2 61.77667 -0.57666667 3.325444e-01
### 22  63.8 61.77667  2.02333333 4.093878e+00
### 23  62.5 61.77667  0.72333333 5.232111e-01
### 24  61.0 61.77667 -0.77666667 6.032111e-01
### 25  62.8 61.77667  1.02333333 1.047211e+00
### 26  61.0 61.77667 -0.77666667 6.032111e-01
### 27  62.3 61.77667  0.52333333 2.738778e-01
### 28  62.6 61.77667  0.82333333 6.778778e-01
### 29  61.2 61.77667 -0.57666667 3.325444e-01
### 30  63.3 61.77667  1.52333333 2.320544e+00
```

Now sum the squared deviations, $$ \sum_{i = 1}^{n} (x_i − bar{x})^2 $$

```R
sumdev2 <- sd.table$DevSq %>% sum()
sumdev2
```

```console
### [1] 61.09367
```

Now divide by n−1 (Bessel’s correction):

```R
variance <- sumdev2/(length(Diamonds_sample$depth)-1)
variance
```

```console
### [1] 2.106678
```

Correct! Square root the variance, $$\sqrt{s^2} $$ to get the sample standard deviation, s:

```R
variance %>% sqrt()
```

```console
### [1] 1.45144
```

Correct again! The variance for the depth data was 1.45. As the variance represents an averaged squared value, it is unit-less. The standard deviation corrects this by taking the square root of the variance in order to convert it back to its original scale. The standard deviation uses all the values in a dataset and is therefore a much more useful indicator of variability. The standard deviation represents the average deviation from the mean. For example, we could state that diamond depth percentages variaed by 1.45% on average. In other words, very littl variation. The mean of the depth data was calculated to be 61.78. The following info-graphic depicts the mean, range and standard deviation for diamond depth data according to a dot plot.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615278855/MATH1324/ModelTwo/StandardDeviation_wzd4as.png)

Now let’s calculate the mean and standard deviation for price in the complete Diamond dataset. We will short cut this using the **summary()** function.

```R
Diamonds$price %>% summary() 
```

```console
###    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
###     326     950    2401    3933    5324   18823
```

This is missing the standard deviation. We can use the summarise() function from the dplyr package to produce a similar summary. There are many other packages that make this easier, however, I believe learning to use dplyr to build these tables gives you far more flexibility and prevents the need to install another package. I’ll prove this shortly. Let’s have a look at a basic summarised table.

```R
Diamonds %>% summarise(Mean = mean(price, na.rm = TRUE),
                             SD = sd(price, na.rm = TRUE))
```

```console
###     Mean      SD
### 1 3932.8 3989.44
```

Note how we include **na.rm = TRUE** to remove missing values from the computations.

We quickly find the mean price equals 3932.8 and the standard deviation equals 3989.4. The very high standard deviation, which is higher than the mean itself, suggests great variability in diamond prices. We can plot the mean on the histogram to get a better sense of the value:

```R
Diamonds$price %>% hist(,col="grey",xlim=c(0,20000),xlab="Diamond Price",
                        main="Histogram of Diamond Prices")
Diamonds$price %>% mean() %>% abline(v=.,col='red',lw=2)
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615279193/MATH1324/ModelTwo/HistogramOfDiamondPricesWithMean_mj5gbe.png)

I’ve added a red line showing the mean. As the mean is influenced by all values in the dataset, the histogram above suggests that the mean is being pulled towards higher values. This is what we refer to as positive skew. The mean might not be the best indicator of central tendency for such a highly skewed distribution. Fortunately, when we performed the **summary()** function, we also obtained some very useful values called quartiles.

##### Quartiles and the Median
Quartiles are values that break a distribution into four parts, so that 25% of the data values fall within each interval. We refer to these values as Q1, Q2 and Q3. Q2 is also referred to as the median. Data can also be broken into percentages. So, we could call Q1 the 25th percentile, Q2 the 50% percentile and Q3 as the 75th percentile.

The median, Q2 or the 50% percentile, is a measure of central tendency. The median splits an ordered dataset in half, with 50% of values above and below the median.

The calculation of the median depends on whether there are an even or odd number of data points. Consider the two following datasets. Scenario 1 has 7 measurements and scenario 2 has 6 measurements:

Scenario 1	2, 4, 9, 8, 6, 5, 3
---
Ordered	2, 3, 4, 5, 6, 8, 9
---
Location of Median	$$ (n+1)/2 = (7+1)/2 = 4th $$
---

Therefore, the median is the 4th ordered value, Median =5. In R:

```R
x <- c(2, 3, 4, 5, 6, 8, 9)
x %>% summary()
```

```console
###    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
###   2.000   3.500   5.000   5.286   7.000   9.000
```

Scenario 2	2, 4, 9, 8, 6, 5
---
Ordered	2, 4, 5, 6, 8, 9
---
Location of Median	Average of the **(n/2)** and $$(n/2) + 1 $$ observations, so the average of the 3rd and 4th

The median is the average of the 3rd and 4th ordered observation so, $$ Median = (5 + 6) /2 = 5.5 $$. In R:

```R
y <- c(2, 4, 9, 8, 6, 5)
y %>% summary()
```

```console
###    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
###   2.000   4.250   5.500   5.667   7.500   9.000
```

Q1 and Q3 are calculated in a similar fashion after the dataset is split at the median, top and bottom 50%. Q1 is the median of the bottom 50% (i.e. 25th percentile) and Q3 is median of the top 50% (i.e. 75th percentile).

+ Q1 and Q3 when n = odd (take median value)

Q1 = Median of bottom 50%: For example, Median of 2, 3, 4, 5 = average of 2nd and 3rd value = (3+4)/2 = 3.5

Q3 = Median of top 50%: For example, Median of 5, 6, 8, 9 = average of 2nd and 3rd value = (6+8)/2 = 7

Note how the median is included in both halves.

+ Q1 and Q3 when n = even

Q1 = Median of bottom 50%: For example, Median of 2, 4, 5 = 2nd value = 4

Q3 = Median of top 50%: For example, Median of 6, 8, 9 = 2nd value = 8.

Note how the median is not included because the median is not an actual data point.

Note also that R does not use this method, which I have included as a simple instructional example. R has 9 different methods to calculate quartiles. We will stick to the default method produced by R. You just need to know conceptually what it represents.

**NOTE One:**

```R
Diamonds$carat %>% quantile() #Quartiles
```

**NOTE Two:**

```R
Diamonds$carat %>% median() # Median
```

##### Box Plots
Box Plots are used to depict the quartiles of distribution. The following info-graphic puts all the concepts of quartiles, medians and percentiles together. Let’s first dissect a box plot of diamond depth from the small sample:

Here are the quartiles:

Diamonds_sample$depth %>% summary()
###    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
###   58.20   61.05   62.05   61.78   62.67   63.90
Now let’s discuss the anatomy of the basic box plot below.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615283364/MATH1324/ModelTwo/BoxPlot_fw5x1f.png)

The **interquartile range (IQR)** is the middle 50% of data and is depicted as the “box” in the box plot. The IQR is also a measure of variation.

$$ IQR = Q3 − Q1 $$

```R
Diamonds$carat %>% IQR() #Interquartile range
```

Box plots also include suspected **outliers**, depicted using an “o” or a similar symbol. Outliers are values that fall beyond the **outlier fences**. The outlier fences are defined as the following:

$$ Lower outlier < Q1 − 1.5 ∗ IQR $$
$$ Upper outlier > Q3 + 1.5 ∗ IQR $$

Using the depth data summary, we find:

$$ IQR = 62.675 − 61.05 = 1.625 $$
$$ Lower outlier < 61.05 − (1.5 ∗ 1.625) = 58.6125 $$
$$ Upper outlier > 62.675 + (1.5 ∗ 1.625) = 65.1125 $$

Outliers are unusual cases that should be investigated by the researcher. Don’t automatically remove outliers until you have a good reason to do so. For example, an outlier might be a data entry error or a measurement that should have been excluded from the investigation. Removing outliers because they don’t look “nice” is not appropriate. When you remove outliers for any reason, this should be made clear when you report your results.

Now let’s put histograms, box plots, and measures of central tendency together:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615285599/MATH1324/ModelTwo/HistogramWithBoxPlot_inexyr.png)

The mean and median will be the same when the data have a symmetrical distribution. The median is said to be more robust (less sensitive to unusual cases) than the mean. Therefore, the median is often preferred when a variable’s distribution is skewed or has many outliers present. This is the case for the highly skewed diamond price data. **The median appears to give a better account of the central tendency of the data, while the mean seems unduly influenced by the long tail**. The following info-graphic summarises the effect of skewness on the mean and median. The mean is the **solid red line**, and the median is the **dashed red line**. The tail of a skewed distribution always draws the mean towards it, because the mean takes all values into account.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615309561/MATH1324/ModelTwo/TheEffectOfSkewnessOnTheMeanAndMedian_fss672.png)

Note that these effects are generally true for large datasets. In small datasets, skewness is often poorly estimated, so the relationship among the mean, median and skewness can behave in unusual ways.

##### Comparing Groups
Descriptive statistics and visualisations are often used to compare groups. The following examples show how the basic descriptive R functions and plots can be quickly extended to assist with comparing the distributions of a quantitative variable across qualitative groupings. The example will consider comparing diamond price distributions across colour. First, lets get a descriptive statistics table using the **summarise()** function from the **dplyr** package.

The table will include min, Q1, median, Q3, max, mean, standard deviation, n and missing value count. I’ve included quite a few descriptive statistics so you can get a sense of how to customise the table. Essentially, the table can incorporate any descriptive functions in R provided the function results in a single value. Take note how we have to include the option **na.rm = TRUE** to most of these functions. If we didn’t, and missing values were present, the function would fail.

```R
Diamonds %>% group_by(cut) %>% summarise(Min = min(price,na.rm = TRUE),
                                         Q1 = quantile(price,probs = .25,na.rm = TRUE),
                                         Median = median(price, na.rm = TRUE),
                                         Q3 = quantile(price,probs = .75,na.rm = TRUE),
                                         Max = max(price,na.rm = TRUE),
                                         Mean = mean(price, na.rm = TRUE),
                                         SD = sd(price, na.rm = TRUE),
                                         n = n(),
                                         Missing = sum(is.na(price)))
```

```console
### # A tibble: 5 x 10
###   cut         Min    Q1 Median    Q3   Max  Mean    SD     n Missing
###   <ord>     <int> <dbl>  <dbl> <dbl> <int> <dbl> <dbl> <int>   <int>
### 1 Fair        337 2050.  3282  5206. 18574 4359. 3560.  1610       0
### 2 Good        327 1145   3050. 5028  18788 3929. 3682.  4906       0
### 3 Very Good   336  912   2648  5373. 18818 3982. 3936. 12082       0
### 4 Premium     326 1046   3185  6296  18823 4584. 4349. 13791       0
### 5 Ideal       326  878   1810  4678. 18806 3458. 3808. 21551       0
```

Next, let’s create a side-by-side box plot.

```R
Diamonds %>% boxplot(price ~ cut,data = ., main="Box Plot of Diamond Price by Cut", 
                     ylab="Cut", xlab="Price",horizontal=TRUE, col = "skyblue")
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615310007/MATH1324/ModelTwo/ComparingGroups_ydb8ia.png)

Using this plot, confirm the following features:
+ Ideal has the smallest median price
+ Premium has the highest IQR
+ All price distributions are positively skewed
+ All price distributions have many suspected outliers
+ Fair has the highest Q1
+ Premium has the highest Q3

##### Scatter Plots
Scatter plots are used to visualise the relationship between two quantitative variables. One variable is plotted on the x axis and one variable on the y. The bivariate, or paired data, are indicated on the plot using a point. Let’s look at some examples. Let’s first consider the relationship between diamond price and carat. Here’s an excerpt from the data showing 10 sets of bivariate data, x,y.

```console
###    ID Carat Price
### 1   1  0.23   326
### 2   2  0.21   326
### 3   3  0.23   327
### 4   4  0.29   334
### 5   5  0.31   335
### 6   6  0.24   336
### 7   7  0.24   336
### 8   8  0.26   337
### 9   9  0.22   337
### 10 10  0.23   338
```

A point is plotted at the intersection between the x and y value for each data point. For example, for ID = 1, a point is plotted where carat = 0.23 intersects with a price value of 326. This is repeated for all 54,000 data points. Fortunately, you don’t have to do this by hand. Using R:

```R
Diamonds %>% plot(price ~ carat, data = .,ylab="Price", xlab="Carat",
                  col="blue",main="Price by Carat")
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615310410/MATH1324/ModelTwo/ScatterPlotsByCarat_tst3ld.png)

The scatter plot for price by carat suggests that as carat increases, price also tends to increase. However, there is still lots of variability that other diamond characteristics may help explain. Weight is not everything. Let’s have a look at a few more examples:

```R
Diamonds %>% plot(price ~ x, data = ., ylab="Price", xlab="Length (mm)",
                  col="blue",main="Price by Length (mm)")
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615310522/MATH1324/ModelTwo/ScatterPlotsLength_yar4kr.png)

Notice the 0 values. Scatter plots are a great way to explore your data to find possible irregularities.

```R
Diamonds %>% plot(price ~ y, data = ., ylab="Price", xlab="Width (mm)",
                  col="blue",main="Price by Width (mm)")
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615310632/MATH1324/ModelTwo/ScatterPlotsWidth_sewyvg.png)

Once again, there appears to be some outliers that need following up.

## Model Two - Probability: The Language of Uncertainty
### learning objectives
The learning objectives associated with this module are:
+ List the basic principles of probability.
+ Express uncertainty using probability.
+ Define common probability terms.
+ Solve basic probability problems.
+ Solve problems involving permutations and combinations.

### Probability
**Probability** is defined as the proportion of times a random event occurs in a very large number of trials. Probability must always be a value between 0 and 1. What we define as an “event” and a “trial” depends on the context. In statistics, we estimate the probability of an event using a sample and note its relative frequency, f/n, where f is the frequency or number of times an event occurs and n is the total sample size. As the sample size n increases, the sample will begin to approximate the true population probability.

+ In Statistics, we need to infer characteristics concerning a population from a sample (data) selected from the population.
+ Notice that the process of selecting the sample involves an element of variability and the theory of probability, which is the formal study of the law of chance, is just the thing we need to assess this variability.
+ Since nothing in life is certain, probability is widely used in all branches of science, engineering and economics.

There are many applications of probability in society. For example, we need to use probability theory to
+ design and analyse experiments in almost any field of science and social science.
+ assign values to financial derivatives.
+ design, dimension and control telecommunications systems, and
+ understand the process of evolution of gene sequences.

### Dependencies and risk
Modelling dependencies is an important and widespread issue in risk analysis:
+ Bank loans:
	+ Dependency between defaults on loans
	+ Correlation of default: what is the likelihood that if one company defaults, another will default soon after?
	+ Dependency between stocks (e.g. CAC40 & DAX)
	+ Amount of money for an insurance company which is needed to reimburse all claims.
+ Hydrology: Dependency between annual peak of a river and volume
+ Civil engineering: Reliability analysis of highway bridges
+ Risk management: 1% or 5% quantile of an investment portfolio return
+ Insurance industry: Estimating exposure to systemic risks
+ Correlation of deaths for life insurance companies:
	+ Marginal distributions: Probabilities of time until death for each spouse
	+ Joint distribution: Shows the probability of spouses dying in close succession
	+ Aim (actuarial studies): Estimate the conditional probability when one spouse dies, that the succeeding spouse will die shortly afterwards

### Basic Concepts
+ Why probability?
	+ It forms the mathematical foundation for statistical models and procedures.
+ Basic Concepts:
	+ An **experiment** is the process by which an observation (or measurement) is obtained.
	+ An **event** is a set of possible outcomes of an experiment, that is a subset of Ω, usually denoted by a capital letter.
+ The outcome space or sample space Ω is the set of all possible outcomes of an experiment, survey or
other observation

The **sample space** is the set of all possible outcomes of an experiment. We use the term “experiment” very loosely here to refer to any activity where an outcome can vary. The most common “experiment” in statistics is taking a sample from the population.

For examples,
+ Toss of a coin.
Ω = {H, T }  where H = “head up” T = “tail up”
+ Spin of a roulette wheel. Ω = {0, 1, . . . , 36} (There are 37 numbers on an Australian roulette wheel.)

#### Experiments and Events
##### Experiment
+ Experiment: Record an age
	+ A: person is 30 years old
	+ B: person is older than 65
+ Experiment: Toss a die
	+ A: observe an odd number
	+ B: observe a number greater than 2
+ Measurement of the number of phone calls passing through a telephone exchange in a fixed time period.
+ A record of the proportion of people in a survey who approve of the prime minister.

##### Events
+ An event that cannot be decomposed is called a **simple event**.
+ Denoted by E with a subscript.
+ Each simple event will be assigned a probability, measuring “how often” it occurs.
+ The set of all simple events of an experiment is called the sample space, S.
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615786366/MATH1324/ModelThree/event_gregwk.png)

Events are sets and so they are subject to the normal set operations. Thus
+ The event A ∪ B is the event that A or B or both occur.
+ The event A ∩ B is the event that A and B both occur.
+ The event A^c or \bar{A} is the event that A does not occur.
+ We write ω ∈ A to say that the outcome ω is in the event A.
+ We write A ⊆ B to say that A is a subset of B. This includes the possibility that A = B.
+ If A is finite (which will often not be the case), we write #A for the number of elements of A.

For illustrative purposes, and to gain intuition, the relationship between events is often depicted using a Venn diagram.

Two events A_{1} , A_{2} which have no outcomes in common (A1 ∩ A2 = ∅) are called mutually exclusive or disjoint events.

Similarly, events A1 , A2 , . . . are disjoint if no two have outcomes in common, that is
A_{i} ∩ A_{j} = ∅ ∀ i 6 != j.

Set operations satisfy the **distributive laws**
+ A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
+ A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)

and **De Morgan’s laws**
+ (A ∪ B)^c = A^c ∩ B^c
+ (A ∩ B)^c = A^c ∪ B^c

What do we mean when we say “The probability that a toss of a coin will result in ‘heads’ is 1/2”?
An interpretation that is accepted by most people for practical purposes, that such statements are made based upon some information about relative frequencies.

|  People  |   #trials   |    #heads   |    frequency of heads    |
|----------|-------------|-------------|--------------------------|
|  Buffon  |    4040     |     2048    |         0.5069           |
| DeMorgan |    4092     |     2048    |         0.5005           |
| Feller   |    10000    |     4979    |         0.4979           |
| Pearson  |    12000    |     6019    |         0.5016           |
| Pearson  |    24000    |     12012   |         0.5005           |

Similar statements can be made about tossing dice, spinning roulette wheels, arrivals of phone calls in a given time period, etc.

##### The Probability of an Event
+ The probability of an event A measures “how often” we think A will occur. We write P(A).
+ Suppose that an experiment is performed n times. The relative frequency for an event A is

$$ Number of timesA occurs / n = f / n $$
+ If we let n get infinitely large, $$ p(A) = \lim_{n \to \infty} f/n $$

Examples:
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615836762/MATH1324/ModelThree/probabilityExampleOne_i2zjpg.png)

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615836762/MATH1324/ModelThree/probabilityExampleTwo_hsusvv.png)

##### Probability axioms
These considerations lead to the following **axioms**:
1. P(A) ≥ 0, for all events A
2. P(Ω) = 1
3∗. (Finite additivity) For a set of mutually exclusive events {A1 , A2 , A3 , . . . , An }
$$ P ( \cup_{i=1}^{n} A_i ) = \sum_{i=1}^n P(A_i) $$

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615837364/MATH1324/ModelThree/ProbabilityAxioms_e6uq46.png)

In fact, it turns out that we need a slightly stronger version of Axiom 3 . Specifically, it has to hold for infinite sequences of mutually exclusive events. Thus, we use
3. (Countable additivity)
$$ P ( \cup_{i=1}^{\infty} A_i ) = \sum_{i=1}^{\infty} P(A_i) $$

where {A1 , A2 , A3 , . . .} is any sequence of mutually exclusive events.

We use countable, rather than finite, additivity because we sometimes need to calculate probabilities for countable unions.

For example, the event that a 6 eventually occurs when tossing a die can be expressed as $\cup_{i=1}^{\infty} A_i , where A_i is the event that the 6 occurs for the first time on the ith toss.

From the axioms, we can deduce the following properties of the probability function:
4. P(∅) = 0, since ∅ ∪ ∅ ∪ · · · = ∅
5. Finite additivity
6. P(A^c ) = 1 − P(A), since A ∪ A^c = Ω
7. A ⊆ B ⇒ P(A) ≤ P(B), since A ∪ (A^c ∩ B) = B
8. P(A) ≤ 1, since A ⊂ Ω
9. Addition theorem: P(A ∪ B) = P(A) + P(B) − P(A ∩ B)

The simplest case

When the outcome space is finite #(Ω) = N and there is no difference between outcomes so make them equally likely, then it follows easily from the axioms that

$$ P({ω}) = 1/N for all ω ∈ Ω $$

Further,

$$ P(A) = #(A)/N $$

##### Conditional Probability
If A and H are two events, and it is known that event H has occurred, what effect does this information have on the probability of occurrence of A?

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615838187/MATH1324/ModelThree/ConditionalProbability_blhf9r.png)

###### Example
Toss two fair dice. If we know that the first die is a 3, what is the probability that the sum of the two dice is 8?

The original sample space Ω has 36 outcomes {(1, 1), (1, 2), . . . , (6, 6)}. Given the first die is a 3 there are six outcomes of interest, {(3, 1), (3, 2), . . . , (3, 6)}. Since the dice are fair, each of these outcomes has the same probability of occurring. Hence, given that the first die is a 3, the probability of the sum being 8 is

If A denotes “sum of the dice is 8” and H denotes “first die is a 3” the probability we have calculated is called the **conditional probability** of A given H and is denoted P(A|H).

Hence the probability of A given H should be defined as the probability of A ∩ H relative to the probability of H:

$$ P(A|H) = P(A ∩ H) / P(H) if  P(H) > 0 $$

##### Multiplication Theorem
Sometimes we know P(H) and P(A|H) but not P(A ∩ H). If this is the case we can use the definition of conditional probability to express the probability of A ∩ H, that is

$$ P(A ∩ H) = P(H)P(A|H) $$

Let’s consider an example estimating the probability of randomly selecting people from the Australian population who have different levels of daily fruit consumption.

If we sampled random Australians we could categorise them into “< 1 serve”, “1 serve”, “2 serves” or “3 serves or more”. These outcomes or categories make up the sample space and the process of the sampling from the population is our “experiment”. An event is an outcome of the experiment, e.g. that someone we sample consumes < 1 serve of fruits per day. The probability of an event measures “how often” we expect the event to occur in the long run and is estimated using f/n. A probability estimated using a sample is an example of a statistic.

There is a entire abstract language used to express the laws of probability. We will look at the conventions here and relate these to real world examples. Once we have the basics down, we will concentrate on using these principles for practical purposes. Consider the following table adapted from Table 10 of the Australian Bureau of Statistics 2011 - 2012 National Health Survey. The table shows the estimated persons (reported in hundreds of thousands, ’000) that occupy the different levels of fruit intake. These estimates were taken from self-reports of a representative sample of approximately 18,400 households. The table splits these estimates across age and gender. We will use this table to explain the language of probability in a meaningful way and learn to solve problems that you will face in this course and later modules.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615772339/MATH1324/ModelThree/FruitIntake_ivsh5k.png)

### Rules
We denote probability using Pr(A), where A refers to an event of interest, e.g. Pr(2 serves). Let’s run an experiment by randomly selecting an Australian adult from the population. We will use the ABS data table as the probabilities of different events occurring. We use the relative frequency formula, f/n, to estimate this basic probability. First, we find the trial size, which is the estimated population size of Australians over the age of 18 as of 2012, 17,042, which equates to 17,042,000 people (the table is reported in ’000). Next, we find the frequency of people who eat two serves of fruit a day, 4984. Using the f/n formula, we write…

$$Pr(2 serves)=4984/17042=0.292$$

Therefore, the probability of randomly selecting an Australian adult who consumes two serves of fruits a day is .292. The probability of any event, Pr(A), must be between 0 and 1. If event A can never occur, Pr(A)=0. If event A always occurs when the experiment is performed, then Pr(A)=1. The sum of all probabilities of all possible events must equal 1:

$$Pr(< 1 serve)+Pr(1serve)+Pr(2 serves)+Pr(3 serves or more)=1$$
$$(3368+5445+4984+3244)/17042 = 17042 / 17042 = 1$$

Two events are said to be **mutually exclusive** if, when one event occurs, the other cannot and vice versa. Mutually exclusive sets have no intersection: Pr(A∩B)=0. We use ∩ to denote an intersection. The levels of fruit consumption are mutually exclusive. A person cannot occupy more than one category at a particular time.

%%Pr(1 serve ∩ 2 serves) = 0%%

If two events can occur simultaneously, the events are not mutually exclusive and an intersection is possible, e.g. Pr(< 1 serve ∩ Male). Note that the probability of an intersection can still be 0 even though an intersection is possible. For example, what if all Australian males had their favourite fruit prepared and delivered to them daily? Then, Pr(< 1 serve ∩ Male) would probably be close to 0.

When we talk about intersections, the term “and” is often used. For example, what is the probability that a randomly sampled Australian adult is in the “< 1 serve” interval AND male? You need to become comfortable with the language of probability. However, don’t worry, its a lot easier than you think when we apply the rules to real world examples. Using the Fruit Intake table, we can find this probability to be:

$$Pr(< 1 serve ∩ Male) = 2036 / 17042 = .119$$

The **union** of two events A or B, is an event when either A or B, or A and B occur. We write a union using the ∪ symbol. The word “or” is used to refer to a union. For example, consider Pr(1 serve ∪ < 1 serve), or in words, “What is the probability that a randomly sampled Australian will consume 1 serve of fruit OR less?”

$$Pr(1 serve ∪ < 1 serve) = (3368 + 5445) / 17042 = .517$$

The **complement** of an event consists of all outcomes of the experiment that do not result in an event. For example, $$Pr(\bar{< 1 serve}) = Pr(1 serve) + Pr(2 serves) + Pr(3 serves or more)$$. The complement of an event usually has a bar over the top of the event which is read as “not”. For example:

$$Pr(\bar{< 1 serve}) = Pr(1 serve) + Pr(2 serves) + Pr(3 serves or more) = (5445 + 4984 + 3244) / 17042 = .802$$

or

$$ Pr(\bar{< 1 serve}) = 1 − Pr(< 1 serve) = 1 − 3368/17042 = .802 $$

The figure below provides a notational overview of the basic probability concepts.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615773549/MATH1324/ModelThree/robabilityConcepts_fuflbf.png)

### Multiplication Law

If two events are **independent** (i.e. the probability of the first event does not impact the probability of the second event), then the intersection is equal to the probability of the first event multiplied by the second event, Pr(A∩B)=Pr(A)×Pr(B). However, if independence does not hold, the two events are said to be **dependent**.

For example, if the consumption of fruit was independent of gender, then Pr(< 1 serve ∩ Male) = Pr(< 1 serve) × Pr(Male). However, is the assumption of independence safe for fruit consumption and gender? It’s often believed that adult males tend to consume less fruits than females. Therefore, the assumption of independence is not safe and the multiplication rule will not hold. Let’s check this assumption using the multiplication rule.

Recall…

$$ Pr(< 1 serve ∩ Male) = 2036 / 17042 = .119 $$

Now, according to the multiplication rule for independent events:

$$ Pr(< 1 serve ∩ Male) = Pr(< 1 serve) × Pr(Male) = 3368 \ 17042 × 8406 \ 17042 = .097 $$

The two probabilities are not the same, therefore, as suspected, fruit consumption and gender are not independent. Males are more likely to be in the “< 1 serve” category. The take home message is that **the multiplication rule does not apply when events are dependent**.

### Addition Laws
Finding the probability of a union depends on whether or not the events are **mutually exclusive**. If the events are mutually exclusive, we simply add the events. Recall…

$$ Pr(1 serve ∪ < 1 serve) = (3368 + 5445) / 17042 = .517 $$

If the events are not mutually exclusive, we need to subtract the intersection from the addition law. For example:

$$ Pr(< 1 serve ∪ Male) = Pr(< 1 serve) + Pr(Male) − Pr(< 1 serve ∩ Male) = 3368 / 17042 + 8406 / 17042 − 2036 / 17042 = .571 $$

### Conditional Probability
The probability that an event, **B, will occur** given that another event, **A, has already occurred** is called the **conditional probability** of B given A. The “|” symbol, read as “given” is used to denote a condition. Conditional probability can be written as follows:

Pr(B|A) = Pr(A ∩ B) / Pr(A)

Using an example…

$$ Pr(< 1 serve|Male) = Pr(Male ∩ < 1 serve) / Pr(Male) = (2036 / 17042) / (8406 / 17042) = .242 $$

We can also use conditional probability to check independence. The two events A and B are independent if and only if Pr(A|B) = Pr(A) or Pr(B|A)=Pr(B). Otherwise, the events are dependent. Let’s use this rule to reconfirm that gender and fruit consumption are dependent.

Pr(< 1 serve | Male) = .242
Pr(< 1 serve) = 3368 / 17042 = .198

We find Pr(B|A) ≠ Pr(A). The probabilities are not equal, therefore, dependency is present. Given that you’re male, you are more likely to be consuming less than 1 serve of fruit per day than females. Males need to eat more fruit!

**NOTE:** conditional probability and Multiplication Law to check independence.

### Permutations and Combinations
#### Permutations (have rangking)

Let’s assume you are voting in a local council election. There are six candidates. You need to vote for the top three. How many possible ways can you assign your votes, 1st, 2nd and 3rd preference? This is an example of a permutation problem. Permutations refers to all the possible ways of selecting something where order matters. Here are three possible permutations for the voting example:

| Veronica Paskett   |	Milagros Depaolo    |	Loraine Muntz     |	Thuy Silverberg      |  	Myriam Hakes	|     Maude Dimery    |
|--------------------|----------------------|---------------------|--------------------------|--------------------------|---------------------|
|         1st	     |          2nd	    |          3rd  	  |              -	     |             -	        |          -          |
|         -	     |          1st	    |          2nd	  |              3rd	     |             -	        |          -          |
|         -	     |          2nd	    |          1st	  |              -	     |             3rd	        |          -          |
|         …	     |          …	    |          …	  |              …	     |             …	        |          …          |

As you can see, there are many more possible ways to assign your votes. To quickly calculate all the possible permutations, we can use the following formula:

$$P(n,k)=n! / (n−k)!$$

The ! symbol refers to the factorial of a number. For example, 6!=6×5×4×4×3×2×1=720. In R, we can use factorial():

```R
factorial(6)
```

```console
### [1] 720
```

k is the number to choose, in this example, 3.

Solving the voting problem:

P(6,3) = 6! / (6−3)! =6! / 3! = 7206

Using R:

```R
factorial(6) / factorial(6-3)
```

```console
### [1] 120
```

#### Combinations (not ranking)
Now let’s change the problem. You have four spare tickets for a sport grand final. You have ten friends that you know would like to go. You need to weigh up the social impact of inviting different combinations of friends. First you need to know how many possible combinations of selecting four out of ten friends need to be considered. **Combinations** refer to all the possible ways of selecting a certain number of things from a larger group. Here are three possible combinations:

|   Leah    |	Rosalie	   |    Marlena	   |    Tarra	 |    Graham	|    Gilberto	|    Marcos	|    Gladis	|    Otha	|    Jeremiah    |
|-----------|--------------|---------------|-------------|--------------|---------------|---------------|---------------|---------------|----------------|
|  Ticket   |      -	   |    Ticket	   |      -	 |    Ticket	|        -	|       -	|      -	|       -	|     Ticket     |
|     -	    |      -	   |       -	   |      -	 |      -	|        -	|     Ticket	|     Ticket	|     Ticket	|     Ticket     |
|     -	    |    Ticket	   |       -	   |    Ticket	 |      -	|      Ticket	|       -	|      -	|       -	|     Ticket     |

Notice with combinations that order does not matter. Leah, Marlena, Graham and Jeremiah is the same combination as Marlena, Leah, Jeremiah and Graham. All four friends will go to the game and will be your best friends forever, regardless of the order by which they’re selected.

The formula for combinations is as follows:

C(n,k) = n! / ((n−k)!k!)

This is known as the “choose”" formula or the binomial coefficient (we will revisit this in Module 4). Solving, we find:

C(n,k) = n! / ((n−k)!k!) = 10! / (10−4)!4! = 10! / (6)!4! = 3628800 / 17280 = 210

Using R:

```R
choose(10,4)
```

```console
### [1] 210
```

That’s incredible. There are 210 different combinations of friends that you could end up taking to the final. Considering the social ramifications of each combination will take weeks of deliberation, leave it to chance. Use a raffle instead. That way no one can claim favouritism… Who said statistics wasn’t useful!

## Probability Distributions: Random, but Predictable
### Overview
Despite the omnipresence of variability, many variables follow predicable patterns. That’s not to say we can reliably predict an individual observation with great certainty, but over the course of many repeated observations of a variable, we can predict many informative outcomes. This module introduces two discrete probability distributions and one continuous probability distribution which are know to model the behaviour of many random processes.

### Learning Objectives
The learning objectives associated with this module are:

+ Define and distinguish between random variables, discrete random variables, and continuous random variables.
+ Define the properties of the Binomial and Poisson distributions.
+ Correctly apply and work with the Binomial and Poisson distributions to solve Binomial and Poisson-based problems.
+ Define the properties of the normal distribution and identify where it can be applied.
+ Work with the normal distribution to solve normal-based problems.
+ Define the standard normal z-distribution.
+ Standardise random variables to standard normal variables, and vice-versa.
+ Compare empirical distributions to theoretical probability distributions

### Probability Distributions
This module will introduce you to the first set of fundamental probability distributions used by statisticians to model random processes. Probability distributions are based on the central concept of statistics that, while an individual random event is almost impossible to predict, the behaviour of random processes in the long run can be very well understood. This module introduces discrete and continuous probability distributions. These distributions are used to model quantitative variables that can only take on discrete values (1, 2, 3…) and continuous values (1.45, 5.43, 2.39). These probability distributions can be used to model many random variables including guessing on a multiple choice exam, the number of heads flipped from five tosses of a coin, the number of goals scored in a football match, the infection rate of a disease or the number of people lining up in a queue at your local cafe. Let’s start with the binomial distribution.

### Binomial Distribution
The binomial distribution is used to model the number of successes/failures in n independent trials where the probability of success at each trial is fixed as p. The probability of failure is 1−p. For example, let’s say a cancer vaccine is effective 85% of the time, p = .85. If we randomly select 12 vaccinated people from the population, n = 12, and expose them to the virus that causes the cancer, what is the probability that the vaccine will be successful for all 12 people? Before we answer this question, let’s take a look at some theory.

The binomial distribution has the following mathematical form:

$$Pr(X = k) = \binom{n}{k}p^k(1-p)^{n-k}$$

where k = successes, n = no. of trials and p = probability of success. This formula is known as a probability mass function or PMF.

The mean, or expected value, E(x), variance and standard deviation for a binomial distribution are as follows:

$$\text{Mean} = E(x) = np$$

$$\text{Variance} = np(1 - p)$$

$$\text{Standard deviation} = \sqrt{np(1-p)}$$


However, there is no need to remember these formulae. We will learn to use R to do the hard work for us. We will demonstrate R’s binomial function to solve the following questions related to the vaccine scenario. We will assume p = .85 and n = 12.

#### 1.1. What is the probability that the vaccine will work for 10 people?

$$Pr(X = k)$$

The key to solving these types of problems is to understand the question. Let’s write it out. The question is asking $Pr(X=10)$ , assuming 12 trials and the vaccine to be effective 85% of the time. X is a short way to refer to the number of successes. We can visualise this in the following plot (the code will be introduced later). The height of each point line refers to the binomial probability of observing 0 to 12 successes in 12 trials assuming, p = 0.85. Each probability was calculated using the binomial PMF formula above. We can see 0 - 7 success all have probabilities below 0.05, while 10 and 11 successes have probabilities approximately 0.30. This makes sense as the expected, or mean value = np = 12\*.85 = 10.2. If we added all the probabilities for each point line together, they would sum to 1. This is known as the total probability law. The Pr(X=10) has been coloured as a red line in the plot. We can quickly see Pr(X=10) will be about .30.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617966932/MATH1324/ModelFour/BinomialDistribution_npw3ty.png)

Now we could use the formula given above to calculate the exact probability…

$$Pr(X = 10) = \binom{12}{10}.85^{10}(1-.85)^{12-10}$$

However, using an R function will do this a lot quicker and far more accurately. In R, we use the dbinom(x, size, prob) function. This function has three arguments:

+ x : The value for k, or number of successes
+ size : The number of trials for each experiment
+ prob : The probability of success (p)

For Question 1. We type the following command into R:

```R
dbinom(x = 10, size = 12, prob = 0.85)
```

```console
### [1] 0.2923585
```

The answer is found to be $Pr(X = 10) = 0.29$. Given that the vaccine is 85% effective, it would be relatively common to find 10 successes in 12 randomly sampled people. In other words, there is a 29% chance that the vaccine will work for exactly 10/12 people.

If you’re interested in reproducing the plot above, you can use the following R code. Its a little lengthy, but it should mostly make sense.

```R
## Set binomial parameters.

n <- 12
p = .85

## Define PMF to highlight - Pr(X < x), Pr(X > x), or Pr(a < x < b)
## Leave blank "" for no highlights
x <- 10
a <- ""
b <- ""


## Set sequence of x values to plot
Successes <- seq(0,n)

## Calculate PMF
PMF <- dbinom(x = Successes, size = n, prob = p)

## Define points to highlight in plot

highlight <- ifelse(Successes <= b & 
                      Successes >= a |
                      Successes == x, "red", "blue")

## Plot PMF
plot(Successes, PMF, type = "p",
     main = paste("Binomial Distribution, n = ",n,", p = ",p), col = highlight)
lines(Successes,PMF, type = "h", col = highlight)
grid()
```

#### 1.2. What is the probability that the vaccine will work for 8 or less people?
$$Pr(X \leq k)$$

This is a slightly different question. We are asked to find $Pr(X = 0) + Pr(X = 1) + ... + Pr(X = 8)$, or simply $Pr(X ≤ 8)$. This is known as a cumulative probability. Visually, this question looks like the following plot. The red shaded point lines refer to $Pr(X≤8)$. If we add the probabilities of each of these point lines, we can solve the problem.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617967904/MATH1324/ModelFour/BinomialDistribution2_emgy8i.png)

Using the dbinom() function:

```console
dbinom(x = 0:8, size = 12, prob = .85) %>% sum()
### [1] 0.09220633
```

Alternatively, we can visualise the cumulative masss function (CMF), which plots, Pr(X≤x). For example: Pr(X≤1)=Pr(X=0)+Pr(X=1), or Pr(X≤8)=Pr(X=0)+Pr(X=1)+...+Pr(X=8) The CMF for the binomial distribution with n=12, p=0.85 is visualised below. As this is a CMF, it is bound between a probability of 0 and 1. To find Pr(X≤8), we look for 8 on the x axis. We can’t see the exact value, but we know it’s going be be less than 0.1.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617968098/MATH1324/ModelFour/BinomialDistribution3_rm3naj.png)

Easy to do in R using a slightly different pbinom() function:

```console
pbinom(q = 8, size = 12, prob = 0.85, lower.tail = TRUE)
### [1] 0.09220633
```

which we recall is exactly the same as:

```console
dbinom(x = 0:8, size = 12, prob = .85) %>% sum()
### [1] 0.09220633
```

We use q instead of x and we add lower.tail = TRUE to ensure we calculate $Pr(X≤x)$ and not $Pr(X>x)$, which would be specified as lower.tail = FALSE. The answer is .092. Once again, it would be unusual to observe the vaccine only working for 8 or less people out of 12, given p=0.85.

Here’s the code for the CMF plot above.

```R
## Set binomial parameters.

n <- 12
p = .85

## Define CMF to highlight - Pr(X < x), Pr(X > x), or Pr(a < x < b)
## Leave blank "" for no highlights
x <- ""
a <- 0
b <- 8

## Set sequence of x values to plot
Successes <- seq(0,n)

## Calculate CMF
CMF <- pbinom(q = Successes, size = n, prob = p)

## Define points to highlight in plot

highlight <- ifelse(Successes <= b & 
                      Successes >= a |
                      Successes == x, "red", "blue")

## Plot CMF
plot(Successes, CMF, type = "p",
     main = paste("Binomial Distribution, n = ",n,", p = ",p), col = highlight)
lines(Successes,CMF, type = "h", col = highlight)
grid()
```

#### 1.3. What is the probability that the vaccine will work in more than 8 random people?

$$Pr(X > k)$$

Once again, a slightly different question. This time we need to find, $Pr(X>8)$. According to the total probability rule, $Pr(0≤X≤12)=1$. The pbinom() function in R, by default, gives us $Pr(X≤8)$, therefore, $Pr(X>8)=1−Pr(X≤8)$. In other words, $Pr(X>8)=Pr(X=9)+Pr(X=10)+Pr(X=11)+Pr(X=12)$. Let’s visualise this question. The $Pr(X>8)$ is shaded in red.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617968446/MATH1324/ModelFour/BinomialDistribution4_qpkmpm.png)

```console
pbinom(q = 8, size = 12, prob = 0.85, lower.tail = FALSE)
### [1] 0.9077937
```

or…

```console
1-pbinom(q = 8, size = 12, prob = 0.85, lower.tail = TRUE)
### [1] 0.9077937
```

Note the use of lower.tail = FALSE to calculate $Pr(X>8)$. The answer should be .908. Now adding $Pr(X≤8)+Pr(X>8)=.092+.908=1!$ This confirms the total probability rule.

#### 1.4. What is the probability that the vaccine will work for between 9 to 11 people?

$$Pr(a \leq k \leq b)$$

Now this is a little tricky. We are asked to find $Pr(9≤X≤11)$. Let’s visualise it.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617968638/MATH1324/ModelFour/BinomialDistribution5_vwup2q.png)

We could just add, $Pr(X=9)+Pr(X=10)+Pr(X=11)$. That’s a perfectly acceptable answer.

```console
dbinom(x = 9:11, size = 12, prob = .85) %>% sum()
### [1] 0.7655519
```

We can also use some tricky subtraction:

```console
pbinom(11, 12, 0.85, lower.tail = TRUE) - pbinom(8, 12, 0.85, lower.tail = TRUE)
### [1] 0.7655519
```

This formula takes the cumulative probability, Pr(X≤11) and subtracts Pr(X≤8). The probability left over includes Pr(9≤X≤11).

#### 1.5. What is the expected value and standard deviation of the binomial distribution with n=12, p=0.85?

$$ E(x) & Var(x) $$

Looking back at the formula, we can write some quick R code to answer this question. First we create two objects called n and p. We assign the parameters from the example to these objects.

```R
n <- 12
p <- 0.85
```

Now we can call these objects into our formula.

```console
## Mean or expected value
n*p
### [1] 10.2
## SD
sqrt(n*p*(1-p))
### [1] 1.236932
```

The advantage of this approach is if we need to change n and p to work on a different example. We simply change the object values (e.g. n <- 50, p <- 0.5) and re-run the formula. There is no need to rewrite the values into the formula. This can save a lot of time in the long run.

### Poisson Distribution
The Poisson distribution is used to model the occurrence of discrete events over a specific period of time, t. The Poisson distribution has one parameter, $λ$, which is the expected, E(x), or mean, $μ$, number of events in a unit of time. For example, the expected daily number of patients for a doctor during winter might be $λ=16$. $λ$ can be adjusted to take into account different time periods using $μ=λt$. For example, the mean number of patients for the same doctor over a week in winter is $μ=λt=16∗7=112$. This assumes $λ$ is time constant. The mean, $μ$, and variance, $σ2$, of a Poisson random variable is simply $λ$. The Poisson distribution has the following probability mass function:

$$Pr(X = k) = \frac{e^{-\mu}\mu^k}{k!}$$

where, k = the number of occurrences, e = the exponential function, and ! is a factorial.

#### $$ E(x) & Var(x) $$

The mean, μ,or expected value, E(X), variance, $\sigma^2$, and standard deviation, $\sigma$, for a Poisson distributed variable are as follows:

+ $\mu = E(X) = \lambda$
+ $\sigma^2 = Var(X) = \lambda$
+ $\sigma = \sqrt{\lambda}$

We will work through some Poisson problems using R.

##### 2.1. What is the probability the doctor will see exactly 16 patients in a given day?

$$Pr(X = x)$$

This is a simple one. We need to find $Pr(X=16)$. The red area in the following plot highlights the probability visually. The plot represents a PMF of the Poisson distribution with $\lambda = 16$.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617970344/MATH1324/ModelFour/PoissonDistribution1_blns7v.png)

In R, use the dpois(x, lambda) function, which has the following options:

+ **x**: This is the x value you want to look up under the Poisson distribution
+ **lambda**: This the mean rate over time, $\mu$

Therefore, we use the following formula:

```console
dpois(x = 16, lambda = 16)
### [1] 0.09921753
```

The function dpois() computes the probability of observing a particular number of occurrences for a Poisson distribution. The answer to question 1 is Pr(X=16)=.099. We can use the following code to replicate the visualisation above:

```R
## Set Poisson parameters. 

lambda <- 16
time_multiplier <- 1
mu <- lambda*time_multiplier

## Define PMF to highlight - Pr(X < x), Pr(X > x), or Pr(a < x < b)
## Leave blank "" for no highlights
x <- 16
a <- ""
b <- ""

## Set sequence of x values to plot
Events <- seq(ifelse(sign(round(mu-sqrt(mu)*4,0))==-1,0,
                     round(mu-sqrt(mu)*4,0)),
              round(mu+sqrt(mu)*4,0))

## Calculate PMF
PMF <- dpois(x = Events, lambda = mu)

## Define points to highlight in plot

highlight <- ifelse(Events <= b & 
                      Events >= a |
                      Events == x, "red", "blue")

## Plot PMF
plot(Events, PMF, type = "p", 
     main = paste("Poisson Distribution, Mean = ",mu), col = highlight)
lines(Events, PMF, type = "h", col = highlight)
grid()
```

##### 2.2. What is the probability the doctor will see 12 or less patients in a given day?

$$Pr(X \leq x)$$

This time we’re asked $Pr(X ≤ 12)$. Visually…

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617970878/MATH1324/ModelFour/PoissonDistribution2_pfd6vj.png)

In R…

```console
ppois(q = 12, lambda = 16)
### [1] 0.1931215
```

Notice that we need to use the function ppois(), which gives $Pr(X <= x)$, rather than the earlier function dpois(), to solve for the cumulative probability, CMF, of the doctor seeing 0 to 12 patients in a given day. Remember the difference between these two functions. Visually, the Poisson CMF looks like the following:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617971039/MATH1324/ModelFour/PoissonDistribution3_v3ji5d.png)

```R
## Set Poisson parameters. 
Pr(8 \leq X \leq 24) = 0.968
lambda <- 16
time_multiplier <- 1
mu <- lambda*time_multiplier

## Define PMF to highlight - Pr(X < x), Pr(X > x), or Pr(a < x < b)
## Leave blank "" for no highlights
x <- ""
a <- 0
b <- 12

## Set sequence of x values to plot
Events <- seq(ifelse(sign(round(mu-sqrt(mu)*4,0))==-1,0,
                     round(mu-sqrt(mu)*4,0)),
              round(mu+sqrt(mu)*4,0))

## Calculate CMF
CMF <- ppois(q = Events, lambda = mu)

## Define points to highlight in plot

highlight <- ifelse(Events <= b & 
                      Events >= a |
                      Events == x, "red", "blue")

## Plot PMF
plot(Events, CMF, type = "p", 
     main = paste("Poisson Distribution, Mean = ",mu), col = highlight)
lines(Events, CMF, type = "h", col = highlight)
grid()
```

##### 2.3. What is the probability that the doctor will see less than or equal to 100 patients in a week?

We need to adjust the mean value to $\mu = 16\*7 = 112$. The questions asks $Pr(X≤100)$. Visually…

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617971269/MATH1324/ModelFour/PoissonDistribution4_icnsj0.png)

Using R:

```console
ppois(q = 100, lambda = 16*7)
### [1] 0.1378483
```

The answer will be Pr(X≤100)=.138.

##### 2.4. What is the probability that the doctor will see more than 25 patients in a day?

$$Pr(X > x)$$

This time we are asked Pr(X>25). Visually…

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617971398/MATH1324/ModelFour/PoissonDistribution5_dlt4tk.png)

We can solve this by solving $Pr(X > 25) = 1 - Pr( X \leq 25$.

```console
1 - ppois(q = 25, lambda = 16)
### [1] 0.01311856
```

or…

```console
ppois(q = 25, lambda = 16, lower.tail = FALSE)
### [1] 0.01311856
```

The probability is very small at Pr(X>25)=.013.

##### 2.5. What is the probability that the doctor will see between 8 to 24 patients in a given day?

$$Pr(a \leq X \leq b)$$

This is a little tricky. We need to find $Pr(8 \leq X \leq 24)$. Visually…

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617971597/MATH1324/ModelFour/PoissonDistribution6_cxsbds.png)

We could just add $Pr(X = 8) + Pr(X = 9) + ... + Pr(X = 24)$. However, this is a little slow. Try…

```console
ppois(q = 24, lambda = 16) - ppois(q = 7, lambda = 16)
### [1] 0.9676847
```

Much quicker! The answer is found to be $Pr(8 \leq X \leq 24) = 0.968$. The reason we put x=7 into the second part of the formula is that we want to include $Pr(X=8)$ in the left over cumulative probability.

### Normal Distribution

The continuous, normal, or Gaussian, distribution is ubiquitous in the field of statistics. Many random variables exhibit a normal distribution shape or, at least, do so approximately. Continuous variables that are known to have a normal distribution make determining the probability of certain events easy to calculate. Probabilities for normal distributions can be readily obtained from tables in the back of most statistics textbooks or functions built into spreadsheets and statistical packages. We will focus on using technology to calculate these probabilities.

To illustrate the application of the normal distribution, we will consider looking at an example involving IQ or “intelligence” scores. IQ scores are believed to have a normal distribution in the population. Most people score close to the average, while few people score really low (e.g. those with learning disabilities) or really high (e.g. geniuses). The normal distribution has two parameters, a mean, $\mu$, and a standard deviation, $\sigma$. For IQ we would denote the theoretical normal distribution as follows:

$$IQ \sim N(\mu, \sigma) \sim N(100,15)$$

The following info-graphic shows the theoretical normal distribution of IQ scores. The shaded areas refer to 1 standard deviation, $\sigma$. Normal distributions have very specific properties. As you can see from the info graphic, 68% of a normal distribution falls within 1 standard deviation of the mean, $85\<x\<115$. From 1 to 2 standard deviations, $115\<x\<130$, 13.5% of values will fall. As the normal distribution is perfectly symmetric, we can also see that 13.5% of values will fall between -1 and -2 standard deviations, $70\<x\<85$. We also have 2.5% of values falling beyond 2 and -2 standard deviations, $x<70$ and $x>130$.

Note that for continuous distributions, there is no distinction between $Pr(X\<x)$ and $(X \leq x)$. These two statements are the same because for a continuous distribution the exact probability $Pr(X=x)$ always equals 0. This course will always use the < sign in place of $\leq$ because < is quicker to type!

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617972688/MATH1324/ModelFour/NormalDistribution1_wyx06z.png)

So assuming IQ scores are theoretically normally distributed in the population, what types of questions can we answer? Let’s work through some examples to get an idea. Along the way, we will look at using simple functions in R to quickly and effectively answer these questions.

#### 1. What is the probability that a random person from the population will have an IQ score less than 80?

The question is asking $Pr(X<80)$. We use X to represent a measurement for a random variable. If we plot the theoretical normal distribution and shade the area red that represents this probability, it would look like the following:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617972805/MATH1324/ModelFour/NormalDistribution2_xobufv.png)

So what’s the best way to find this probability? Use the built in functions of R. Specifically, we will use the function, pnorm(q, mean , sd , lower.tail = TRUE). This function has the following arguments:

+ **q**: This is the value you want to look up under the normal distribution.
+ **mean**: The population mean.
+ **sd**: The population standard deviation (don’t confuse this with the variance).
+ **lower.tail**: If TRUE = Pr(X\<x), the cumulative probability up to x . If false, Pr(X\>x) will be returned. TRUE is used by default, so it’s often ignored.
Therefore, in R, we use the formula:

```console
pnorm(q = 80, mean = 100, sd = 15)
### [1] 0.09121122
```

We find Pr(X<80)=0.091. This means we have a 9.1% chance of randomly selecting a person with an IQ below 80. To reproduce the plot see the code at the end of this section (It’s rather long).

#### 2. What is the probability that you will randomly select a person from the population with an IQ score above 110?

$$Pr(X > x)$$

This time we need to find Pr(X \> 110). Visually…

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617973090/MATH1324/ModelFour/NormalDistribution3_yb41ns.png)

One way to solve this is to use the rule that Pr(X\>x) = 1 − Pr(X\<x). In R, we would write the formula as either:

```console
1 - pnorm(q = 110, mean = 100, sd = 15)
### [1] 0.2524925
```

or…

```console
pnorm(q = 110, mean = 100, sd = 15, lower.tail = FALSE)
### [1] 0.2524925
```

Note the use of lower.tail = FALSE in the second formula. This reports Pr(X>110). The answer was found to be Pr(X>110)=.252.

#### 3. What is the probability that a randomly selected person from the population will have an IQ score within one standard deviation from the mean?

$$Pr(a < x < b)$$

The population standard deviation is 15 points, therefore, we need to find Pr(85\<X\<115). Visually…
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617973356/MATH1324/ModelFour/NormalDistribution4_x8hpud.png)

This is getting a little tricky. We can solve this by first calculating Pr(X<115). We then calculate Pr(X\<85). If we subtract Pr(X<85) from Pr(X<115), we are left with Pr(85\<X\<115). This gives us the following useful formula:

$$Pr(a < x < b) = Pr(X < b) - Pr(X < a)$$

In R:

```console
pnorm(q = 115, mean = 100, sd = 15) - pnorm(q = 85, mean = 100, sd = 15)
### [1] 0.6826895
```

The answer is Pr(85\<X\<115)=.683. Now look back at the info-graphic. Therefore, there is a 68.3% chance that a person’s IQ score will be within one standard deviation from the mean. Simple! Well, sort of…

#### Find X given percentile
4. A random person is selected from the population and their IQ is found to be in the 90th percentile. What was their IQ?

This is a different question again. We are given a percentile and asked to find the person’s actual IQ. Scoring in the 90th percentile means that a person scored equal to or better than 90% of other people in the population. Therefore, we need to solve for x, in Pr(X\<x)=.9. We need to use a different formula in R. The formula in question is qnorm(p, mean, sd, lower.tail = TRUE/FALSE), which has four arguments.

+ **p**: This is the cumulative probability Pr(X < x).
+ **mean**: The population mean.
+ **sd**: This is the population standard deviation (don’t confuse this with the variance).
+ **lower.tail**: If TRUE = Pr(X\<x), the cumulative probability up to x . If FALSE, Pr(X\>x), TRUE is set by default if left blank.

To answer the question, we complete the formula as follows:

```console
qnorm(p = 0.9, mean = 100, sd = 15)
### [1] 119.2233
```

Rounding the answer to a whole number, we find Pr(X\<119)=.9. Therefore, if a person scored in the 90th percentile, their IQ was 119.

#### Find b given a and percentile
5. You are told that 95% of the population’s IQ scores fall between a score of 71 and an unsolved upper value. What is the upper value?

The question asks Pr(71\<X\<b)=.95. This one is also quite tricky. Let’s have a think… We can find Pr(X\>71)=.973, which tells us how much probability is above a score of 71.

```console
1 - pnorm(q = 71, mean = 100, sd = 15)
### [1] 0.9734024
```

or…

```console
pnorm(q = 71, mean = 100, sd = 15, lower.tail = FALSE)
### [1] 0.9734024
```

This means that there is .973−.95=.023 probability left above the upper value x, or Pr(X\>x)=.023. This x value is the answer to our question. To find this x value, we use:

```console
qnorm(p = 1 - .023, mean = 100, sd = 15)
### [1] 129.9309
```

Note how we have used 1−.023, which corresponds to the 97.7th percentile. The answer to the above formula is Pr(71\<X\<130)=.95. Visually, the red shaded area corresponds to .95 probability.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617974230/MATH1324/ModelFour/NormalDistribution5_iu4lip.png)

We can check our answer using the formula:

```console
pnorm(q = 130, mean = 100, sd = 15) - pnorm(q = 71, mean = 100, sd = 15)
### [1] 0.9506523
```

The answer is confirmed to be .95! Phew, that one was getting tricky.

### The Standard Normal Z-Distribution
The standard normal z-distribution is sometimes used in statistics as it allows for probabilities to be looked up using standard tables available in textbooks. We need to know a little bit about the z-distribution, particularly the concept of standardisation, as it appears in a number of other modules. The standard normal distribution has the following properties:

$$z \sim N(0,1)$$

where z refers to a standard normal variable. Let’s look at an example. Thinking back to IQ scores, we can convert IQ scores to a standard normal variable using the equation:

$$z = \frac{x - \mu}{\sigma}$$

The z-score divides the difference between an x value and the mean by a population standard deviation. Therefore, z scores are standard deviations. So, suppose we are asked to find Pr(X>110) using the standard normal distribution. First, we convert the IQ variable, x, to z, i.e. a z-score or standard deviation.

$$z = \frac{x - \mu}{\sigma} = \frac{110 - 100}{15} = \frac{10}{15} = .667$$

Therefore, an IQ score of 110 sits .667 standard deviations above the mean of 100. Simple!

Now we can find Pr(Z>.667) using the pnorm() function in R.

```console
1 - pnorm(q = .667, mean = 0, sd = 1)
### [1] 0.2523861
```

or…

```console
pnorm(q = .667, mean = 0, sd = 1, lower.tail = FALSE)
### [1] 0.2523861
```

We find Pr(X>110)=0.252. You will find the answer to be exactly the same as when we used:

```console
1 - pnorm(q = 110, mean = 100, sd = 15) 
### [1] 0.2524925
```

or

```console
pnorm(q = 110, mean = 100, sd = 15, lower.tail = FALSE)
### [1] 0.2524925
```

You will need to use standardisation techniques throughout the course. This section has aimed to give you a heads up. There is nothing special about the z-distribution. It’s just a way to standardise a variable so that common probability tables can used. To convert a z-score back to its original x value use the following equation:

$$x = \mu + \sigma{}z$$

E.g…

$$x=100+15(.667)=110$$

#### Normal Distribution Visualisation Code
This is the code used to create the visualisations of the normal distribution.

```R
## Set Normal distribution parameters. Use SD, not Var!

mu <- 100
sd <- 15

## Set values to highlight
## x: Pr(x < x) or Pr(X > x)
## a and b: Pr(a < x < b)

x <- 80
a <- ""
b <- ""

## Highlight area under curve - Pr(X < x) = "less",
## Pr(X > x) = "greater", Pr(a < x < b) = "between"

area <- "less"

## Define area to highlight

if (area == "less") {
  auc <- c(0,dnorm(seq(mu-sd*4,x,sd*0.01), mean = mu, sd = sd),0)
  x_values <- c(mu-sd*4,seq(mu-sd*4,x,sd*0.01),x)
  } else {
  if (area == "greater") {
    auc <- c(0,dnorm(seq(x,mu+sd*4,sd*0.01), mean = mu, sd = sd),0)
    x_values <- c(x,seq(x,mu+sd*4,sd*0.01),mu+sd*4)
  } else {
    if (area == "between") {
      auc <- c(0,dnorm(seq(a,b,sd*0.01), mean = mu, sd = sd),0)
      x_values <- c(a,seq(a,b,sd*0.01),b)
    }
  }
}

## Create probability statement

if (area == "less") {
  prob_statement <- paste("Pr(X < ",x,") = ", round(pnorm(x,mu,sd),3), sep = "")
  } else {
    if (area == "greater") {
      prob_statement <- paste("Pr(X > ",x,") = ", 
                              round(pnorm(x,mu,sd,lower.tail = FALSE),3), sep = "")
      } else {
        if (area == "between") {
          prob_statement <- paste("Pr(",a," < x < ",b,") = ", 
                                  round(pnorm(b,mu,sd) - pnorm(a,mu,sd),3), sep = "")}
        else {
          prob_statement <- ""
        }
      }
  }


## Plot density
curve(expr = dnorm(x,mu,sd), 
      xlim = c(mu-sd*4,mu+sd*4), 
      main = paste("Normal Distribution, Mean = ",mu,", Sigma = ",sd),
      ylab = "Density")
if (area != "") {
  polygon(x = x_values, y = auc, col = "tomato")
  text(x = mu-sd*4, y = dnorm(mu-sd/4,mu,sd), labels = prob_statement, pos = 4)
}
```

## Module 5 Sampling: Randomly Representative

### Introduction to the Module
This topic is covered in Module 5 of course website. Often a population is immeasurable. Therefore, statistical investigations must often rely on the use of a sample from the population. This module will introduce sampling from populations.

### Learning Objectives
The learning objectives associated with this module are:

+ Describe the purpose of sampling for estimation and inference.
+ Define and distinguish between different sampling methods.
+ Define a sampling distribution for a statistic.
+ Define the expected value and variance of a sampling distribution.
+ Use technology to simulate and explore the characteristics of sampling distributions.
+ Define and apply the Central Limit Theorem (CLT).

### Module Video
This a nice video that explains the challenge of sampling in ecology research. The video discusses populations, samples and random samples.

{% youtube nsMWvSuJm08 %}

### Populations and Samples
In this module we will dive deeper into the world of inferential statistics first introduced back in Module 1. Recall, statistical inference refers to methods for estimating population parameters using sample data. A **population** is the larger group that a researcher wants to generalise their results to. For example, a researcher may need to know the average battery life for a new model of mobile phone, or estimate the average transfer speeds for a new computer hard disk drive. It would be too expensive or infeasible to test every unit manufactured. Therefore, the researcher must use another method.

A researcher’s confidence in their ability to infer what’s happening in the population comes down to the quality of the sample and quality of the data collected. In this section we will deal with samples. A **sample** is a smaller subset of a population. If the sample is chosen appropriately, it can provide a fairly accurate account of the population. Why do we use samples? Cost, time and practical constraints often make measuring the population impossible. Think back to the mobile phone and hard disk drive example in the previous paragraph. When an entire population is measured, it is called a census. The Australian Bureau of Statistics (ABS) conducts the Australian Census every five years at an estimated cost of $440 million (Based on 2011 Census). As you can understand, this amount of time and money is well beyond the means of most statistical investigations.

There are good and bad ways of gathering samples. Probability-based methods maximise the chances of gathering a randomly representative sample. Common probability-based methods include simple random sampling, cluster sampling and stratified sampling. Non-probability based methods make no effort to ensure the sample is randomly representative. The best example of these types of methods are convenience sampling, purposive sampling, quota sampling and snowballing. Let’s take a closer look at the probability-based methods.

### Sampling Methods

#### Simple Random Sampling (SRS)
In SRS, every unit in a population has an equal chance of being selected. For example, every new model mobile phone manufactured has an equal chance of being selected to undertake a battery test. This is the most simple and effective probability-based sampling method. However, it can be tricky to implement. For example, if we were looking at the population, how do we get a list of every single Australian so you can ensure everyone has an equal chance of being selected? A phone book is a good start, but what about people without landlines? This course will focus mainly on simple random sampling. Watch the following video by Steve Mays for a nice overview of SRS.

{% youtube yx5KZi5QArQ %}

#### Stratified Sampling
Stratified sampling divides the population into subpopulations, called strata (e.g. gender, age bands, ethnicity), and then takes a SRS from each strata proportional to the strata’s representation in the population. For example, the Australian population is approximately 49% male and 51% female. A stratified sample for gender would divide the population into males and females and then proceed to take SRSs of males and females so the resulting sample is approximately 49:51 male:female. Stratified sampling can be more complex as there is no limit to the number of strata and levels within the strata. For example, a researcher may wish to stratify the population by gender, age bands and ethnicity. This would result in a sample that is more likely to be representative, but would require substantially more time and effort.

{% youtube sYRUYJYOpG0 %}

#### Cluster Sampling
Cluster sampling first divides the population into naturally occurring and homogeneous clusters, e.g. postcodes, towns, manufacturing batches, factories, etc. The investigator then randomly selects a defined number of clusters. For example, referring back to the hard disk drive example, the company may have manufactured 100 batches of hard disk drives on different days. They may decide to randomly select 10 batches which they define as the clusters. Using these randomly sampled clusters, the investigator would then proceed with the use of SRS within each cluster to select their sample. For example, the investigator might decide to randomly select 10 hard disk drives from each of the 10 batches making a total sample size of 100. Cluster sampling can be more economical and less time-consuming than SRS. This is because the researcher is required to perform SRS only within a limited number of clusters and not the entire population.

{% youtube QOxXy-I6ogs %}

#### Convenience Sampling
Convenience sampling methods, or non-probabilistic sampling, make no effort to randomly sample from the population. Therefore, the degree to which a convenience sample is randomly representative to the population is always unknown. Convenience samples have a high probability of being biased. A biased sample is a sample that cannot be considered representative of the target population. It is possible for a convenience sample to be representative, but the probability is always unknown. Substantial caution must be placed on inferences drawn from the use of convenience samples. Regardless, convenience samples are probably the most common samples used in research due to their low cost and relative ease. Very few researchers have the time and money to use probabilistic methods. That’s not to say you shouldn’t try, but if you’re forced to use a convenience sample, you should always note its limitations.

{% youtube MJjq0NILrnk %}

It’s important to note that probability-based sampling methods do not guarantee a representative sample either. That’s why we say the sample is **randomly representative**. There is still uncertainty. This is particularly true for small samples. We can take another look at the info-graphic provided by Wild, Pfannkuch and Horton (2011) that looks at populations, samples and sample size. Note that Wild et al. are referring to probability-based sampling methods.

The larger a random sample, the more likely it is to represent the population.

This is an important lesson. Sample size does matter and should always be considered an important consideration when planning an investigation. In the next section will be explore this concept further when we consider sampling distributions.

### Sampling Distributions
Take a random sample from the population, of say size n=100, measure a quantitative variable on each unit and calculate the sample mean. Write down the sample mean in a data recording sheet. Now place the sample back into the population and take another random sample of the same size. Measure your variable, calculate the sample mean, and record its value in the same recording sheet. The sample mean won’t be the same, because it’s a slightly different sample. Remember, this is called sampling variability or error. Now, repeat this process many, many times, say one thousand. Now, take all the one thousand sample means you recorded and plot them using a histogram. This histogram of the sample means is an example of a **sampling distribution**.

{% youtube z0Ry_3_qhDw %}

A sampling distribution is a hypothetical distribution of a sample statistic, such as a mean, median or proportion, constructed through the repeated sampling from a population. A sampling distribution describes what would happen if we were to repeat a study many times over and for each replicated study we recorded a summary statistic. 

Sampling distributions are influenced by two major factors.
+ The first factor is the underlying distribution of the random variable. For example, if your random variable is distributed normally, binomially, or exponentially, this will have an effect on the characteristics of the sampling distribution. 
+ The second major factor is the sample size n. The sample size of the hypothetical repeated studies has some interesting effects on the sampling distribution, as we will discover shortly.

The [Cal Poly Sampling Distribution Shiny app](https://calpolystat1.shinyapps.io/sampling_distribution/) will allow you to commence exploring sampling distributions.

**Activity 1**

1. Set the following inputs:
+ Population Distribution: Normal
+ Population mean: 0
+ Population standard deviation: 1
+ Sample size: 10
+ Statistic: Mean
+ Number of samples: 1

2. Click **Draw samples**. This draws one random sample (n=10) from the population. The sample values are displayed in the first histogram. The sample mean is calculated and plotted on the sampling distribution of the mean plot.
3. Number of samples: 1000
4. Click Draw samples. The app will quickly draw 1000 random samples and plot their means. Note the difference between a sample distribution versus a sampling distribution of the mean.

**Activity 2**

1. Now let’s change the underlying population distribution and increase the sample size. Set the following inputs:
+ Population Distribution: Left-skewed
+ Population mean: 0
+ Population standard deviation: 1
+ Sample size: 100
+ Statistic: Mean
+ Number of samples: 1000

2. Click **Draw samples**. Note that while the population distribution is heavily left-skewed, the sampling distribution of the means is not. You will learn more about this when we look at the central limit theorem.

#### YouTube Data
We will use the [YouTube.csv](https://raw.githubusercontent.com/yanboyang713/RMIT-Data-Repository/main/Youtube.csv) data to explore the concepts of a sampling distribution. The data were originally sourced from the [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Online+Video+Characteristics+and+Transcoding+Time+Dataset). The dataset contains the basic video characteristics of over 24,000 YouTube clips. The variables are as follows:

+ **id**: Youtube vide id
+ **duration**: duration of video
+ **bitrate**: bitrate(total in Kbits)
+ **bitrate.video**: bitrate(video bitrate in Kbits)
+ **height**: height of video in pixles
+ **width**: width of video in pixles
+ **framerate**: actual video frame rate
+ **frame.rate.est.**: estimated video frame rate
+ **codec**: coding standard used for the video
+ **category**: YouTube video category

#### Population Distribution
The [Youtube.csv](https://raw.githubusercontent.com/yanboyang713/RMIT-Data-Repository/main/Youtube.csv) data will be treated as the unknown population. As the dataset contains over 24,000 video characteristics, this isn’t too difficult to imagine, even though the total population size of YouTube is much, much, much higher (I am yet to find a credible estimate! If you find one email me). For the sake of the example, we will imagine this to be the unknown reality that we are trying to estimate. We will look at estimating the average YouTube video duration, measured in seconds (sec). The data has been cleaned to enable a better a visualisation of the population distribution. Extreme outliers (Duration > Q3 + [IQR∗3]) have been removed to help lessen the extent of the extreme values in the right tail of the distribution. I used the following R code and saved the filtered data object as YouTube_clean.

```R
YouTube_clean <- YouTube %>% filter(duration < (281 + ((281-52)*3)))
```

This step only removed around 3% of the original data. The YouTube video duration distribution is visualised in the following density plot. A density plot is similar to a histogram, but uses a smoothing algorithm to remove the need for bins. The mean is depicted using a red line. The distribution is skewed to the right. Visually:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618677526/MATH1324/ModelFive/youtubeVideoDistribution_gywftq.png)

Here are the population’s parameters:

```R
YouTube_clean$duration %>% summary()
```

```console
###    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
###       1      50     131     193     261     966
```

The population mean, which we denote as μ, rounds to 193 secs (or 3 minutes 21 secs). However, variability is high with a population standard deviation, which we denote as σ, of 193 secs.

#### Simulations in R
We can use R to simulate repeated random sampling from the population of YouTube video durations. Let’s run a simulation that generates 10,000 random samples of size n=10. The simulator will save the sample means in order to create a sampling distribution. Here’s a simple simulator:

```R
set.seed(123456) #Set random seed number to allow replication

n <- 10 #set sample size

sims <- 10000 #Set number of random samples to be drawn

x_bar <- data.frame(x=as.numeric()) #Create a data.frame to store sample means from simulation

for (i in 1:sims) { #create a loop to perform the simulations
  samp <- YouTube_clean %>% sample_n(n) #Generate a random sample
  x_bar[i,1] <- samp$duration %>% mean() #Store the sample mean in the data.frame
}

x_bar$x %>% summary()
```

```console
###    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
###    34.5   148.6   187.0   192.7   231.8   476.4
```

The set.seed() function forces R’s built-in random number generator to start at a particular seeding value. This ensures that others, like yourself, can re-run this code, and get the same results. If we used a different seed, the results would be a little different. Try for yourself if you wish.

Next, we set the sample size n <- 10, and the number of random samples to draw from the population distribution, sims <- 10000. Generally, we should do this at least 10,000 times, but keep in mind that requires computational time.

Next, we want to same the results of the simulation to an object, which we will define as a data.frame named x_bar. The loop function, for (i in 1:n){} tells R to loop through as function starting at 1 and ending at n. We use the sims object to tell R who many times to loop. If we change the sims object, we can quickly change the number of simulations, e.g. sims <- 1000 or sims <-100000.

Inside the loop, we use the sample_n function to take a random sample of size n from the YouTube_clean data frame. Then we take the mean duration of the sample and assign it to the ith row in the data frame. i is set as the loop number.

Once the loop finishes, the simulation is complete, and we can use the x_bar object to analyse the simulated sampling distribution of the mean.

Let’s visualise these steps:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618678056/MATH1324/ModelFive/SamplingDistributionSimulationOverview_sjbzkq.png)

Let’s take a closer look at the sampling distribution visualised using a histogram. Also included for comparison is the population distribution. Pay attention to the differences. Notice how the variability of the sampling distribution is much smaller and the mean of the sampling distribution is approximately the same as the population mean?

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618677526/MATH1324/ModelFive/youtubeVideoDistribution_gywftq.png)

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618678261/MATH1324/ModelFive/sampleDistributionOfMeanYoutube_slqp1d.png)

#### Expected Value and Variance
These observations introduce two important concepts related to the sampling distributions. For sampling distributions of the mean, the expected value, E(x¯), variance, Var(x¯) and standard deviation, σx¯, are as follows:

$$E(\bar{x}) = \mu_{\bar{x}} = \mu$$
$$Var(\bar{x}) = \sigma^2_{\bar{x}} = \frac{\sigma^2}{n}$$
$$\sigma_{\bar{x}} = \frac{\sigma}{\sqrt{n}}$$

where x¯ refers to a sample mean, and n = sample size. Let’s demonstrate that this is true. The population parameters are as follows:

$$\mu = 193$$
$$\sigma^2 = 193^2$$
$$\sigma = 193$$

Note that, conincidently, μ=σ=193.

According to the formula above, the mean, variance and standard deviation of a sampling distribution of the mean using a sample size n=10, are…

$$E(\bar{x}) = \mu_{\bar{x}} = 193$$

$$Var(\bar{x}) = \sigma^2_{\bar{x}} = \frac{\sigma^2}{n} = \frac{193^2}{10} = 3724.9$$

$$\sigma_{\bar{x}} = \frac{\sigma}{\sqrt{n}} = \frac{193}{\sqrt{10}} = 61.03$$

Now, keeping in mind that we used a simulation, and we expect there to be some random error (especially for the variance), recall the descriptive statistics of the sampling distribution simulated in R…

```R
x_bar$x %>% mean()
```

```console
### [1] 192.7484
```

```R
x_bar$x %>% var()
```

```console
### [1] 3723.879
```

```R
x_bar$x %>% sd()
```

```console
### [1] 61.02359
```

These simulation estimates are very close! We get closer if we increase the simulation size, but this becomes impractical due to the extra computational time.

#### Standard Error
The standard deviation for a sampling distribution is known as the standard error (SE). So, we could write the standard error for the mean as:

$$SE = \sigma_{\bar{x}} = \frac{\sigma}{\sqrt{n}}$$

The size of the sample and the standard error share an inverse relationship. As sample size increases, the SE for the mean decreases. Consider the following plot visualising this relations assuming σ=10.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618678836/MATH1324/ModelFive/standardError_zm3vpj.png)

Why? Larger random samples provide more reliable estimates of population parameters, therefore, less error. Let’s demonstrate this further by running the simulation outlined above for three different sample sizes, n = 10, 30, and 100. The results for the simulations are summarised in the following three histograms:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618679262/MATH1324/ModelFive/histograms1_g4dg6l.png)
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618679262/MATH1324/ModelFive/histograms2_tjkxfb.png)
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618679262/MATH1324/ModelFive/histograms3_j18y30.png)

As you can see, as the sample size increases, the standard error decreases. You might also detect that the shape changes from being slightly skewed to symmetric. This brings us to the next important concept.

#### Central Limit Theorem
There are a few useful rules we need to know about sampling distributions of the mean. If the underlying population distribution of a variable is normally distributed, the resulting sampling distribution of the mean will be normally distributed. This rule is referred to the Central Limit Theorem and can be written as:

$$\text{If } x \sim N(\mu,\sigma) \text{ then } \bar{x} \sim N(\mu,\frac{\sigma}{\sqrt{n}})$$

This makes sense. However, what if the population distribution isn’t normally distributed as was the case with YouTube video durations? We got a hint in the previous figure. Let’s take a closer look.

We use our simulator to create a sampling distribution of the mean duration using 10,000 samples of size 100. We plot the distribution and overlay a hypothetical normal distribution (blue line) with μx¯=193 and σx¯=19.3:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618679514/MATH1324/ModelFive/centralLimitTheorem_phgyvy.png)

The blue (theoretical) line is a near perfect fit to the sampling distribution. This is another important property of the Central Limit Theorem. When the sample size we use is large, typically defined as n>30, the sampling distribution of the mean is approximately normal, regardless of the variable’s underlying population distribution.

**NOTE:**
1. When sampling from a population with mean $/mu$ and finite standard deviation $/sigma$ , the sampling
distribution of the sample mean will tend to be a normal distribution with mean $/mu$ and standard deviation $/sigma / /sqrt{n}$ as the sample size becomes large (n>30).

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618694588/MATH1324/ModelSix/clt_jbtxpu.png)

2. Why CLT is important?
Many statistics have distributions that are approximately normal for large sample sizes, even when we are sampling from a distribution that is not normal and this means that we can often use well-developed statistical inference and probability calculations procedures that are based on a normal distribution even if we are sampling from a population that is not normal, provided we have a large sample size.

#### What are sampling distributions used for?
We will start using sampling distributions in greater depth to help us answer interesting questions about the results of statistical investigation later in Module 7. For now, we go through a few examples to start getting a sense of how sampling distributions are used in statistics. We will use the CLT to quickly calculate probabilities of observing different sample means for various sample sizes, assuming the population mean and standard deviation of YouTube video duration is 193 secs.

1. What is the probability of randomly selecting a sample of size n=100 that has a sample mean duration of less than 150 secs?
Because we have a large sample size, we can invoke the CLT, which means the sampling distribution of the mean can be approximated as:

$$\bar{x} \sim N(\mu,\frac{\sigma}{\sqrt{n}}) = N(193,19.3)$$

Now we can use R’s normal distribution functions to determine Pr(x¯<150). In R we use the formula:

```R
pnorm(q = 150, mean = 193, sd = 19.3)
```

```console
### [1] 0.01294095
```

The probability, Pr(x¯<150)), was found to equal .013. Therefore, there is a 1.3% chance that an investigator will randomly select a sample with a mean below 150 secs. In other words, this would be unusual.

2. What is the probability of randomly selecting a sample of size n = 100 that has a mean duration greater than four minutes?
We need to find Pr(x¯>240). In R, we use the formula:

```R
pnorm(q = 240, mean = 193, sd = 19.3, lower.tail = FALSE)
```

```console
### [1] 0.007441098
```

The answer is found to be Pr(x¯>240)=0.007.

3. What is the probability of randomly selecting a sample of size n = 200 that has a mean duration greater than five minutes?

We need to change the standard error as the example calls for a larger sample. We can do this directly in R using:

```R
pnorm(q = 300, mean = 193, sd = 193/sqrt(200), lower.tail = FALSE)
```

```console
### [1] 2.244519e-15
```

Note how we calculated SE directly in the formula using the sqrt() function. We find Pr(x¯>300)=2.244519e−15. What does that mean? When you see e-15, that means to move the decimal place to the right 15 places from 2.244519, so, Pr(x¯>300)=0.000000000000002244519. In other words, the probability is really, really small.

Why has the probability substantially dropped? As a larger sample size was used, the sampling distribution has a smaller standard error. Therefore, observing a sample mean duration of 300 secs would be very unlikely when the sample size was n=200 vs. n=100. Larger random samples provide more reliable estimates of population parameters.

4. The probability distribution of 6-month incomes of account executives has mean $20,000 and standard deviation $5,000. n=64 account executives are randomly selected. What is the probability that the sample mean exceeds $20,500?

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618694903/MATH1324/ModelSix/Example4_nlz7vt.png)

5. A business client of FedEx wants to deliver urgently a large freight from Australia to China. When asked about the weight of the cargo they could not supply the exact weight, however they have specified that there are total of 36 boxes. You are working as a Business analyst for FedEx. And you have been challenged to tell the executives quickly whether or not they can do certain delivery.

Since, we have worked with them for so many years and have seen so many freights from them we can confidently say that the type of cargo they follow is a distribution with a mean of μ= 72 lb (32.66 kg) and a standard deviation of σ = 3 lb (1.36 kg). The plane you have can carry the max cargo weight up to 2640 lb (1193 kg). Based on this information what is the probability that all of the cargo can be safely loaded onto the planes and transported?

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618695129/MATH1324/ModelSix/Example5_demouz.png)

##### Demonstrations of CLT
+ A fantastic toy for exploring this can be found here:
http://onlinestatbook.com/stat_sim/sampling_dist/

+ Another can be found here:
https://gallery.shinyapps.io/CLT_mean/

## Module 6 Estimating Uncertainty Confidently

### Overview

Our best, and often only, estimate for a population parameter is the sample estimate. However, due to sampling variability, the sample estimate is always uncertain. Module 6 will introduce the concept of confidence intervals as an interval estimate that expresses the degree of uncertainty associated with sample statistics.

### Learning Objectives
The learning objectives associated with this module are:
+ Differentiate between a point and interval estimate.
+ Define the concept of a confidence interval.
+ Discuss the major factors that impact the width of a confidence interval.
+ Use technology to calculate confidence intervals for common statistics including means, proportions and rates.

### Types of Inference
+ **Estimation**:
  – Estimating or predicting the value of the parameter
  – “What is (are) the most likely values of μ or p?”
  - Example: A consumer wants to estimate the average price of similar homes in her city before putting her home on the market.
    + Estimation: Estimate μ, the average home price.

+ **Hypothesis Testing**: (I will teach it on module 7)
  – Deciding about the value of a parameter based on some preconceived idea.
  – "Did the sample come from a population with m = 5 or p = .2?"
  - Example: A manufacturer wants to know if a new type of steel is more resistant to high temperatures than an old type was.
    + Hypothesis test: Is the new average resistance, μΝ equal to the old average resistance, $ μ_Ο $?

### Point and Interval Estimation

#### Definitions
An estimator is a rule, usually a formula, that tells you how to calculate the estimate based on the sample.

+ **Point estimation**: A single number is calculated to estimate the parameter.
The **point estimate** of a sample statistic, such as the mean, median, proportion or rate are single, or point values. They are often our best estimate for a population parameter, but do not express the degree of uncertainty for an estimate associated with its sampling variability. Point estimates should be accompanied by additional information to assist with drawing inferences about the population.

+ **Interval estimation**: Two numbers are calculated to create an interval within which the parameter is expected to lie.
**Interval estimation** serves to overcome this limitation. The idea is to supplement the point estimate with an interval that reflects the degree of uncertainty associated with a statistic. The most common type of interval estimator is called the **confidence interval**, or CI for short.

#### Some definitions
+ A point estimate is a single number,
+ a confidence interval provides additional information about the variability of the estimate (based on the sampling distribution)

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620610086/MATH1324/ModelSix/Mon_May_10_11_26_32_AM_AEST_2021_oyiigh.png)

##### Properties of Point Estimators
+ Since an estimator is calculated from sample values, it varies from sample to sample according to its **sampling distribution**.
+ An **estimator** is **unbiased** if the mean of its sampling distribution equals the parameter of interest.
  – It does not systematically overestimate or underestimate the target parameter.
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620610736/MATH1324/ModelSix/Mon_May_10_11_38_27_AM_AEST_2021_pqb6am.png)

+ Of all the **unbiased** estimators, we prefer the estimator whose sampling distribution has the **smallest spread** or **variability**.
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620610843/MATH1324/ModelSix/Mon_May_10_11_40_12_AM_AEST_2021_ajtlae.png)

##### Measuring the Goodness of an Estimator
The distance between an estimate and the true value of the parameter is the **error of estimation**.
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620631387/MATH1324/ModelSix/Mon_May_10_05_22_34_PM_AEST_2021_bep0ld.png)

**NOTE:** The distance between the bullet and the bull’s-eye.

##### The Margin of Error
For **unbiased** estimators with normal sampling distributions, 95% of all point estimates will lie within 1.96 standard deviations of the parameter of interest.
**Margin of error**: The maximum error of estimation, calculated as
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620631927/MATH1324/ModelSix/Mon_May_10_05_31_29_PM_AEST_2021_yl5mpp.png)

##### Confidence Intervals
An interval gives a range of values:
+ Takes into consideration variation in sample statistics from sample to sample
+ Gives information about “closeness” to unknown population parameters
+ Stated in terms of level of confidence
  – e.g. 95% confident, 99% confident
  – Can never be 100% confident

Let’s consider a typical confidence interval using a hypothetical example. Let’s assume height is normally distributed in the population with a standard deviation of 7 cm (This is unrealistic as we often do not know the population SD, but let’s go with it for now). An investigator takes a random sample of 10 peoples’ height (cm). Say the mean of the sample was found to be 176.5 cm. To calculate a **confidence interval for the mean of a normally distributed variable with a known standard deviation**, we use the following formula:

$$\bar{x} \pm z_{1 - (\alpha/2)}\frac{\sigma}{\sqrt{n}}$$

We need to discuss the z critical value, Z1−(α/2), in the above formula. This value is obtained from the standard normal distribution. Recall, the standard normal distribution has the following properties:

$$z \sim N(0,1)$$

The α value refers to what is known as the significance level. Almost all studies will use a standard level of α=0.05. The α value is based on the level of the confidence interval. A CI is defined as 100(1−α) CI. If we use α=0.05, this means we’re going to calculate a 100(1−0.05) = 95% CI.

The z critical value in the confidence interval formula is found by looking up the z-value associated with the 1−α/2=1−0.05/2=1−0.025=.975 percentile of the standard normal distribution. We might write:

$$Pr(Z < z) = .975$$

We dealt with solving a similar problem in Module 4. Fortunately, this is easy to solve in R. To solve the formula above we type the following into R:

```R
qnorm(p = .975)
```

```console
### [1] 1.959964
```

Note, that if we don’t specify the mean and standard deviation for qnorm(), the R function reverts to a standard normal distribution with mean = 0 and sd = 1. We discover $ Pr( Z < 1.96 ) = .975 $. The following figure shows how $ z = 1.96 $ relates back to the 95% CI. We can see that $ Pr(−1.96 < z < 1.96) = .95 $ or 95%. This means that 0.025 probability sits in the upper and lower tail of the distribution. As you will discover later on, the critical value is required in the conference interval formula to ensure the confidence interval achieves the desired level of coverage, e.g. 95%.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618681589/MATH1324/ModelSix/significanceInterval_a2gi1s.png)

Beauty! Now we can calculate the 95% CI for the sample mean:

$$176.5 \pm z_{1 - (\alpha/2)}\frac{\sigma}{\sqrt{n}} =  1.96\frac{7}{\sqrt{10}} = 4.34$$

We would write x¯=176.5, 95% CI [172.161, 180.84]. The confidence interval captures a wide range of values for the mean height and reflects the high degree of uncertainty expected from a sample of n=10. This interval is depicted as follows:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618681847/MATH1324/ModelSix/CIBreakDownForMean_sgac5a.png)

### Confidence Intervals
Before we dig deeper, you need to have a definition of a CI in the back of your mind. When we refer to confidence in statistics, we need to understand very carefully what this means. In this course we will use a strict frequentist definition. Not all statistics instructors will be this stringent and in the past you may have been taught something different. However, for my course assessment, I expect you to understand and use this definition.

100(1−α)% CI, is an interval estimate for a population parameter, based on a given sample statistic, where if samples of a certain size n were repeatedly drawn from the population and a CI for each sample’s statistic was calculated, 100(1−α)% of these intervals would capture the population parameter, whereas the other 100(α)% would not.

Now with this strange and long-winded definition in mind, let’s start digging deeper into the theory.

#### The General Process
The general formula for all confidence intervals is:
$$ Point Estimate ± (Critical Value)(Standard Error) $$

Where:
+ Point Estimate is the sample statistic estimating the population parameter of interest
+ Critical Value is a table value based on the sampling distribution of the point estimate and the desired confidence level
+ Standard Error is the standard deviation of the point estimate

### Theory
We will explore confidence interval theory using a simulation and visualisation. We will first make some assumptions about the population. Let’s assume height is normally distributed with a mean of 175 and a standard deviation of 7:

$$Height∼N(175,7)$$

As investigators, we don’t tend to know population parameters in advance, and hence the reason we need to gather a sample and estimate it. However, for the purpose of this lesson, we need to assume these values.

Now imagine drawing 100 random samples of size 10 from the population. For each of the 100 samples, you calculate the sample mean and 95% CI. You can plot all these means and 95% CIs like in Plot 1 below. Plot 2 and 3 repeat the same procedure, each displaying the means and 95% CIs of 100 random samples of size 10. At the top of each plot, the percentage of CIs that miss capturing the population mean, μ=175, are reported. Missed intervals are coloured red. For Plot 1, we see that Missed = 3 % of the CIs missed μ=175, for Plot 2, Missed = 5 %, and for Plot 3, Missed = 4 %. If we repeated this for many thousands of plots and samples, what do you think this missed percentage would average? If you guessed 5%, you’re already on your way to understanding CIs. The 5% of CIs that will miss capturing the population mean is our α=0.05.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618682453/MATH1324/ModelSix/confidenceIntervals_vvb9bm.png)

Think carefully about the plots above and now re-read the CI definition:

100(1−α)% CI, is an interval estimate for a population parameter, based on a given sample statistic, where if samples of a certain size n were repeatedly drawn from the population and a CI for each sample’s statistic was calculated, 100(1−α)% of these intervals would capture the population parameter, whereas the other 100(α)% would not.

CIs should now be starting to make a little more sense. Basically, CIs are constructed in a way that in the long run, a certain percentage (e.g. 95%) of CIs calculated by repeating the same random sampling procedure will capture a population parameter, for example μ=175.

CIs can be calculated for a wide range of statistics using formulaic approaches. However, the methods vary depending on the type of statistic being estimated and the assumptions we make about the population from which the data are drawn. Later sections in this module explain calculating CIs for various situations and statistics.

### Influencing Factors
#### Sample Size
Look at the formula for a CI for the mean of a normally distributed variable with a known standard deviation:

$$\bar{x} \pm z_{1 - (\alpha/2)}\frac{\sigma}{\sqrt{n}}$$

You can see the standard error of the mean in the formula:

$$SE = \sigma_{\bar{x}}=\frac{\sigma}{\sqrt{n}}$$

Therefore, it comes as no surprise that CIs share some of the same rules as sampling distributions. Consider the following plots. Note that the number of simulated samples have been increased to 1000 so we get better estimates of the “Missed” percentage. We know from the previous module that sample size shares an inverse relationship with SE. As N increases, SE decreases. Moving from Plot 1 to Plot 3, sample sizes are 10, 50 and100. What happens to the width of the CIs as sample size increases?

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618682986/MATH1324/ModelSix/confidenceIntervalsTwo_sleuwn.png)

We see a dramatic decrease in the width of the intervals. Why? Mathematically, as sample size increases, the SE in the CI formula decreases, meaning that the lower and upper bounds fall closer to the sample mean.

For example, if in the height example the investigator had used a sample size of 30, the confidence interval would become:

$$176.5 \pm z_{1 - (\alpha/2)}\frac{\sigma}{\sqrt{n}} =  1.96\frac{7}{\sqrt{30}} = 2.50$$

and therefore, x¯=176.5, 95% CI [174.00, 179.00]. This 95% CI is narrower than the interval calculated for n=10, 95% CI [172.16, 180.84]. Conceptually, larger random samples are better estimates of the population and therefore, we can be more certain in their estimates over the use of smaller samples.

#### Confidenece Level
+ Expressed as a percentage (<100%)
+ Suppose confidence level = 95%
  – Also written (1 - α) = 0.95, (so α = 0.05)
+ A relative frequency interpretation:
  – 95% of all the confidence intervals that can be constructed will contain the unknown true parameter
+ A specific interval either will contain or will not contain the true parameter
  – No probability involved in a specific interval

While the 95% CI is the most common, it is possible to use other levels of confidence. Let’s compute a 90% and 99% confidence interval for the sample mean height when n=10. This is depicted in the following plot. Plot 1 reports a 99% CI, Plot 2, 95% CI, and Plot 3, 90% CI.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618683157/MATH1324/ModelSix/confidenceIntervalsThree_wgrptl.png)

As you can see, higher levels of confidence are associated with wider intervals. This makes sense. If you want to be more confident about capturing a population parameter, cast a wider interval!

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620633826/MATH1324/ModelSix/Mon_May_10_06_03_11_PM_AEST_2021_itm5l8.png)

##### Confidence Interval for μ (σ Known)
+ Assumptions
  – Population standard deviation σ is known
  – Population is normally distributed
  – If population is not normal, use large sample (n > 30)
+ Confidence interval estimate:
$$ \bar{X} \pm Z_{\alpha/2} \frac{\sigma}{\sqrt{n}}$$

where $ \bar {X} $ is the point estimate, $ Z_{\alpha/2} $ is the normal distribution critical value for a probability of $ \alpha/2 $ in each tail is the standard error.

+ Finding the Critical Value, $ Z_{\alpha/2} $
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620634357/MATH1324/ModelSix/Mon_May_10_06_12_02_PM_AEST_2021_h5afqy.png)

+ Commonly used levels are 90%, 95% and 99%
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620634427/MATH1324/ModelSix/Mon_May_10_06_13_24_PM_AEST_2021_sg8urt.png)

+ Intervals and Level of Confidence
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620634520/MATH1324/ModelSix/Mon_May_10_06_14_55_PM_AEST_2021_puxcwi.png)

Now let’s look at the formula. We need to change the z critical value for the confidence interval formula:

$$\bar{x} \pm z_{1 - (\alpha/2)}\frac{\sigma}{\sqrt{n}}$$

We will begin with the 90% CI. This CI width corresponds to a significance level of α=0.1. We need to find Pr(Z<z)=1−α/2=1−0.1/2=1−0.05=.95. In R:

```R
qnorm(p = .95)
```

```console
### [1] 1.644854
```

The z-value is found to be 1.64. Now completing the 90% CI equation:

$$176.5 \pm z_{1 - (\alpha/2)}\frac{\sigma}{\sqrt{n}} =  1.64\frac{7}{\sqrt{10}} = 3.64$$

We calculate x¯=176.5, 90% CI [172.86, 180.14]. Now compare this 90% CI to the 95% CI [172.16, 180.84]. The 90% CI is narrower. Why? Because as we are less certain about the CI capturing the population parameter in the long run, the width of the confidence interval will reduce. Think of it like casting a smaller net to capture the population mean.

For a 99% CI, we must change the z critical value again. This CI width corresponds to a significance level of α=0.01. Therefore, we need to find Pr(Z<z)=1−α/2=1−0.01/2=1−0.005=.995. In R:

```R
qnorm(p = .995)
```

```console
### [1] 2.575829
```

The z-value is found to be 2.58. Next…

$$176.5 \pm z_{1 - (\alpha/2)}\frac{\sigma}{\sqrt{n}} =  2.58\frac{7}{\sqrt{10}} = 5.70$$

The result is x¯=176.5, 99% CI [170.80, 182.20]. Comparing this to the 95% CI [172.16, 180.84], we note that the 99% CI is wider. As we are trying to be extra certain (99% of confidence interval will capture the population mean in the long run), we need to widen the interval. In other words, the 99% CI is casting a wider net to catch the population parameter.

My Confidence Interval app below can be used explore confidence intervals and the effect of changing different parameters. If the app does not load in this page, you can view the app [here](https://jbaglin.shinyapps.io/Confidence_Intervals/).

### Calculating Confidence Intervals

#### Pizza Data

This section will compare the mean diameter for pizzas made by Dominos and Eagle Boys. This is an issue close to many students’ hearts.

Eagle Boys claim their pizzas are larger than their main competitor, Dominos. The Pizza dataset contains the diameters (cm) of 125 random pizzas from each company. The dataset is available from the data repository. You can read all about the data [here](https://raw.githubusercontent.com/yanboyang713/RMIT-Data-Repository/main/Pizza.csv).

Specifically, the Pizza dataset contains the following variables:
+ **ID**: An identifier
+ **Store**: The pizza store/company; one of Dominos or EagleBoys
+ **Crust**: The crust type for the pizza; DeepPan, Mid and Thin.
+ **Topping**: The pizza topping: BBQMeatlovers, Hawaiian and Supreme
+ **Diameter**: The pizza diameter in centimetres

#### Comparing Means
We start with the descriptive statistics and histograms comparing the pizza diameters (cm) of the two companies.

```R
library(dplyr)
Pizza %>% group_by(Store) %>% summarise(Min = min(Diameter,na.rm = TRUE),
                                         Q1 = quantile(Diameter,probs = .25,na.rm = TRUE),
                                         Median = median(Diameter, na.rm = TRUE),
                                         Q3 = quantile(Diameter,probs = .75,na.rm = TRUE),
                                         Max = max(Diameter,na.rm = TRUE),
                                         Mean = mean(Diameter, na.rm = TRUE),
                                         SD = sd(Diameter, na.rm = TRUE),
                                         n = n(),
                                         Missing = sum(is.na(Diameter)))
```

```console
### # A tibble: 2 x 10
###   Store       Min    Q1 Median    Q3   Max  Mean    SD     n Missing
###   <fct>     <dbl> <dbl>  <dbl> <dbl> <dbl> <dbl> <dbl> <int>   <int>
### 1 Dominos    25.5  26.6   26.9  28.8  29.7  27.4 1.17    125       0
### 2 EagleBoys  26.6  28.8   29.1  29.5  31.1  29.2 0.626   125       0
```

```R
library(lattice)
library(ggplot2)
Pizza %>% histogram(~Diameter | Store, data = .,layout=c(1,2))
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618683958/MATH1324/ModelSix/histogramDiameter_uqtral.png)

There appears to be a strange looking distribution for the Dominos’ pizzas. The distribution appears to be bi-modal. Does the crust type has something to do with it?

```R
Pizza %>% group_by(Store, Crust) %>% summarise(Min = min(Diameter,na.rm = TRUE),
                                         Q1 = quantile(Diameter,probs = .25,na.rm = TRUE),
                                         Median = median(Diameter, na.rm = TRUE),
                                         Q3 = quantile(Diameter,probs = .75,na.rm = TRUE),
                                         Max = max(Diameter,na.rm = TRUE),
                                         Mean = mean(Diameter, na.rm = TRUE),
                                         SD = sd(Diameter, na.rm = TRUE),
                                         n = n(),
                                         Missing = sum(is.na(Diameter)))
```

```console
### # A tibble: 6 x 11
### # Groups:   Store [2]
###   Store     Crust     Min    Q1 Median    Q3   Max  Mean    SD     n Missing
###   <fct>     <fct>   <dbl> <dbl>  <dbl> <dbl> <dbl> <dbl> <dbl> <int>   <int>
### 1 Dominos   DeepPan  26.0  26.4   26.6  26.8  28.8  26.7 0.462    40       0
### 2 Dominos   Mid      25.5  26.6   26.7  27.0  28.9  26.8 0.510    42       0
### 3 Dominos   Thin     25.6  28.8   29.0  29.2  29.7  28.8 0.801    43       0
### 4 EagleBoys DeepPan  28.2  28.7   29.0  29.4  30.4  29.1 0.479    43       0
### 5 EagleBoys Mid      26.6  28.6   28.8  29    29.8  28.8 0.483    43       0
### 6 EagleBoys Thin     28.5  29.4   29.7  30.0  31.1  29.7 0.550    39       0
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618684246/MATH1324/ModelSix/deepPan_uz3wb5.png)
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618684287/MATH1324/ModelSix/mid_chxyoz.png)
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618684338/MATH1324/ModelSix/thin_kgsjgw.png)

The bi-modal appearance of the Dominos’ pizza diameter can be accounted for by the large difference between Dominos’ DeepPan and Mid pizzas when compared to their This pizzas. Because of this confounding variable, let’s focus on comparing only the thin crusts between Eagle Boys and Dominos.

```R
Pizza_thin <- Pizza %>% filter(Crust == "Thin")

Pizza_thin %>% group_by(Store) %>% summarise(Min = min(Diameter,na.rm = TRUE),
                                         Q1 = quantile(Diameter,probs = .25,na.rm = TRUE),
                                         Median = median(Diameter, na.rm = TRUE),
                                         Q3 = quantile(Diameter,probs = .75,na.rm = TRUE),
                                         Max = max(Diameter,na.rm = TRUE),
                                         Mean = mean(Diameter, na.rm = TRUE),
                                         SD = sd(Diameter, na.rm = TRUE),
                                         n = n(),
                                         Missing = sum(is.na(Diameter)))
```

```console
### # A tibble: 2 x 10
###   Store       Min    Q1 Median    Q3   Max  Mean    SD     n Missing
###   <fct>     <dbl> <dbl>  <dbl> <dbl> <dbl> <dbl> <dbl> <int>   <int>
### 1 Dominos    25.6  28.8   29.0  29.2  29.7  28.8 0.801    43       0
### 2 EagleBoys  28.5  29.4   29.7  30.0  31.1  29.7 0.550    39       0
```

```R
Pizza_thin %>% boxplot(Diameter ~ Store, data = .)
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618684440/MATH1324/ModelSix/boxplot_w4mfdj.png)

There are also a few outliers that we should pay some attention to. We have four values in the Dominos’ group and one in the Eagle Boys’ group. These outliers can have unwanted effects on our estimates, so it is best to deal with them at this point.

There are a few ways that we could do this. A simple approach is to exclude them. When you exclude outliers, you must be sure to explain why you did so. In this example, we will assume that these were due to poor measurements.

We can use the following code to remove outliers using the following definition reported back in Module 2.

+ Lower outlier<Q1−1.5∗IQR
+ Upper outlier>Q3+1.5∗IQR

The following code exploits the boxplot() function which saves a list of the outliers plotted in the box plot.

```R
boxplot <- Pizza_thin %>% boxplot(Diameter ~ Store, data = ., plot = FALSE)
boxplot
```

```console
### $stats
###        [,1]  [,2]
### [1,] 28.320 28.54
### [2,] 28.765 29.40
### [3,] 29.010 29.68
### [4,] 29.200 30.03
### [5,] 29.660 30.67
### 
### $n
### [1] 43 39
### 
### $conf
###          [,1]     [,2]
### [1,] 28.90519 29.52061
### [2,] 29.11481 29.83939
### 
### $out
### [1] 27.04 25.58 27.45 26.38 31.06
### 
### $group
### [1] 1 1 1 1 2
### 
### $names
### [1] "Dominos"   "EagleBoys"
```

Now we can create a filter matrix to identify and remove the outliers in Pizza_thin.

```R
Filt_mat <- data.frame(group = boxplot$group, outliers = boxplot$out)
Filt_mat$group <- Filt_mat$group %>% factor(levels = c(1,2), 
                                            labels = c("Dominos","EagleBoys"))
Filt_mat
```

```console
###       group outliers
### 1   Dominos    27.04
### 2   Dominos    25.58
### 3   Dominos    27.45
### 4   Dominos    26.38
### 5 EagleBoys    31.06
```

Now we can use dplyr and %in% operator to filter the outliers.

```R
Pizza_thin_filt <- Pizza_thin %>% filter(!(Store %in% Filt_mat$group) 
                                        | !(Diameter %in% Filt_mat$outliers))
```

This filter uses the filter matrix to identify values that are not considered outliers. The ! symbol mean “not” and the %in% operator check a range of values in a vector. Therefore the filter systematically searches the Pizza\_thin dataset for outliers and filters them out, saving the results to Pizza_thin_filt.

Now let’s recheck the box plot:

```R
Pizza_thin_filt %>% boxplot(Diameter ~ Store, data = .,
                            main = "Thin Pizza Diamater (Outliers removed)",
                            ylab = "Diameter (cm)")
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618684749/MATH1324/ModelSix/boxplot-outliersRemoved_t1xtj9.png)

```R
Pizza_thin_filt %>% group_by(Store) %>% summarise(Min = min(Diameter,na.rm = TRUE),
                                         Q1 = quantile(Diameter,probs = .25,na.rm = TRUE),
                                         Median = median(Diameter, na.rm = TRUE),
                                         Q3 = quantile(Diameter,probs = .75,na.rm = TRUE),
                                         Max = max(Diameter,na.rm = TRUE),
                                         Mean = mean(Diameter, na.rm = TRUE),
                                         SD = sd(Diameter, na.rm = TRUE),
                                         n = n(),
                                         Missing = sum(is.na(Diameter)))
```

```console
### # A tibble: 2 x 10
###   Store       Min    Q1 Median    Q3   Max  Mean    SD     n Missing
###   <fct>     <dbl> <dbl>  <dbl> <dbl> <dbl> <dbl> <dbl> <int>   <int>
### 1 Dominos    28.3  28.8   29.0  29.2  29.7  29.0 0.307    39       0
### 2 EagleBoys  28.5  29.4   29.6  30.0  30.7  29.7 0.509    38       0
```

Sometimes when you are dealing with very large datasets, removing one set of outliers, can create additional outliers in the filtered dataset. This is due to the outlier definition being based on the estimates of the IQR and quartiles. When you remove outliers, you are changing these estimates, which then changes the location of your fences. This is a major problem when dealing with highly skewed distributions. If you’re ever faced with this situation, look into applying a Box-cox power transformation prior to outlier detection and removal. The Box-Cox transformations do an amazing job of normalising distributions, which can greatly assist with outlier detection.

Eagle Boys do appear to have larger diameters. However, the data were taken from a random sample of 77 pizzas across both stores. Before drawing conclusions, we need to quantify our uncertainty of our statistical estimates.

#### Mean - Unknown Population Standard Deviation - t-distribution

##### Do You Ever Truly Know σ?
+ Probably not!
+ In virtually all real world engineering, science and business situations, $ \sigma $ is not known.
+ If you truly know $ \mu $ there would be no need to gather a sample to estimate it.

##### Confidence Interval for μ (σ Unknown)
+ If the population standard deviation $ \sigma $ is unknown, we can substitute the sample standard deviation, S
+ This introduces extra uncertainty, since S is variable from sample to sample
+ So we use the t distribution instead of the normal distribution.
+ Assumptions:
  – Population standard deviation is unknown
  – Population is normally distributed
  – If population is not normal, use large sample (n > 30)
+ Use Student’s t Distribution


{{< youtube Uv6nGIgZMVw >}}

In the first example of CIs, we made an unrealistic assumption that the population standard deviation, σ, is known for a normally distributed variable. This allows us to use the standard normal distribution to calculate the CIs. In real research, σ is rarely known and must be estimated from the sample standard deviation, s. As we are estimating two parameters from the sample, the population mean, μ, and standard deviation, σ, we need to take into account the extra uncertainty or error associated with s to ensure the expected coverage of the CI remains at the desired level, e.g. 95%. The family of t-distributions are used for this purpose.

The t-distribution has an extra parameter, called degrees of freedom, df, that can be altered to change the heaviness of the distribution’s tails. Degrees of freedom for a t-distribution are typically calculated as:

The t is a family of distributions
+ The $ t_{α/2} $ value depends on degrees of freedom (d.f.)
+ Number of observations that are free to vary after sample mean has been calculated

$$ d.f. = n - 1 $$

The t-distribution looks very flat in comparison to a normal distribution when the df values are low. However, as df increases (i.e. sample size increases), the t-distribution will start to approximate a normal distribution. In fact, for sample sizes where df > 30, there is very little practical difference between them. As df approaches infinity, the t-distribution will become a normal distribution.

###### Degrees of Freedom (df)
**Idea**: Number of observations that are free to vary after sample mean has been calculated
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620635777/MATH1324/ModelSix/Mon_May_10_06_35_40_PM_AEST_2021_al0jfk.png)

Here, n = 3, so degrees of freedom = n – 1 = 3 – 1 = 2 (2 values can be any numbers, but the third is not free to vary for a given mean)

###### Student’s t Distribution
As the degrees of freedom increases, the t distribution approaches the normal distribution.
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620636136/MATH1324/ModelSix/Mon_May_10_06_41_51_PM_AEST_2021_kxgrwx.png)

Developed in work with Guinness Brewery for working with small samples.

###### Student’s t Table
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1620636256/MATH1324/ModelSix/Mon_May_10_06_43_48_PM_AEST_2021_oczelf.png)

In the Pizza example, we don’t know the population standard deviation, so we have to estimate it using the sample. Do we need to worry about normality of the data to consider whether the confidence interval formula used previously is appropriate? The answer to this question depends on the sample size. If the sample size was small (e.g. n<30), the non-normality of the data would prevent us from applying a regular CI formula. However, thanks to the larger sample size (n=39 for Dominos and n=38 for Eagle Boys) and the CLT introduced in the previous module, the standard CI formula works quite well. We only need to adjust the formula slightly to take into account that we don’t know the population standard deviation.

$$\bar{x} \pm t_{n-1,1-(\alpha/2)}\frac{s}{\sqrt{n}}$$

Notice the inclusion of tn−1,1−(α/2). Instead of looking this value up using a normal distribution, we need to use a different formula in R namely qt(). For example, for Dominos’ thin pizza (outliers removed):

```R
qt(p = 0.975, df = 39 -1)
```

```console
### [1] 2.024394
```

$$ 29.04 \pm 2.024\frac{0.306}{\sqrt{39}} = 099 $$

and for Eagle Boys:

```R
qt(p = 0.975, df = 38 -1)
```

```console
### [1] 2.026192
```

$$ 29.66 \pm 2.026\frac{0.509}{\sqrt{38}} = 0.167 $$

| Store     |  Mean |    SD |  n | tcrit |    SE | 95 %   CI      |
|-----------|-------|-------|----|-------|-------|----------------|
| Dominos   | 29.04 | 0.307 | 39 | 2.024 | 0.049 | [28.94, 29.14] |
| EagleBoys | 29.66 | 0.509 | 38 | 2.026 | 0.083 | [29.49, 29.83] |

As the population standard deviation is rarely known, we should always default to using the t-distribution and t-critical values to calculate interval estimates for sample means (assuming Normality or the CLT applies). Only use a z-critical value if the population standard deviation is given (which is rare!).

We can use dplyr and some quick computations to generate tables of 95% CIs for means…

```R
Pizza_thin_filt %>% group_by(Store) %>% summarise(Mean = round(mean(Diameter, na.rm = TRUE),2),
                                                  SD = round(sd(Diameter, na.rm = TRUE),3),
                                                  n = n(),
                                                  tcrit = round(qt(p = 0.975, df = n - 1),3),
                                                  SE = round(SD/sqrt(n),3),
                                                  `95% CI Lower Bound` = round(Mean - tcrit * SE,2),
                                                  `95% CI Upper Bound` = round(Mean + tcrit * SE,2))
```

```console
### # A tibble: 2 x 8
###   Store     Mean    SD     n tcrit    SE `95% CI Lower Boun~ `95% CI Upper Boun~
###   <fct>    <dbl> <dbl> <int> <dbl> <dbl>               <dbl>               <dbl>
### 1 Dominos   29.0 0.307    39  2.02 0.049                28.9                29.1
### 2 EagleBo~  29.7 0.509    38  2.03 0.083                29.5                29.8
```

We can also use the t-test if we filter the dataset first:

```R
Dominos <- Pizza_thin_filt %>% filter(Store == "Dominos")
t.test(Dominos$Diameter)
```

```console
### 
###  One Sample t-test
### 
### data:  Dominos$Diameter
### t = 591.66, df = 38, p-value < 2.2e-16
### alternative hypothesis: true mean is not equal to 0
### 95 percent confidence interval:
###  28.94089 29.13962
### sample estimates:
### mean of x 
###  29.04026
```

```R
EagleBoys <- Pizza_thin_filt %>% filter(Store == "EagleBoys")
t.test(EagleBoys$Diameter)
```

```console
### 
###  One Sample t-test
### 
### data:  EagleBoys$Diameter
### t = 359.09, df = 37, p-value < 2.2e-16
### alternative hypothesis: true mean is not equal to 0
### 95 percent confidence interval:
###  29.49735 29.83212
### sample estimates:
### mean of x 
###  29.66474
```

If you want to change the confidence level to 99%:

```R
Dominos <- Pizza_thin_filt %>% filter(Store == "Dominos")
t.test(Dominos$Diameter, conf.level=0.99)
```

```console
### 
###  One Sample t-test
### 
### data:  Dominos$Diameter
### t = 591.66, df = 38, p-value < 2.2e-16
### alternative hypothesis: true mean is not equal to 0
### 99 percent confidence interval:
###  28.90717 29.17335
### sample estimates:
### mean of x 
###  29.04026
```

```R
EagleBoys <- Pizza_thin_filt %>% filter(Store == "EagleBoys")
t.test(EagleBoys$Diameter, conf.level=0.99)
```

```console
### 
###  One Sample t-test
### 
### data:  EagleBoys$Diameter
### t = 359.09, df = 37, p-value < 2.2e-16
### alternative hypothesis: true mean is not equal to 0
### 99 percent confidence interval:
###  29.44042 29.88906
### sample estimates:
### mean of x 
###  29.66474
```

Visualising confidence intervals can be tricky. I recommend you display the confidence intervals overlaid upon the data. This ensures the viewer does not confuse the 95% CI as the range of the data. Here’s some code that you can adapt to different situations. The visualisation makes use of the ggplot2 and Hmisc package.

```R
##install.packages("ggplot2") # If required
##install.packages("Hmisc") # If required

library(ggplot2)
library(Hmisc)

p1 <- ggplot(data = Pizza_thin_filt, aes(x = Store, y = Diameter))
p1 + geom_dotplot(binaxis = "y", stackdir = "center", dotsize = 1/2, alpha = .25) + 
  stat_summary(fun.y = "mean", geom = "point", colour = "red") +
  stat_summary(fun.data = "mean_cl_normal", colour = "red", 
               geom = "errorbar", width = .2)
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618687590/MATH1324/ModelSix/t-test_aoeygi.png)

Based on the 95% CIs for the mean pizza diameters of the competing stores, I think we can be very confident that Eagle Boy’s pizzas tend to have a wider mean diameter.

#### Proportions - binomial distribution
Interval estimates for other statistics can also be calculated using the following formulas. However, be warned. You can only guarantee the appropriate confidence interval converge will be met if the stated assumptions are satisfied. These methods are referred to as approximations. When approximations cannot be used, we must look to exact methods. Fortunately, R has you covered for both.

Interval estimates for proportions are based on a normal approximation to the binomial distribution. If np(1−p)≥5 , we can approximate a CI using:

$$p \pm z_{1-(\alpha/2)}\sqrt{\frac{p(1-p)}{n}}$$

For example, suppose a researcher randomly selects 300 people from the population and finds that 2% (x=6) have cancer. We confirm, np(1−p)=300∗.02∗.98=5.88≥5. Therefore, we can proceed with the normal approximated CI. We will use the standard 95% CI.

$$.02 \pm z_{1-(\alpha/2)}\sqrt{\frac{p(1-p)}{n}}=1.96\sqrt{\frac{.02(1-.02)}{300}} = 0.016$$

We calculate the prevalence of cancer to be 0.02, 95% CI [.004, .036].

In R, we can use the binom.conf.int() command from the epitools package to quickly calculate the 95% CI.

```R
##install.packages("epitools") #If required
library(epitools)
binom.approx(6, 300, conf.level = 0.95)
```

```console
###   x   n proportion     lower     upper conf.level
### 1 6 300       0.02 0.0041578 0.0358422       0.95
```

What do you do if np(1−p)<5? For example, say the above example was changed so n=20, p=.3 (x=6) and 1−p=.7, np(1−p)=20∗.3∗.70=4.2. Therefore, the normal approximation does not apply. We can use the binom.exact() function to deal with this situation.

```R
binom.exact(6, 20, conf.level = 0.95)
```

```console
###   x  n proportion     lower     upper conf.level
### 1 6 20        0.3 0.1189316 0.5427892       0.95
```

#### Rates - Poisson distribution
Confidence intervals for rates following a Poisson distribution can be readily obtained using the pois.conf.int() function, which is also part of the epitools package. For example, we can confirm from the output below that the 95% CI for λ=56 is [42.30, 72.72].

```R
pois.exact(56, pt = 1, conf.level = 0.95)
```

```console
###    x pt rate    lower    upper conf.level
### 1 56  1   56 42.30181 72.72068       0.95
```

When λ>100, we can use the following normal approximation:

$$ \lambda \pm z_{1-(\alpha/2)}\sqrt{\lambda} $$

Suppose a sample’s point estimate is λ=145. A normal approximated 95% CI for λ is calculated by:

$$ 145 \pm 1.96\sqrt{145} = 23.6 $$

Therefore, λ=145, 95% CI [121.4, 168.6]. Alternatively, in R:

```R
pois.approx(145, pt = 1, conf.level = 0.95)
```

```console
###     x pt rate    lower    upper conf.level
### 1 145  1  145 121.3989 168.6011       0.95
```

### Determining Sample Size for the Mean
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618692392/MATH1324/ModelSix/DeterminingSampleSizeForTheMean_vgm6kr.png)
To determine the required sample size for the mean, you must know:
+ The desired level of confidence (1 - α), which determines the critical value, Zα/2
+ The acceptable sampling error, e
+ The standard deviation, σ

### Example
 If σ = 45, what sample size is needed to estimate the mean within ± 5 with 90% confidence?
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1618692392/MATH1324/ModelSix/DeterminingSampleSizeForTheMeanExample_sjaaz7.png)

