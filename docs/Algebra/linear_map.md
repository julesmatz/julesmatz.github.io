# Linear maps
A __linear map__ (fr: _application linéaire_) is a function $f:V\mapsto W$ preserving vector addition and scalar multiplication, that is,  
$\forall u,v\in V, \forall a \in F$,

- additivity $f(u+v)=f(u)+f(v)$
- homogeneity $f(av)=af(v)$

Thus a linear map preserves linear combinations,
$$
f\left(\sum_{i=1}^{k}a_iv_i\right) = \sum_{i=1}^{k}a_if(v_i)
$$
A few special cases: $f$ is a

- __linear isomorphism__ if it is a __bijection__ (one-to-one correspondance between elements in $V$ and $W$)
- __linear endomorphism__ if it maps to itself
- __linear automorphism__ if it is both of the above
