# Kalman filter

## Model
Stochastic linear state-space model,

$$
\begin{aligned}
x_{k+1} &= A_d x_k + B_d u_k + Q\\
z_k &= H x_k + R
\end{aligned}
$$

- filtered state is \(\color{blue}{x_k\sim\mathcal{N}(m_k,P_k)}\)
- predicted state is \(\color{green}{x_k\sim\mathcal{N}(m_{k},P_{k})}\)
- output is \(z_k\sim\mathcal{N}(y_k,R)\)

<details>
<summary>Euler discretization for \(A_d\), \(B_d\)</summary>
Using Euler approximation,
$$
\begin{aligned}
\frac{\Delta x(t)}{\Delta t} &\approx Ax(t) + Bu(t) \\
\frac{x_{k+1}-x_k}{\Delta t} &= Ax_k + Bu_k\\
x_{k+1} &= \underbrace{x_k + \Delta t A x_k}_{A_d=(I+\Delta t A)} + \underbrace{\Delta t B}_{B_d} u_k
\end{aligned}
$$
</details>

## Equations
\(A_d\), \(B_d\), \(H\), \(Q\), \(R\) can be time-varying.

<details open>
<summary>Prediction</summary>
     $$
     \begin{aligned}
     \color{green}{m_{k+1}} &= A_d \color{blue}{m_k} + B_du_k \\
     \color{green}{P_{k+1}} &= A_d \color{blue}{P_k} A_d^\top + Q
     \end{aligned}
     $$
</details>

<details open>
<summary>Update</summary>
     $$
     \begin{aligned}
     S_k &= H \color{green}{P_k} H^\top + R \\
     K_k &= \color{green}{P_k} H^\top S_k^{-1} \\
     \color{blue}{m_k} &= \color{green}{m_k} + K_k (y_k - H \color{green}{m_k}) \\
     \color{blue}{P_k} &= (I - K_k H) \color{green}{P_k} 
     \end{aligned}
     $$
</details>

<details>
$$
\begin{aligned}
&\color{blue}{p(x|y)} = \frac{p(y|x)\color{green}{p(x)}}{p(y)} \\
&\propto \exp\left(-\frac{1}{2}(y-Hx)^\top R^{-1}(y-Hx)\right) \exp\left(-\frac{1}{2}(x-\color{green}{m})^\top \color{green}{P}^{-1}(x-\color{green}{m})\right) \\
&= \exp\left(-\frac{1}{2}\left( y^\top R^{-1}y-2x^\top H^\top R^{-1}y + x^\top H^\top R^{-1}Hx + x^\top \color{green}{P}^{-1}x-2x^\top \color{green}{P}^{-1}\color{green}{m} + \color{green}{m}^\top \color{green}{P}^{-1}\color{green}{m} \right)\right) \\
&= \exp\left(-\frac{1}{2}\left( x^\top(\underbrace{\color{green}{P}^{-1} + H^\top R^{-1}H}_{\color{blue}{P}^{-1}})x - 2x^\top (\underbrace{\color{green}{P}^{-1}\color{green}{m}+H^\top R^{-1}y}_{\color{blue}{P}^{-1}\color{blue}{m}}) + \ldots \right)\right)
\end{aligned}
$$
hence
$$
\begin{aligned}
\color{blue}{P} &= (\color{green}{P}^{-1}+H^\top R^{-1}H)^{-1} \\
&= P-\underbrace{\color{green}{P}H^\top (\underbrace{H\color{green}{P}H^\top+R}_{S})^{-1}}_{K = \color{green}{P}H^\top S^{-1}}H\color{green}{P}
\end{aligned}
$$
where the second line is obtained from the Woodbury identity, and
$$
\begin{aligned}
\color{blue}{m} &= \color{blue}{P} (\color{green}{P}^{-1}\color{green}{m} + H^\top R^{-1}y) \\
&= \left(\color{green}{P}-\color{green}{P}H^\top (H\color{green}{P}H^\top+R)^{-1}H\color{green}{P}\right) \left(\color{green}{P}^{-1}\color{green}{m} + H^\top R^{-1}y\right) \\
&= \left(\color{green}{P}-KH\color{green}{P}\right) \left(\color{green}{P}^{-1}\color{green}{m} + H^\top R^{-1}y\right) \\
&= \color{green}{m}
\end{aligned}
$$
</details>