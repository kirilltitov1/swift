import UIKit

//№1
class car {
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
    enum actions_ {
        case switchEngineMode(engineMode_)
        case switchWindowsMode(windowsMode_)
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
    
    func actions(action: actions_) {
        switch action {
        case .switchEngineMode(let mode):
            engineMode = mode
        case .switchWindowsMode(let mode):
            windowsMode = mode
        }
    }
}

//№2
class trunkCar: car {
    var orderNumber: Int
    var volume: Double
    var truncActions_: car.actions_
    
    enum truncActions_ {
        case load
        case unload
    }
//    №3
    

    init(brend: String, color: String, orderNumber: Int, volume: Double, machineYear: Double, engineMode: engineMode_, windowsMode: windowsMode_) {
        self.orderNumber = orderNumber
        self.volume = volume
        super.init(brend: brend, color: color, machineYear: machineYear, engineMode: engineMode, windowsMode: windowsMode)
    }
}

//№2
class sportСar: car {
    var countOfRaces: Int
    var sponsor: String
    
//    №3
    init(brend: String, color: String, countOfRaces: Int, sponsor: String, machineYear: Double, engineMode: engineMode_, windowsMode: windowsMode_) {
        self.countOfRaces = countOfRaces
        self.sponsor = sponsor
        super.init(brend: brend, color: color, machineYear: machineYear, engineMode: engineMode, windowsMode: windowsMode)
    }
}

