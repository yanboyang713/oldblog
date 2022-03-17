---
title: "Time Series Analysis Basic Plots, Examples, and Fundamental Concepts"
date: 2022-03-15T18:23:00+11:00
tags: ["time", "series", "analysis"]
draft: false
---

## Introduction {#introduction}

You will study the basic context of time series and stochastic processes including basic visualisations for time series data.

Time series data is composed of observations collected sequentially over time. This type of data is frequently seen and analysed in data analytics applications.

In **business**, we observe

-   weekly interest rates,
-   daily closing stock prices,
-   monthly price indices,
-   yearly sales figures, and so forth.

In **meteorology**, we observe

-   daily high and low temperatures,
-   annual precipitation and drought indices, and
-   hourly wind speeds.

In **agriculture**, we record

-   annual figures for crop and livestock production,
-   soil erosion, and export sales.

In the **biological** sciences, we observe the electrical activity of the heart at millisecond intervals.

In **ecology**, we record the abundance of an animal species.

As a recent example from time series research, Miwa Fukino, Yoshito Hirata, and Kazuyuki Aihara from University of Tokyo proposed a new method based on nonlinear time series analysis analyse music’s emotional effect.

In this module,

we will start with examples of time series and visualise time series data with the most frequently used plots.
Introduce the model-building strategy that we will follow through the semester.
We will focus on the fundamental concepts in terms of
Time Series and Stochastic Processes,
Means, Variances, and Covariances, and Stationarity.


## Examples of time series {#examples-of-time-series}

In this section, we will see some examples of time series and basic visualisations to make inferences about the basic characteristics of time series data. In all of the examples, we use the R package TSA. Therefore you need to install the TSA packages calling

```R
install.packages("TSA")
```


## Annual Rainfall in Los Angeles {#annual-rainfall-in-los-angeles}

In this example, the data is composed of the annual rainfall amounts recorded in Los Angeles, California, over more than 100 years. The time series plot for this data is generated with the following code chunk. Here, the dataset larain contains the annual rainfall data. Please note that throughout the codes given in this module, you can also use win.graph() function to open a new graphics window with the settings determined by the arguments of this function.

```R
library(TSA)
# win.graph(width=4.875, height=2.5,pointsize=8)
data(larain)
plot(larain,ylab='Inches',xlab='Year',type='o', main = "Figure 1. Time series plot of LA rain series.")
```

In Figure 1, we observe considerable variation in rainfall amount over the years from this time series plot. The year 1883 was an exceptionally wet year for Los Angeles, while 1983 was quite dry. For the analysis, we are interested in whether or not consecutive years are related in some way. If so, we might be able to use one year’s rainfall value to help forecast next year’s rainfall amount. The following code chunk generates a scatter plot to investigate the relationship between pairs of consecutive rainfall values:

```R
plot(y=larain,x=zlag(larain),ylab='Inches', xlab='Previous Year Inches', main = "Figure 2. Scatter plot of rainfall in consequtive years.")
```

The plots show no “trends” and no general tendencies. In Figure 2, the point plotted near the lower right-hand corner shows that the year of extremely high rainfall, 40 inches in 1883, was followed by an amount nearly 12 inches in 1884. The point near the top of the display shows that the 40-inch year was preceded by a much more typical year of about 15 inches. We observe from this plot that there is little information about this year’s rainfall amount from last year’s amount. The correlation between last year’s rainfall amount and this year’s amount which can be calculated by the following code chunk:

```R
y = larain             # Read the annual rainfall data into y
x = zlag(larain)       # Generate first lag of the annual rainfall series
index = 2:length(x)    # Create an index to get rid of the first NA value in x
cor(y[index],x[index]) # Calculate correlation between numerical values in x and y
```


## An Industrial Chemical Process {#an-industrial-chemical-process}

The second example is on a a time series from an industrial chemical process. A color property from consecutive batches in the process is measured here and named color in the package. We plot the time series with the following code chunk:

```R
# win.graph(width=4.875, height=2.5,pointsize=8)
data(color)
plot(color,ylab='Color Property',xlab='Batch',type='o', main = "Figure 3. Time series plot of the color property series.")
```

From Figure 3, it seems that succeeding measurements are related to one another as the values that are neighbors in time tend to be similar in size. This is more clearly seen in the following scatter plot of neighboring pairs:

```R
# win.graph(width=3,height=3,pointsize=8)
plot(y=color,x=zlag(color),ylab='Color Property', xlab='Previous Batch Color Property', main = "Figure 4. Scatter plot of the color property in consequtive batches.")
```

In Figure 4, we see a slight upward trend, which is apparent but not terribly strong. The correlation in this scatter plot is about 0.6:

```R
y = color              # Read the color data into y
x = zlag(color)        # Generate first lag of the color series
index = 2:length(x)    # Create an index to get rid of the first NA value in x
cor(y[index],x[index]) # Calculate correlation between numerical values in x and y
```


## Annual Abundance of Canadian Hare {#annual-abundance-of-canadian-hare}

The third example concerns the annual abundance of Canadian hare. The data consists of their abundance over about 30 years. The following is the time series plot of annual abundance of Canadian hare for 30 years:

```R
# win.graph(width=4.875, height=2.5,pointsize=8)
data(hare)
plot(hare,ylab='Abundance',xlab='Year',type='o', main = "Figure 5. Time series plot of annual abundance of Canadian hare.")
```

In Figure 5, neighboring values here are very closely related. Large changes in abundance do not occur from one year to the next. The following plot shows the correlation between abundance versus the previous year’s abundance:

```R
# win.graph(width=3, height=3,pointsize=8)
plot(y=hare,x=zlag(hare),ylab='Abundance', xlab='Previous Year Abundance', main = "Figure 6. Scatter plot of abundance in consequtive years.")
```

In Figure 6, we see an upward trend in the plot-low values tend to be followed by low values in the next year, middle-sized values by middle-sized values, and high values by high values. The amount of correlation between neighboring abundance values is 0.70:

```R
y = hare               # Read the abundance data into y
x = zlag(hare)         # Generate first lag of the abundance series
index = 2:length(x)    # Create an index to get rid of the first NA value in x
cor(y[index],x[index]) # Calculate correlation between numerical values in x and y
```


## Monthly Average Temperatures in Dubuque, Iowa {#monthly-average-temperatures-in-dubuque-iowa}

The average monthly temperatures (in degrees Fahrenheit) over a number of years recorded in Dubuque, Iowa, are shown in the following plot:

```R
# win.graph(width=4.875, height=2.5,pointsize=8)
data(tempdub)
plot(tempdub,ylab='Temperature',type='o', main = "Figure 7. Time series plot of average monthly temperature series.")
```

Figure 7 displays seasonality. Seasonality for monthly values occurs when observations twelve months apart are related in some manner or another. All Januarys and Februarys are quite cold but they are similar in value and different from the temperatures of the warmer months of June, July, and August, for example. There is still variation among the January values and variation among the June values. Models for such series must accommodate this variation while preserving the similarities. Here the reason for the seasonality is well understood-the Northern Hemisphere’s changing inclination toward the sun.

The following shows the scatter plot of neighboring temperature measurements.

```R
# win.graph(width=3, height=3,pointsize=8)
plot(y=tempdub,x=zlag(tempdub),ylab='Temperature', xlab='Previous Month Temperature', main = "Figure 8. Scatter plot of average temperature in consequtive months.")
```

As expected, we observe a high correlation between temperatures of succeeding months from Figure 8. However, it is impossible to observe seasonality for this scatter plot.

```R
y = tempdub               # Read the abundance data into y
x = zlag(tempdub)         # Generate first lag of the abundance series
index = 2:length(x)    # Create an index to get rid of the first NA value in x
cor(y[index],x[index]) # Calculate correlation between numerical values in x and y
```


## Monthly Oil Filter Sales {#monthly-oil-filter-sales}

The last example is on the monthly sales to dealers of a specialty oil filter for construction equipment manufactured by John Deere. According to the authors of our textbook, when these data were first presented to one of the authors, the manager said, “There is no reason to believe that these sales are seasonal.” Seasonality would be present if January values tended to be related to other January values, February values tended to be related to other February values, and so forth. The time series plot in Figure 9 is not designed to display seasonality especially well.

```R
# win.graph(width=4.875, height=2.5,pointsize=8)
data(oilfilters)
plot(oilfilters,type='o',ylab='Sales', main = "Figure 9. Time series plot of monthly oil filter sales series.")
```

To exhibit the seasonality, we can build a more informative plot labeling the months with the first letters of their names. In this version, all January values are plotted with the character J, all Februarys with F, all Marches with M, and so forth. With these plotting symbols, it is much easier to see that sales for the winter months of January and February all tend to be high, while sales in September, October, November, and December are generally quite low. The seasonality in the data is much easier to see from the modified time series plot in Figure 10.

```R
plot(oilfilters,type='l',ylab='Sales', main = "Figure 10. Time series plot of monthly oil filter sales series with labels.")
points(y=oilfilters,x=time(oilfilters), pch=as.vector(season(oilfilters)))
```

Here, the command **time(oilfilters)** puts continuous time points on each measurement such that

The command **as.vector(season(oilfilters))** creates a vector puts months on each measurement such that

Then, the **points()** function writes the first letter of each month over the time series plot generated by **plot()** function.

Figure 11 shows the scatter plot of neighboring monthly sales of oil filters.

```R
# win.graph(width=3, height=3,pointsize=8)
plot(y=oilfilters,x=zlag(oilfilters),ylab='Sales', xlab='Previous Month Sales',main = "Figure 11. Scatter plot of oil filter sales in consequtive months.")
```

And the amount of correlation between sales of succeeding months is

```R
y = oilfilters               # Read the abundance data into y
x = zlag(oilfilters)         # Generate first lag of the abundance series
index = 2:length(x)    # Create an index to get rid of the first NA value in x
cor(y[index],x[index]) # Calculate correlation between numerical values in x and y
```

Although we observe a seasonal effect, autocorrelation between monthly sales is slightly correlated. So, we should note that having seasonality in time series data does not imply a significant correlation.


## A Model-Building Strategy {#a-model-building-strategy}

It is not a straightforward task to find appropriate models for time series data. There are several components that a data scientist should deal with. Throughout the course we will follow a multistage model-building strategy with the following three steps:

-   model specification, (or identification)
-   model fitting, and
-   model diagnostics.

In model specification (or identification), the classes of time series models are selected that may be appropriate for a given observed series. In choosing a model, we shall attempt to adhere to the principle of parsimony; that is, the model used should require the smallest number of parameters that will adequately represent the time series.

Albert Einstein is quoted in Parzen (1982, p. 68) as remarking that “everything should be made as simple as possible but not simpler.”

The model fitting consists of finding the best possible estimates of a number of parameters involved in the model using a statistical estimation method such as least squares, maximum likelihood estimation, or Bayesian estimation.

Model diagnostics is concerned with assessing the quality of the model that we have specified and estimated. We try to answer the questions:

How well does the model fit the data?
Are the assumptions of the model reasonably well satisfied?
If no inadequacies are found, the modeling may be assumed to be complete, and the model may be used, for example, to forecast future values. Otherwise, we choose another model in the light of the inadequacies found; that is, we return to the model specification step. In this way, we cycle through the three steps until an acceptable model is found.


## Time Series and Stochastic Processes {#time-series-and-stochastic-processes}

The sequence of random variables \\({Yt:t=0,±1,±2,±3,…}\\) is called a stochastic process and serves as a model for an observed time series. It is known that the complete probabilistic structure of such a process is determined by the set of distributions of all finite collections of the Y’s. Much of the information in these joint distributions can be described in terms of means, variances, and covariances. So, we will focus on the measures mostly based on the first and second moments.


## Means, Variances, and Covariances {#means-variances-and-covariances}

For a stochastic process {<t=0,±1,±2,±3>,…}, the mean function is defined by

μt=E(Yt), for t=0,±1,±2,±3,…

Actually, μt is just the expected value of the process at time t.

The autocovariance function, γt,s is defined as

γt,s=Cov(Yt,Ys), for t,s=0,±1,±2,±3,…

where Cov(Yt,Ys)=E[(Yt−μt)(Ys−μs)]=E(YtYs)−μtμs.

The autocorrelation function, ρt,s, is given by

ρt,s=Corr(Yt,Ys), for t,s=0,±1,±2,±3,…

where

Corr(Yt,Ys)=Cov(Yt,Ys)Var(Yt)Var(Ys)−−−−−−−−−−−−−√=γt,sγt,tγs,s−−−−−√.

Please note that

γt,t=Cov(Yt,Yt)=E[(Yt−μt)(Yt−μt)]=E[(Yt−μt)2]=E(Y2t)−μ2t=Var(Yt)

and

γs,s=Cov(Ys,Ys)=E[(Ys−μs)(Ys−μs)]=E[(Ys−μs)2]=E(Y2s)−μ2s=Var(Ys).

Consequently, ρt,t=ρs,s=1.

Because γt,s=γs,t, we have ρt,s=ρs,t. And because |γt,s|≤γt,tγs,s−−−−−√, we have |ρt,s|≤1.

Values of ρt,s near ±1 indicate strong (linear) dependence, whereas values near zero indicate weak (linear) dependence. If ρt,s=0, we say that Yt and Ys are uncorrelated.

Because most of the context is based on the covariance and correlations, we will go a little bit further. To investigate the covariance properties of various time series models, the following result will be used repeatedly: If c1,c2,…,cm and d1,d2,…,dn are constants and t1,t2,…,tm and s1,s2,…,sn are time points, then the contrivance of two linear combinations of time series observations is calculated by

Cov[∑i=1mciYti,∑j=1ndjYsj]=∑i=1m∑j=1ncidjCov(Yti,Ysj).

As a special case, we obtain the variance of a linear combination of time series observations as

Var[∑i=1mciYti]=∑i=1nc2iVar(Yti)+2∑i&lt;jcicjCov(Yti,Ytj).


## The Random Walk {#the-random-walk}

Let e1,e2,… be a sequence of independent, identically distributed random variables each with zero mean and variance σ2e. The observed time series, {<t=1,2>,…}, is constructed as follows:

Y1Y2Yt==⋮=e1e1+e2e1+e2+⋯+et

Apparently, this system of equations can be written as

Yt=Yt−1+et

with initial condition Y1=e1.

If the e’s are interpreted as the sizes of the “steps” taken (forward or backward) along a number line, then Yt is the position of the random walker at time t.

We obtain the mean and variance of the random walk process as follows:

μt=E(Yt)=E(e1+e2+⋯+et)=E(e1)+E(e2)+⋯+E(et)=0+0+⋯+0.

So, μt=0 for all t. As for the variance,

Var(Yt)=Var(e1+e2+⋯+et)=Var(e1)+Var(e2)+⋯+Var(et)=σ2e+σ2e+⋯+σ2e.

So we have a linearly increasing variance Var(Yt)=tσ2e with time.

For 1≤t≤s, we have the following autocorrelation function,

γt,s=tσ2e.

Autocorrelation function is straightforwardly obtained as follows:

ρt,s=ts−−√

for 1≤t≤s. For example, we have the following autocorrelation values ρ1,2=0.707, ρ8,9=0.943, ρ24,25=0.980, and ρ1,25=0.200. The neighboring time points are more correlated than those distant from each other.

Figure 12 shows a simulated random walk:

```R
data(rwalk) # rwalk contains a simulated random walk
plot(rwalk,type='o',ylab='Random Walk', main = "Figure 12. Time series plot of a simulated random walk.")
```


## A Moving Average {#a-moving-average}

Suppose that {Yt} is constructed as

Yt=et+et−12

where e’s are i.i.d. with zero mean and variance σ2e. Consequently, we have the following:

μt=0Var(Yt)=0.5σ2eCov(Yt,Yt−1)=0.25σ2e and Cov(Yt,Yt−k)=0 for k&gt;1, and ρt,s=0.5 and ρt,t−k=0 for k&gt;1.

Values of Y precisely one-time unit apart have exactly the same correlation no matter where they occur in time and, more generally, ρt,t−k is the same for all values of t. This leads us to the important concept of stationarity.

The following code chunk generates a random realisation of a moving average series in Figure 13.

```R
e = rnorm(50,0,1) # Generate standard normal distributed e_t series
Y = array(NA, 50)
for ( t in 2:50){
  Y[t] = (e[t] + e[t-1])/2
}
plot(ts(Y), type ="o", ylab="Y_t", xlab ="t", main = "Figure 13. Time series plot of a moving average series.")
```


## Stationarity {#stationarity}

The basic idea of stationarity is that the probability laws that govern the behavior of the process do not change over time. the assumption of stationarity allows us to make statistical inferences about the structure of a stochastic process on the basis of an observed record of that process. Specifically, a process {Yt} is said to be strictly stationary if the joint distribution of Yt1,Yt2,…,Ytn is the same as the joint distribution of Yt1−k,Yt2−k,…,Ytn−k for all choices of time points t1,t2,…,tn and all choices of time lag k.

It then follows that both the mean and variance functions are constant for all time: E(Yt)=E(Yt−k) and Var(Yt)=Var(Yt−k) for all t and k.

The covariance between Yt and Ys depends on time only through the time difference |t−s| and not otherwise on the actual times t and s.

Thus, for a stationary process, to simplify our notation, we can write

γk=Cov(Yt,Yt−k) and ρk=Corr(Yt,Yt−k)=γkγ0.

General properties of a stationary process are

γ0=Var(Yt)γk=γ−k|γk|≤γ0

and correspondingly,

ρ0=1ρk=ρ−k|ρk|≤1.

If a process is strictly stationary and has a finite variance, then the covariance function must depend only on the time lag. A definition that is similar to that of strict stationarity but is mathematically weaker is the following: A stochastic process {Yt} is said to be weakly (or second-order) stationary if

The mean function is constant over time, and
γt,t−k=γ0,k for all time t and lag k.
In this course, the term stationary when used alone will always refer to this weaker form of stationarity.

Figure 14 and 15 show a stationary and a nonstationary randomly generated series. Which one is for the non-stationary series?


## White Noise {#white-noise}

One of the important and mostly used stationary processes is called white noise process. A white noise process is actually a sequence of i.i.d. random variables {et}. many useful processes can be constructed from white noise.

For a white noise process, μt=E(et) is constant and γk=Var(et) for k=0 and γk=0 for k≠0. Thus, we can write ρk=1 for k=0 and ρk=0 for k≠0. We usually assume that the white noise process has mean zero and denote Var(et) by σ2e.

The moving average also defines a stationary process. For a moving average process, Yt=(et+et−1)/2, we have ρk=1 for k=0, ρk=0.5 for |k|=1, and ρk=0 for |k|≥2.

Figure 16 shows an example of a white noise series:

```R
e = rnorm(50,0,1)
plot(ts(e), type ="o", ylab="e_t", xlab ="t", main = "Figure 16. Time series plot of a white noise series.")
```


## Random Cosine Wave {#random-cosine-wave}

Let us define the following process:

Yt=cos[2π(t12+Φ)] for t=0,±1,±2,…

where Φ∼Uniform(0,1). Figure 17 displays the time series plot of this process:

```R
phi = runif(51,0,1)
t = seq(0,50,1)
Y = cos(2*pi*((t/12)+phi))
plot(ts(Y), type ="o", ylab="Y_t", xlab ="t", main = "Figure 17. Time series plot of a random cosine wave.")
```

Statistical properties of this process are

E(Yt)=∫10cos[2π(t12+ϕ)]f(ϕ)dϕ=∫10cos[2π(t12+ϕ)]⋅1dϕ=12πsin(2πt12+ϕ)∣∣∣10=12π[sin(2πt12+2π)−sin(2πt12)]=0

for all t. Also,

γt,s=12cos[2π(|t−s|12)].

So the process is stationary with the autocorrelation function

ρk=cos(2πk12) for t=0,±1,±2,…

With this example, we observe that it will be difficult to assess whether or not stationarity is a reasonable assumption for a given time series on the basis of the time sequence plot of the observed data.

As another example, the random walk constructed with Yt=e1+e2+⋯+et is not stationary due to non-constant variance function Var(Yt=tσ2e also its covariance function γt,s=tσ2e does not depend only on time lag for 0≤t&lt;s.

Instead of going on with Yt directly, we can consider the differences of successive Y-values, denoted ΔYt. Then $Y<sub>t</sub> = Y<sub>t</sub>-Y<sub>t−1</sub>=e<sub>t</sub>, so the differenced series, {ΔYt}, is stationary.

Many real time series cannot be reasonably modeled by stationary processes since they are not in statistical- equilibrium but are evolving over time. However, we can frequently transform non- stationary series into stationary series by simple techniques such as differencing.


## Summary {#summary}

In this module, we introduced a special data type called time series data. We use simple visualisations to plot time series data for descriptive purposes. Then we focused on the fundamentals of time series analysis such as mean function, autocovariance function, and autocorrelation function. We illustrated these concepts with the basic processes: the random walk, white noise, a simple moving average, and a random cosine wave. Finally, the fundamental concept of stationarity is introduced and the idea of differentiating time series to ensure stationarity is highlighted.
