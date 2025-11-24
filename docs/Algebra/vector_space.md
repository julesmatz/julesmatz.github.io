# Vector space
__Linear algebra__ is often introduced through the concept of __vector spaces__ (also called __linear spaces__), which provide a suitable general framework to work with systems of linear equations.

A vector space over a __field__ $F$ is a set $V$ equipped with addition and scalar multiplication, its elements are called __vectors__.  
The __field__ $F$ (usually $\mathbb{R}$ or $\mathbb{C}$) is a set on which addition, substraction, multiplication and division are well-defined operations, with its elements called __scalars__.  
If $F=\mathbb{R}$, $V$ is a __real vector space__, while for $F=\mathbb{C}$ it is a __complex vector space__.

A vector space must verify the following properties,  
$\forall u,v,w \in V, \forall a,b \in F$,

- associativity of addition  
$u+(v+w) = (u+v)+w$
- commutativity of addition  
$u+v=v+u$
- identity element of addition  
$\exists 0\in V \text{ s.t. } v+0=v$
- inverse element of addition  
$\exists -v\in V \text{ s.t. } v+(-v) = 0$
- compatibility of scalar mult with field mult  
$a(bv)=(ab)v$
- identity of scalar multiplication  
$1v=v$
- distributivity of scalar mult w.r.t. addition  
$a(u+v)=au+av$
- distributivity of scalar mult w.r.t. field addition  
$(a+b)v = av+bv$


A __linear combination__ of vectors $v_1,\ldots,v_k$ of $V$ is an element of the form $\sum_{i=1}^ka_iv_i$ with $a_1,\ldots,a_k\in F$.

Vectors $v_1,\ldots,v_k$ are __linearly independent__ if none of them is a linear combination of the others.

A __linear subspace__ (or __vector subspace__) $W$ of $V$ is a subset of $V$ that is closed under vector addition and scalar multiplication. That is, any linear combination of elements in $W$ is an element of $W$. A linear subspace is itself a vector space.

The __span__ of a vectors $v_1,\ldots,v_k\in V$ is the smallest linear subspace of $V$ that contains these vectors. It is the set of all linear combinations of $v_1,\ldots,v_k$.

A __basis__ is a set of linearly independent vectors that span the vector space.

The __dimension__ of $V$ is the cardinality of its bases (they all have the same).

The __coordinates__ of a vector $v$ expressed in a basis $(e_1,\ldots,e_n)$ are the scalars $a_1,\ldots,a_n$ such that vector $v$ is uniquely decomposed as $v=\sum_{i=1}^{n}a_ie_i$.

The $n$-tuple (ordered list of size $n$) $a=(a_1,\ldots,a_n)$ is also said to be a __coordinate vector__ , since $F^n$ is a vector space for componentwise addition and multiplication with dimension $n$. This vector space is an isomorphism of $V$, which allows translating reasoning on a vector $v\in V$ into reasoning and computations on its associated coordinate vector $a\in F^n$.

Vector spaces which also satisfy additional properties are for example __algebras__, __Lie agebras__, __topological vector space__, __Banach space__, __Hilbert space__. In particular, a Banach space is a vector space equipped with a norm, and a Hilbert space is a vector space equipped with an inner product (and thus also inducing a norm).
