import Foundation

//в си есть define для макроопределений препроцессора
let OK = 0
let IMPUT_ERROR = -1


// задание 1
print("Задача 1\nВведите число для проверки на четност:")
let num1: Int? = Int(readLine()!)
func parityCheckOn2(num: Int?) -> Bool {
    return num! % 2 == 0
}
if parityCheckOn2(num: num1) {
    print("Число \(num1!) является четным\n")
} else {
    print("Число \(num1!) является нечетным\n")
}


// задание 2
print("Задача 2\nВведите число для проверки на кратность 3")
let num2: Int? = Int(readLine()!)
func parityCheckOn3(num: Int?) -> Bool {
    return num! % 3 == 0
}
if parityCheckOn3(num: num2) {
    print("Число \(num2!) делится 3 без остатка\n")
} else {
    print("Число \(num2!) делится на 3 без остатка\n")
}


// задание 3
print("Задание 3\nУдалить из массива все четные числа и все числа, которые не делятся на 3")
//чем отличается это обьявленее от нижнего ? я про массивы
//var arr: [Int] = []
var arr: Array<Int> = []
func MakeArrOf100Elem( arr: inout [Int]) {
    for i in 0...99 {
        arr.append(i)
    }
}
MakeArrOf100Elem(arr: &arr)
print("Ваш массив \(arr)")


// задание 4
print("Задание 4\nВаш новый массив после удаления четных элементов и элементов не кратных 3")
func deleteAnyNums(arr: inout [Int]) {
    for (_, num) in arr.enumerated() {
        if num % 2 == 0 || num % 3 != 0 {
            arr.remove(at: arr.firstIndex(of: num)!)
        }
    }
}
deleteAnyNums(arr: &arr)
print("Ваш новый массив \(arr)")


//Задание 5
// я хотел хранить числа в 16-ричной но непонял как сделать это как хранить именно 16ричное чсило а не пользоваться преобразованием 0x ?

print("Задание 5\n")
var arr1: [UInt] = []
func addfibonacci(arr: inout [UInt]) {
    if arr.count == 0 {
        arr.append(0)
    } else if arr.count == 1 {
        arr.append(1)
    } else {
        arr.append(arr[arr.count - 1] + arr[arr.count - 2])
    }
}
for _ in 0...93 {
    addfibonacci(arr: &arr1)
}
print(arr1)


print("Задание 6\n")
var arr2: [UInt] = []
func makeSimpleNums(arr: inout [UInt], n: UInt) {
    for i in 2...n {
        arr.append(i)
    }
    var p = arr[0]
    
    var count = 0
    
    let rr = arr.count
    
    
    while true {
        for (_, value) in arr.enumerated() {
            if value % p == 0 && value != p{
                arr.remove(at: arr.firstIndex(of: value)!)
            }
        }
        count += 1
        if count == arr.count {
            break
        }
        p = arr[count]
    }
}
print("Введите длину n")
let n = UInt(readLine()!)

makeSimpleNums(arr: &arr2, n: n!)
print("Массив простых чисел \(arr2)")
