import Cocoa

enum gears {
    case neutral
    case first
    case second
    case third
    case fourth
    case fifth
    case sixth
}

struct Car {
    nonisolated(unsafe) static var myCars: [String] = []
    nonisolated(unsafe) static var myCarsCount: Int = 0
    
    static func printCars() {
        if myCarsCount > 0 {
            print("Cars:")
            myCars.forEach { print($0) }
        }else {
            print("No Cars")
        }
    }
    
    static func printCarsCount() {
        print("Cars Count: \(myCarsCount)")
    }
    
    private let model: String
    private let numberOfSeats: Int
    private var currentGear: gears  = gears.neutral {
        didSet {
            if currentGear == oldValue{
                print("Already in \(currentGear)")
            }else {
                print("Gear changed to \(currentGear)")
            }
        }
    }
    
    init(model: String, numberOfSeats: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        print("Car Created: \(model) with \(numberOfSeats) seats")
        Car.myCars.append(model)
        Car.myCarsCount += 1
    }
    
    mutating func changeGear(to newGear: gears) {
        currentGear = newGear
    }
    
    func printGear() {
        print("Current Gear of \(model): \(currentGear)")
    }
}

var ford = Car(model: "Ford Raptor", numberOfSeats: 5)
ford.changeGear(to: .third)
ford.changeGear(to: .fourth)
ford.changeGear(to: .neutral)

var tata = Car(model: "Tata Tiago", numberOfSeats: 4)
tata.changeGear(to: .neutral)
tata.changeGear(to: .third)
tata.changeGear(to: .fourth)
tata.changeGear(to: .neutral)

Car.printCars()
Car.printCarsCount()

ford.printGear()
tata.printGear()
