## Categorical Data Plots
%
```python
# 
# Now let's discuss using seaborn to plot categorical data! There are a few main plot types for this:
# 
# * factorplot
# * boxplot
# * violinplot
# * stripplot
# * swarmplot
# * barplot
# * countplot
# 
# Let's go through examples of each!
import seaborn as sns
%matplotlib inline
tips = sns.load_dataset('tips')
tips.head()
```
## barplot and countplot
%
```python
# 
# These very similar plots allow you to get aggregate data off a categorical feature in your data. **barplot** is a general plot that allows you to aggregate the categorical data based off some function, by default the mean:
sns.barplot(x='sex',y='total_bill',data=tips)
import numpy as np
# You can change the estimator object to your own function, that converts a vector to a scalar:
sns.barplot(x='sex',y='total_bill',data=tips,estimator=np.std)
```
## countplot
%
```python
# 
# This is essentially the same as barplot except the estimator is explicitly counting the number of occurrences. Which is why we only pass the x value:
sns.countplot(x='sex',data=tips)
```
## boxplot and violinplot
%
```python
# 
# boxplots and violinplots are used to shown the distribution of categorical data. A box plot (or box-and-whisker plot) shows the distribution of quantitative data in a way that facilitates comparisons between variables or across levels of a categorical variable. The box shows the quartiles of the dataset while the whiskers extend to show the rest of the distribution, except for points that are determined to be “outliers” using a method that is a function of the inter-quartile range.
sns.boxplot(x="day", y="total_bill", data=tips,palette='rainbow')
# Can do entire dataframe with orient='h'
sns.boxplot(data=tips,palette='rainbow',orient='h')
sns.boxplot(x="day", y="total_bill", hue="smoker",data=tips, palette="coolwarm")
```
## violinplot
%
```python
# A violin plot plays a similar role as a box and whisker plot. It shows the distribution of quantitative data across several levels of one (or more) categorical variables such that those distributions can be compared. Unlike a box plot, in which all of the plot components correspond to actual datapoints, the violin plot features a kernel density estimation of the underlying distribution.
sns.violinplot(x="day", y="total_bill", data=tips,palette='rainbow')
sns.violinplot(x="day", y="total_bill", data=tips,hue='sex',palette='Set1')
sns.violinplot(x="day", y="total_bill", data=tips,hue='sex',split=True,palette='Set1')
```
## stripplot and swarmplot
%
```python
# The stripplot will draw a scatterplot where one variable is categorical. A strip plot can be drawn on its own, but it is also a good complement to a box or violin plot in cases where you want to show all observations along with some representation of the underlying distribution.
# 
# The swarmplot is similar to stripplot(), but the points are adjusted (only along the categorical axis) so that they don’t overlap. This gives a better representation of the distribution of values, although it does not scale as well to large numbers of observations (both in terms of the ability to show all the points and in terms of the computation needed to arrange them).
sns.stripplot(x="day", y="total_bill", data=tips)
sns.stripplot(x="day", y="total_bill", data=tips,jitter=True)
sns.stripplot(x="day", y="total_bill", data=tips,jitter=True,hue='sex',palette='Set1')
sns.stripplot(x="day", y="total_bill", data=tips,jitter=True,hue='sex',palette='Set1',split=True)
sns.swarmplot(x="day", y="total_bill", data=tips)
sns.swarmplot(x="day", y="total_bill",hue='sex',data=tips, palette="Set1", split=True)
```
## Combining Categorical Plots
%
```python
sns.violinplot(x="tip", y="day", data=tips,palette='rainbow')
sns.swarmplot(x="tip", y="day", data=tips,color='black',size=3)
```
## factorplot
%
```python
# 
# factorplot is the most general form of a categorical plot. It can take in a **kind** parameter to adjust the plot type:
sns.factorplot(x='sex',y='total_bill',data=tips,kind='bar')
```
## Distribution Plots
%
```python
# 
# Let's discuss some plots that allow us to visualize the distribution of a data set. These plots are:
# 
# * distplot
# * jointplot
# * pairplot
# * rugplot
# * kdeplot
# ___
```
## Imports
%
```python
import seaborn as sns
%matplotlib inline
```
## Data
%
```python
# Seaborn comes with built-in data sets!
tips = sns.load_dataset('tips')
tips.head()
```
## distplot
%
```python
# 
# The distplot shows the distribution of a univariate set of observations.
sns.distplot(tips['total_bill'])
# Safe to ignore warnings
# To remove the kde layer and just have the histogram use:
sns.distplot(tips['total_bill'],kde=False,bins=30)
```
## jointplot
%
```python
# 
# jointplot() allows you to basically match up two distplots for bivariate data. With your choice of what **kind** parameter to compare with: 
# * “scatter” 
# * “reg” 
# * “resid” 
# * “kde” 
# * “hex”
sns.jointplot(x='total_bill',y='tip',data=tips,kind='scatter')
sns.jointplot(x='total_bill',y='tip',data=tips,kind='hex')
sns.jointplot(x='total_bill',y='tip',data=tips,kind='reg')
```
## pairplot
%
```python
# 
# pairplot will plot pairwise relationships across an entire dataframe (for the numerical columns) and supports a color hue argument (for categorical columns). 
sns.pairplot(tips)
sns.pairplot(tips,hue='sex',palette='coolwarm')
```
## rugplot
%
```python
# 
# rugplots are actually a very simple concept, they just draw a dash mark for every point on a univariate distribution. They are the building block of a KDE plot:
sns.rugplot(tips['total_bill'])
```
## kdeplot
%
```python
# 
# kdeplots are [Kernel Density Estimation plots](http://en.wikipedia.org/wiki/Kernel_density_estimation#Practical_estimation_of_the_bandwidth). These KDE plots replace every single observation with a Gaussian (Normal) distribution centered around that value. For example:
# Don't worry about understanding this code!
# It's just for the diagram below
import numpy as np
import matplotlib.pyplot as plt
from scipy import stats
#Create dataset
dataset = np.random.randn(25)
# Create another rugplot
sns.rugplot(dataset);
# Set up the x-axis for the plot
x_min = dataset.min() - 2
x_max = dataset.max() + 2
# 100 equally spaced points from x_min to x_max
x_axis = np.linspace(x_min,x_max,100)
# Set up the bandwidth, for info on this:
url = 'http://en.wikipedia.org/wiki/Kernel_density_estimation#Practical_estimation_of_the_bandwidth'
bandwidth = ((4*dataset.std()**5)/(3*len(dataset)))**.2
# Create an empty kernel list
kernel_list = []
# Plot each basis function
for data_point in dataset:
    # Create a kernel for each point and append to list
    kernel = stats.norm(data_point,bandwidth).pdf(x_axis)
    kernel_list.append(kernel)
    #Scale for plotting
    kernel = kernel / kernel.max()
    kernel = kernel * .4
    plt.plot(x_axis,kernel,color = 'grey',alpha=0.5)
plt.ylim(0,1)
# To get the kde plot we can sum these basis functions.
# Plot the sum of the basis function
sum_of_kde = np.sum(kernel_list,axis=0)
# Plot figure
fig = plt.plot(x_axis,sum_of_kde,color='indianred')
# Add the initial rugplot
sns.rugplot(dataset,c = 'indianred')
# Get rid of y-tick marks
plt.yticks([])
# Set title
plt.suptitle("Sum of the Basis Functions")
# So with our tips dataset:
sns.kdeplot(tips['total_bill'])
sns.rugplot(tips['total_bill'])
sns.kdeplot(tips['tip'])
sns.rugplot(tips['tip'])
```
## Grids
%
```python
# 
# Grids are general types of plots that allow you to map plot types to rows and columns of a grid, this helps you create similar plots separated by features.
import seaborn as sns
import matplotlib.pyplot as plt
%matplotlib inline
iris = sns.load_dataset('iris')
iris.head()
```
## PairGrid
%
```python
# 
# Pairgrid is a subplot grid for plotting pairwise relationships in a dataset.
# Just the Grid
sns.PairGrid(iris)
# Then you map to the grid
g = sns.PairGrid(iris)
g.map(plt.scatter)
# Map to upper,lower, and diagonal
g = sns.PairGrid(iris)
g.map_diag(plt.hist)
g.map_upper(plt.scatter)
g.map_lower(sns.kdeplot)
```
## pairplot
%
```python
# 
# pairplot is a simpler version of PairGrid (you'll use quite often)
sns.pairplot(iris)
sns.pairplot(iris,hue='species',palette='rainbow')
```
## Facet Grid
%
```python
# 
# FacetGrid is the general way to create grids of plots based off of a feature:
tips = sns.load_dataset('tips')
tips.head()
# Just the Grid
g = sns.FacetGrid(tips, col="time", row="smoker")
g = sns.FacetGrid(tips, col="time",  row="smoker")
g = g.map(plt.hist, "total_bill")
g = sns.FacetGrid(tips, col="time",  row="smoker",hue='sex')
# Notice hwo the arguments come after plt.scatter call
g = g.map(plt.scatter, "total_bill", "tip").add_legend()
```
## JointGrid
%
```python
# 
# JointGrid is the general version for jointplot() type grids, for a quick example:
g = sns.JointGrid(x="total_bill", y="tip", data=tips)
g = sns.JointGrid(x="total_bill", y="tip", data=tips)
g = g.plot(sns.regplot, sns.distplot)
# Reference the documentation as necessary for grid types, but most of the time you'll just use the easier plots discussed earlier.
```
## Matrix Plots
%
```python
# 
# Matrix plots allow you to plot data as color-encoded matrices and can also be used to indicate clusters within the data (later in the machine learning section we will learn how to formally cluster data).
# 
# Let's begin by exploring seaborn's heatmap and clutermap:
import seaborn as sns
%matplotlib inline
flights = sns.load_dataset('flights')
tips = sns.load_dataset('tips')
tips.head()
flights.head()
```
## Heatmap
%
```python
# 
# In order for a heatmap to work properly, your data should already be in a matrix form, the sns.heatmap function basically just colors it in for you. For example:
tips.head()
# Matrix form for correlation data
tips.corr()
sns.heatmap(tips.corr())
sns.heatmap(tips.corr(),cmap='coolwarm',annot=True)
# Or for the flights data:
flights.pivot_table(values='passengers',index='month',columns='year')
pvflights = flights.pivot_table(values='passengers',index='month',columns='year')
sns.heatmap(pvflights)
sns.heatmap(pvflights,cmap='magma',linecolor='white',linewidths=1)
```
## clustermap
%
```python
# 
# The clustermap uses hierarchal clustering to produce a clustered version of the heatmap. For example:
sns.clustermap(pvflights)
# Notice now how the years and months are no longer in order, instead they are grouped by similarity in value (passenger count). That means we can begin to infer things from this plot, such as August and July being similar (makes sense, since they are both summer travel months)
# More options to get the information a little clearer like normalization
sns.clustermap(pvflights,cmap='coolwarm',standard_scale=1)
```
## Regression Plots
%
```python
# 
# Seaborn has many built-in capabilities for regression plots, however we won't really discuss regression until the machine learning section of the course, so we will only cover the **lmplot()** function for now.
# 
# **lmplot** allows you to display linear models, but it also conveniently allows you to split up those plots based off of features, as well as coloring the hue based off of features.
# 
# Let's explore how this works:
import seaborn as sns
%matplotlib inline
tips = sns.load_dataset('tips')
tips.head()
```
## lmplot()
%
```python
sns.lmplot(x='total_bill',y='tip',data=tips)
sns.lmplot(x='total_bill',y='tip',data=tips,hue='sex')
sns.lmplot(x='total_bill',y='tip',data=tips,hue='sex',palette='coolwarm')
```
## Working with Markers
%
```python
# 
# lmplot kwargs get passed through to **regplot** which is a more general form of lmplot(). regplot has a scatter_kws parameter that gets passed to plt.scatter. So you want to set the s parameter in that dictionary, which corresponds (a bit confusingly) to the squared markersize. In other words you end up passing a dictionary with the base matplotlib arguments, in this case, s for size of a scatter plot. In general, you probably won't remember this off the top of your head, but instead reference the documentation.
# http://matplotlib.org/api/markers_api.html
sns.lmplot(x='total_bill',y='tip',data=tips,hue='sex',palette='coolwarm',
           markers=['o','v'],scatter_kws={'s':100})
```
## Using a Grid
%
```python
# 
# We can add more variable separation through columns and rows with the use of a grid. Just indicate this with the col or row arguments:
sns.lmplot(x='total_bill',y='tip',data=tips,col='sex')
sns.lmplot(x="total_bill", y="tip", row="sex", col="time",data=tips)
sns.lmplot(x='total_bill',y='tip',data=tips,col='day',hue='sex',palette='coolwarm')
```
## Aspect and Size
%
```python
# 
# Seaborn figures can have their size and aspect ratio adjusted with the **size** and **aspect** parameters:
sns.lmplot(x='total_bill',y='tip',data=tips,col='day',hue='sex',palette='coolwarm',
          aspect=0.6,size=8)
# You're probably wondering how to change the font size or control the aesthetics even more, check out the Style and Color Lecture and Notebook for more info on that!
# 
```
## Seaborn Exercises - Solutions
%
```python
# 
# Time to practice your new seaborn skills! Try to recreate the plots below (don't worry about color schemes, just the plot itself.
```
## The Data
%
```python
# 
# We will be working with a famous titanic data set for these exercises. Later on in the Machine Learning section of the course, we will revisit this data, and use it to predict survival rates of passengers. For now, we'll just focus on the visualization of the data with seaborn:
import seaborn as sns
import matplotlib.pyplot as plt
%matplotlib inline
sns.set_style('whitegrid')
titanic = sns.load_dataset('titanic')
titanic.head()
```
## Exercises
%
```python
# 
# ** Recreate the plots below using the titanic dataframe. There are very few hints since most of the plots can be done with just one or two lines of code and a hint would basically give away the solution. Keep careful attention to the x and y labels for hints.**
# 
# ** *Note! In order to not lose the plot image, make sure you don't code in the cell that is directly above the plot, there is an extra cell above that one which won't overwrite that plot!* **
# CODE HERE
# REPLICATE EXERCISE PLOT IMAGE BELOW
# BE CAREFUL NOT TO OVERWRITE CELL BELOW
# THAT WOULD REMOVE THE EXERCISE PLOT IMAGE!
sns.jointplot(x='fare',y='age',data=titanic)
# CODE HERE
# REPLICATE EXERCISE PLOT IMAGE BELOW
# BE CAREFUL NOT TO OVERWRITE CELL BELOW
# THAT WOULD REMOVE THE EXERCISE PLOT IMAGE!
sns.distplot(titanic['fare'],bins=30,kde=False,color='red')
# CODE HERE
# REPLICATE EXERCISE PLOT IMAGE BELOW
# BE CAREFUL NOT TO OVERWRITE CELL BELOW
# THAT WOULD REMOVE THE EXERCISE PLOT IMAGE!
sns.boxplot(x='class',y='age',data=titanic,palette='rainbow')
# CODE HERE
# REPLICATE EXERCISE PLOT IMAGE BELOW
# BE CAREFUL NOT TO OVERWRITE CELL BELOW
# THAT WOULD REMOVE THE EXERCISE PLOT IMAGE!
sns.swarmplot(x='class',y='age',data=titanic,palette='Set2')
# CODE HERE
# REPLICATE EXERCISE PLOT IMAGE BELOW
# BE CAREFUL NOT TO OVERWRITE CELL BELOW
# THAT WOULD REMOVE THE EXERCISE PLOT IMAGE!
sns.countplot(x='sex',data=titanic)
# CODE HERE
# REPLICATE EXERCISE PLOT IMAGE BELOW
# BE CAREFUL NOT TO OVERWRITE CELL BELOW
# THAT WOULD REMOVE THE EXERCISE PLOT IMAGE!
sns.heatmap(titanic.corr(),cmap='coolwarm')
plt.title('titanic.corr()')
# CODE HERE
# REPLICATE EXERCISE PLOT IMAGE BELOW
# BE CAREFUL NOT TO OVERWRITE CELL BELOW
# THAT WOULD REMOVE THE EXERCISE PLOT IMAGE!
g = sns.FacetGrid(data=titanic,col='sex')
g.map(plt.hist,'age')
# 
```
## Style and Color
%
```python
# 
# We've shown a few times how to control figure aesthetics in seaborn, but let's now go over it formally:
import seaborn as sns
import matplotlib.pyplot as plt
%matplotlib inline
tips = sns.load_dataset('tips')```
```
## Styles
%
```python
# 
# You can set particular styles:
sns.countplot(x='sex',data=tips)
sns.set_style('white')
sns.countplot(x='sex',data=tips)
sns.set_style('ticks')
sns.countplot(x='sex',data=tips,palette='deep')
```
## Spine Removal
%
```python
sns.countplot(x='sex',data=tips)
sns.despine()
sns.countplot(x='sex',data=tips)
sns.despine(left=True)
```
## Size and Aspect
%
```python
# You can use matplotlib's **plt.figure(figsize=(width,height) ** to change the size of most seaborn plots.
# 
# You can control the size and aspect ratio of most seaborn grid plots by passing in parameters: size, and aspect. For example:
# Non Grid Plot
plt.figure(figsize=(12,3))
sns.countplot(x='sex',data=tips)
# Grid Type Plot
sns.lmplot(x='total_bill',y='tip',size=2,aspect=4,data=tips)
```
## Scale and Context
%
```python
# 
# The set_context() allows you to override default parameters:
sns.set_context('poster',font_scale=4)
sns.countplot(x='sex',data=tips,palette='coolwarm')
# Check out the documentation page for more info on these topics:
# https://stanford.edu/~mwaskom/software/seaborn/tutorial/aesthetics.html
sns.puppyplot()
```