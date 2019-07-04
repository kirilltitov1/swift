import UIKit

class car {
    enum type_ {
        case passenger
        case truck
    }
    
    var type: type_
    var brend: String
    var color: String
    var amountOfDoors: Int
    
    init(type: type_, brend: String, color: String, amountOfDoors: Int) {
        self.type = type
        self.brend = brend
        self.color = color
        self.amountOfDoors = amountOfDoors
    }
}
