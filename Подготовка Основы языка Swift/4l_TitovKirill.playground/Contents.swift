import UIKit

class car: CustomStringConvertible {
    
    enum engineMode_: String {
        case on = "engineOn"
        case off = "engineOff"
    }
    enum windowsMode_: String {
        case on = "windowsOn"
        case off = "windowsOff"
    }
    enum windowsAction_: String {
        case on = "windowsOn"
        case off = "windowsOff"
    }
    enum sponsors_ {
        case audi
        case redBull
        case tornadoEnergy
    }
    
    enum actions_ {
        case switchEngineMode(engineMode_)
        case switchWindowsMode(windowsMode_)
        case changeOrderNumber(number: Int)
        case changeSponsor(sponsors_)
    }
    
    var brend: String
    var color: String
    var machineYear: Double
    var engineMode: engineMode_
    var windowsMode: windowsMode_
    
    init(brend: String, color: String, machineYear: Double, engineMode: engineMode_, windowsMode: windowsMode_) {
        self.brend = brend
        self.color = color
        self.machineYear = machineYear
        self.engineMode = engineMode
        self.windowsMode = windowsMode
    }
    var description: String {
        return "\(brend)\nГод выпуска: \(machineYear)\nСостояние мотора: \(engineMode)\nСостояние окон: \(windowsMode)\n"
    }
    
    func actions(action: actions_...) {
    }
}

class trunkCar: car {
    var orderNumber: Int

    init(brend: String, color: String, orderNumber: Int, machineYear: Double, engineMode: engineMode_, windowsMode: windowsMode_) {
        self.orderNumber = orderNumber
        super.init(brend: brend, color: color, machineYear: machineYear, engineMode: engineMode, windowsMode: windowsMode)
    }
    override func actions(action: actions_...) {
        for action_ in action {
            switch action_ {
            case .switchEngineMode(let mode):
                engineMode = mode
            case .switchWindowsMode(let mode):
                windowsMode = mode
            case .changeOrderNumber(let number):
                orderNumber = number
            default:
                break
            }
        }
    }
    var description2: String {
        return description + "Номер заказа: \(orderNumber)\n"
    }
}

class sportСar: car {
    var sponsor: sponsors_
    
    init(brend: String, color: String, sponsor: sponsors_, machineYear: Double, engineMode: engineMode_, windowsMode: windowsMode_) {
        self.sponsor = sponsor
        super.init(brend: brend, color: color, machineYear: machineYear, engineMode: engineMode, windowsMode: windowsMode)
    }
    override func actions(action: actions_...) {
        for action_ in action {
            switch action_ {
            case .switchEngineMode(let mode):
                engineMode = mode
            case .switchWindowsMode(let mode):
                windowsMode = mode
            case .changeSponsor(let sponsor_):
                sponsor = sponsor_
            default:
                break
            }
        }
    }
    var description2: String {
        return description + "Спонсор: \(sponsor)\n"
    }
}

var vaz = trunkCar(brend: "vaz", color: "черный", orderNumber: 11, machineYear: 1999, engineMode: .off, windowsMode: .on)
var lamb = sportСar(brend: "lamborghini", color: "orange", sponsor: .redBull, machineYear: 2019, engineMode: .on, windowsMode: .on)
print(vaz.description2)
print(lamb.description2)

vaz.actions(action: .switchEngineMode(.off),
                    .switchWindowsMode(.off),
                    .changeOrderNumber(number: 90))

lamb.actions(action: .switchEngineMode(.off),
                     .switchWindowsMode(.off),
                     .changeSponsor(.tornadoEnergy))

print(vaz.description2)
print(lamb.description2)
