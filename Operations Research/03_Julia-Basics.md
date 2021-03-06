---
title: 'Julia Basics'
author: 'Brandon Moretz'
date: '15th May 2020'
---  
  
  
#  Julia Basics
  
  
```julia
using LinearAlgebra;
  
```
##  Vector, Matrix, and Array
  
  
```julia
a = [1; 2; 3]
b = [4 5 6]
A = [1 2 3; 4 5 6]
  
A[1, 3]
A[2, 1]
```
  
```julia
transpose(A)
  
A'
```
  
Column Vectors:
  
```julia
a = [1; 2; 3]
c = [7; 8; 9]
  
a'*c
  
vec
```
  
Identity
  
```julia
Matrix(I, 3, 3)
```
  
```julia
zeros(4, 1)
  
zeros(2, 3)
  
ones(1, 3)
```
  
```julia
B = [1 3 2; 3 2 2; 1 1 1]
  
inv(B)
```
  
```julia
B * inv(B)
  
inv(B)[2, 1]
  
a = [1; 2; 3]
  
```
  
```julia
d = Array{Float64}(undef, 3)
print(d)
  
d[1] = 1
d[2] = 2
d[3] = 3
  
print(d)
```
  
```julia
p = Array{Float64}(undef, 3, 1)
q = Array{Float64}(undef, 1, 3)
  
display(p * q)
```
  
##  Tuples
  
  
```julia
pairs = Array{Tuple{Int64, Int64}}(undef, 3)
  
pairs[1] = (1, 2)
pairs[2] = (2, 3)
pairs[3] = (3, 4)
  
pairs
```
  
Same as:
  
```julia
pairs = [ (1, 2); (2, 3); (3, 4) ]
```
  
```julia
ijk_array = Array{Tuple{Int64, Int64, Int64}}(undef, 3)
  
ijk_array[1] = (1, 4, 2)
```
  
##  Indices and Ranges
  
  
```julia
a = [10; 20; 30; 40; 50; 60; 70; 80; 90]
  
a[1:3]
  
a[1:3:9]
  
a[end-2:end]
  
b = [200; 300; 400]
a[2:4] = b
a
  
c = collect(1:2:9)
```
  
```julia
A = [1 2 3; 4 5 6; 7 8 9]
  
A[:, 2]
  
A[:, 2:3]
  
A[3, :]
  
A[3, :]'
  
A[3:3, :]
  
A[2:3, :]
```
  
##  Printing Messages
  
  
```julia
println("Hello, World!")
```
  
```julia
a = 123.0
  
println("The value of a = ", a)
println("a is $a, and a-10 is $(a-10).")
```
  
```julia
b = [1; 3; 10]
println("b is $b")
  
using Printf
  
@printf("The %s of a = %f", "value", a)
  
c = [123.12345    ;
      10.983      ;
       1.9832132  ]
  
for i in 1:length(c)
  
      println("c[$i] = $(c[i])")
  
end
  
for i in 1:length(c)
  
      @printf("c[%d] = %7.3f\n", i, c[i])
end
  
str = @sprintf("The %s of a = %f", "value", a)
println(str)
```
  
##  Collections, Dictionary and For-Loop
  
  
```julia
for i in 1:5
      println("This is number $i.")
end
  
  
for i in 1:5
      if i >= 3
            break
      end
  
      println("This is number $i.")
end
  
```
  
```julia
  
s = 0
for i in 1:10
      global s += i
end
println(s)
  
```
  
```julia
my_keys = ["Zinedine Zidane", "Magic Johnson", "Yuna Kim"]
my_values = ["football", "basketball", "figure skating"]
  
d = Dict()
  
for i in 1:length(my_keys)
      d[my_keys[i]] = my_values[i]
end
  
display(d)
  
for (key, value) in d
      println("$key is a $value player.")
end
  
d["Diego Mardona"] = "football"
  
d
```
  
```julia
links = [ (1, 2), (3, 4), (4, 2) ]
link_costs = [ 5, 13, 8 ]
  
link_dict = Dict()
  
for i in 1:length(links)
      link_dict[ links[i] ] = link_costs[ i ]
end
  
link_dict
  
for (link, cost) in link_dict
      println("Link $link has cost of $cost.")
end
```
  
###  Functions
  
  
<img src="https://latex.codecogs.com/gif.latex?f(x,%20y)%20=%203x%20+%20y"/>
  
```julia
function f(x, y)
      return 3x + y
end
  
f(1, 3)
3 * ( f(3, 2) + f(5, 6) )
```
  
or
  
```julia
f(x, y) = 3x + y
  
f(1, 3)
```
  
```julia
function my_func(n, m)
      a = zeros(n , 1)
      b = ones(m, 1)
      return a, b
end
  
x, y = my_func(3, 2)
  
x
  
y
```
  
```julia
function f(x)
      return x+2
end
  
function g(x)
      return 3x+3
end
```
  
```julia
function f1(x)
      return x + a
end
  
a = 0
  
for i in 1:10
      global a = i
      println(f1(1))
end
```
  
```julia
function f2(x)
      a = 0
      return x+a
end
  
a = 5
println(f2(1))
println(a)
```
  
```julia
  
function f3(x)
      _a = 0
      return x + _a
end
  
a = 5
println(f3(1))
println(a)
```
  
```julia
function f4(x, a)
      return x + a
end
  
a = 5
println(f4(1, a))
println(a)
```
  
##  Random Number Generation
  
  
```julia
rand()
```
  
```julia
rand(5)
```
  
```julia
rand(4, 3)
```
  
```julia
rand() * 100
```
  
```julia
rand(1:10)
  
randn(2, 3)
```
  
```julia
using StatsFuns;
  
mu = 50; sigma = 3
  
normpdf(mu, sigma, 52)
  
normcdf(mu, sigma, 50)
  
norminvcdf(mu, sigma, 0.5)
```
  
##  File I/O
  
  
```julia
datafilename = "data.txt"
datafile = open(datafilename)
data = readlines(datafile)
close(datafile)
  
println(data)
```
  
```julia
outputfilename = "results1.txt"
outputfile = open(outputfilename, "w")
print(outputfile, "Majic Johnson")
println(outputfile, " is a basketball player.")
println(outputfile, "Michael Jordan is also a basketball player.")
close(outputfile)
```
  
```julia
outputfilename = "results2.txt"
outputfile = open(outputfilename, "a")
println(outputfile, "Yuna Kim is a figure skating player.")
close(outputfile)
```
  
```julia
using CSV; using DataFrames;
  
csvfilename = "data.csv"
csvdata = CSV.file(csvfilename) |> DataFrame!
  
csvdata
```
  
##  Plotting
  
  
```julia
using PyPlot
pygui(false)
# Preparing a figure object
fig = figure()
  
# Data
x = range(0, stop = 2*pi, length = 1000)
y = sin.(3*x)
  
# Plotting with linewidth and linestyle specified
plot(x, y, color="blue", linewidth=2.0, linestyle="--")
  
# Labeling the axes
xlabel(L"value of $x$")
ylabel(L"\sin(3x)")
  
# Title
title("Test plotting")
plt.show()
  
p = plot(x,y)
xlabel("X")
ylabel("Y")
PyPlot.title("Your Title Goes Here")
grid("on")
  
p = plot_date(x,y,linestyle="-",marker="None",label="Base Plot") # Basic line plot
```
  
```julia
using PyPlot
  
plot([1,2,3,4])
  
# Data
lower_bound = [4.0, 4.2, 4.4, 4.8, 4.9, 4.95, 4.99, 5.00]
upper_bound = [5.4, 5.3, 5.3, 5.2, 5.2, 5.15, 5.10, 5.05]
iter = 1:8
  
# Creating a new figure object
fig = figure()
  
# Plotting two datasets
plot(iter, lower_bound, color="red", linewidth=2.0, linestyle="-",
 marker="o", label=L"Lower Bound $Z^k_L$")
plot(iter, upper_bound, color="blue", linewidth=2.0, linestyle="-.",
 marker="D", label=L"Upper Bound $Z^k_U$")
  
# Labeling axes
xlabel(L"iteration clock $k$", fontsize="xx-large")
ylabel("objective function value", fontsize="xx-large")
  
# Putting the legend and determining the location
legend(loc="upper right", fontsize="x-large")
  
# Add grid lines
grid(color="#DDDDDD", linestyle="-", linewidth=1.0)
tick_params(axis="both", which="major", labelsize="x-large")
  
# Title
title("Lower and Upper Bounds")
  
# Save the figure as PNG and PDF
savefig("plot2.png")
savefig("plot2.pdf")
  
# Closing the figure object
close(fig)
```
  
```julia
using PyPlot
  
# Data
data = randn(100) # Some Random Data
nbins = 10        # Number of bins
  
# Creating a new figure object
fig = figure()
  
# Histogram
plt[:hist](data, nbins)
  
# Title
title("Histogram")
  
# Save the figure as PNG and PDF
savefig("plot3.png")
savefig("plot3.pdf")
  
# Closing the figure object
close(fig)
```
  
```julia
  
```
  