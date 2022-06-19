## SciPy
# 
# SciPy is a collection of mathematical algorithms and convenience functions built on the Numpy extension of Python. It adds significant power to the interactive Python session by providing the user with high-level commands and classes for manipulating and visualizing data. With SciPy an interactive Python session becomes a data-processing and system-prototyping environment rivaling systems such as MATLAB, IDL, Octave, R-Lab, and SciLab.
# 
# The additional benefit of basing SciPy on Python is that this also makes a powerful programming language available for use in developing sophisticated programs and specialized applications. Scientific applications using SciPy benefit from the development of additional modules in numerous niches of the software landscape by developers across the world. 
# 
# Everything from parallel programming to web and data-base subroutines and classes have been made available to the Python programmer. All of this power is available in addition to the mathematical libraries in SciPy.
# 
# We'll focus a lot more on NumPy arrays, but let's show some of the capabilities of SciPy:
%
```python
import numpy as np
A = np.array([[1,2,3],[4,5,6],[7,8,8]])
```
## Linear Algebra
# **linalg**
%
```python
from scipy import linalg
```
# Determinant of a Matrix
# Compute the determinant of a matrix
%
```python
linalg.det(A)
```
# Compute pivoted LU decomposition of a matrix.
# 
# The decomposition is::
# 
#     A = P L U
# 
# where P is a permutation matrix, L lower triangular with unit
# diagonal elements, and U upper triangular.
%
```python
P, L, U = linalg.lu(A)
P
L
U
np.dot(L,U)
```
# We can find out the eigenvalues and eigenvectors of this matrix:
%
```python
EW, EV = linalg.eig(A)
EW
EV
```
# Solving systems of linear equations can also be done:
%
```python
v = np.array([[2],[3],[5]])
v
s = linalg.solve(A,v)
s
```
## Sparse Linear Algebra
# SciPy has some routines for computing with sparse and potentially very large matrices. The necessary tools are in the submodule scipy.sparse.
# 
# We make one example on how to construct a large matrix:
%
```python
from scipy import sparse
```
# Row-based linked list sparse matrix
%
```python
A = sparse.lil_matrix((1000, 1000))
A
A[0,:100] = np.random.rand(100)
A[1,100:200] = A[0,:100]
A.setdiag(np.random.rand(1000))
A
```
# **Linear Algebra for Sparse Matrices**
%
```python
from scipy.sparse import linalg
```
# Convert this matrix to Compressed Sparse Row format.
%
```python
A.tocsr()
A = A.tocsr()
b = np.random.rand(1000)
linalg.spsolve(A, b)
# There is a lot more that SciPy is capable of, such as Fourier Transforms, Bessel Functions, etc...
# 
# You can reference the Documentation for more details!
```