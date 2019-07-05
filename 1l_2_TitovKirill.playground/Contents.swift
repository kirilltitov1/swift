import UIKit

let a: Double = 3.4
let b: Double = 4

print("Triangle area = \(NSString(format: "%.3g", (a*b/2)))")

let c: Double = sqrt(a*a + b*b)

print("Perimeter = \(NSString(format: "%.3g",(a + b + c)))")

print("Hypotenuse = \(NSString(format: "%.3g",c))")
