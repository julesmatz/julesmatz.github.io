# Norm and inner product
#### Norm
A __norm__ for a vector space $V$ over a field $F$ is a real-valued function $\lVert \cdot\rVert:V\rightarrow \mathbb{R}$ generalizing the notion of distance with the properties,  
$\forall u,v\in V, \forall a \in F$,

- triangle inequality $\lVert u+v\rVert \leq \lVert u\rVert +\lVert v\rVert$
- homogeneity $\lVert av \rVert = | a | \lVert v \rVert$
- positive-definiteness $\lVert x\rVert =0\implies x=0$

#### Inner product
An __inner product__ for a vector space $V$ over a $F$ is a map $\langle\cdot,\cdot\rangle : V\times V \rightarrow F$. generalizing geometric notions such as __angles__ and __orthogonality__.
An inner product must satisfy the properties,  
$\forall u,v,w \in V, \forall a,b \in F$,

- conjugate symmetry $\langle u,v\rangle = \overline{\langle u,v \rangle}$  
(where $\overline{a}$ denotes the complex conjugate of $a$)
- linearity in the first argument  
$\langle au+bv,w\rangle = a\langle u,w \rangle + b\langle v,w \rangle$
- positive-definiteness if $v\neq 0$, $\langle v,v\rangle>0$  
(conjugate symmetry implies $\langle v,v \rangle \in \mathbb{R}$)

Note that an inner product induces a norm as 
$$
   \Vert v\Vert = \sqrt{\langle v,v \rangle}
$$
As such, Hilbert spaces (vector spaces with norm) are a subset of Banach spaces (vector spaces with inner product).

## Properties
In addition to the above properties of norms and inner products, the following also holds,

- angle $u,v \in V$ over $\mathbb{R}$, $\angle(u,v) = \arccos\frac{\langle u,v \rangle}{\lVert u\rVert \lVert v\rVert}$
- orthogonality $u\perp v \iff \langle u,v \rangle=0$
- Polarization identity  
$\lVert u+v\rVert^2=\lVert u\rVert^2+\lVert y\rVert^2+2\mathfrak{Re} \langle u,v \rangle$
- Pythagorean theorem $u\perp v$, then  
$$
\lVert u+v\rVert^2=\lVert u\rVert^2+\lVert v\rVert^2
$$
- Parseval's identity $v_1,\ldots,v_n$ pairwise orthogonal ($v_i\perp v_j \forall i\neq j \in \lbrace 1,\ldots,n\rbrace$), then  
$$
\left\lVert \sum_{i=1}^n v_i \right\rVert^2=\sum_{i=1}^{n}\lVert v_i\rVert^2
$$
- reverse triangle inequality $\lVert u\pm v\rVert \geq \left| \lVert u\rVert -\lVert v\rVert \right|$
- parallelogram law  
$\lVert u+v\rVert^2+\lVert u-v\rVert^2=2\lVert u\rVert^2+2\lVert u\rVert^2$

- Cauchy-Schwarz inequality $\left| \langle u,v \rangle \right| \leq \lVert u\rVert \lVert v\rVert$


## Examples
The set of real numbers $\mathbb{R}$ is a vector space over $\mathbb{R}$ with the inner product $\langle u,v \rangle = uv$.

The Euclidean space $\mathbb{R}^n$ over the field $\mathbb{R}$ has its inner products of the form
$$
\langle u,v \rangle = u^\top M v
$$
with $M$ a symmetric positive-definite matrix. The dot product $u^\top v$ is one particular inner product.

The space $C([x_a,x_b])$ of continuous complex valued functions on the interval $[x_a,x_b]$. Its inner product is
$$
\langle f,g \rangle = \int_{x_a}^{x_b} f(t) \overline{g(t)}dt
$$

space of $T$-periodic square-integrable ($L^2$) functions have the inner product
$$
\langle f,g\rangle = \frac{1}{T}\int_{-\frac{T}{2}}^{\frac{T}{2}}f(x)\overline{g(x)}dx.
$$

The set of random variables, in which the expected value of the product of two random variables $X$ and $Y$ defines an inner product,
$$
\langle X,Y \rangle = \mathbb{E}[X,Y]
$$

The set $\mathbb{C}^{n\times m}$ of complex matrices of same size, in which the Frobenius inner product is 
$$
\langle A,B \rangle _F = \text{tr}(AB^*)
$$
with $B^*$ the conjugate transpose (also called __adjoint matrix__) of $B$.
