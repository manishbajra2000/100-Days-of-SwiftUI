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


func getRandomNumber() -> some Equatable {
    return Int.random(in: 1...2)
}

func getRandomBool() -> some Equatable {
    return Bool.random()
}

print(getRandomNumber())
print(getRandomBool())

print(getRandomNumber() == getRandomNumber())


var quote = "    Are there any white lines?    "
print(quote)

var trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
print(trimmed)

extension String {
    func trimmed () -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var trimmed2 = quote.trimmed()
print(trimmed2)

//func trim (_ string: String) -> String {
//    string.trimmingCharacters(in: .whitespacesAndNewlines)
//}
//
//var trimmed3 = trim(quote)
//print(trimmed3)



let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)


struct Boook {
    let title: String
    let pageCount: Int
    var readingHours: Int
    
    init(title: String, pageCount: Int, readingHours: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = readingHours
}
}
extension Boook {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount/50
    }
}
let lotr = Boook(title: "Lord of the Ring", pageCount: 1174, readingHours: 10)
let hobbit = Boook(title: "Hobbit", pageCount: 2000)
print(lotr.readingHours)
print(hobbit.readingHours)

extension Double {
    var isNegative: Bool {
        return self < 0
    }
}

var hhh: Double = -10.0
print(hhh.isNegative)


extension Bool{
    mutating func toogled() -> Bool{
        if self == true{
            return false
        }
        else{
            return true
        }
    }
}
var t: Bool = true
print(t.toogled())


extension Int{
    mutating func clamped(min: Int, max: Int) {
        if self < min{
            self = min
        }
        else if self > max{
            self = max
        }
    }
}

var range = 46
range.clamped(min: 29, max: 83)
print(range)

extension String{
    var isLong: Bool {
        return count > 10
    }
    
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix){
            return self
        }
        else {
            return "\(prefix)\(self)"
        }
        
    }
    
    func isUppercased() -> Bool {
        self == self.uppercased()
    }
    
}

var str: String = "ASD HELLO WORLD"
print(str.isLong)


print(str.withPrefix("ASD"))

print(str.isUppercased())


protocol Politician {
    var isDirty: Bool { get set }
    func takeBribe()
}

extension Politician{
    func takeBribe() {
        if isDirty{
            print("Thank you very much")
        }
        else{
            print("Call the police.")
        }
    }
}

struct Person: Politician {
    let name: String
    var isDirty: Bool
}

let oli = Person(name: "KP Oli", isDirty: true)
oli.takeBribe()


protocol Anime {
    var availableLanguages: [String] { get set }
    func watch(in language: String)
}

extension Anime {
    func watch(in language: String) {
        if availableLanguages.contains(language) {
            print("Playing in \(language).")
        }
        else {
            print("Unrecognized language: \(language).")
        }
    }
}


struct Netflix: Anime{
    var availableLanguages: [String]
}
var languages = ["English", "French", "Japanese"]
let deathnote = Netflix(availableLanguages: languages)

deathnote.watch(in: "Japanese")
deathnote.watch(in: "Nepali")
