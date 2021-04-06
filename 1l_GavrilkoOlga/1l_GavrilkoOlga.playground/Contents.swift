import Foundation

//  Задача 1
print("Задача 1")

let a = 1.0
let b = 4.0
let c = 2.0

let discriminant = b * b - 4 * a * c

if discriminant < 0 {
    print("Корней нет")
} else if discriminant == 0 {
    let x = -b / (2 * a)
    print("x = \(x)")
} else if discriminant > 0 {
    let x1 = (-b + (discriminant.squareRoot())) / (2 * a)
    let x2 = (-b - (discriminant.squareRoot())) / (2 * a)
    print("x1 = \(x1)", "x2 = \(x2)")
}

//  Задача 2
print("\nЗадача 2")

let cathetus1 = 5.0
let cathetus2 = 10.0

let square = cathetus1 * cathetus2 / 2
let hypotenuse = (cathetus1 * cathetus1 + cathetus2 * cathetus2).squareRoot()
let perimeter = cathetus1 + cathetus2 + hypotenuse

print("S = \(square)")
print("Hypotenuse = \(hypotenuse)")
print("P = \(perimeter)")

//  Задача 3
print("\nЗадача 3")

let deposit = 1000.0
let percent = 10.0
let years = 5

var result = deposit

for _ in 1...years {
    result += result * (percent / 100.0)
}

print(result)
