import Cocoa


//DAY 9

//Create and Use Closures
func greetUser() {
    print("Hello, there!")
}
greetUser()

var greetCopy: () -> Void = greetUser  // () -> Void      type annotation for the function as it takes no parameter and returns no value
greetCopy()

var sayHello = {
    print("Hello, user!")
}
sayHello()

var sayHi = {(name: String) in
    print("Hello, \(name)!")
}
sayHi("Manish")    //does not need parameter name in closures

var sayHola = {(name: String) -> String in
    return "Hello, \(name)"
}
print("\(sayHola("Sadie"))!")

print()
print()

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    }else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)     //does not need parameter names
print(user)

print()
print()

let team = ["Harry", "Fred", "George", "Wood", "Angelina"]
print(team)
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Wood" {
        return true
    }
    else if name2 == "Wood" {
        return false
    }
    
    return name1 < name2
}

//let captainFirstTeam = team.sorted(by: captainFirstSorted)   //Wood is the Captain
//print(captainFirstTeam)

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Wood" {
        return true
    }
    else if name2 == "Wood" {
        return false
    }
    
    return name1 < name2
})
print(captainFirstTeam)


