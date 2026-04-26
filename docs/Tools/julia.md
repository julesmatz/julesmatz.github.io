# Julia

---
## Containers
Julia is **1-indexed** (unlike Python).

- **Arrays**: *ordered*, *mutable*, and possibly multidimensional.  
Rows are separated by `;` and items in a row are separated by a space ` ` or `,`.
  ```julia
  my_array = [1, 2, 2, "a", "word"] # Heterogeneous array
  my_matrix = [1 2 3; 4 5 6]        # 2x3 matrix
  my_3d_array = zeros(Int, 2, 3, 4) # 3D array of zeros
  ```
  For numerical work, prefer **type-stable arrays** (e.g., `Int[...]`, `Float64[...]`) for performance. Array type is automatically detected.
  ```julia
  my_int64_array = [1, 2, 3]
  my_float64_array = [1.0 2 3]
  ```

- **Tuples**:  *ordered*, *immutable* items.
  ```julia
  my_tuple = (1, 2, 2, "a", "word")
  ```

- **Sets**: *unordered unique* items.
  ```julia
  my_set = Set([1, 2, "a", "word"])
  ```

- **Dictionaries**: *key-value pairs* (keys are unique and immutable)
```julia
my_dict = Dict("name" => "design_01",
               "point" => [1, 4, 3],
               "status" => 0)
my_dict["status"] = 1
```

### Copying Containers
**Assignment operator**, **shallow copy** and **deep copy** are
```julia
b = a           # pointer to a (modifying b changes a)
b = copy(a)     # separate copy of a (for arrays, sets, dicts)
b = deepcopy(a) # separate copy for objects with nested structure
```

### Loop Over Containers
For **arrays**, **tuples**, **sets**,

- get **items**
  ```julia
  for item in my_array
      println(item)
  end
  ```

- get **indices** and **items**
  ```julia
  for (index, value) in enumerate(my_array)
      println("Index $index: $value")
  end
  ```

- get **items** from related **containers**
  ```julia
  for (name, length) in zip(names, lengths)
      println("Length of $name is $length m")
  end
  ```

For **dictionaries**,
```julia
for (key, value) in my_dict
    println("$key: $value")
end
```


