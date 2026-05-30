# Python

---
## Virtual environments

Module `venv` creates virtual environments that are isolated python installations with their own python interpreter, packages, environment variables.
```bash
my_project/
├── venv/           # Virtual environment directory
│   ├── Include/
│   ├── bin/        # (Linux) or Scripts/ (Windows)
│   ├── lib/        # Python packages
│   └── pyvenv.cfg  # Configuration
└── requirements.txt
```
`venv/` should be added to `.gitignore`, recreate venv at every new install.  
File `requirements.txt` lists required packages,
```txt
mkdocs-material>=9.7.0
matplotlib>=3.5.0
```
Create, activate, install dependencies as
```bash
# Create virtual env
python -m venv path_to_myproject/venv/

# Activate/deactivate
source venv/bin/activate # Linux, for Windows: venv\Scripts\activate
deactivate               # both

# Install dependencies
pip install -r requirements.txt  # use when venv is active
```

---

## Core language
### Functions
```python
def my_function(a, b=0, /, *, c=0, d=0):
  # args before / are positional-only, after * keywords-only
  return a + b + c + d

result = my_function(5, 1, c=1, d=1) # 8
result = my_function(5)              # 5

# lambda function
fadd = lambda a, b : a * b
c = fadd(1, 2)

# example with built-in filter function
numbers = [1, 2, 3, 4, 5, 6, 7, 8]
odd_numbers = list(filter(lambda x: x % 2 != 0, numbers)) # [1 3 5 7]
```

### Containers
**Lists**
store *ordered* (accessed by index) and *mutable* (can be changed) items
```Python
my_list = [1, 2, 2, "a", "word"]
```

**Tuples**
store *ordered* and *immutable* (cannot be modified) items, faster than lists
```Python
my_tuple = (1, 2, 2, "a", "word")
```

**Sets**
store *unordered unique* (no duplicates) items
```Python
my_set = {1, 2, "a", "word"}
```

**Dictionaries**
store *key-value pairs* (keys are unique and immutable)
```Python
my_dict = {"name"  : "design_01",
           "point" : np.array([1, 4, 3]),
           "status": 0}
my_dict["status"] = 1
```

**NumPy Arrays**
store numerical (homogeneous) data efficiently
```
my_array = np.array([1, 2, 3], [5, 6, 7])
```

#### Copying containers
**Assignement operator** for containers `a = b` creates a *reference* (pointer) to the object `b` in memory. Modifying values in `a` modifies `b`.  
**Shallow copy** `a = b.copy()` for standard containers or `np.copy(b)` for numpy arrays. Does not copy nested objects (they are still referenced to by pointers). Faster than deep copy.  
**Deep copy** using `import copy` and then `a=copy.deepcopy(b)` to entirely copy objects with its nested objects.

#### Loop over containers
```Python
# get each item
for item in my_list_tuple_set_nparray:
    print(item)
```
```Python
# get each dictionary items
for key, value in my_dict.items():
    print(f"{key}: {value}")
```
```Python
# loop over multiple related containers
for name, length in zip(list_names, list_lengths):
    print(f"length of {name} is {length}m")
```
```Python
# get each index and item
for index, value in enumerate(my_list_tuple_set_nparray):
    print(f"Index {index}: {value}")
```

### List comprehension
```python
sq = [x**2 for x in range(10)]
sq_evens = [x for x in range(10) if x % 2 == 0] # with condition
```

### Unpacking
```python
a, b = [1, 2]
a, *rest = [1, 2, 3, 4] # rest = [2, 3, 4]

data = [(1, 2), (3, 4)]
for x, y in data: # implicit unpacking
    print(x, y)
```

---
## Libraries

### NumPy
```python
import numpy as np

v = np.array([1.0, 2])    # also np.zeros(3)
v1 = np.linspace(0, 1, 3) # 3 evenly spaced values in [0, 1]
v2 = np.arange(0, 1, 0.1) # values in [0, 1] with step 0.1

M = np.array([[1.0, 2], [3, 4]]) # also np.ones(2,2), np.identity(3)

v3 = v2 * 2 + np.sin(v2) # vectorized operations
product = M @ v          # matrix multiplication
eigenvalues, eigenvectors = np.linalg.eig(M)
print(eigenvalues)
```


### SciPy (+ matplotlib)
#### ODE
```python
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt
import numpy as np

def system(t, y, k, m): # m*x_ddot + k*x = 0
    x, xdot = y
    return [xdot, -k/m * x]

t_span = (0, 10)
t_eval = np.linspace(0, 10, 100) # requested output points (optional)
y0 = [1, 0] # p0, v0

k, m = 4, 1
sol1 = solve_ivp(system, t_span, y0, t_eval=t_eval, args=(k, m))
k, m = 8, 1
sol2 = solve_ivp(system, t_span, y0, t_eval=t_eval, args=(k, m))

plt.plot(sol1.t, sol1.y[0], label="model 1")
plt.plot(sol2.t, sol2.y[0], label="model 2")
plt.title("Mass-spring system")
plt.xlabel("Time")
plt.ylabel("Position")
plt.legend()
plt.grid()
plt.show()
```

#### ODE Variation using closure
```python
def make_system(k, m):
    def system(t, y):
        x, xdot = y
        return [xdot, -k/m * x]
    return system

system1 = make_system(4, 1)
sol1 = solve_ivp(system1, t_span, y0, t_eval=t_eval)
```

#### ODE Variation using class
```python
class MassSpring:
    def __init__(self, k, m):
        self.k = k
        self.m = m

    def system(self, t, y):
        x, xdot = y
        return [xdot, -self.k/self.m * x]

model1 = MassSpring(k=4, m=1)
sol1 = solve_ivp(model1.system, t_span, y0, t_eval=t_eval)
```

#### Filtering
```python
from scipy import signal

# Noisy signal
t = np.linspace(0, 1, 500)
signal_clean = np.sin(2*np.pi*5*t)
noise = np.random.normal(0, 0.5, t.shape) # mean 0, std 0.5
noisy = signal_clean + noise

# Low-pass filter
b, a = signal.butter(3, 0.1)
filtered = signal.filtfilt(b, a, noisy)
```

#### Optimization
```python
from scipy.optimize import minimize

f = lambda x: (x - 3)**2
result = minimize(f, x0=0)
print("Minimum at:", result.x)
```

### SymPy
```python
import sympy as sp

x = sp.symbols('x')

expr = x**2 + 2*x + 1
print(sp.factor(expr))       # simplification
print(sp.diff(expr, x))      # derivative
solution = sp.solve(expr, x) # solve equation
print(solution)
```

### Pandas
```python
import pandas as pd

data = {
    "time": [0, 1, 2],
    "velocity": [0, 9.8, 19.6],
    "validity": ["yes", "no", "yes"]
}
df = pd.DataFrame(data)

print(df.describe()) # also df.info(), df.head()
df["velocity"].mean()
df[(df["velocity"] > 5) & (df["validity"] == "yes")]
df.isnull().sum() # count missing values
df = df.fillna(0) # fill missing with 0
```