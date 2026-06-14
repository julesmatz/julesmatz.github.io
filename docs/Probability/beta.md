# Beta random variable
A beta RV \(X\sim \text{Beta}(\alpha,\beta)\) has continuous outputs in interval $[0, 1]$.  
One of its use is in modelling the uncertainty in the probability $p$ of success in [Bernoulli](bernoulli.md) or [binomial](binomial.md) RV.  
So a yes/no uncertainty can be modelled as a Bernoulli RV with outcome in $\left\lbrace 0, 1\right\rbrace$ and parameterized by $p$, which can itself be considered uncertain and modelled as a beta random variable, $p\sim\text{Beta}(\alpha, \beta)$ with PDF

$$
\begin{align}
f(p) &= \frac{1}{\text{B}(\alpha,\beta)} p^{\alpha-1} (1-p)^{\beta-1} \\
&\propto p^{\alpha-1} (1-p)^{\beta-1}
\end{align}
$$

where $\text{B}(\alpha,\beta)$ is a normalization constant.

#### Expectation

$$
\mathbb{E}[X] = \frac{\alpha}{\alpha + \beta}
$$

#### Variance

$$
\mathbb{E}[X] = \frac{\alpha \beta}{\left(\alpha + \beta\right)^2\left(\alpha + \beta + 1\right)}
$$