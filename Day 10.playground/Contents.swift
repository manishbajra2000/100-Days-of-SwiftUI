import Cocoa

struct Album {
    // Properties of a struct
    let title: String
    let artist: String
    let year: Int
    
    // Method of a struct
    func printSummary() {
        print("\(title) \(year) by \(artist)")
    }
}

// Initializing the struct
let red = Album(title: "Red", artist: "Taylor swift", year: 2012)
let americanIdiot = Album(title: "American Idiot", artist: "Green Day", year: 2004)

print(red.artist)
print(americanIdiot.year)

red.printSummary()
americanIdiot.printSummary()

print()

//struct Employee {
//    // These are properties of a struct
//    let name: String
//    var vacationRemaining: Int = 14
//    
//    
//    // This is a method of a struct
//    mutating func takeVacation(forDays days: Int) {
//        if vacationRemaining > days {
//            print("\(name) is going on a vacation")
//            vacationRemaining -= days
//            print("Vacation Remaining: \(vacationRemaining)")
//        }
//        else{
//            print("Oops, there are not enough days left.")
//        }
//    }
//}
//var archer = Employee(name: "Jofra Archer", vacationRemaining: 20)
//archer.takeVacation(forDays: 11)
//
//var root = Employee(name: "Joe Root")
//var peterson = Employee.init(name: "Kevin Peterson", vacationRemaining: 20)

struct Employee {
    let name: String
    var vacationRemaining: Int
    
    func printRemainingDays(){
        print("Vacation Remaining for \(name): \(vacationRemaining)")
    }
    
    mutating func TakeVacation(forDays days: Int){
        if days < vacationRemaining {
            print("Yayy! Vacation granted for \(days) days.")
            print("Taking vacation...")
            vacationRemaining -= days
            print("Vacation taken for \(days) days.")
        }
        else{
            print("Oops! Not enough days remaining to take a vacation for \(days) days.")
        }
    }
}

var Manish = Employee(name: "Manish Bajracharya", vacationRemaining: 10)
var Sadie = Employee(name: "Sadikshya Poudel", vacationRemaining: 15)

Manish.printRemainingDays()
Manish.TakeVacation(forDays: 5)
Manish.printRemainingDays()
Sadie.printRemainingDays()
Sadie.TakeVacation(forDays: 29)
Sadie.TakeVacation(forDays: 13)
Sadie.printRemainingDays()



//how to compute property values dynamically

struct Worker {
    let name: String
    var vacationAllocated: Int
    var vacationTaken: Int
    var vacationRemaining: Int {
        get{
            vacationAllocated - vacationTaken
        }
        set{
            vacationAllocated = vacationRemaining + newValue
        }
    }

}

var jofra = Worker(name: "Jofra Archer", vacationAllocated: 20, vacationTaken: 5)
print(jofra.vacationAllocated)
print(jofra.vacationTaken)
print(jofra.vacationRemaining)
print()
jofra.vacationRemaining = 13
jofra.vacationTaken += 8
print(jofra.vacationAllocated)
print(jofra.vacationTaken)
print(jofra.vacationRemaining)



// PROOERTY OBSERVER

struct Game {
    var score: Int = 2 {
        didSet{
            print("The score is: \(score)")
        }
    }
}
var game1 = Game()
game1.score += 2
game1.score += 3
game1.score -= 1
game1.score += 7

struct App {
    var contacts: [String] {
        willSet{
            print()
            print("willSet runing...")
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        didSet{
            print()
            print("didSet runing...")
            print("Current value is: \(contacts)")
            print("Old value was: \(oldValue)")
        }
    }
}

var app = App(contacts: [])
app.contacts.append("Harry")
app.contacts.append("Ron")
app.contacts.append("Hermione")
app.contacts.append("Malfoy")
app.contacts.append("Ginny")
app.contacts.append("Luna")
app.contacts.append("Voldemort")



//Initializers

struct Player {
    let name: String
    let age: Int
    
    init(name: String) {
        self.name = name
        age = Int.random(in: 20...25)
    }
}
let player1 = Player(name: "Root")

