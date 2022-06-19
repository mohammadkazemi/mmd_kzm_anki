## Pandas Built-in Data Visualization
%
```python
# In this lecture we will learn about pandas built-in capabilities for data visualization! It's built-off of matplotlib, but it baked into pandas for easier usage!  
# Let's take a look!
```
## Imports
%
```python
import numpy as np
import pandas as pd
```
## The Data
%
```python
# There are some fake data csv files you can read in as dataframes:
df1 = pd.read_csv('df1',index_col=0)
df2 = pd.read_csv('df2')
# Matplotlib has [style sheets](http://matplotlib.org/gallery.html#style_sheets) you can use to make your plots look a little nicer. These style sheets include plot_bmh,plot_fivethirtyeight,plot_ggplot and more. They basically create a set of style rules that your plots follow. I recommend using them, they make all your plots have the same look and feel more professional. You can even create your own if you want your company's plots to all have the same look (it is a bit tedious to create on though).
# **Before plt.style.use() your plots look like this:**
# Call the style:
import matplotlib.pyplot as plt
df1['A'].hist()
plt.style.use('dark_background')
df1['A'].hist()
plt.style.use('fivethirtyeight')
plt.style.use('ggplot')
# There are several plot types built-in to pandas, most of them statistical plots by nature:
area     
# * df.plot.
# * df.plot.hist     
# * df.plot.barh     
# * df.plot.sar      
# * df.plot.bcatter
# * df.plot.box      
# You can also just call df.plot(kind='hist') or replace that kind argument with any of the key terms shown in the list above (e.g. 'box','barh', etc..)
# * df.plot.kde      
# ___
```
## Area
%
```python
df2.plot.area(alpha=0.4)
```
## Barplots
%
```python
df2.head()
df2.plot.bar()
df2.plot.bar(stacked=True)
```
## Histograms
%
```python
df1['A'].plot.hist(bins=50)
```
## Line Plots
## Scatter Plots
%
```python
# You can use c to color based off another column value
df1.plot.scatter(x='A',y='B')
# Use cmap to indicate colormap to use. 
# Useful for Bivariate Data, alternative to scatterplot:
df.plot.hexbin(x='a',y='b',gridsize=25,cmap='Oranges')
df = pd
```
## Kernel Density Estimation plot (KDE).DataFrame(np.random.randn(1000, 2), columns=['a', 'b'])
%
```python
# ____
df2['a'].plot.kde()
df2.plot.density()
# Next we will learn about seaborn, which is a statistical visualization library designed to work with pandas dataframes well.
# That's it! Hopefully you can see why this method of plotting will be a lot easier to use than full-on matplotlib, it balances ease of use with control over the figure. A lot of the plot calls also accept additional arguments of their parent matplotlib plt. call. 
# This is just a quick exercise for you to review the various plots we showed earlier. Use **df3** to replicate the following plots. 
```
## Pandas Data Visualization Exercise
%
```python
import matplotlib.pyplot as plt
import pandas as pd
df3 = pd.read_csv('df3')
df3.info()
df3.head()
df3.plot.scatter(x='a',y='b',c='red',s=50,figsize=(12,3))
```
## # ** Create a boxplot comparing the a and b columns.**
%
```python
df3[['a','b']].plot.box()
df3['a'].plot.hist(alpha=0.5,bins=25)
# ** Figure out how to increase the linewidth and make the linestyle dashed. (Note: You would usually not dash a kde plot line)**
# ** Create an area plot of all the columns for just the rows up to 30. (hint: use .ix).**
```
## Bonus Challenge!
%
```python
# ** Try searching Google for a good stackoverflow link on this topic. If you can't find it on your own - [use this one for a hint.](http://stackoverflow.com/questions/23556153/how-to-put-legend-outside-the-plot-with-pandas)**
# ** Notice how the legend in our previous figure overlapped some of actual diagram. Can you figure out how to display the legend outside of the plot as shown below?**
df3.ix[0:30].plot.area(alpha=0.4,ax=f.gca())
plt.show()
```