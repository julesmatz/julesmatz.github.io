# Polynomial Chaos Expansion (PCE)
**PCE** is used for **Uncertainty Quantification** (UQ, propagates inputs uncertainties on model output) and **Sensitivity Analysis** (SA, understand which inputs contribute to the output uncertainty).

**PCE** represents a **random variable** \(y\) **as a polynomial function of other random variables** \(x_1, \ldots, x_n\).

$$
y \approx \sum_{i=0}^M a_j \Psi_j(x_1, \ldots, x_n)
$$

An approximate distribution of \(y\) is obtained and expressed in the basis formed by **orthogonal polynomials** \( \{\Psi_j(x_1, \ldots, x_n)\} \) with **coefficients** \(\{a_j\}\) as coordinates.  
Truncating the polynomials at degree \(p\), we get \(M\) coefficients and basis polynomials, with

$$
M+1 = \frac{(n+p)!}{n!p!}
$$

For example, \((n=3, p=4) \implies M=34\), and \((n=10, p=4) \implies M=1000\) 

# Sobol decomposition
Consider a model \(y=f(x)~,x\in\left[0,1\right]^n\) (\(x\) in unit hypercube). It can be decomposed as

$$
f(x_1,\ldots,x_n) = f_0 + \sum_{i=1}^n f_i(x_i) + \sum_{1\leq i\leq j\leq n}f_{ij}(x_i,x_j) + \ldots + f_{12\ldots n}(x_1,x_2,\ldots,x_n)
$$

For example in dimension \(n=3\),

$$
\begin{aligned}
f(x_1, x_2, x_3) &= f_0 + f_1(x_1) + f_2(x_2) + f_3(x_3) \\
&\quad + f_{12}(x_1,x_2) + f_{13}(x_1,x_3) + f_{23}(x_2,x_3) \\
&\quad + f_{123}(x_1,x_2,x_3)
\end{aligned}
$$

Apart from \(f_0\), all functions integrate to 0 and are orthogonal to each other.  
They can be constructed as

$$
\begin{aligned}
f_0 &= \mathbb{E}\left[y\right] \\
&= \int_{\left[0,1\right]^n}f(x)dx \\
f_i(x_i) &= \mathbb{E}\left[y|x_i\right] - f_0 \\
&= \int_{\left[0,1\right]^{n-1}}f(x)dx_{\sim i} - f_0 \\
f_{ij}(x_i,x_j) &= \mathbb{E}\left[y|x_i,x_j\right] -f_i(x_i) - f_j(x_j) - f_0 \\
&= \int_{\left[0,1\right]^{n-2}}f(x)dx_{\sim \left\lbrace i,j \right\rbrace} - f_i(x_i) - f_j(x_j) - f_0
\end{aligned}
$$

where \(x_{\sim i}\) means \(x\) along all dimensions except the i-th one.
