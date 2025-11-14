# Sliding Mode Control
Sliding mode control forces the state to attain (reaching
phase) and stay (sliding mode) on a hypersurface
of the state-space. This sliding manifold is defined as

$$
S = \left\lbrace x\in \mathbb{R}^n | s(x,t)=0 \right\rbrace
$$

Typically, the constraint $s(x,t)=0$ is designed to ensure the systems follows a reference signal.
\par Ressources used are \cite{khalil2002, shtessel2014, polito_ncaa, kunusch2012, Fridman2002}.

## First-order Sliding Mode Control
If $u$ appears in $\dot{s}$ (relative degree 1) linearly,
$$
\dot{s}=a(x,t) + b(x,t)u
$$
we can apply a first-order sliding mode control
$$
u = u_\text{eq} - k_1\text{sign}(s)
$$
##### Invariance of sliding mode (so it stays on surface)
To stay at $s(x,t)=0$ once it is reached, we should have $\dot{s}(x,t)=0$.  
From our nominal model of the system $\dot{s} = \hat{a}(x,t) + \hat{b}(x,t) u$, we deduce

$$
\begin{aligned}
\hat{a}(x,t) + \hat{b}(x,t) u_\text{eq} &= 0\\
u_\text{eq} &= -\frac{\hat{a}(x,t)}{\hat{b}(x,t)}
\end{aligned}
$$

##### Attractivness (so it reaches surface)
Adding a discontinous term $-k_1\text{sign}(s)$ leads to the system evolution
$$
\dot{s} = a(x,t) + b(x,t)\left(-\frac{\hat{a}(x,t)}{\hat{b}(x,t)} - k_1\text{sign}(s)\right)
$$
For a good model, the evolution is approximately $\dot{s}\approx-k_1\text{sign}(s)$ which (for a sufficiently large $k_1$) enforces attractiveness. Let's see why.  
Using candidate Lyapunov function $V=\frac{1}{2}s^2$, the sliding surface is reached in finite time if $V$ decreases sufficiently fast,
for any $k>0$,

$$
\begin{aligned}
\dot{V} &\leq -k\sqrt{V} \\
s\dot{s} &\leq -k |s| \\
\text{sign}(s) \dot{s} &\leq -k \label{eq:SMCattractiveness}
\end{aligned}
$$

which is satisfied for $k_1>k$, and a first-order discretization gives

- $s(t+\Delta t)=s(t)-\Delta t k_1$ if $s>0$
- $s(t+\Delta t)=s(t)+\Delta t k_1$ if $s<0$

ensuring the attractiveness of $s(x,t)=0$ in finite time.

##### Robustness to model uncertainty
Also, to be robust against model uncertainties,
$$
k_1 > \left|a- \frac{b}{\hat{b}}\hat{a}\right|
$$
High values of $k_1$ gives more robustness, at the cost of increased command activity (more energy consumption and possible chattering).

##### Smoothing the sign function
To avoid chattering, it is desirable to reduce $|\dot{s}|$ close to the sliding surface. It can be done by replacing $\text{sign}(s)$ with a sigmoid or high-slope saturation function such as 
$$
\text{sat}\left(\frac{s}{\epsilon}\right),\text{ with }\text{sat}(y)=\begin{cases}
y,&\text{if } |y| \leq 1 \\
\text{sign}(y),&\text{if } |y| > 1
\end{cases}
$$
The attractiveness is eventually lost and the state only reaches a neighborhood of $S$, leading to steady-state error.

If the system then only evolves in the linear part of the sigmoid, it amounts to a Proportional controller with $K_p = k_1$.


## Super Twisting Algorithm
STA again considers sliding surface with relative degree 1. It adds an integrator part,

$$
\begin{aligned}
u &= u_\text{eq}-\lambda\sqrt{|s|}\text{sign}(s) + u_1 \\
\dot{u}_1 &= -W\text{sign}(s)
\end{aligned}
$$

The discontinuity is now in $\dot{u}$ and is applied to $\ddot{s}$. Derivating a second time the sliding surface,

$$
\begin{aligned}
\dot{s} &= a(x,t) + b(x,t)u \\
\ddot{s} &= \underbrace{\dot{a}(x,t) + \dot{b}(x,t)u}_{\phi(x,u,t)} + \underbrace{b(x,t)}_{\gamma(x,t)}\dot{u}
\end{aligned}
$$

##### Attractiveness
Using bounds such that $\ddot{s}\in \left[-\Phi,\Phi\right] + \left[\Gamma_m,\Gamma_M\right]\dot{u}$
$$
|\phi(x,u,t)|\leq\Phi \qquad 0<\Gamma_m\leq\gamma(x,u,t)\leq\Gamma_M
$$
Attractivness is guaranteed (even for $u_\text{eq} = 0$) for sufficiently large $\lambda$ and $W$,
$$
W > \frac{\Phi}{\Gamma_m} \qquad
\lambda^2 > \frac{2}{\Gamma_m^2} \frac{(\Gamma_m W + \Phi)^2}{(\Gamma_m W - \Phi)}.
$$

##### Link to PI control
If sigmoids are used to dampen chattering, and the system eventually only evolves in the linear part, it almost amounts to a PI controller, with $K_p = \lambda$ and $K_i=W$. The only difference is the $\sqrt{|s|}$ term.


## Twising Controller
For sliding surface with relative degree 2,
$$
\ddot{s} = \phi(x,t) + \gamma(x,t)\dot{u}
$$
The Twisting controller is
$$
u = -\left(r_1 \text{sign}(s) + r_2 \text{sign}(\dot{s})\right)
$$
with $r_1, r_2>0$.
##### Attractiveness
$u$ appears in the second derivative of the sliding surface,
$$
\ddot{s} = \phi(x,t) + \gamma(x,t)u
$$
Using bounds such that $\ddot{s}\in \left[-\Phi,\Phi\right] + \left[\Gamma_m,\Gamma_M\right]u$
$$
|\phi(x,t)|\leq\Phi \qquad 0<\Gamma_m\leq\gamma(x,t)\leq\Gamma_M
$$
$s=0$ and $\dot{s}=0$ are reached in finite time if the following equations are satisfied,

$$
\begin{aligned}
(r_1 + r_2)K_m-C &> (r_1-r_2) K_M + C \\
(r_1-r_2)K_m>C
\end{aligned}
$$

Although in practice values of $r_1$ and $r_2$ are mostly obtained from simulation experiments