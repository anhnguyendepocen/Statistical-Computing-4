---
title: 'Selected Topics in Numerical Methods'
author: 'Brandon Moretz'
date: '16th May 2020'
---  
  
  
#  Selected Topics in Numerical Methods
  
  
##  Curve Fitting
  
  
```julia
using LsqFit
using PyPlot
  
# preparing data for fitting
xdata = [ 15.2; 19.9;  2.2; 11.8; 12.1; 18.1; 11.8; 13.4; 11.5;  0.5;
          18.0; 10.2; 10.6; 13.8;  4.6;  3.8; 15.1; 15.1; 11.7;  4.2 ]
ydata = [ 0.73; 0.19; 1.54; 2.08; 0.84; 0.42; 1.77; 0.86; 1.95; 0.27;
          0.39; 1.39; 1.25; 0.76; 1.99; 1.53; 0.86; 0.52; 1.54; 1.05 ]
  
  
```
  
<img src="https://latex.codecogs.com/gif.latex?f(x)%20=%20&#x5C;beta_1(&#x5C;frac{x}{&#x5C;beta_2})^{&#x5C;beta_3-1}exp{(-(&#x5C;frac{x}{&#x5C;beta_2})^{&#x5C;beta_3})}"/>
  
```julia
  
function model(xdata, beta)
  values = similar(xdata)
  for i in 1:length(values)
    values[i] = beta[1] * ((xdata[i]/beta[2])^(beta[3]-1)) * (exp( - (xdata[i]/beta[2])^beta[3] ))
  end
  return values
end
  
```
  
Or, simply:
  
```julia
model(x,beta) = beta[1] * ((x/beta[2]).^(beta[3]-1)) .*
                          (exp( - (x/beta[2]).^beta[3] ))
```
  
```julia
fit = curve_fit(model, xdata, ydata, [3.0, 8.0, 3.0])
```
  
```julia
# defining a model
model(x,beta) = beta[1] * ((x/beta[2]).^(beta[3]-1)) .*
                          (exp.( - (x/beta[2]).^beta[3] ))
  
# run the curve fitting algorithm
fit = curve_fit(model, xdata, ydata, [3.0, 8.0, 3.0])
```
  
```julia
beta = fit.param
  
margin_error(fit)
```
  
```julia
# preparing the fitting evaluation
xfit = 0:0.1:20
yfit = model(xfit, fit.param)
  
# Plotting two datasets
plot(xdata, ydata, color="black", linewidth=2.0, marker="o",
  linecolor = :transparent, label = "data")
plot!(xfit, yfit, color="lightblue", linewidth=2.0,
  label = "model")
  
PyPlot.savefig("Operations Research\\03_model_fig.png")
```
  
![Image Test](03_model_fig.png )
  
##  Numerical Differentation
  
  
<img src="https://latex.codecogs.com/gif.latex?f&#x27;(x)%20=%20&#x5C;lim_{h%20-&gt;%20&#x5C;infty}&#x5C;frac{f(x%20+%20h)%20-%20f(x)}{h}"/>
  
...
  
<img src="https://latex.codecogs.com/gif.latex?f&#x27;(x)%20&#x5C;approx%20&#x5C;frac{f(x%20+%20h)%20-%20f(x)}{h}"/>
  
Forward finite approximation
  
<img src="https://latex.codecogs.com/gif.latex?f&#x27;(x)%20&#x5C;approx%20&#x5C;frac{f(x)%20-%20f(x%20-%20h)}{h}"/>
  
Central approximation
  
<img src="https://latex.codecogs.com/gif.latex?f&#x27;(x)%20&#x5C;approx%20&#x5C;frac{f(x%20+%20h)%20-%20f(x%20-%20h)}{2h}"/>
  