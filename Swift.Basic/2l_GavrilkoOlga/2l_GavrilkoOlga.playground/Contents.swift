import Foundation

// MARK: - Задание 1
print("\nЗадание 1")

func isEven(_ value: Int) -> Bool {
    value % 2 == 0
}

let result = isEven(5)
print(result)

// MARK: - Задание 2
print("\nЗадание 2")

func isMultipleOf3(_ value: Int) -> Bool {
    value % 3 == 0
}

let result2 = isMultipleOf3(30)
print(result2)

// MARK: - Задание 3
print("\nЗадание 3")

var array: [Int] = []
var index = 0

for i in 1...100 {
    array.append(i)
}

print(array)

// MARK: - Задание 4
print("\nЗадание 4")

// 1-ый способ
let newArray = array.filter { $0 % 2 == 1 && $0 % 3 == 0 }
print(newArray)

// 2-ой способ
var newArray2: [Int] = []

for element in array {
    if element % 2 == 1 && element % 3 == 0 {
        newArray2.append(element)
    }
}

print(newArray2)

// MARK: - Задание 5
print("\nЗадание 5")

func generateNewElement(preLast: Int, last: Int) -> Int {
    preLast + last
}

var fibonacciSeries: [Int] = []

for index in 0..<50 {
    if index == 0 || index == 1 {
        fibonacciSeries.append(1)
        continue
    }
    let newElement = generateNewElement(
        preLast: fibonacciSeries[index - 2],
        last: fibonacciSeries[index - 1])
    fibonacciSeries.append(newElement)
}

print(fibonacciSeries)

// MARK: - Задание 6
print("\nЗадание 6")

var simpleArray: [Int] = []
var n = 2

func isNumberSimple(_ n: Double) -> Bool {

    if n == 2 || n == 3 {
        return true
    }

    let sqrt = Int((n.squareRoot()).rounded(.down))

    for i in 2...sqrt {
        if Int(n) % i != 0 {
            continue
        } else {
            return false
        }
    }
    return true
}

while simpleArray.count < 100 {

    if isNumberSimple(Double(n)) {
        simpleArray.append(n)
    }
    n += 1
}

print(simpleArray)
