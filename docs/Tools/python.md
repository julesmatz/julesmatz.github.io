# Python

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

## Copying containers
**Assignement operator** for containers `a = b` creates a *reference* (pointer) to the object `b` in memory. Modifying values in `a` modifies `b`.  
**Shallow copy** `a = b.copy()` for standard containers or `np.copy(b)` for numpy arrays. Does not copy nested objects (they are still referenced to by pointers). Faster than deep copy.  
**Deep copy** using `import copy` and then `a=copy.deepcopy(b)` to entirely copy objects with its nested objects.

## Loop over containers
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


