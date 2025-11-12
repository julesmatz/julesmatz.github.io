# Bayesian inference for Gaussians
Considering
$$
p(\theta|y) = \frac{p(y|\theta)p(\theta)}{p(y)}
$$
with model \(p(y|\theta)\) and prior \(p(\theta)\) being Gaussian random variables.  
<details>
<summary> The posterior \(p(\theta|y)\) is also Gaussian if... </summary>
\(p(\theta|y)\) is Gaussian if the product \(p(y|\theta)p(\theta)\) is proportionnal to
$$
e^{-\frac{1}{2}\left(\theta^\top\Sigma^{-1}\theta - 2\theta^\top\Sigma^{-1}\mu + ...\right)}
$$
the last constant part in the exponential does not matter: it is partly used for completing the square so the exponential part is
$$
e^{-\frac{1}{2}(\theta-\mu)^\top\Sigma^{-1}(\theta-\mu)}
$$
and partly used to scale (since \(e^{x+c}=e^xe^c\)) the result so the final posterior distribution has a scaling factor (also taking into account \(p(y)\) ) that integrates to 1. It always does integrate to 1 because all probability density functions do.
</details>

<details open>
<summary>Example \(y=\theta + \epsilon\)</summary>
with measurement noise \(\epsilon=\mathcal{N}(0,\sigma_y^2)\) and a priori \(\theta\sim\mathcal{N}(\mu_0,\sigma_0^2)\), the posterior is proportional to a product of gaussians, itself proportional to another gaussian,
$$
\begin{aligned}
p(\theta|y) &\propto p(y|\theta)p(\theta) \\
&\propto \mathcal{N}(\mu_1,\sigma_1^2)
\end{aligned}
$$
$$
\begin{aligned}
\mu_1 &= \frac{1}{\frac{1}{\sigma_y^2} + \frac{1}{\sigma_0^2}} \left(\frac{y}{\sigma_y^2} + \frac{\mu_0}{\sigma_0^2}\right) \\
\sigma_1^2 &= \frac{1}{\frac{1}{\sigma_y^2} + \frac{1}{\sigma_0^2}}
\end{aligned}
$$
<details>
$$
\begin{aligned}
p(\theta|y) &\propto \exp\left(-\frac{1}{2}\frac{(y-\theta)^2}{\sigma_y^2}\right) \exp\left(-\frac{1}{2}\frac{(\theta-\mu_0)^2}{\sigma_0^2}\right) \\
&=\exp\left(-\frac{1}{2}\left(\frac{y^2-2y\theta+\theta^2}{\sigma_y^2}+\frac{\theta^2-2\theta\mu_0+\mu_0^2}{\sigma_0^2}\right)\right) \\
&= \exp\left(-\frac{1}{2}\left(\theta^2\underbrace{\left(\frac{1}{\sigma_y^2}+\frac{1}{\sigma_0^2}\right)}_{\frac{1}{\sigma_1^2}}-2\theta\underbrace{\left(\frac{y}{\sigma_y^2}+\frac{\mu_0}{\sigma_0^2}\right)}_{\frac{\mu_1}{\sigma_1^2}} + \ldots\right)\right)
\end{aligned}
$$
</details>
For the multivariate case, \(p(\theta|y) \propto \mathcal{N}(\mu_1,\Sigma_1)\) with
$$
\begin{aligned}
\mu_1 &=\left[\Sigma_y^{-1} + \Sigma_0^{-1}\right]^{-1} \left[\Sigma_y^{-1}y + \Sigma_0^{-1}\mu_0\right] \\
\Sigma_1 &= \left[\Sigma_y^{-1} + \Sigma_0^{-1}\right]^{-1}
\end{aligned}
$$
</details>


<details open>
<summary>Example \(y = X\theta + \epsilon \)</summary>
Consider having many measurement for the model \(y=\sum_{i=1}^m\theta_i f_i(u) + \epsilon\), for example
\begin{align}
\begin{pmatrix}
y_1 \\
\vdots \\
y_N
\end{pmatrix} &=
\begin{pmatrix}
u_1 & \sin(u_1) \\
\vdots & \vdots \\
u_N & \sin(u_N)
\end{pmatrix}
\begin{pmatrix}
\theta_1 \\
\theta_2
\end{pmatrix}
+\begin{pmatrix}
\epsilon_1 \\
\vdots \\
\epsilon_N
\end{pmatrix} \\
y &= X \theta + \epsilon
\end{align}
with measurement noise \(\epsilon_k=\mathcal{N}(0,\sigma_{y,k}^2)\), and independent measurements, so \(\Sigma_y=\text{diag}(\sigma_{y,1}^2,\ldots,\sigma_{y,N}^2)\). A priori is \(\theta\sim\mathcal{N}(\mu_0,\Sigma_0)\),
$$
p(\theta|y) \propto \mathcal{N}(\mu_1,\Sigma_1^2)
$$
$$
\begin{aligned}
\mu_1 &=\left[X^\top\Sigma_y^{-1}X + \Sigma_0^{-1}\right]^{-1} \left[X^\top\Sigma_y^{-1}y + \Sigma_0^{-1}\mu_0\right] \\
\Sigma_1 &= \left[X^\top\Sigma_y^{-1}X + \Sigma_0^{-1}\right]^{-1}
\end{aligned}
$$
<details>
$$
\begin{aligned}
p(\theta|y) &\propto \exp\left(-\frac{1}{2}(y-X\theta)^\top\Sigma_y^{-1}(y-X\theta)\right) \exp\left(-\frac{1}{2}(\theta-\mu_0)^\top\Sigma_0^{-1}(\theta-\mu_0)\right) \\
&=\exp\left(-\frac{1}{2}\left(y^\top\Sigma_y^{-1}y - 2\theta^\top X^\top\Sigma_y^{-1}y + \theta^\top X^\top\Sigma_y^{-1}X\theta + \theta^\top\Sigma_0^{-1}\theta - 2\theta^\top\Sigma_0^{-1}\mu_0 + \mu_0^\top\Sigma_0^{-1}\mu_0\right)\right) \\
&= \exp\left(-\frac{1}{2}\left(\theta^\top\underbrace{\left(X^\top \Sigma_y^{-1} X+\Sigma_0^{-1}\right)}_{\Sigma_1^{-1}}\theta - 2\theta^\top\underbrace{\left(X^\top \Sigma_y^{-1} y+\Sigma_0^{-1}\mu_0\right)}_{\Sigma^{-1}\mu_1}+\ldots\right)\right)
\end{aligned}
$$
</details>

</details>