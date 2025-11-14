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
## Containers
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

### Copying containers
**Assignement operator** for containers `a = b` creates a *reference* (pointer) to the object `b` in memory. Modifying values in `a` modifies `b`.  
**Shallow copy** `a = b.copy()` for standard containers or `np.copy(b)` for numpy arrays. Does not copy nested objects (they are still referenced to by pointers). Faster than deep copy.  
**Deep copy** using `import copy` and then `a=copy.deepcopy(b)` to entirely copy objects with its nested objects.

### Loop over containers
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

---
## Pandas

```python
import pandas as pd

# From dictionary
data = {'Name': ['Alice', 'Bob', 'Charlie'],
        'Age': [25, 30, 35],
        'City': ['NYC', 'London', 'Tokyo']}
df = pd.DataFrame(data)

# From CSV
df = pd.read_csv('filename.csv')
df.head()        # First 5 rows
df.tail(3)       # Last 3 rows  
df.shape         # (rows, columns)
df.columns       # Column names
df.info()        # Data types & memory

df['Name']              # Single column
df[['Name', 'Age']]     # Multiple columns
df.iloc[0]              # First row by position
df.loc[0, 'Name']       # Specific value

df[df['Age'] > 25]              # Age greater than 25
df[(df['City'] == 'NYC') & (df['Age'] < 30)]  # Multiple conditions

df['Salary'] = [50000, 60000, 70000]  # Add column
df = df.rename(columns={'City': 'Location'})  # Rename
df = df.drop('Age', axis=1)           # Remove column

df.describe()           # Summary statistics
df['Age'].mean()        # Average age
df['City'].value_counts()  # Count unique values
df.sort_values('Age')   # Sort by age

df.isnull().sum()       # Count missing values
df = df.dropna()        # Remove rows with missing values
df = df.fillna(0)       # Fill missing with 0
```


