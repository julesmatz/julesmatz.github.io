# Polynomial Chaos Expansion (PCE)
**PCE** is used for **Uncertainty Quantification** (UQ, propagates inputs uncertainties on model output) and **Sensitivity Analysis** (SA, understand which inputs contribute to the output uncertainty).

**PCE** represents a **random variable** \(y\) **as a polynomial function of other random variables** \(x_1, \ldots, x_m\).

$$
y \approx \sum_{i=0}^P a_j \Psi_j(x_1, \ldots, x_m)
$$

An approximate distribution of \(y\) is obtained and expressed in the basis formed by **orthogonal polynomials** \( \{\Psi_j(x_1, \ldots, x_m)\} \) with **coefficients** \(\{a_j\}\) as coordinates.

