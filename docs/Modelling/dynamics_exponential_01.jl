using Plots

# Define the function to plot
f(s,t) = exp(s * t)

# Generate values for t
t_values = range(0, stop=10, length=500)

# Compute the real and imaginary parts
s1 = -0.5 + im
s1label = "(-0.5+i)"
s1filename = "m05pit"
f1 = f.(s1, t_values)

# Plot the function in the complex plane
plot(real(f1), imag(f1),
     label="exp("*s1label*"t)",
     xlabel="Re",
     ylabel="Im",
     linewidth=2,
     color=:blue,
     legend=:topleft,
     aspect_ratio=:equal,
     size=(400, 200))

# Add the arrow
quiver!([real(f1[1])], [imag(f1[1])],
        quiver=([real(s1*f1[1])], [imag(s1*f1[1])]),
        color=:green,
        linewidth=2)
plot!([real(f1[1])], [imag(f1[1])], color=:green, label="v0 = "*s1label*"*p0")

# Save the plot
path_save = dirname(@__FILE__()) * "/img/exp_"*s1filename*"_julia.png"
savefig(path_save)
