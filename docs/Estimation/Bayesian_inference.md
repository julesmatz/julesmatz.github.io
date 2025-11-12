# Bayesian inference

## Bayes' theorem
Obtained from the relation between conditional and joint probabilites.
<details>
<summary>Events \(A\) and \(B\)</summary>
$$
\mathbb{P}(A|B) \mathbb{P}(B) = \mathbb{P}(A,B) = \mathbb{P}(B|A) \mathbb{P}(A)
$$
$$
\mathbb{P}(A|B) = \frac{\mathbb{P}(B|A)\mathbb{P}(A)}{\mathbb{P}(A)}
$$
</details>

<details>
<summary>Discrete random variables \(X\) and \(Y\)</summary>
$$
p(X=x|Y=y) p(Y=y) = p(\lbrace X=x\rbrace ,\lbrace Y=y\rbrace) = p(Y=y|X=x) p(X=x)
$$
$$
p(X=x|Y=y) = \frac{p(Y=y|X=x) p(X=x)}{p(Y=y)}
$$
</details>

<details open>
<summary>Continuous random variables \(X\) and \(Y\)</summary>
$$
p_{X|Y}(x|y) p_Y(y) = p_{X,Y}(x,y) = p_{Y|X}(y|x) p_X(x)
$$
Omitting the subscript notation for the random variable,
$$
p(x|y) p(y) = p(x,y) = p(y|x) p(x)
$$
Bayes' theorem is
$$
p(x|y) = \frac{p(y|x) p(x)}{p(y)}
$$
</details>
The rest of this note only deals with continuous random variables. 




## Recursive Bayesian inference for parameter estimation
With prior distribution \(p(\theta)\), measurement model \(p(y|\theta)\) and measurements \(y_{1:N}\), the estimation for model parameter \(\theta\) is
$$
p(\theta|y_{1:N}) = \frac{p(y_{1:N}|\theta) p(\theta)}{p(y_{1:N})}
$$
As measurements are typically received successively, the posterior of one instant becomes the prior of the next.

$$
\begin{aligned}
p(\theta|y_1) &= \frac{p(y_1|\theta)p(\theta)}{p(y_1)} \\
p(\theta|y_{1:2}) &= \frac{p(y_2|\theta)p(\theta|y_1)}{p(y_2)} \\
&\ldots
\end{aligned}
$$

Thus we are interested in 
$$
p(\theta|y) = \frac{p(y|\theta)p(\theta)}{p(y)}
$$
The denominator is only a normalizing constant so the PDF integrates to 1.

We can either

- compute the denominator, by _integrating out_ over \(\theta\),
$$
p(y) = \int p(y|\theta)p(\theta)d\theta
$$

- discard the denominator, if working with a quantity only proportionnal to \(p(\theta|y)\) is enough,
$$
p(\theta|y) \propto p(y|\theta) p(\theta)
$$
