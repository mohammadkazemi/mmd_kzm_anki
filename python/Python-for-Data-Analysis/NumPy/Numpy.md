## NumPy 
%
```python
# NumPy (or Numpy) is a Linear Algebra Library for Python, the reason it is so important for Data Science with Python is that almost all of the libraries in the PyData Ecosystem rely on NumPy as one of their main building blocks.
# 
# Numpy is also incredibly fast, as it has bindings to C libraries. For more info on why you would want to use Arrays instead of lists, check out this great [StackOverflow post](http://stackoverflow.com/questions/993984/why-numpy-instead-of-python-lists).
# 
# We will only learn the basics of NumPy, to get started we need to install it!
```
## Installation Instructions
%
```python
# **It is highly recommended you install Python using the Anaconda distribution to make sure all underlying dependencies (such as Linear Algebra libraries) all sync up with the use of a conda install. If you have Anaconda, install NumPy by going to your terminal or command prompt and typing:**
#     
#     conda install numpy
#     
# **If you do not have Anaconda and can not install it, please refer to [Numpy's official documentation on various installation instructions.](http://docs.scipy.org/doc/numpy-1.10.1/user/install.html)**
```
## Using NumPy
%
```python
# 
# Once you've installed NumPy you can import it as a library:
import numpy as np
```
## Numpy has many built-in functions and capabilities. We won't cover them all but instead we will focus on some of the most important aspects of Numpy: vectors,arrays,matrices, and number generation. Let's start by discussing arrays.
# 
# # Numpy Arrays
# 
# NumPy arrays are the main way we will use Numpy throughout the course. Numpy arrays essentially come in two flavors: vectors and matrices. Vectors are strictly 1-d arrays and matrices are 2-d (but you should note a matrix can still have only one row or one column).
# 
# Let's begin our introduction by exploring how to create NumPy arrays.
# 
#  Creating NumPy Arrays
# 
#  From a Python List
# 
# We can create an array by directly converting a list or list of lists:
%
```python
my_list = [1,2,3]
my_list
np.array(my_list)
my_matrix = [[1,2,3],[4,5,6],[7,8,9]]
my_matrix
np.array(my_matrix)
```
## Built-in Methods
# 
# There are lots of built-in ways to generate Arrays
#  arange
# 
# Return evenly spaced values within a given interval.
%
```python
np.arange(0,10)
np.arange(0,11,2)
```
## zeros and ones
# 
# Generate arrays of zeros or ones
%
```python
np.zeros(3)
np.zeros((5,5))
np.ones(3)
np.ones((3,3))
```
## linspace
# Return evenly spaced numbers over a specified interval.
%
```python
np.linspace(0,10,3)
np.linspace(0,10,50)
```
## eye
# 
# Creates an identity matrix
%
```python
np.eye(4)
```
## Random 
# 
# Numpy also has lots of ways to create random number arrays:
# 
## rand
# Create an array of the given shape and populate it with
# random samples from a uniform distribution
# over ``[0, 1)``.
%
```python
np.random.rand(2)
np.random.rand(5,5)
```
## randn
# 
# Return a sample (or samples) from the "standard normal" distribution. Unlike rand which is uniform:
%
```python
np.random.randn(2)
np.random.randn(5,5)
```
## randint
# Return random integers from `low` (inclusive) to `high` (exclusive).
%
```python
np.random.randint(1,100)
np.random.randint(1,100,10)
```
## Array Attributes and Methods
# 
# Let's discuss some useful attributes and methods or an array:
%
```python
arr = np.arange(25)
ranarr = np.random.randint(0,50,10)
arr
ranarr
```
## Reshape
# Returns an array containing the same data with a new shape.
%
```python
arr.reshape(5,5)
```
## max,min,argmax,argmin
# 
# These are useful methods for finding max or min values. Or to find their index locations using argmin or argmax
%
```python
ranarr
ranarr.max()
ranarr.argmax()
ranarr.min()
ranarr.argmin()
```
## Shape
# 
# Shape is an attribute that arrays have (not a method):
# Vector
%
```python
arr.shape
# Notice the two sets of brackets
arr.reshape(1,25)
arr.reshape(1,25).shape
arr.reshape(25,1)
arr.reshape(25,1).shape
```
## dtype
# 
# You can also grab the data type of the object in the array:
%
```python
arr.dtype
```
# ___
# 
# <a href='http://www.pieriandata.com'> <img src='../Pierian_Data_Logo.png' /></a>
# ___
# # NumPy Indexing and Selection
# 
# In this lecture we will discuss how to select elements or groups of elements from an array.
%
```python
import numpy as np
#Creating sample array
arr = np.arange(0,11)
#Show
arr
```
## Bracket Indexing and Selection
# The simplest way to pick one or some elements of an array looks very similar to python lists:
%
```python
#Get a value at an index
arr[8]
#Get values in a range
arr[1:5]
#Get values in a range
arr[0:5]
```
## Broadcasting
# 
# Numpy arrays differ from a normal Python list because of their ability to broadcast:
%
```python
# Setting a value with index range (Broadcasting)
arr[0:5]=100
# Show
arr
# Reset array, we'll see why I had to reset in  a moment
arr = np.arange(0,11)
#Show
arr
#Important notes on Slices
slice_of_arr = arr[0:6]
#Show slice
slice_of_arr
#Change Slice
slice_of_arr[:]=99
#Show Slice again
slice_of_arr
# Now note the changes also occur in our original array!
arr
# Data is not copied, it's a view of the original array! This avoids memory problems!
#To get a copy, need to be explicit
arr_copy = arr.copy()
arr_copy
```
## Indexing a 2D array (matrices)
# 
# The general format is **arr_2d[row][col]** or **arr_2d[row,col]**. I recommend usually using the comma notation for clarity.
%
```python
arr_2d = np.array(([5,10,15],[20,25,30],[35,40,45]))
#Show
arr_2d
#Indexing row
arr_2d[1]
# Format is arr_2d[row][col] or arr_2d[row,col]
# Getting individual element value
arr_2d[1][0]
# Getting individual element value
arr_2d[1,0]
# 2D array slicing
#Shape (2,2) from top right corner
arr_2d[:2,1:]
#Shape bottom row
arr_2d[2]
#Shape bottom row
arr_2d[2,:]
```
## Fancy Indexing
# 
# Fancy indexing allows you to select entire rows or columns out of order,to show this, let's quickly build out a numpy array:
%
```python
#Set up matrix
arr2d = np.zeros((10,10))
#Length of array
arr_length = arr2d.shape[1]
#Set up array
for i in range(arr_length):
    arr2d[i] = i
arr2d
# Fancy indexing allows the following
arr2d[[2,4,6,8]]
#Allows in any order
arr2d[[6,4,2,7]]
```
# More Indexing Help
# Indexing a 2d matrix can be a bit confusing at first, especially when you start to add in step size. Try google image searching NumPy indexing to fins useful images, like this one:
# 
# <img src= 'http://memory.osu.edu/classes/python/_images/numpy_indexing.png' width=500/>


## Selection
# 
# Let's briefly go over how to use brackets for selection based off of comparison operators.
%
```python
arr = np.arange(1,11)
arr
arr > 4
bool_arr = arr>4
bool_arr
arr[bool_arr]
arr[arr>2]
x = 2
arr[arr>x]
# 
# ___
# 
# <a href='http://www.pieriandata.com'> <img src='../Pierian_Data_Logo.png' /></a>
# ___
# # NumPy Operations
```
## Arithmetic
# 
# You can easily perform array with array arithmetic, or scalar with array arithmetic. Let's see some examples:
%
```python
import numpy as np
arr = np.arange(0,10)
arr + arr
arr * arr
arr - arr
# Warning on division by zero, but not an error!
# Just replaced with nan
arr/arr
# Also warning, but not an error instead infinity
1/arr
arr**3
```
## Universal Array Functions
# 
# Numpy comes with many [universal array functions](http://docs.scipy.org/doc/numpy/reference/ufuncs.html), which are essentially just mathematical operations you can use to perform the operation across the array. Let's show some common ones:
%
```python
#Taking Square Roots
np.sqrt(arr)
#Calcualting exponential (e^)
np.exp(arr)
np.max(arr) #same as arr.max()
np.sin(arr)
np.log(arr)
# 
# That's all we need to know for now!
# ___
# 
# <a href='http://www.pieriandata.com'> <img src='../Pierian_Data_Logo.png' /></a>
# ___
# # NumPy Exercises - Solutions
# 
# Now that we've learned about NumPy let's test your knowledge. We'll start off with a few simple tasks and then you'll be asked some more complicated questions.
```
## Import NumPy as np
%
```python
import numpy as np
```
## Create an array of 10 zeros 
%
```python
np.zeros(10)
```
## Create an array of 10 ones
%
```python
np.ones(10)
```
## Create an array of 10 fives
%
```python
np.ones(10) * 5
```
## Create an array of the integers from 10 to 50
%
```python
np.arange(10,51)
```
## Create an array of all the even integers from 10 to 50
%
```python
np.arange(10,51,2)
```
## Create a 3x3 matrix with values ranging from 0 to 8
%
```python
np.arange(9).reshape(3,3)
```
## Create a 3x3 identity matrix
%
```python
np.eye(3)
```
## Use NumPy to generate a random number between 0 and 1
%
```python
np.random.rand(1)
```
## Use NumPy to generate an array of 25 random numbers sampled from a standard normal distribution
%
```python
np.random.randn(25)
```
## Create the following matrix:
%
```python
np.arange(1,101).reshape(10,10) / 100
```
## Create an array of 20 linearly spaced points between 0 and 1:
%
```python
np.linspace(0,1,20)
```
## Numpy Indexing and Selection
# 
# Now you will be given a few matrices, and be asked to replicate the resulting matrix outputs:
%
```python
mat = np.arange(1,26).reshape(5,5)
mat
# WRITE CODE HERE THAT REPRODUCES THE OUTPUT OF THE CELL BELOW
# BE CAREFUL NOT TO RUN THE CELL BELOW, OTHERWISE YOU WON'T
# BE ABLE TO SEE THE OUTPUT ANY MORE
mat[2:,1:]
# WRITE CODE HERE THAT REPRODUCES THE OUTPUT OF THE CELL BELOW
# BE CAREFUL NOT TO RUN THE CELL BELOW, OTHERWISE YOU WON'T
# BE ABLE TO SEE THE OUTPUT ANY MORE
mat[3,4]
# WRITE CODE HERE THAT REPRODUCES THE OUTPUT OF THE CELL BELOW
# BE CAREFUL NOT TO RUN THE CELL BELOW, OTHERWISE YOU WON'T
# BE ABLE TO SEE THE OUTPUT ANY MORE
mat[:3,1:2]
# WRITE CODE HERE THAT REPRODUCES THE OUTPUT OF THE CELL BELOW
# BE CAREFUL NOT TO RUN THE CELL BELOW, OTHERWISE YOU WON'T
# BE ABLE TO SEE THE OUTPUT ANY MORE
mat[4,:]
# WRITE CODE HERE THAT REPRODUCES THE OUTPUT OF THE CELL BELOW
# BE CAREFUL NOT TO RUN THE CELL BELOW, OTHERWISE YOU WON'T
# BE ABLE TO SEE THE OUTPUT ANY MORE
mat[3:5,:]
```
## Get the sum of all the values in mat
%
```python
mat = np.arange(1,26).reshape(5,5)
mat
mat.sum()
```
## Get the standard deviation of the values in mat
%
```python
mat = np.arange(1,26).reshape(5,5)
mat
mat.std()
```
## Get the sum of all the columns in mat
%
```python
mat = np.arange(1,26).reshape(5,5)
mat
mat.sum(axis=0)
```