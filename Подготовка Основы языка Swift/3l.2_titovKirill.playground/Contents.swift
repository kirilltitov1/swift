import UIKit

struct typeoOfCar {
//  №2 описание
    enum engineMode_: String {
        case on = "engineOn"
        case off = "engineOff"
    }
    enum windowsMode_: String {
        case on = "windowsOn"
        case off = "windowsOff"
    }
    enum enginAction_ {
        case start
        case finish
    }
    enum windowsAction_: String {
        case on = "windowsOn"
        case off = "windowsOff"
    }
    enum type_ {
        case car
        case truck
    }
//  №3 перечисление действий
    enum actions_ {
        case switchEngineMode(engineMode_)
        case switchWindowsMode(windowsMode_)
        case loadUnloadCargo(Double)
    }
    
//  №1 сделал так что можете выбрать тип сами получилось более универсально
    struct car: CustomStringConvertible{
        var brend: String
        var type: type_
        var machineYear: Double
        var luggageCapacity: Double
        var engineMode: engineMode_
        var trunkVolumeFilled: Double
        var windowsMode: windowsMode_
    
        var description: String {
            return "\(type)\n\(brend)\nГод выпуска: \(machineYear)\nСостояние мотора: \(engineMode)\nСостояние окон: \(windowsMode)\nЗагрузка \(luggageCapacity)/\(trunkVolumeFilled)\n"
        }
        
        init(brend: String, type: type_, machineYear: Double, luggageCapacity: Double, trunkVolumeFilled: Double,
             engineMode: engineMode_, windowsMode: windowsMode_) {
            self.brend = brend
            self.type = type
            self.machineYear = machineYear
            self.luggageCapacity = luggageCapacity
            self.trunkVolumeFilled = trunkVolumeFilled
            self.engineMode = engineMode
            self.windowsMode = windowsMode
        }
        
//      №4 меняет свойства структуры
//      я кстати создал здесь неогранниченный воод действий
        mutating func actions(action: actions_...) {
            for action_ in action {
                switch action_ {
                case .switchEngineMode(let mode):
                    engineMode = mode
                case .switchWindowsMode(let mode):
                    windowsMode = mode
                case .loadUnloadCargo(let capacity):
                    let value: Double = luggageCapacity + capacity
                    switch value {
                    case _ where value > trunkVolumeFilled:
                        print("Вы пытаетесь поместить больше чем может вместиться")
                    case _ where value < 0:
                        print("Вы пытаетесь отнять больше чем есть")
                    default:
                        luggageCapacity += capacity
                    }
                }
            }
        }
    }
}

//№5 создаю 2 экземпляра
var audi: typeoOfCar.car = typeoOfCar.car(brend: "audi", type: .car, machineYear: 2018, luggageCapacity: 100, trunkVolumeFilled: 9000, engineMode: .off, windowsMode: .off)
print(audi.description)
audi.actions(action: .switchEngineMode(.on),
                     .switchWindowsMode(.on),
                     .loadUnloadCargo(90))
print(audi.description)

var kamaz: typeoOfCar.car = typeoOfCar.car(brend: "Kamaz", type: .truck, machineYear: 1999, luggageCapacity: 8000, trunkVolumeFilled: 9000, engineMode: .on, windowsMode: .on)
print(kamaz.description)
kamaz.actions(action: .switchEngineMode(.off),
                      .switchWindowsMode(.off),
                      .loadUnloadCargo(9000))
