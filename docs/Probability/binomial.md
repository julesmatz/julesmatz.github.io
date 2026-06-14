# Binomial random variable
A binomial RV $X\sim\mathcal{B}(n,p)$ is the number of successes for $n$ [Bernoulli](bernoulli.md) trials.
Its PMF can be expressed as

$$
P(X=x) = \begin{pmatrix} n\\ x\end{pmatrix} p^x (1-p)^{1-x}
$$

with $\begin{pmatrix} n\\ x\end{pmatrix}$ the number of different arrangements for $x$ successes in $n$ trials ("$n$ choose $x$", "$x$ _parmi_ $n$").

#### Example
Take 3 trials, the probability of getting sequence 0-1-0 is $(1-p)\cdot p\cdot (1-p) = p^1(1-p)^{2}$  
Other arrangements lead to only 1 success: 0-0-1 and 1-0-0.  
The number of arrangements leading to only 1 success is indeed $\begin{pmatrix} n\\ 1\end{pmatrix} = 3$.  
The probability of only 1 success is thus $\begin{pmatrix} n\\ 1\end{pmatrix} p^1(1-p)^{2}$.

#### Limit as $n\to\infty$
When $p$ and $q$ are not too small, it tends to a normal distribution (it is one example of the central limit theorem),

$$
\lim\limits_{n\to\infty} \mathcal{B}(n,p) = \mathcal{N}\left(\mu=np, \sigma^2=np(1-p)\right)
$$

if $p$ or $q$ is small, it tends to a Poisson distribution

$$
\lim\limits_{n\to\infty} \mathcal{B}(n,p) = \frac{\lambda^k}{k!}e^{-\lambda} \quad \text{where } \lambda=np
$$

#### Expectation

$$
\mathbb{E}[X] = np
$$

#### Variance

$$
\mathbb{V}[X] = np(1-p)
$$