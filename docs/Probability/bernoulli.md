# Bernoulli random variable
A Bernoulli RV \(X\sim \mathcal{B}(p)\) has only two outcomes,

$$
\begin{cases}
P(X=1) &= p \\
P(X=0) &= q \qquad \text{where } q=1-p
\end{cases}
$$

Its PMF has various valid expressions (any function that outputs $p$ at $x=1$ and $1-p$ at $x=0$).  
The "exponential selector" form is generally used as it is very practical when applying Bayes' rule (exponents simply add up when multiplying),

$$
P(X=x) = p^x (1-p)^{1-x} \qquad \text{where } x\in\left\lbrace 0, 1\right\rbrace
$$

#### Expectation

$$
\mathbb{E}[X] = p\cdot 1 + (1-p)\cdot 0 = p
$$

#### Variance

$$
\begin{align}
\mathbb{V}[X] &= \mathbb{E}[X^2] - \mathbb{E}[X]^2 \\
&= (p\cdot 1^2 + (1-p)\cdot 0^2) - (p\cdot 1 + (1-p)\cdot 0)^2 \\
&= p - p^2 \\
&= p(1-p) \\
&= pq
\end{align}
$$

Maximum variance $\mathbb{V}[X]=0.25$ is obtained at $p=q=0.5$.