using ControlSystems, Plots

# System parameters
m, k, c = 1.0, 1.0, 0.2

# State-space representation
A = [0 1; -k/m -c/m]
B = [0; 1/m]
C = [1 0]
D = 0
sys = ss(A, B, C, D)

# time, initial conditions, controller
t = 0:0.01:10
x0 = [1.0, 1.0]
u(x,t) = [0] # controller function must return a vector

# Simulation
result = lsim(sys, u, t, x0=x0)

# Plot
plot(result, plotu=false, plotx=false)

