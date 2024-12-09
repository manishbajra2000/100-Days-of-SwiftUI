import Cocoa

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game ()
newGame.score += 10


class Game1 {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame1 = Game1 ()
newGame1.score += 10

//Inheritance

class Employee {
    var hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

final class Developer: Employee {
    func work() {
        print("I will be coding for \(hours) hours.")
    }
    
    final override func printSummary() {
        print("I work sometimes for \(hours) hours coding, but mostly I spend my time arguing whether code should only be indented using tabs or we can use spaces as well.")
    }
}

final class Manager: Employee {
    func work() {
        print("I will be managing \(hours) hours.")
    }
}

let Paudel = Developer(hours: 8)
let Moores = Manager(hours: 5)

Paudel.work()
Moores.work()

let Critchley = Developer(hours: 12)
Critchley.printSummary()

//final keyword does not let you override or inherit from the parent class


//class initializers and sub aclass initializers

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isConvertible)
    }
}

let TeslaX = Car(isConvertible: false)
let TeslaY = Car(isConvertible: true)


//copying classes

class User {
    var username: String = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }

}
var user1 = User()
var user2 = user1
var user3 = user1.copy()
user2.username = "John"
print(user1.username)
print(user2.username)
print(user3.username)

var user4: User = User()
user4.username = "Jane"
print(user4.username)

// Deinitializers


var count = [Int]()
count.append(1)
count.append(2)
count.append(3)
count.append(4)
count.append(5)
count.append(6)
count.append(7)
count.append(8)
count.append(9)
count.append(10)
count.append(11)
count.remove(at: 0)
count.remove(at: 0)
count.remove(at: 0)
print(count)

class Tank {
    var tankID: Int
    
    init(tankID: Int) {
        self.tankID = tankID
        print("Tank: \(tankID) created.")
    }
    
    deinit {
        print("Tank: \(tankID) destroyed.")
    }
}

var tanks = [Tank]()

for i in 1...3 {
    var Tank = Tank(tankID: i)
    print("Tank: \(i) in control.")
    tanks.append(Tank)
}

print("Loop is finished.")
tanks.removeAll()
print("Task is finished.")


//Variable inside the classes

class VariableClass {
    var variableInsideVariableClass: Int
    let constantInsideVariableClass: Int
    init() {
        self.variableInsideVariableClass = 10
        self.constantInsideVariableClass = 1000
    }
}

class ConstantClass {
    let constantInsideConstantClass: Int
    var variableInsideConstantClass: Int
    init() {
        self.constantInsideConstantClass = 10
        self.variableInsideConstantClass = 10
    }
}

var variableInstance = VariableClass()
print(variableInstance.variableInsideVariableClass)
print(variableInstance.constantInsideVariableClass)
variableInstance.variableInsideVariableClass = 20                   // can change variable properties
//      variableInstance.constantInsideVariableClass = 2000            cannot change constant properties
print(variableInstance.variableInsideVariableClass)

variableInstance = VariableClass()                  // can change variable class instance
print(variableInstance.variableInsideVariableClass)

print();print()

let constantInstance = ConstantClass()
print(constantInstance.variableInsideConstantClass)
print(constantInstance.constantInsideConstantClass)
constantInstance.variableInsideConstantClass = 20           // can change variable properties even inside constant class
//      constantInstance.constantInsideConstantClass = 2000         // cannot change constant properties

//      constantInstance = ConstantClass()          // cannot change constant class instance



class School {
    var students = 200
    func expel (student: String, for reason: String) {
        print("\(student) has been expelled for \(reason)")
        students -= 1
    }
}

let school = School()
school.expel(student: "Manish", for: "having too much sex.")

struct Garden {
    var flowers = 100
    mutating func plantFlowers() {
        flowers += 50
        print(flowers)
    }
}

var garden = Garden()
garden.plantFlowers()









