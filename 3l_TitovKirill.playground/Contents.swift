import UIKit


struct typeOfTransport {
    
    struct car {
        var brend: String = " "
        var machineYear: Int = 0
        var luggageCapacity: Int = 0
        var engineMode: Bool = false
        var trunkVolumeFilled: Int = 0
        var windowMode: Bool = false
        
//      тут я просто переопределяю структуру car после того как пользователь выберет действия
//      (30 мин спустя первой строчки) и я вообще в упор не понимаю зач вот эта функция пытался
//      я пытался придумать ей хоть какое то применение но че то не понимаю зач она вообще нужна
//      если я могу менять ее значение по адресу переменной
//      мб у вас есть какие то примерымиз вашего опыта где это вообще стоит применять ?
        mutating func refactorActions(newCharacteristics: typeOfTransport.car) {
            self.engineMode = newCharacteristics.engineMode
            self.trunkVolumeFilled = newCharacteristics.trunkVolumeFilled
            self.windowMode = newCharacteristics.windowMode
        }
    }
//  с грузовой машиной все тоже самое 
    struct truck {
        var brend: String = " "
        var machineYear: Int = 0
        var luggageCapacity: Int = 0
        var engineMode: Bool = false
        var trunkVolumeFilled: Int = 0
        var windowMode: Bool = false
    }
}


func anyActions (urCar: inout typeOfTransport.car, action: String, capacity: Int...) {
    if capacity.count == 1 {
    
        switch action {
        case "turnOnEngine":
            urCar.engineMode = true
            print("Вы запустили двигатель")
        case "turnOffEngine":
            urCar.engineMode = false
            print("Вы заглушили двигатель")
        case "turnOnWindow":
            urCar.windowMode = true
            print("Вы открыли окна")
        case "turnOffWindow":
            urCar.windowMode = false
            print("Вы закрыли окна")
        case "loadCargo":
            if capacity[0] <= urCar.luggageCapacity {
                urCar.trunkVolumeFilled += capacity[0]
            } else {
                print("Груз превышает допустимый обьем")
            }
        case "unLoadCargo":
            if abs(capacity[0]) <= urCar.trunkVolumeFilled {
                urCar.trunkVolumeFilled -= capacity[0]
            } else {
                print("Вы пытаетесь достать больше чем есть в машине")
            }
        default:
            break
        }
    } else {
        print("Было введено не верное кол-во аргументов изменения обьема груза")
    }
}


var dreamСar = typeOfTransport.car(brend:"audi",
                                    machineYear: 2019,
                                    luggageCapacity: 80,
                                    engineMode: false,
                                    trunkVolumeFilled: 0,
                                    windowMode: false)

let capacity1: Int = 40
let capacity2: Int = 80

// тут нужно задать действие в строковом виде из тех что есть в функции

//var action: String = "turnOnEngine"
//var action: String = "turnOffEngine"
var action: String = "turnOnWindow"
//var action: String = "turnOffWindow"




anyActions(urCar: &dreamСar, action: action, capacity: capacity1)

dreamСar

action = "loadCargo"

anyActions(urCar: &dreamСar, action: action, capacity: capacity2)

dreamСar

struct truck {
    var brend: String = " "
    var machineYear: Int = 0
    var carBody: Int = 0
    var engineMode: Bool = false
    var windowmMode: Bool = false
    var trunkVolumeFilled: Int = 0
}
