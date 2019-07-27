import Foundation

enum Error_: String, Error {
    case divByZero = "Деление на ноль"
    case outOfRange = "Выход за границы"
    case arrIsClean = "Массив пуст"
}


class nums {
    var arr: [Double] = []
    
    func division(a: Double, b: Double) throws -> Double {
        guard b != 0 else {
            throw Error_.divByZero
        }
        return a/b
    }
    init(arr: [Double]) {
        self.arr = arr
    }
    func delparam(index: Int) throws {
        guard index < arr.count else {
            throw Error_.outOfRange
        }
        guard arr.count > 0 else {
            throw Error_.arrIsClean
        }
        arr.remove(at: index)
    }
}

var nums1 : nums = nums(arr: [15.0, 56.0, 0.0, 88.0])

do {
    try _ = nums1.division(a: nums1.arr[0], b: nums1.arr[2])
} catch  (let error as Error_) {
    print("\(error.rawValue)")
}

do {
    try nums1.delparam(index: 9)
} catch (let error as Error_) {
    print("\(error.rawValue)")
}

print(Error_.arrIsClean.rawValue)
