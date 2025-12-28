
using Plots

t = 0:0.01:10

m,k,c = 1, 1, 0.2
A = [0 1; -k/m -c/m]
lambda1, lambda2 = eigvals(A)
V = eigvecs(A)
v1 = V[:,1]
v2 = V[:,2]

a = 0.5
b = -0.555
c1 = a-b*im
c2 = a+b*im

# x = real(c1*exp.(lambda1*t)*v1[1] .+ c2*exp.(lambda2*t)*v2[1])
# v = real(c1*exp.(lambda1*t)*v1[2] .+ c2*exp.(lambda2*t)*v2[2])

# elementwise operations for vectors
x = exp.(-0.1*t).*(2(a*cos.(0.99*t).-b*sin.(0.99*t)))
v = exp.(-0.1*t).*(-0.2*(a*cos.(0.99*t).-b*sin.(0.99*t)).-1.98*(a*sin.(0.99*t).+b*cos.(0.99*t)))


# create two vertically stacked subplots
p1 = plot(t, x, label="x(t)", xlabel="", ylabel="position", legend=false)
p2 = plot(t, v, label="v(t)", xlabel="t", ylabel="velocity", legend=false)

p = plot(p1, p2, layout=(2,1), size=(400,300))
path_save = dirname(@__FILE__()) * "/img/mass_spring_damper_in_time.png"
savefig(path_save)
