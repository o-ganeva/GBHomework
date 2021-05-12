import Foundation

enum CheckInError: CustomStringConvertible, Error {
    case flightNotFound
    case passengerNotFound
    case overweight
    case alreadyRegistered
    case passengerInStopList
    
    var description: String {
        switch self {
        case .flightNotFound: return "Рейс не найден"
        case .passengerNotFound: return "Пассажир не найден"
        case .overweight: return "Перевес"
        case .alreadyRegistered: return "Уже зарегистрирован"
        case .passengerInStopList: return "Ограничение на вылет"
        }
    }
}

struct Flight {
    let maxBaggageWeight: Int
    let allPassengers: [String]
    var checkedInPassengers: [String]
    let destination: String
}

struct Passenger {
    let passportID: String
    let flightNumber: String
    let baggageWeight: Int
}

struct BoardingPass {
    let passengerId: String
    let destination: String
}

final class Airport {
    
    private let stopList = ["323334"]
    
    private let flights = [
        "U172": Flight(maxBaggageWeight: 10,
                       allPassengers: ["012345", "678910", "111213", "141516"],
                       checkedInPassengers: ["111213", "141516"],
                       destination: "Rome"),
        "U178": Flight(maxBaggageWeight: 5,
                       allPassengers: ["171819", "202122", "232425", "262728"],
                       checkedInPassengers: ["232425", "262728"],
                       destination: "Madrid"),
        "U1710": Flight(maxBaggageWeight: 8,
                        allPassengers: ["293031", "323334", "353637", "383940"],
                        checkedInPassengers: ["353637", "383940"],
                        destination: "Paris")
    ]
    
    func checkInPassenger(_ passenger: Passenger) -> (BoardingPass?, CheckInError?) {
        
        guard var flight = flights[passenger.flightNumber] else {
            return (nil, .flightNotFound)
        }
        
        for id in flight.checkedInPassengers {
            guard passenger.passportID != id else {
                return (nil, .alreadyRegistered)
            }
        }
        
        var isFound = false
        for id in flight.allPassengers {
            if passenger.passportID == id {
                isFound = true
                break
            }
        }
        
        guard isFound else {
            return (nil, .passengerNotFound)
        }
        
        for id in stopList {
            if passenger.passportID == id {
                return (nil, .passengerInStopList)
            }
        }
        
        guard passenger.baggageWeight <= flight.maxBaggageWeight else {
            return (nil, .overweight)
        }
        
        flight.checkedInPassengers.append(passenger.passportID)
        
        let boardingPass = BoardingPass(passengerId: passenger.passportID,
                                        destination: flight.destination)
        
        return (boardingPass, nil)
    }
}

let airport = Airport()

var passengers = [Passenger(passportID: "012345",
                            flightNumber: "U171",
                            baggageWeight: 1),
                  Passenger(passportID: "111213",
                            flightNumber: "U178",
                            baggageWeight: 3),
                  Passenger(passportID: "293031",
                            flightNumber: "U1710",
                            baggageWeight: 10),
                  Passenger(passportID: "262728",
                            flightNumber: "U178",
                            baggageWeight: 5),
                  Passenger(passportID: "323334",
                            flightNumber: "U1710",
                            baggageWeight: 5),
                  Passenger(passportID: "678910",
                            flightNumber: "U172",
                            baggageWeight: 5),
                  Passenger(passportID: "202122",
                            flightNumber: "U178",
                            baggageWeight: 4),
                  Passenger(passportID: "293031",
                            flightNumber: "U1710",
                            baggageWeight: 7)
]

for passenger in passengers {
    print(airport.checkInPassenger(passenger))
}

extension Airport {
    
    func checkIn(passenger: Passenger) throws -> BoardingPass {
        
        guard var flight = flights[passenger.flightNumber] else {
            throw CheckInError.flightNotFound
        }
        
        for id in flight.checkedInPassengers {
            guard passenger.passportID != id else {
                throw CheckInError.alreadyRegistered
            }
        }
        
        var isFound = false
        for id in flight.allPassengers {
            if passenger.passportID == id {
                isFound = true
                break
            }
        }
        
        guard isFound else {
            throw CheckInError.passengerNotFound
        }
        
        for id in stopList {
            if passenger.passportID == id {
                throw CheckInError.passengerInStopList
            }
        }
        
        guard passenger.baggageWeight <= flight.maxBaggageWeight else {
            throw CheckInError.overweight
        }
        
        flight.checkedInPassengers.append(passenger.passportID)
        
        let boardingPass = BoardingPass(passengerId: passenger.passportID,
                                        destination: flight.destination)
        
        return boardingPass
    }
}

for passenger in passengers {
    do {
        let boardingPass = try airport.checkIn(passenger: passenger)
        print(boardingPass)
    } catch let error {
        print(error)
    }
}
