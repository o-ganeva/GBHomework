import UIKit

enum CarDoorState: CustomStringConvertible {
    case open, close

    var description: String {
        switch self {
        case .open:
            return "Дверь открыта"
        case .close:
            return "Дверь закрыта"
        }
    }
}

enum CarEngineState: CustomStringConvertible {
    case on, off

    var description: String {
        switch self {
        case .on:
            return "Двигатель запущен"
        case .off:
            return "Двигатель заглушен"
        }
    }
}

enum Transmission: CustomStringConvertible {
    case manual, auto
    
    var description: String {
        switch self {
        case .manual:
            return "Механическая"
        case .auto:
            return "Автоматическая"
        }
    }
}

enum CarRoofState: CustomStringConvertible {
    case open, close
    
    var description: String {
        switch self {
        case .open:
            return "Крыша открыта"
        case .close:
            return "Крыша закрыта"
        }
    }
}

protocol CarProtocol: class {
    var brand: String { get }
    var model: String { get }
    var yearOfIssue: Int { get }
    var transmission: Transmission { get }
    var engineState: CarEngineState { get set }
    var doorState: CarDoorState { get set }
    
    func openDoor()
    func closeDoor()
    func turnOnEngine()
    func turnOffEngine()
}

extension CarProtocol {
    func openDoor() {
        doorState = .open
    }
    
    func closeDoor() {
        doorState = .close
    }
    
    func turnOnEngine() {
        engineState = .on
    }
    
    func turnOffEngine() {
        engineState = .off
    }
}

final class SportsCar: CarProtocol {
    
    var brand: String
    var model: String
    var yearOfIssue: Int
    var transmission: Transmission
    var engineState: CarEngineState
    var doorState: CarDoorState
    var roofState: CarRoofState
    
    init(brand: String, model: String, yearOfIssue: Int, transmission: Transmission, engineState: CarEngineState, doorState: CarDoorState, roofState: CarRoofState) {
        self.brand = brand
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.transmission = transmission
        self.engineState = engineState
        self.doorState = doorState
        self.roofState = roofState
    }
    
    func openRoof() {
        roofState = .open
    }
    
    func closeRoof() {
        roofState = .close
    }
}

class Truck: CarProtocol {
    
    var brand: String
    var model: String
    var yearOfIssue: Int
    var transmission: Transmission
    var engineState: CarEngineState
    var doorState: CarDoorState
    let trunkVolume: Int
    var filledTrunkVolume: Int
    
    init(brand: String, model: String, yearOfIssue: Int, transmission: Transmission, engineState: CarEngineState, doorState: CarDoorState, trunkVolume: Int, filledTrunkVolume: Int) {
        self.brand = brand
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.transmission = transmission
        self.engineState = engineState
        self.doorState = doorState
        self.trunkVolume = trunkVolume
        self.filledTrunkVolume = filledTrunkVolume
    }

    func uploadTrunk(volume: Int) {
        guard volume <= trunkVolume - filledTrunkVolume else {
            print("В машине \(brand) \(model) не хватает места!")
            return
        }
        filledTrunkVolume += volume
    }
    
    func unloadTrunk(volume: Int) {
        guard volume <= filledTrunkVolume else {
            print("В машине \(brand) \(model) недостаточно груза!")
            return
        }
        filledTrunkVolume -= volume
    }

}

let nissanGTR = SportsCar(brand: "Nissan",
                          model: "GT-R",
                          yearOfIssue: 2012,
                          transmission: .manual,
                          engineState: .on,
                          doorState: .open,
                          roofState: .close)

let porsche718 = SportsCar(brand: "Porsche",
                           model: "718",
                           yearOfIssue: 2021,
                           transmission: .auto,
                           engineState: .on,
                           doorState: .close,
                           roofState: .open)

let howoA7 = Truck(brand: "HOWO",
                   model: "A7",
                   yearOfIssue: 2010,
                   transmission: .auto,
                   engineState: .off,
                   doorState: .close,
                   trunkVolume: 500,
                   filledTrunkVolume: 0)

let isuzuELF = Truck(brand: "ISUZU",
                   model: "ELF3.5",
                   yearOfIssue: 2017,
                   transmission: .manual,
                   engineState: .off,
                   doorState: .open,
                   trunkVolume: 350,
                   filledTrunkVolume: 50)

nissanGTR.turnOffEngine()
nissanGTR.closeDoor()

porsche718.openRoof()

howoA7.unloadTrunk(volume: 100)
howoA7.uploadTrunk(volume: 300)
howoA7.turnOnEngine()

isuzuELF.uploadTrunk(volume: 350)
isuzuELF.uploadTrunk(volume: 300)
isuzuELF.openDoor()

print(nissanGTR)
print(porsche718)
print(howoA7)
print(isuzuELF)

extension SportsCar: CustomStringConvertible {
    var description: String {
        return """
        \nМарка: \(brand)
        Модель: \(model)
        Год выпуска: \(yearOfIssue)
        Трансмиссия: \(transmission)
        Состояние двигателя: \(engineState)
        Состояние дверей: \(doorState)
        Состояние крыши: \(roofState)
        """
    }
}

extension Truck: CustomStringConvertible {
    var description: String {
        return """
        \nМарка: \(brand)
        Модель: \(model)
        Год выпуска: \(yearOfIssue)
        Трансмиссия: \(transmission)
        Состояние двигателя: \(engineState)
        Состояние дверей: \(doorState)
        Объем кузова: \(trunkVolume)
        Заполненный объем кузова: \(filledTrunkVolume)
        """
    }
}
