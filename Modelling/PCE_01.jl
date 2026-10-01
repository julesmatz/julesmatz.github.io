using Plots
using Polynomials
using QuadGK

# Define the function to approximate
f(x) = sin(x) + 0.1 * x^2

# Define the domain
x_min, x_max = -π, π

# Define the weight function for orthogonality (e.g., uniform weight)
weight(x) = 1.0

# Define the basis functions (Legendre polynomials)
function legendre_polynomial(n, x)
    if n == 0
        return 1.0
    elseif n == 1
        return x
    else
        P₀ = 1.0
        P₁ = x
        for k in 2:n
            Pₙ = ((2k - 1) * x * P₁ - (k - 1) * P₀) / k
            P₀, P₁ = P₁, Pₙ
        end
        return P₁
    end
end

# Compute the coefficients using Galerkin projection
function compute_coefficients(f, n_max, x_min, x_max)
    coefficients = zeros(n_max + 1)
    for n in 0:n_max
        integrand(x) = f(x) * legendre_polynomial(n, x) * weight(x)
        coefficients[n+1], _ = quadgk(integrand, x_min, x_max)
        norm_squared, _ = quadgk(x -> legendre_polynomial(n, x)^2 * weight(x), x_min, x_max)
        coefficients[n+1] /= norm_squared
    end
    return coefficients
end

# Approximate the function using polynomial chaos
function approximate_function(x, coefficients)
    result = 0.0
    for (i, c) in enumerate(coefficients)
        result += c * legendre_polynomial(i-1, x)
    end
    return result
end

# Parameters
n_max = 5  # Maximum degree of the polynomial

# Compute coefficients
coefficients = compute_coefficients(f, n_max, x_min, x_max)

# Generate points for plotting
x_vals = range(x_min, stop=x_max, length=1000)
y_true = f.(x_vals)
y_approx = approximate_function.(x_vals, Ref(coefficients))

# Plot the results
plot(x_vals, y_true, label="True Function", line=(2, :blue))
plot!(x_vals, y_approx, label="Polynomial Chaos Approximation", line=(2, :red, :dash))
plot!(title="Polynomial Chaos Approximation of f(x) = sin(x) + 0.1x²", 
      xlabel="x", ylabel="f(x)", legend=:topright)