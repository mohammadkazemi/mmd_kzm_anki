## Data Input and Output
# 
# This notebook is the reference code for getting input and output, pandas can read a variety of file types using its pd.read_ methods. Let's take a look at the most common data types:
%
```python
import numpy as np
import pandas as pd
```
## CSV Input
%
```python
df = pd.read_csv('example')
df
```
## CSV Output
%
```python
df.to_csv('example',index=False)
```
## Excel
# Pandas can read and write excel files, keep in mind, this only imports data. Not formulas or images, having images or macros may cause this read_excel method to crash. 
%
```python
```
## Excel Input
%
```python
pd.read_excel('Excel_Sample.xlsx',sheetname='Sheet1')
```
## Excel Output
%
```python
df.to_excel('Excel_Sample.xlsx',sheet_name='Sheet1')
```
## HTML
# 
# You may need to install htmllib5,lxml, and BeautifulSoup4. In your terminal/command prompt run:
# 
#     conda install lxml
#     conda install html5lib
#     conda install BeautifulSoup4
# 
# Then restart Jupyter Notebook.
# (or use pip install if you aren't using the Anaconda Distribution)
# 
# Pandas can read table tabs off of html. For example:
%
```python
```
## HTML Input
# 
# Pandas read_html function will read tables off of a webpage and return a list of DataFrame objects:
%
```python
df = pd.read_html('http://www.fdic.gov/bank/individual/failed/banklist.html')
df[0]
# ____
# _____
# _____
```
##  SQL (Optional)
# 
# * Note: If you are completely unfamiliar with SQL you can check out my other course: "Complete SQL Bootcamp" to learn SQL.
%
```python
# The pandas.io.sql module provides a collection of query wrappers to both facilitate data retrieval and to reduce dependency on DB-specific API. Database abstraction is provided by SQLAlchemy if installed. In addition you will need a driver library for your database. Examples of such drivers are psycopg2 for PostgreSQL or pymysql for MySQL. For SQLite this is included in Python’s standard library by default. You can find an overview of supported drivers for each SQL dialect in the SQLAlchemy docs.
# 
# 
# If SQLAlchemy is not installed, a fallback is only provided for sqlite (and for mysql for backwards compatibility, but this is deprecated and will be removed in a future version). This mode requires a Python database adapter which respect the Python DB-API.
# 
# See also some cookbook examples for some advanced strategies.
# 
# The key functions are:
# 
# * read_sql_table(table_name, con[, schema, ...])	
#     * Read SQL database table into a DataFrame.
# * read_sql_query(sql, con[, index_col, ...])	
#     * Read SQL query into a DataFrame.
# * read_sql(sql, con[, index_col, ...])	
#     * Read SQL query or database table into a DataFrame.
# * DataFrame.to_sql(name, con[, flavor, ...])	
#     * Write records stored in a DataFrame to a SQL database.
from sqlalchemy import create_engine
engine = create_engine('sqlite:///:memory:')
df.to_sql('data', engine)
sql_df = pd.read_sql('data',con=engine)
sql_df
# ___
# 
# <a href='http://www.pieriandata.com'> <img src='../Pierian_Data_Logo.png' /></a>
# ___
```
##  DataFrames
# 
# DataFrames are the workhorse of pandas and are directly inspired by the R programming language. We can think of a DataFrame as a bunch of Series objects put together to share the same index. Let's use pandas to explore this topic!
%
```python
import pandas as pd
import numpy as np
from numpy.random import randn
np.random.seed(101)
df = pd.DataFrame(randn(5,4),index='A B C D E'.split(),columns='W X Y Z'.split())
df
```
## Selection and Indexing
# 
# Let's learn the various methods to grab data from a DataFrame
%
```python
df['W']
# Pass a list of column names
df[['W','Z']]
# SQL Syntax (NOT RECOMMENDED!)
df.W
# DataFrame Columns are just Series
type(df['W'])
# **Creating a new column:**
df['new'] = df['W'] + df['Y']
df
# ** Removing Columns**
df.drop('new',axis=1)
# Not inplace unless specified!
df
df.drop('new',axis=1,inplace=True)
df
# Can also drop rows this way:
df.drop('E',axis=0)
# ** Selecting Rows**
df.loc['A']
# Or select based off of position instead of label 
df.iloc[2]
# ** Selecting subset of rows and columns **
df.loc['B','Y']
df.loc[['A','B'],['W','Y']]
```
## Conditional Selection
# 
# An important feature of pandas is conditional selection using bracket notation, very similar to numpy:
%
```python
df
df>0
df[df>0]
df[df['W']>0]
df[df['W']>0]['Y']
df[df['W']>0][['Y','X']]
# For two conditions you can use | and & with parenthesis:
df[(df['W']>0) & (df['Y'] > 1)]
```
## More Index Details
# 
# Let's discuss some more features of indexing, including resetting the index or setting it something else. We'll also talk about index hierarchy!
%
```python
df
# Reset to default 0,1...n index
df.reset_index()
newind = 'CA NY WY OR CO'.split()
df['States'] = newind
df
df.set_index('States')
df
df.set_index('States',inplace=True)
df
```
## Multi-Index and Index Hierarchy
# 
# Let us go over how to work with Multi-Index, first we'll create a quick example of what a Multi-Indexed DataFrame would look like:
# Index Levels
%
```python
outside = ['G1','G1','G1','G2','G2','G2']
inside = [1,2,3,1,2,3]
hier_index = list(zip(outside,inside))
hier_index = pd.MultiIndex.from_tuples(hier_index)
hier_index
df = pd.DataFrame(np.random.randn(6,2),index=hier_index,columns=['A','B'])
df
# Now let's show how to index this! For index hierarchy we use df.loc[], if this was on the columns axis, you would just use normal bracket notation df[]. Calling one level of the index returns the sub-dataframe:
df.loc['G1']
df.loc['G1'].loc[1]
df.index.names
df.index.names = ['Group','Num']
df
df.xs('G1')
df.xs(['G1',1])
df.xs(1,level='Num')
# ___
# 
# <a href='http://www.pieriandata.com'> <img src='../Pierian_Data_Logo.png' /></a>
# ___
```
##  Groupby
# 
# The groupby method allows you to group rows of data together and call aggregate functions
%
```python
import pandas as pd
# Create dataframe
data = {'Company':['GOOG','GOOG','MSFT','MSFT','FB','FB'],
       'Person':['Sam','Charlie','Amy','Vanessa','Carl','Sarah'],
       'Sales':[200,120,340,124,243,350]}
df = pd.DataFrame(data)
df
# ** Now you can use the .groupby() method to group rows together based off of a column name. For instance let's group based off of Company. This will create a DataFrameGroupBy object:**
df.groupby('Company')
# You can save this object as a new variable:
by_comp = df.groupby("Company")
# And then call aggregate methods off the object:
by_comp.mean()
df.groupby('Company').mean()
# More examples of aggregate methods:
by_comp.std()
by_comp.min()
by_comp.max()
by_comp.count()
by_comp.describe()
by_comp.describe().transpose()
by_comp.describe().transpose()['GOOG']
# ___
# 
# <a href='http://www.pieriandata.com'> <img src='../Pierian_Data_Logo.png' /></a>
# ___
```
##  Merging, Joining, and Concatenating
# 
# There are 3 main ways of combining DataFrames together: Merging, Joining and Concatenating. In this lecture we will discuss these 3 methods with examples.
# 
# ____
%
```python
```
## Example DataFrames
%
```python
import pandas as pd
df1 = pd.DataFrame({'A': ['A0', 'A1', 'A2', 'A3'],
                        'B': ['B0', 'B1', 'B2', 'B3'],
                        'C': ['C0', 'C1', 'C2', 'C3'],
                        'D': ['D0', 'D1', 'D2', 'D3']},
                        index=[0, 1, 2, 3])
df2 = pd.DataFrame({'A': ['A4', 'A5', 'A6', 'A7'],
                        'B': ['B4', 'B5', 'B6', 'B7'],
                        'C': ['C4', 'C5', 'C6', 'C7'],
                        'D': ['D4', 'D5', 'D6', 'D7']},
                         index=[4, 5, 6, 7]) 
df3 = pd.DataFrame({'A': ['A8', 'A9', 'A10', 'A11'],
                        'B': ['B8', 'B9', 'B10', 'B11'],
                        'C': ['C8', 'C9', 'C10', 'C11'],
                        'D': ['D8', 'D9', 'D10', 'D11']},
                        index=[8, 9, 10, 11])
df1
df2
df3
```
## Concatenation
# 
# Concatenation basically glues together DataFrames. Keep in mind that dimensions should match along the axis you are concatenating on. You can use **pd.concat** and pass in a list of DataFrames to concatenate together:
%
```python
pd.concat([df1,df2,df3])
pd.concat([df1,df2,df3],axis=1)
# _____
```
## Example DataFrames
%
```python
left = pd.DataFrame({'key': ['K0', 'K1', 'K2', 'K3'],
                     'A': ['A0', 'A1', 'A2', 'A3'],
                     'B': ['B0', 'B1', 'B2', 'B3']})

right = pd.DataFrame({'key': ['K0', 'K1', 'K2', 'K3'],
                          'C': ['C0', 'C1', 'C2', 'C3'],
                          'D': ['D0', 'D1', 'D2', 'D3']})    
left
right
# ___
```
## Merging
# 
# The **merge** function allows you to merge DataFrames together using a similar logic as merging SQL Tables together. For example:
%
```python
pd.merge(left,right,how='inner',on='key')
# Or to show a more complicated example:
left = pd.DataFrame({'key1': ['K0', 'K0', 'K1', 'K2'],
                     'key2': ['K0', 'K1', 'K0', 'K1'],
                        'A': ['A0', 'A1', 'A2', 'A3'],
                        'B': ['B0', 'B1', 'B2', 'B3']})

right = pd.DataFrame({'key1': ['K0', 'K1', 'K1', 'K2'],
                               'key2': ['K0', 'K0', 'K0', 'K0'],
                                  'C': ['C0', 'C1', 'C2', 'C3'],
                                  'D': ['D0', 'D1', 'D2', 'D3']})
pd.merge(left, right, on=['key1', 'key2'])
pd.merge(left, right, how='outer', on=['key1', 'key2'])
pd.merge(left, right, how='right', on=['key1', 'key2'])
pd.merge(left, right, how='left', on=['key1', 'key2'])
```
## Joining
# Joining is a convenient method for combining the columns of two potentially differently-indexed DataFrames into a single result DataFrame.
%
```python
left = pd.DataFrame({'A': ['A0', 'A1', 'A2'],
                     'B': ['B0', 'B1', 'B2']},
                      index=['K0', 'K1', 'K2']) 
right = pd.DataFrame({'C': ['C0', 'C2', 'C3'],
                    'D': ['D0', 'D2', 'D3']},
                      index=['K0', 'K2', 'K3'])
left.join(right)
left.join(right, how='outer')
# ___
# 
# <a href='http://www.pieriandata.com'> <img src='../Pierian_Data_Logo.png' /></a>
# ___
```
##  Missing Data
# 
# Let's show a few convenient methods to deal with Missing Data in pandas:
%
```python
import numpy as np
import pandas as pd
df = pd.DataFrame({'A':[1,2,np.nan],
                  'B':[5,np.nan,np.nan],
                  'C':[1,2,3]})
df
df.dropna()
df.dropna(axis=1)
df.dropna(thresh=2)
df.fillna(value='FILL VALUE')
df['A'].fillna(value=df['A'].mean())
# ___
# 
# <a href='http://www.pieriandata.com'> <img src='../Pierian_Data_Logo.png' /></a>
# ___
```
##  Operations
# 
# There are lots of operations with pandas that will be really useful to you, but don't fall into any distinct category. Let's show them here in this lecture:
%
```python
import pandas as pd
df = pd.DataFrame({'col1':[1,2,3,4],'col2':[444,555,666,444],'col3':['abc','def','ghi','xyz']})
df.head()
```
## Info on Unique Values
%
```python
df['col2'].unique()
df['col2'].nunique()
df['col2'].value_counts()
```
## Selecting Data
#Select from DataFrame using criteria from multiple columns
%
```python
newdf = df[(df['col1']>2) & (df['col2']==444)]
newdf
```
## Applying Functions
%
```python
def times2(x):
    return x*2
df['col1'].apply(times2)
df['col3'].apply(len)
df['col1'].sum()
# ** Permanently Removing a Column**
del df['col1']
df
# ** Get column and index names: **
df.columns
df.index
# ** Sorting and Ordering a DataFrame:**
df
df.sort_values(by='col2') #inplace=False by default
# ** Find Null Values or Check for Null Values**
df.isnull()
# Drop rows with NaN Values
df.dropna()
# ** Filling in NaN values with something else: **
import numpy as np
df = pd.DataFrame({'col1':[1,2,3,np.nan],
                   'col2':[np.nan,555,666,444],
                   'col3':['abc','def','ghi','xyz']})
df.head()
df.fillna('FILL')
data = {'A':['foo','foo','foo','bar','bar','bar'],
     'B':['one','one','two','two','one','one'],
       'C':['x','y','x','y','x','y'],
       'D':[1,3,2,5,4,1]}
df = pd.DataFrame(data)
df
df.pivot_table(values='D',index=['A', 'B'],columns=['C'])
# ___
# 
# <a href='http://www.pieriandata.com'> <img src='../Pierian_Data_Logo.png' /></a>
# ___
```
##  Series
%
```python
# The first main data type we will learn about for pandas is the Series data type. Let's import Pandas and explore the Series object.
# 
# A Series is very similar to a NumPy array (in fact it is built on top of the NumPy array object). What differentiates the NumPy array from a Series, is that a Series can have axis labels, meaning it can be indexed by a label, instead of just a number location. It also doesn't need to hold numeric data, it can hold any arbitrary Python Object.
# 
# Let's explore this concept through some examples:
import numpy as np
import pandas as pd
```
## Creating a Series
# 
# You can convert a list,numpy array, or dictionary to a Series:
%
```python
labels = ['a','b','c']
my_list = [10,20,30]
arr = np.array([10,20,30])
d = {'a':10,'b':20,'c':30}
# ** Using Lists**
pd.Series(data=my_list)
pd.Series(data=my_list,index=labels)
pd.Series(my_list,labels)
# ** NumPy Arrays **
pd.Series(arr)
pd.Series(arr,labels)
# ** Dictionary**
pd.Series(d)
```
## Data in a Series
# 
# A pandas Series can hold a variety of object types:
%
```python
pd.Series(data=labels)
# Even functions (although unlikely that you will use this)
pd.Series([sum,print,len])
```
## Using an Index
%
```python
# 
# The key to using a Series is understanding its index. Pandas makes use of these index names or numbers by allowing for fast look ups of information (works like a hash table or dictionary).
# 
# Let's see some examples of how to grab information from a Series. Let us create two sereis, ser1 and ser2:
ser1 = pd.Series([1,2,3,4],index = ['USA', 'Germany','USSR', 'Japan'])                                   
ser1
ser2 = pd.Series([1,2,5,4],index = ['USA', 'Germany','Italy', 'Japan'])                                   
ser2
ser1['USA']
# Operations are then also done based off of index:
ser1 + ser2
# Let's stop here for now and move on to DataFrames, which will expand on the concept of Series!
```
## Ecommerce Purchases Exercise - Solutions
# 
# In this Exercise you will be given some Fake Data about some purchases done through Amazon! Just go ahead and follow the directions and try your best to answer the questions and complete the tasks. Feel free to reference the solutions. Most of the tasks can be solved in different ways. For the most part, the questions get progressively harder.
# 
# Please excuse anything that doesn't make "Real-World" sense in the dataframe, all the data is fake and made-up.
# 
# Also note that all of these questions can be answered with one line of code.
# ____
# ** Import pandas and read in the Ecommerce Purchases csv file and set it to a DataFrame called ecom. **
%
```python
import pandas as pd
ecom = pd.read_csv('Ecommerce Purchases')
# **Check the head of the DataFrame.**
ecom.head()
# ** How many rows and columns are there? **
ecom.info()
# ** What is the average Purchase Price? **
ecom['Purchase Price'].mean()
# ** What were the highest and lowest purchase prices? **
ecom['Purchase Price'].max()
ecom['Purchase Price'].min()
# ** How many people have English 'en' as their Language of choice on the website? **
ecom[ecom['Language']=='en'].count()
# ** How many people have the job title of "Lawyer" ? **
ecom[ecom['Job'] == 'Lawyer'].info()
# ** How many people made the purchase during the AM and how many people made the purchase during PM ? **
# **(Hint: Check out [value_counts()](http://pandas.pydata.org/pandas-docs/stable/generated/pandas.Series.value_counts.html) ) **
ecom['AM or PM'].value_counts()
# ** What are the 5 most common Job Titles? **
ecom['Job'].value_counts().head(5)
# ** Someone made a purchase that came from Lot: "90 WT" , what was the Purchase Price for this transaction? **
ecom[ecom['Lot']=='90 WT']['Purchase Price']
# ** What is the email of the person with the following Credit Card Number: 4926535242672853 **
ecom[ecom["Credit Card"] == 4926535242672853]['Email'] 
# ** How many people have American Express as their Credit Card Provider *and* made a purchase above $95 ?**
ecom[(ecom['CC Provider']=='American Express') & (ecom['Purchase Price']>95)].count()
# ** Hard: How many people have a credit card that expires in 2025? **
sum(ecom['CC Exp Date'].apply(lambda x: x[3:]) == '25')
# ** Hard: What are the top 5 most popular email providers/hosts (e.g. gmail.com, yahoo.com, etc...) **
ecom['Email'].apply(lambda x: x.split('@')[1]).value_counts().head(5)
```