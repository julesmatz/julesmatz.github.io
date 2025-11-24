# Models

A **mathematical model** uses equations to describe what can and cannot happen in a real system. It aims at representing how _manifest_ variables are linked (e.g. inputs-outputs). However, it is often necessary to introduce _latent_ variables (e.g. states, auxiliary variables) to build the model. These _latent_ variables are unobserable, or indirectly observable through the _manifest_ variables [^1].  

---

A model is a **structure** (how equations are arranged) and a set of **parameters**. It can be describes by some of its attributes:

- **Static / Dynamic**
    - A **static** model's output only depends on inputs through algebraic equations
    - A **dynamic** model's output depends on time through ODE, involving a history of states or inputs. It can be **time-invariant** or not.
- **Deterministic / Stochastic**
    - **Determistic** models: same input always produces the same output.
    - **Stochastic** models can consider uncertainties through:
        - Random variables (uncertain but time-invariant, e.g. material property, measurement noise).
        - Stochastic processes for random evolution (e.g. market price, turbulences).
- **Black / white / gray-box**
    - **Black-box** models are data-driven models obtained from input-output measurements (e.g. neural networks, Gaussian processes,  polynomial regression). Issues are extrapolation outside region of learning data, and overfitting.
    - **White-box** models are obtained from first principles (e.g. physics). Limitations are very large system (many components and interactions, possibly emerging behaviors), and highly complex ones (chaotic behavior, complex physical PDE equations). May be difficult to parameterize very large models, and may require heavy computations.
    - **Grey-box** models are in-between (e.g. MOR, semi-empirical, hybrid), so as to be:
        - **Consistent with physics**
        - **In accordance with data**
        - **Easy to parameterize**
        - **Cheap to evaluate**

[^1]:
     Willems, J. C., & Polderman, J. W. (1997). Introduction to mathematical systems theory: a behavioral approach (Vol. 26). Springer Science & Business Media.