import UIKit
import Foundation

print("Quadratic equation solution:")

let a: Double = -3
let b: Double = 4
let c: Double = 0

print("\(a)x² + \(b)x + \(c) = 0\n")

if a == 0
{
    if b == 0
    {
        if c == 0
        {
            print("Infinite number of solutions")
        }
        else
        {
            print("No solutions")
        }
    }
    else
    {
        // подставьте 0 4 0 поч получается отрицательный ноль ?
        // это как то связанно с машинным нулем ?
        print("Solution is x = \(NSString(format: "%.3f", -c / b))")
    }
}
else
{
    let D: Double = (b * b)-4 * a * c
    if D ==  0
    {
        print("x=\(NSString(format: "%.3f", -b / (2 * a)))")
    }
    else if D < 0
    {
        print("Solution belongs to the complex plane: \(NSString(format: "%.3f", (b/(2*a))))" +
              " ± \(NSString(format: "%.3f", -((b * b)-4 * a * c)/(2 * a)))i")
    }
    else
    {
        print("First answer = \(NSString(format: "%.3f", (-b + sqrt(D))/(2 * a)))")
        print("Second answer = \(NSString(format: "%.3f", (-b - sqrt(D))/(2 * a)))")
    }
}
