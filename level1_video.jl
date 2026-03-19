
println("Привет")
#%%
my_answer = 42
typeof(my_answer)

my_pi = 3.14159
typeof(my_pi)

my_name = "Юлия"
typeof(my_name)

my_answer = my_name
typeof(my_answer)

#= 
Я не понимаю разницу между #%% и ## 
для создания блоков
=#
##
sum = 3 + 7
difference = 10 - 3
product = 20 * 5
quotient = 100 / 10
power = 10 ^ 2
modulus = 101 % 2

##
s1 = "Я строка"
s2 = """Я тоже строка"""
println(s1)
println(s2)
s4 = """ "И я строка" """
println(s4)

##
name = "Юля"
num_fingers = 10
num_toes = 10
println("Привет, меня зовут $name.
У меня $num_fingers пальцев на руках и $num_toes на ногах. Всего $(num_fingers + num_toes)!") 

##
println(string("Сколько времени? ", 23, ':', 14))
x = "Сколько времени? "
y = string(23, ':', 14)
println(x * y)
println("$x$y")

##
myphonebook = Dict("Jenny" => "867-5309", "Kitti" => "343-2345", "Kilti" => "343-2345", "Kitlti" => "343-2345")
myphonebook["Kramer"] = "555-FILK"
println(myphonebook)
println(myphonebook["Kramer"])
pop!(myphonebook, "Kramer")
println(myphonebook)
println(myphonebook[1])

##
a = ("cats", "penguins", "sugargliders")
println(a[1])
a[1] = "otters"

##
my_friends = ["Вика", "Алина", "Влад", "Никита"]
fibonacci = [1, 1, 2, 3, 5, 8, 13]
mix = [1, 3.4, "hi"]
my_friends[3]
my_friends[3] = "Боб"
println(my_friends)
push!(fibonacci, 21)
pop!(fibonacci)
println(fibonacci)
numbers = [[1, 2, 3], [4, 5], [6, 7, 8, 9]]

println(rand(4, 3))
println(rand(4, 3, 2))

##
n = 0
while n < 10
    n += 1
    println(n)
    
end

##
for n in 1:10
    println(n)
end

##
my_friends = ["Вика", "Алина", "Влад", "Никита"]

for friend in my_friends
    println(friend)
end

##
m, n = 5, 5
A = zeros(m, n)
B = zeros(m, n)

for i = 1:m 
    for j = 1:n 
        A[i,j] = i + j        
    end    
end
println(A)

for i in 1:m, j in 1:n 
    B[i,j] = i + j
end
println(B)

C = [i + j for i in 1:m, j in 1:n]
println(C)

for n in 1:10
    D = [i + j for i in 1:m, j in 1:n]
    display(D)
end

##
x = 3
y = 10

if x > y 
    println("x > y")
elseif y > x 
    println("x < y")
else
    println("x = y")
end

println(x > y ? "x" : "y")

(x > y) && println("x > y")
(x < y) && println("x < y")

##
function f(x)
    x^2
end

for i in 10:20
    println(f(i))
end

f2(x) = x^2
println(f2(42))

f3 = x -> x^2
println(f3(42))
sayhi = name -> println("hi, $name nice to meet you")
sayhi("Julia")
sayhi(5559572)


##
A = rand(3, 3)
f(A)
v = rand(3)
println(v)
#f(v)
println(sort(v))
println(v)
println(sort!(v))
println(v)

##
A = [i + 3*j for j in 0:2, i in 1:3]
println(f(A))
println(f.(A))

C = [1, 2, 3, 4]
D = C.^2

##
import Pkg
Pkg.add("Example")
using Example
hello("it's me")

##
Pkg.add("Colors")
using Colors
palette = distinguishable_colors(100)
rand(palette, 3, 3)

##
using Plots
x = -3:0.1:3
f(x) = x^2
y = f.(x)
gr()
plot(x, y, label = "line")
scatter!(x, y, label="points")

##
globaltemperatures = [14.1, 14.6, 14.9, 15.4, 15.6, 15.8]
numirates = [45000, 20000, 15000, 5000, 400, 17]

plot(numirates, globaltemperatures, legend=false)
scatter!(numirates, globaltemperatures, legend=false)
xflip!()
xlabel!("Approximate")
ylabel!("Температура[C]")
title!("influence")

##
p1 = plot(x, x)
p2 = plot(x, x.^2)
p3 = plot(x, x.^3)
p4 = plot(x, x.^4)

plot(p1, p2, p3, p4, layout = (2, 2), length = false)

##
methods(+) #все существующие методы для функции +
@which 3 + 3 #смотрим, какой метод вызывается
@which 3.0 + 3.0
@which 3.0 + 3

#добавляем новый метод к существующей функции +
import Base: +
+(x::String, y::String) = string(x, y)
"hello" + " word"
@which "hello" + " word"

foo(x, y) = println("никакой тип не подошел")
foo(x::Int, y::Float64) = println("x - int, y - float")
foo(x::Float64, y::Float64) = println("x, y - float")
foo(x::Int, y::Int) = println("x, y - int")
foo(x::String, y::String) = println("x, y - string")

foo(1, 1)
foo(2, 2.2) 
foo(3., 3.)
foo(true, false)
foo("xy", "xy")

##
A = rand(1:4, 3, 3)
B = A
C = copy(A)
[B C]
A[1] = 17
println(A)
[B C]
x = ones(3)
b = A*x
Asym = A + A'
A'
Apd = A'A
A\b
Atall = A[:, 1:2]
display(Atall)
Atall\b
A = randn(3, 3)
[A[:, 1] A[:, 1]] \ b 
Ashort = A[1:2, :]
Ashort \ b[1:2]