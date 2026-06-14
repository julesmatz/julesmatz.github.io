using Distributions, Plots, LinearAlgebra, Random

# create measurements
u = [pi/2; pi];
y = [sin(pi/2); sin(pi)];
u = [pi/2; pi];
y = [pi/2; pi];
u = [0.2; 0.4];
y = [sin(0.2); sin(0.4)];
Σ_y = diagm(0.2*ones(length(y)));

# A-priori
Σ_0 = diagm([10, 10]);
μ_0 = [0; 0];

# parameter estimation
X = stack([u, sin.(u)]);
Σ_1 = inv(X'*inv(Σ_y)*X + inv(Σ_0));
μ_1 = Σ_1 * (X'*inv(Σ_y)*y + inv(Σ_0)*μ_0);

# Confidence ellipse
# Compute square root of Σ
Λ,Q = eigen(Σ_1) # Σ = QΛ/Q
Σ_1_sqrt = Q*diagm(sqrt.(Λ))/Q;
θ = range(0, 2π, 100)';
circle = [cos.(θ); sin.(θ)];
ell_1σ = μ_1 .+ Σ_1_sqrt * circle;

# Generate random samples
samples = rand(MvNormal(μ_1, Σ_1_sqrt'*Σ_1_sqrt), 1000)

# Plot samples and ellipse
p1 = plot(title="Measurements", legend=:topright)
u_s= 0:0.01:2*pi;
for i in axes(samples,2)
    plot!(u_s, samples[1,i]*u_s + samples[2,i]*sin.(u_s), color=RGBA(0.5,0.5,0.5,0.1), label="")
end
scatter!(p1, u, y, yerr = diag(Σ_y), label="measurements", color="red", ms=2)
xlabel!(p1, "u")
ylabel!(p1, "y")
xlims!(0, pi+0.1)
ylims!(-1, pi+0.1)
# Plot samples and ellipse
p2 = plot(title="Parameter space", legend=:topright, aspect_ratio=:equal)
scatter!(p2, [μ_1[1]], [μ_1[2]], ms=1, mc=:blue, label="")
plot!(p2, ell_1σ[1,:], ell_1σ[2,:], label="", color=:blue)
xlabel!(p2, "θ_1")
ylabel!(p2, "θ_2")
ylims!(-3, 3)
plot(p1,p2, layout=(2,1))
# save image
#path_save = dirname(@__FILE__()) * "/img/param_estim_gaussian.png"
#savefig(path_save)
