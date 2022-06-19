## Choropleth Maps Offline Plotly Usage
%
```python
# Get imports and set everything up to be working offline.
import plotly.plotly as py
import plotly.graph_objs as go 
from plotly.offline import download_plotlyjs, init_notebook_mode, plot, iplot
# Now set up everything so that the figures show up in the notebook:
init_notebook_mode(connected=True) 
# More info on other options for Offline Plotly usage can be found [here](https://plot.ly/python/offline/).
```
## Choropleth US Maps
%
```python
# Plotly's mapping can be a bit hard to get used to at first, remember to reference the cheat sheet in the data visualization folder, or [find it online here](https://images.plot.ly/plotly-documentation/images/python_cheat_sheet.pdf).
import pandas as pd
# Now we need to begin to build our data dictionary. Easiest way to do this is to use the **dict()** function of the general form:
# * type = 'choropleth',
# * locations = list of states
# * locationmode = 'USA-states'
# * colorscale= 
# Either a predefined string:
#     'pairs' | 'Greys' | 'Greens' | 'Bluered' | 'Hot' | 'Picnic' | 'Portland' | 'Jet' | 'RdBu' | 'Blackbody' | 'Earth' | 'Electric' | 'YIOrRd' | 'YIGnBu'
# or create a [custom colorscale](https://plot.ly/python/heatmap-and-contour-colorscales/)
# * text= list or array of text to display per point
# * z= array of values on z axis (color of state)
# * colorbar = {'title':'Colorbar Title'})
# Here is a simple example:
data = dict(type = 'choropleth',
            locations = ['AZ','CA','NY'],
            locationmode = 'USA-states',
            colorscale= 'Portland',
            text= ['text1','text2','text3'],
            z=[1.0,2.0,3.0],
            colorbar = {'title':'Colorbar Title'})
# Then we create the layout nested dictionary:
layout = dict(geo = {'scope':'usa'})
# Then we use: 
#     go.Figure(data = [data],layout = layout)
#     
# to set up the object that finally gets passed into iplot()
choromap = go.Figure(data = [data],layout = layout)
iplot(choromap)
```
## Real Data US Map Choropleth
%
```python
# Now let's show an example with some real data as well as some other options we can add to the dictionaries in data and layout.
df = pd.read_csv('2011_US_AGRI_Exports')
df.head()
# Now out data dictionary with some extra marker and colorbar arguments:
data = dict(type='choropleth',
            colorscale = 'YIOrRd',
            locations = df['code'],
            z = df['total exports'],
            locationmode = 'USA-states',
            text = df['text'],
            marker = dict(line = dict(color = 'rgb(255,255,255)',width = 2)),
            colorbar = {'title':"Millions USD"}
            ) 
# And our layout dictionary with some more arguments:
layout = dict(title = '2011 US Agriculture Exports by State',
              geo = dict(scope='usa',
                         showlakes = True,
                         lakecolor = 'rgb(85,173,240)')
             )
choromap = go.Figure(data = [data],layout = layout)
iplot(choromap)
```
## World Choropleth Map
%
```python
# Now let's see an example with a World Map:
df = pd.read_csv('2014_World_GDP')
df.head()
data = dict(
        type = 'choropleth',
        locations = df['CODE'],
        z = df['GDP (BILLIONS)'],
        text = df['COUNTRY'],
        colorbar = {'title' : 'GDP Billions US'},
      ) 
layout = dict(
    title = '2014 Global GDP',
    geo = dict(
        showframe = False,
        projection = {'type':'Mercator'}
    )
)
choromap = go.Figure(data = [data],layout = layout)
iplot(choromap)
```
## Choropleth Maps Exercise - Solutions
%
```python
# Welcome to the Choropleth Maps Exercise! In this exercise we will give you some simple datasets and ask you to create Choropleth Maps from them. Due to the Nature of Plotly we can't show you examples embedded inside the notebook.
# [Full Documentation Reference](https://plot.ly/python/reference/#choropleth)
```
## Plotly Imports
%
```python
import plotly.graph_objs as go 
from plotly.offline import init_notebook_mode,iplot,plot
init_notebook_mode(connected=True) 
# ** Import pandas and read the csv file: 2014_World_Power_Consumption**
import pandas as pd
df = pd.read_csv('2014_World_Power_Consumption')
# ** Check the head of the DataFrame. **
df.head()
# ** Referencing the lecture notes, create a Choropleth Plot of the Power Consumption for Countries using the data and layout dictionary. **
data = dict(
        type = 'choropleth',
        colorscale = 'Viridis',
        reversescale = True,
        locations = df['Country'],
        locationmode = "country names",
        z = df['Power Consumption KWH'],
        text = df['Country'],
        colorbar = {'title' : 'Power Consumption KWH'},
      ) 
layout = dict(title = '2014 Power Consumption KWH',
                geo = dict(showframe = False,projection = {'type':'Mercator'})
             )
choromap = go.Figure(data = [data],layout = layout)
plot(choromap,validate=False)
```
## USA Choropleth
%
```python
# ** Import the 2012_Election_Data csv file using pandas. **
usdf = pd.read_csv('2012_Election_Data')
# ** Check the head of the DataFrame. **
usdf.head()
# ** Now create a plot that displays the Voting-Age Population (VAP) per state. If you later want to play around with other columns, make sure you consider their data type. VAP has already been transformed to a float for you. **
data = dict(type='choropleth',
            colorscale = 'Viridis',
            reversescale = True,
            locations = usdf['State Abv'],
            z = usdf['Voting-Age Population (VAP)'],
            locationmode = 'USA-states',
            text = usdf['State'],
            marker = dict(line = dict(color = 'rgb(255,255,255)',width = 1)),
            colorbar = {'title':"Voting-Age Population (VAP)"}
            ) 
layout = dict(title = '2012 General Election Voting Data',
              geo = dict(scope='usa',
                         showlakes = True,
                         lakecolor = 'rgb(85,173,240)')
             )
choromap = go.Figure(data = [data],layout = layout)
plot(choromap,validate=False)```
```