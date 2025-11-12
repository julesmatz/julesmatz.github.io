# Sliding Mode Control
Sliding mode control forces the state to attain (reaching
phase) and stay (sliding mode) on a hypersurface
of the state-space. This sliding manifold is defined as
$$
S = \left\lbrace x\in \mathbb{R}^n | s(x,t)=0 \right\rbrace
$$
Typically, the constraint \(s(x,t)=0\) is designed to ensure the systems follows a reference signal.
\par Ressources used are \cite{khalil2002, shtessel2014, polito_ncaa, kunusch2012, Fridman2002}.

## First-order Sliding Mode Control (SMC)
If \(u\) appears in \(\dot{s}\) (relative degree 1) in a linear fashion, \(\dot{s}=a(x,t) + b(x,t)u\)  
and we have a nominal model of our system \(\dot{s} = \hat{a}(x,t) + \hat{b}(x,t) u\)  
we can apply a first-order sliding mode control
$$
u = u_\text{eq} - k_1\text{sign}(s)
$$
##### Invariance of sliding mode (so it stays on surface)
To stay at \(s(x,t)=0\) once it is reached, we should have \(\dot{s}(x,t)=0\)

$$
\begin{aligned}
\hat{a}(x,t) + \hat{b}(x,t) u_\text{eq} &= 0\\
u_\text{eq} &= -\frac{\hat{a}(x,t)}{\hat{b}(x,t)}
\end{aligned}
$$
##### Attractivness (so it reaches surface)
Adding a discontinous term \(-k_1\text{sign}(s)\) leads to the system evolution
$$
\dot{s} = a(x,t) + b(x,t)\left(-\frac{\hat{a}(x,t)}{\hat{b}(x,t)} - k_1\text{sign}(s)\right)
$$
which for a sufficiently good model (\(\hat{a}\approx a\), \(\hat{b}\approx b\)) gives \(\dot{s}\approx-k_1\text{sign}(s)\)  
Choosing a sufficiently high value \(k_1\) enforces the attractiveness of the sliding surface.  
Using candidate Lyapunov function \(V=\frac{1}{2}s^2\), the sliding surface is reached in finite time if \(V\) decreases sufficiently fast,
For any \(k>0\),

$$
\begin{aligned}
\dot{V} &\leq -k\sqrt{V} \\
s\dot{s} &\leq -k |s| \\
\text{sign}(s) \dot{s} &\leq -k \label{eq:SMCattractiveness}
\end{aligned}
$$

which is satisfied for \(k_1>k\), and a first-order discretization gives

- \(s(t+\Delta t)=s(t)-\Delta t k_1\) if \(s>0\)
- \(s(t+\Delta t)=s(t)+\Delta t k_1\) if \(s<0\)

ensuring the attractiveness of \(s(x,t)=0\) in finite time.

##### Robustness to model uncertainty
Also, to be robust against model uncertainties,
\( k_1 > \left|a- \frac{b}{\hat{b}}\hat{a}\right|\)  
High values of \(k_1\) gives more robustness, at the cost of increased command activity (more energy consumption and possible chattering).

##### Smoothing the sign function
To avoid chattering, it is desirable to reduce \(|\dot{s}|\) close to the sliding surface. It can be done by replacing \(\text{sign}(s)\) with a sigmoid or high-slope saturation function such as 
$$
\text{sat}\left(\frac{s}{\epsilon}\right),\text{ with }\text{sat}(y)=\begin{cases}
y,&\text{if } |y| \leq 1 \\
\text{sign}(y),&\text{if } |y| > 1
\end{cases}
$$
The attractiveness is eventually lost and the state only reaches a neighborhood of \(S\), leading to steady-state error.


## Super Twisting Algorithm (STA)
