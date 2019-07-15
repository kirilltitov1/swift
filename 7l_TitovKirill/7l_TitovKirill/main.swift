import Foundation

enum Error_: Error {
    case divByZero
    case outOfRange
    case arrIsClean
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
} catch Error_.divByZero {
    print("Деление на ноль")
}

print()
