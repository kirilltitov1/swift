import UIKit

let S:Double = 500
let r: Double = 5.5
let ages: Int = 5
var Sn: Double = S

for i in 1...5
{
    Sn *= (1 + r / 100)
    print("\(NSString(format: "В %d-ом году сумма вклада будет равнаа %.2f\n", i, Sn))")
}
print()
