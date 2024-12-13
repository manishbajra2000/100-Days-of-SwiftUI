import Cocoa

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    let name = "car"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        return distance / 50
    }
    
    func travel(distance: Int) {
        print("Driving \(distance) miles.")
    }
    
    func openSunroof() {
        print("Opening sunroof...")
    }
}

struct Bicycle: Vehicle {
    let name = "bicycle"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        return distance / 10
    }
    func travel(distance: Int) {
        print("Biking \(distance) miles.")
    }
}


func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow. I will try different vehicle.")
    }
    else{
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int){
    for vehicle in vehicles{
        print("The \(vehicle.name) will take \(vehicle.estimateTime(for: distance)) minutes to reach \(distance) miles.")
    }
}

let car = Car()
commute(distance: 1000, using: car)

let bicycle = Bicycle()
commute(distance: 50, using: bicycle)

getTravelEstimates(using: [car, bicycle], distance: 1000)


protocol Purchaseable {
    var name: String { get set }
}

struct Book: Purchaseable {
    var name: String
    var author: String
}

struct Movie: Purchaseable {
    var name: String
    var director: String
}

struct Laptop: Purchaseable {
    var name: String
    var manufacturer: String
}

func purchase(_ item: Purchaseable) {
    print("I'm buying \(item.name)")
}

purchase(Book(name: "Swift", author: "Khalid"))
purchase(Movie(name: "Star Wars", director: "Lucas"))
purchase(Laptop(name: "Macbook", manufacturer: "Apple"))

let macbook = Laptop(name: "Macbook Pro", manufacturer: "Apple")

purchase(macbook)

