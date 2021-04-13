import Foundation

enum CarAction {
    case openDoor
    case closeDoor
    case turnOnEngine
    case turnOffEngine
    case uploadTrunk(volume: Int)
    case unloadTrunk(volume: Int)
}

struct SportsCar: CustomStringConvertible {
    let brand: String
    let year: Int
    let trunkVolume: Int
    var filledTrunkVolume: Int
    var isEngineOn: Bool
    var isDoorOpen: Bool
    
    var description: String {
        return """
        \nМарка: \(brand)
        Год выпуска: \(year)
        Объём багажника: \(trunkVolume)
        Заполненный объём багажника: \(filledTrunkVolume)
        \(doorState)
        \(engineState)
        """
    }
    
    var doorState: String {
        isDoorOpen ? "Дверь открыта" : "Дверь закрыта"
    }
    
    var engineState: String {
        isEngineOn ? "Двигатель запущен" : "Двигатель заглушен"
    }
    
    mutating func changeState(action: CarAction) {
        switch action {
        case .openDoor:
            isDoorOpen = true
        case .closeDoor:
            isDoorOpen = false
        case .turnOnEngine:
            isEngineOn = true
        case .turnOffEngine:
            isEngineOn = false
        case let .uploadTrunk(volume):
            guard volume <= trunkVolume - filledTrunkVolume else {
                print("В машине \(brand) не хватает места!")
                return
            }
            filledTrunkVolume += volume
        case let .unloadTrunk(volume):
            guard volume <= filledTrunkVolume else {
                print("В машине \(brand) недостаточно груза!")
                return
            }
            filledTrunkVolume -= volume
        }
    }
}

struct Truck: CustomStringConvertible {
    let brand: String
    let year: Int
    let trunkVolume: Int
    var filledTrunkVolume: Int
    var isEngineOn: Bool
    var isDoorOpen: Bool
    
    var description: String {
        return """
        \nМарка: \(brand)
        Год выпуска: \(year)
        Объём багажника: \(trunkVolume)
        Заполненный объём багажника: \(filledTrunkVolume)
        \(doorState)
        \(engineState)
        """
    }
    
    var doorState: String {
        isDoorOpen ? "Дверь открыта" : "Дверь закрыта"
    }
    
    var engineState: String {
        isEngineOn ? "Двигатель запущен" : "Двигатель заглушен"
    }
    
    mutating func changeState(action: CarAction) {
        switch action {
        case .openDoor:
            isDoorOpen = true
        case .closeDoor:
            isDoorOpen = false
        case .turnOnEngine:
            isEngineOn = true
        case .turnOffEngine:
            isEngineOn = false
        case let .uploadTrunk(volume):
            guard volume <= trunkVolume - filledTrunkVolume else {
                print("В машине \(brand) не хватает места!")
                return
            }
            filledTrunkVolume += volume
        case let .unloadTrunk(volume):
            guard volume <= filledTrunkVolume else {
                print("В машине \(brand) недостаточно груза!")
                return
            }
            filledTrunkVolume -= volume
        }
    }
}

var sportsCar = SportsCar(brand: "Toyota",
                          year: 2015,
                          trunkVolume: 5,
                          filledTrunkVolume: 2,
                          isEngineOn: false,
                          isDoorOpen: false)

var sportsCar2 = SportsCar(brand: "Honda",
                           year: 2021,
                           trunkVolume: 3,
                           filledTrunkVolume: 1,
                           isEngineOn: false,
                           isDoorOpen: false)

var truck = Truck(brand: "Volvo",
                  year: 2018,
                  trunkVolume: 500,
                  filledTrunkVolume: 500,
                  isEngineOn: true,
                  isDoorOpen: false)

var truck2 = Truck(brand: "Howo",
                  year: 2015,
                  trunkVolume: 350,
                  filledTrunkVolume: 200,
                  isEngineOn: false,
                  isDoorOpen: false)

sportsCar.changeState(action: .openDoor)
sportsCar.changeState(action: .uploadTrunk(volume: 4))

sportsCar2.changeState(action: .turnOnEngine)
sportsCar2.changeState(action: .unloadTrunk(volume: 1))

truck.changeState(action: .unloadTrunk(volume: 500))
truck.changeState(action: .uploadTrunk(volume: 300))

truck2.changeState(action: .unloadTrunk(volume: 250))
truck2.changeState(action: .openDoor)

print(sportsCar)
print(sportsCar2)
print(truck)
print(truck2)


