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

let team = ["Harry", "Fred", "Ginny", "George", "Wood", "Angelina"]
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


//Swift lets you shrink the code above by:

let TeamSorted = team.sorted {
    if $0 == "Wood" {
        return true
    }
    else if $1 == "Wood" {
        return false
    }
    return $0 < $1
}
print(TeamSorted)

let ReveresedTeamSorted = team.sorted { $0 > $1 }
print(ReveresedTeamSorted)

let gOnly = team.sorted().filter { $0.hasPrefix("G")}
print(gOnly)

let UppercasedSortedTeam = team.sorted {
    if $0 == "Wood" {
        return true
    }
    else if $1 == "Wood" {
        return false
    }
    return $0 < $1
}.map {
    $0.uppercased()
}
print(UppercasedSortedTeam)

print()
print()
print()

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    for i in 0..<size {
        let newNumber: Int = generator()
        numbers.append(newNumber)
    }
    return numbers
}


let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}
print(rolls)

print()

func generateNumber() -> Int {
    Int.random(in: 1...20)
}
let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

print()
print()

func doThreeWorks(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("Starting first work.")
    first()
    print("Starting second work.")
    second()
    print("Starting third work.")
    third()
    print("Completed")
}
doThreeWorks(
    first: {
        print("Second work done.")
    },
    second: {
        print("Second work done.")
    },
    third: {
        print("Second work done.")
    }
)

print();print()   //OR

doThreeWorks{
    print("First work done.")
}second: {
    print("Second work done.")
}third:{
    print("Third work done.")
}

print();print()

let resignation = { (name: String) in
    print("Dear \(name), I'm outta here.")
}

func sendEmail(contents: (String) -> Void) {
    print("Connecting to server...")
    print("Ready to send email")
    contents("Ma'am")
    print("Sent")
}
sendEmail(contents: resignation)

print()

func holdClass(name: String, lesson: () -> Void, lesson2: () -> Void) {
    print("Welcome to \(name)!")
    lesson()
    print("Make sure your homework is done by next week.")
    lesson2()
}
holdClass(name: "Philosophy 101") {
    print("All we are is dust in the wind, dude.")
} lesson2: {
    print("hello")
}

print()

func knitSweater(then: () -> Void) {
    print("Buy wool")
    for _ in 1...3 {
        print("Knit knit knit...")
    }
    then()
}
knitSweater {
    print("Who wants to buy a sweater?")
}

print()

func repeatAction(count: Int, action: () -> Void) {
    for _ in 1...count {
        action()
    }
}

repeatAction(count: 5) {
    print("Hello, fuckaaasss!")
}


