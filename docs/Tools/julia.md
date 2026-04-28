# Julia

## Program structure
- **Include** read and evaluated a file (e.g. for splitting large scripts)
  ```julia
  include("my_file.jl")
  ```

- **Modules** are libraries, loaded once and cached (Changes require restarting julia session)
  ```julia
  module MyModule
  export my_function, my_var

  my_var = 2.5

  function my_function()
      println("Hello from MyModule")
  end
  end
  ```
  ```julia
  using .MyModule
  my_function()
  a = my_var
  ```

- **Conditional** execution
  ```julia
  if condition
    # ...
  elseif other_condition
    # ...
  else
    # ...
  end
  ```

- **Ternary** operator
  ```julia
  result = condition ? value_if_true : value_if_false
  ```


---
## Functions
- **Typical function** with **positional arguments** separated by `,` and **default values** with `=`
  ```julia
  function my_function(arg1, arg2=1.0)
      r1 = arg1 + arg2
      r2 = r1 + arg2^2
      return r1, r2
  end
  ```

- **Suffix** `!` is a convention indicating a function that modifies its input
  ```julia
  sort!(arr) # Sorts `arr` in place
  plot!(p, [4, 5, 6])  # Plots onto existing plot `p`
  ```

- Short **single-line** functions:
  ```julia
  my_function(arg1, arg2) = arg1 + arg2
  ```

  - **anonymous functions**
  ```julia
  square = x -> x^2
  ```

- **Keyword Arguments** separated by `;`
  ```julia
  function greet(name; greeting="Hello")
      println("$greeting, $name!")
  end
  greet("Alice")              # "Hello, Alice!"
  greet("Bob", greeting="Hi") # "Hi, Bob!"
  ```

- **Varargs**
  ```julia
  function sum_all(args...)
      return sum(args)
  end
  sum_all(1, 2, 3) # 6
  ```
- **Broadcasting** applies the function to all elements of a container
  ```julia
  f.(X)
  ```

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

**Copy** containers with assignment operator, shallow copy and deep copy
```julia
b = a           # pointer to a (modifying b changes a)
b = copy(a)     # separate copy (does not copy nested objects)
b = deepcopy(a) # separate copy including copy of nested objects
```

**Loop** over array, tuples, sets to get

- **items**
  ```julia
  for item in my_array
      println(item)
  end
  ```

- **indices** and **items**
  ```julia
  for (index, value) in enumerate(my_array)
      println("Index $index: $value")
  end
  ```

- **items** from related **containers**
  ```julia
  for (name, length) in zip(names, lengths)
      println("Length of $name is $length m")
  end
  ```

Loop over dictionaries, to get **key**-**value** pairs
```julia
for (key, value) in my_dict
    println("$key: $value")
end
```

---
## Plot
- Typical plot
  ```julia
  using Plots
  plot(sin, 0, 2π)
  scatter!(rand(10), rand(10))
  ```

- Labels, title
  ```julia
  plot(sin, 0, 2π, label="sin(x)", color=:blue, linewidth=2)
  title!("My Plot")
  xlabel!("x")
  ylabel!("sin(x)")
  ```

- Multiple plots
  ```julia
  p1 = plot(sin, 0, 2π)
  p2 = plot(cos, 0, 2π)
  plot(p1, p2, layout=(2,1))
  ```

- 3D plot
  ```julia
  surface((x,y) -> x*y, -10:0.1:10, -10:0.1:10)
  ```

- Save
  ```julia
  savefig("my_plot.png")
  ```


