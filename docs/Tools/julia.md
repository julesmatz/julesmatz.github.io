# Julia

---
## Containers
Julia is **1-indexed** (similar to Matlab but unlike Python’s 0-indexing).
**Arrays**
store *ordered* and *mutable* items (possibly multidimensional, replaces Python lists and np.array)
```julia
my_array = [1, 2, 2, "a", "word"] # Heterogeneous array
my_matrix = [1 2 3; 4 5 6] # 2x3 matrix
my_3d_array = zeros(Int, 2, 3, 4) # 3D array of zeros
```
For numerical work, prefer **type-stable arrays** (e.g., `Int[...]`, `Float64[...]`) for performance.
```julia
my_int_array = Int[1, 2, 3] # Homogeneous array (type-stable, faster)
```


**Tuples**
store *ordered* and *immutable* items
```julia
my_tuple = (1, 2, 2, "a", "word")
```

**Sets**
store *unordered unique* items
```julia
my_set = Set([1, 2, "a", "word"])
```

**Dictionaries**
store *key-value pairs* (keys are unique and immutable)
```julia
my_dict = Dict("name" => "design_01",
               "point" => [1, 4, 3],
               "status" => 0)
my_dict["status"] = 1
```

### Copying Containers
**Assignment operator** `a = b` creates a *reference* (pointer) to the object `b` in memory. Modifying `a` modifies `b`.  
**Shallow copy** for arrays, sets, dictionaries, `copy(a)`. Does not copy nested objects (they are still referenced to by pointers). Faster than deep copy.  
**Deep copy** `using Base: deepcopy` then `b = deepcopy(a)` to entirely copy objects with its nested objects.

### Loop Over Containers
```julia
# Get each item
for item in my_array_tuple_set
    println(item)
end
```
```julia
# Get each dictionary item
for (key, value) in my_dict
    println("$key: $value")
end
```
```julia
# Loop over multiple related containers
for (name, length) in zip(list_names, list_lengths)
    println("Length of $name is $length m")
end
```
```julia
# Get each index and item
for (index, value) in enumerate(my_array_tuple_set)
    println("Index $index: $value")
end
```

