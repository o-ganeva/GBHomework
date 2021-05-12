import Foundation

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

enum TruckTrailerSize: CustomStringConvertible {
    case big, small
    
    var description: String {
        switch self {
        case .big:
            return "Большой"
        case .small:
            return "Маленький"
        }
    }
}

class Car: CustomStringConvertible {
    let brand: String
    let model: String
    let yearOfIssue: Int
    let transmission: Transmission
    var engineState: CarEngineState
    var doorState: CarDoorState
    
    var description: String {
        return """
        \nМарка: \(brand)
        Модель: \(model)
        Год выпуска: \(yearOfIssue)
        Трансмиссия: \(transmission)
        Состояние двигателя: \(engineState)
        Состояние дверей: \(doorState)
        """
    }
    
    init(brand: String,model: String, yearOfIssue: Int, transmission: Transmission, engineState: CarEngineState, doorState: CarDoorState) {
        self.brand = brand
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.transmission = transmission
        self.engineState = engineState
        self.doorState = doorState
    }
    
    func openDoor() {
        doorState = .open
    }
    
    func closeDoor() {
        doorState = .close
    }
        
    func changeEngineState(_ engineState: CarEngineState) {
        self.engineState = engineState
    }
    
}

final class SportsCar: Car {
    var roofState: CarRoofState
    
    override var description: String {
        return """
        \(super.description)
        Состояние крыши: \(roofState)
        """
    }
    
    init(brand: String, model: String, yearOfIssue: Int, transmission: Transmission, roofState: CarRoofState, engineState: CarEngineState, doorState: CarDoorState) {
        self.roofState = roofState
        
        super.init(brand: brand, model: model, yearOfIssue: yearOfIssue, transmission: transmission, engineState: engineState, doorState: doorState)
    }
    
    override func openDoor() {
        super.openDoor()
        print("У спорткара \(brand) \(model) дверь открылась")
    }
    
    override func closeDoor() {
        super.closeDoor()
        print("У спорткара \(brand) \(model) дверь закрылась")
    }
}

final class Truck: Car {
    var trailerSize: TruckTrailerSize
    
    override var doorState: CarDoorState {
        didSet {
            print("Грузовик \(brand) \(model) \(doorState)")
        }
    }
    
    override var description: String {
        return """
        \(super.description)
        Размер прицепа: \(trailerSize)
        """
    }
    
    init(brand: String, model: String, yearOfIssue: Int, transmission: Transmission, trailerSize: TruckTrailerSize, engineState: CarEngineState, doorState: CarDoorState) {
        self.trailerSize = trailerSize
        
        super.init(brand: brand, model: model, yearOfIssue: yearOfIssue, transmission: transmission, engineState: engineState, doorState: doorState)
    }
    
    override func changeEngineState(_ engineState: CarEngineState) {
        super.changeEngineState(engineState)
        switch engineState {
        case .on:
            print("У грузовика \(brand) \(model) двигатель запущен")
        case .off:
            print("У грузовика \(brand) \(model) двигатель заглушен")
        }
    }
}

let toyotaSupra = SportsCar(brand: "Toyota", model: "Supra", yearOfIssue: 2000, transmission: .auto, roofState: .close, engineState: .on, doorState: .close)

let howoA7 = Truck(brand: "Howo", model: "A7", yearOfIssue: 2015, transmission: .manual, trailerSize: .big, engineState: .off, doorState: .open)

toyotaSupra.openDoor()
howoA7.doorState = .close
howoA7.changeEngineState(.on)

print(toyotaSupra)
print(howoA7)
