# Linear Dynamical Systems

In the case of **linear dynamical systems**, the differential operator \(\frac{d}{dt}\) is actually a linear transformation \(A\),
$$
\frac{d}{dt} x(t) = A x(t)
$$

<details>
<summary>ex. First order ODE</summary>
In the scalar case \(A=a\), we need a function \(x(t)\) whose derivative is proportionnal to itself.  
This is the definition of the exponential function,
$$
\frac{d}{dt} e^{\lambda t} = \lambda e^{\lambda t}
$$
\(e^{\lambda t}\) is an eigenfunction of the differential operator, with eigenvalue \(\lambda\).

$$
\frac{dx}{dt} = ax
$$
A solution has the form \(x(t)=e^{\lambda t}\),
$$
\begin{align}
\lambda e^{\lambda t} &= a e^{\lambda t} \\
\lambda &= a
\end{align}
$$
The final solution is scaled \(x(t) = ce^{at}\) with constant \(c\) to be determined from initial conditions.
</details>

For \(x(t)\in\mathbb{R}^n\), the solution is a linear combination of the eigenmodes (superposition principle).  
Eigenmodes are the solutions \(x(t)\) such that 
$$
\frac{d}{dt}x(t) = Ax(t) = \lambda x(t)
$$

Let us first look separately at eigenvectors of matrix \(A\), and eigenfunctions of operator \(\frac{d}{dt}\) on a single dimension.

- \(A\) has \(n\) eigenvectors \(v_i\),
$$
Av_i = \lambda_i v_i
$$
They are all the directions in which the application of \(A\) is equivalent to a scaling. It describes a spatial behavior (in the state-space).

- \(\frac{d}{dt}\) has eigenfunctions \(e^{\lambda t}\) (on a single dimension),
$$
\frac{d}{dt} e^{\lambda t} = \lambda e^{\lambda t}
$$
They are all the functions such that their derivative is proportionnal to their value (increasing for \(\lambda>0\), decreasing for \(\lambda<0\), oscillating for \(\mathfrak{Im}(\lambda)\neq 0\)). It describes a temporal behavior.

To find the solution for the trajectory \(x(t)\) in \(n\) dimensions, the eigendecomposition of \(\frac{d}{dt}\) is extended to multiple dimensions by applying it along each eigenvectors $v_i$ of \(A\). Eigenmodes are thus
$$
x(t) = e^{\lambda_i t}v_i
$$
and associated with eigenvalues \(\lambda_i\) such that
$$
\frac{d}{dt} \left(e^{\lambda_i t}v_i\right) = \lambda_i e^{\lambda_i t} v_i = e^{\lambda_i t} A v_i = A \left( e^{\lambda_i t} v_i \right)
$$

Eigenvectors of \(A\) provide the spatial structure of the solution, while eigenfunctions of \(\frac{d}{dt}\) provide the temporal behavior.

The final solution is a linear combination (superposition) of these \(n\) eigenmodes, 
$$
x(t) = \sum_{i=1}^n c_i e^{\lambda_i t}v_i
$$
with the complex coefficients \(c_i\) obtained from initial conditions and by restricting the solution to be real.

This is applied to an example in the [mass-spring-damper note](example_mass_spring_damper.md).






