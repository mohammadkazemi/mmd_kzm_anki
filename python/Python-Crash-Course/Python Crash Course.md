# Python Crash Course

## Data types : Numbers
```python
1 + 1 
# {{c1:2}}
1 * 3
# {{c1:3}}
1 / 2
# {{c1:0.5}}
# python power
2 {{c1:**}} 4
# 16
4 % 2
# {{c1:0}}
5 % 2
# {{c1:1}}
(2 + 3) * (5 + 5)
# {{c1:50}}
```
## Variable Assignment 
```python
# Can not start with number or special characters
name_of_var = 2
x = 2
y = 3
z = x + y
z
```
## Strings
```python
'single quotes'
"double quotes"
" wrap lot's of other quotes"
```
## Printing
```python
x = 'hello'
x
print(x)
num = 12
name = 'Sam'
print('My number is: {one}, and my name is: {two}'.format(one=num,two=name))
print('My number is: {}, and my name is: {}'.format(num,name))
```
## Lists
```python
[1,2,3]
['hi',1,[1,2]]
my_list = ['a','b','c']
my_list.append('d')
my_list
my_list[0]
my_list[1]
my_list[1:]
my_list[:1]
my_list[0] = 'NEW'
my_list
nest = [1,2,3,[4,5,['target']]]
nest[3]
nest[3][2]
nest[3][2][0]
```
## Dictionaries
```python
d = {'key1':'item1','key2':'item2'}
d
d['key1']
```
## Booleans
```python
True
False
```
## Tuples 
```python
t = (1,2,3)
t[0]
t[0] = 'NEW'
```
## Sets
```python
{1,2,3}
{1,2,3,1,2,1,2,3,3,3,3,2,2,2,1,1,2}
```
## Comparison Operators
```python
1 > 2
1 < 2
1 >= 1
1 <= 4
1 == 1
'hi' == 'bye'
```
## Logic Operators
```python
(1 > 2) and (2 < 3)
(1 > 2) or (2 < 3)
(1 == 2) or (2 == 3) or (4 == 4)
```
## if,elif, else Statements
```python
if 1 < 2:
    print('Yep!')
if 1 < 2:
    print('yep!')
if 1 < 2:
    print('first')
else:
    print('last')
if 1 > 2:
    print('first')
else:
    print('last')
if 1 == 2:
    print('first')
elif 3 == 3:
    print('middle')
else:
    print('Last')
```
## for Loops
```python
seq = [1,2,3,4,5]
for item in seq:
    print(item)
for item in seq:
    print('Yep')
for jelly in seq:
    print(jelly+jelly)
```
## while Loops
```python
i = 1
while i < 5:
    print('i is: {}'.format(i))
    i = i+1
```
## range()
```python
range(5)
for i in range(5):
    print(i)
list(range(5))
```
## list comprehension
```python
x = [1,2,3,4]
out = []
for item in x:
    out.append(item**2)
print(out)
[item**2 for item in x]
```
## functions
```python
def my_func(param1='default'):
    """
    Docstring goes here.
    """
    print(param1)
my_func
my_func()
my_func('new param')
my_func(param1='new param')
def square(x):
    return x**2
out = square(2)
print(out)
```
## lambda expressions
```python
def times2(var):
    return var*2
times2(2)
lambda var: var*2
```
## map and filter
```python
seq = [1,2,3,4,5]
map(times2,seq)
list(map(times2,seq))
list(map(lambda var: var*2,seq))
filter(lambda item: item%2 == 0,seq)
list(filter(lambda item: item%2 == 0,seq))
```
## methods
```python
st = 'hello my name is Sam'
st.lower()
st.upper()
st.split()
tweet = 'Go Sports! ##Sports'
tweet.split('##')
tweet.split('##')[1]
d
d.keys()
d.items()
lst = [1,2,3]
lst.pop()
lst
'x' in [1,2,3]
'x' in ['x','y','z']
```
## ** What is 7 to the power of 4?**
%
```python
7 **4
```
## ** Split this string:**
# 
#     s = "Hi there Sam!"
#     
# **into a list. **
%
```python
s = 'Hi there Sam!'
s.split()
```
## ** Given the variables:**
# 
#     planet = "Earth"
#     diameter = 12742
# 
# ** Use .format() to print the following string: **
# 
#     The diameter of Earth is 12742 kilometers.
%
```python
planet = "Earth"
diameter = 12742
print("The diameter of {} is {} kilometers.".format(planet,diameter))
```
## ** Given this nested list, use indexing to grab the word "hello" **
%
```python
lst = [1,2,[3,4],[5,[100,200,['hello']],23,11],1,7]
lst[3][1][2][0]
```
## ** Given this nest dictionary grab the word "hello". Be prepared, this will be annoying/tricky **
%
```python
d = {'k1':[1,2,3,{'tricky':['oh','man','inception',{'target':[1,2,3,'hello']}]}]}
d['k1'][3]['tricky'][3]['target'][3]
```
## ** What is the main difference between a tuple and a list? **
# Tuple is immutable
## ** Create a function that grabs the email website domain from a string in the form: **
# 
#     user@domain.com
#     
# **So for example, passing "user@domain.com" would return: domain.com**
%
```python
def domainGet(email):
    return email.split('@')[-1]
domainGet('user@domain.com')
```
## ** Create a basic function that returns True if the word 'dog' is contained in the input string. Don't worry about edge cases like a punctuation being attached to the word dog, but do account for capitalization. **
%
```python
def findDog(st):
    return 'dog' in st.lower().split()
findDog('Is there a dog here?')
```
## ** Create a function that counts the number of times the word "dog" occurs in a string. Again ignore edge cases. **
%
```python
def countDog(st):
    count = 0
    for word in st.lower().split():
        if word == 'dog':
            count += 1
    return count
countDog('This dog runs faster than the other dog dude!')
```
## ** Use lambda expressions and the filter() function to filter out words from a list that don't start with the letter 's'. For example:**
# 
#     seq = ['soup','dog','salad','cat','great']
# 
# **should be filtered down to:**
# 
#     ['soup','salad']
%
```python
seq = ['soup','dog','salad','cat','great']
list(filter(lambda word: word[0]=='s',seq))
```
## Final Problem
# **You are driving a little too fast, and a police officer stops you. Write a function
#   to return one of 3 possible results: "No ticket", "Small ticket", or "Big Ticket". 
#   If your speed is 60 or less, the result is "No Ticket". If speed is between 61 
#   and 80 inclusive, the result is "Small Ticket". If speed is 81 or more, the result is "Big    Ticket". Unless it is your birthday (encoded as a boolean value in the parameters of the function) -- on your birthday, your speed can be 5 higher in all 
#   cases. **
%
```python
def caught_speeding(speed, is_birthday):
    if is_birthday:
        speeding = speed - 5
    else:
        speeding = speed

    if speeding > 80:
        return 'Big Ticket'
    elif speeding > 60:
        return 'Small Ticket'
    else:
        return 'No Ticket'
caught_speeding(81,True)
caught_speeding(81,False)
```