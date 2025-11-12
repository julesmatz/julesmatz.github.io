# Polynomial Chaos Expansion (PCE)

Consider a static model
$$
y=f(x_1,\ldots,x_m)
$$
where \(x_1,\ldots,x_m\) are random variables (uncertain, but distribution is time-invariant).

**PCE** approximates the output as a linear combination of the input random variables,
$$
y \approx \sum_{i=0}^P a_j \Psi_j(x_1, \ldots, x_m)
$$
where \( \{\Psi_j(x_1, \ldots, x_m)\} \) are a set of polynomials that are a basis for the output \(y\).  
Coefficients \(\{a_j\}\) are the coordinates of the approximation of distribution \(p(y)\) in this basis.

PCE is used for

- **Uncertainty Quantification** (UQ): given uncertainties on the inputs, compute the uncertainty on the output (mean, variance, and other moments are analytically obtained from the coefficients and polynomials).
- **Sensitivity Analysis** (SA): understand which inputs contribute to the uncertainty on the output (Sobol indices are analytically obtained from the coefficients and polynomials).

It is used for example in structural analysis where loads and material properties are uncertain and modelled as random variables.
