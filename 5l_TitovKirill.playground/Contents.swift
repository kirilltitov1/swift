import UIKit

enum sponsor_ {
    case RadBull
    case Tornado
}

protocol protocolCar {
    var color: String {get set}
    var sponsor: sponsor_ {get set}
    
    func takePassengers()
}


class car: protocolCar {
    
    var color: String
    var sponsor: sponsor_
    
    func takePassengers() {
        print("Пассажиры взяты")
    }
    
    init(color: String, sponsor: sponsor_) {
        self.color = color
        self.sponsor = sponsor
    }
}

extension car: CustomStringConvertible {
    var description: String {
        return "Цвет машины \(color)\nСпонсор \(sponsor)\n"
    }
}

var car1: car = car(color: "зеленый", sponsor: .RadBull)
print(car1.description)

extension car {
    func openWindows() {
        print("Окна открыты")
    }
    func closeWindows() {
        print("Окна закрыты")
    }
    func turnOnEngine() {
        print("Двигатель запущен")
    }
    func turnOffEngine() {
        print("Двигатель заглушен")
    }
}


class sportCar: protocolCar {
    var color: String
    var sponsor: sponsor_
    var amountOfTours: Int
    
    func takePassengers() {
        print("Пассажиры взяты")
    }
    
    init(color: String, sponsor: sponsor_, amountOfTours: Int) {
        self.color = color
        self.sponsor = sponsor
        self.amountOfTours = amountOfTours
    }
    
    
}
extension sportCar: CustomStringConvertible {
    var description: String {
        return "Цвет машины \(color)\nСпонсор \(sponsor)\nКол-во кругов \(amountOfTours)\n"
    }
}
    
var car2: sportCar = sportCar(color: "Черный", sponsor: .Tornado, amountOfTours: 9)
print(car2.description)

// вообще не знаю что может быть общего между цистерной и кдассической машиной ) поэтому пусть будут пассажиры ))))))
class trunkCar: protocolCar {
    var color: String
    var sponsor: sponsor_
    
    var volume: Int
    
    func takePassengers() {
        print("Пассажиры взяты")
    }
    
    init(color: String, sponsor: sponsor_, volume: Int) {
        self.color = color
        self.sponsor = sponsor
        self.volume = volume
    }
}
extension trunkCar: CustomStringConvertible {
    var description: String {
        return "Цвет машины \(color)\nСпонсор \(sponsor)\nОбьем цистерны \(volume) литров\n"
    }
}

var car3: trunkCar = trunkCar(color: "белая", sponsor: .RadBull, volume: 9000)
print(car3.description)
