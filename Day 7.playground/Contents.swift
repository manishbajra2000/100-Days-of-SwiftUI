import Cocoa


// Day 7


func showWelcome() {
    print("Welcome to my app!")
        print("By default This prints out a conversion")
        print("chart from centimeters to inches, but you")
        print("can also set a custom range if you want.")
}

showWelcome()
print()
print()

func printTimesTable(number: Int) {
    for i in 1...12 {
        print("\(number) * \(i) = \(number*i)")
    }
}
printTimesTable(number: 7)

print()
print()

func printTimesTable(number: Int, end: Int) {
    for i in 1...end {
        print("\(number) * \(i) = \(number*i)")
    }
}

printTimesTable(number: 12, end: 300)     //we cannot do printTimesTable(12, 300) like in other languages


func readUserInput() {
    while true {
        print("Reading user input...")
        break
    }
}
readUserInput()

print()
print()

//return a value

let root = sqrt(169) // this returns the square root of the number

func rollDice () -> Int {
    return Int.random(in: 1...6)      //we can omit "return" in this case because function has only one line of code
}
print(rollDice())
print(rollDice())
print(rollDice())

print()
print()

func areLetterSame (string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()   //we can omit "return" in this case because function has only one line of code
}

print(areLetterSame(string1: "lmao", string2: "lamo"))

print()
print()


func pythagoras (perpendicular: Double, base: Double) -> Double {
    sqrt(perpendicular * perpendicular + base * base)
}

let hypotenuse = pythagoras(perpendicular: 3, base: 4)
print(hypotenuse)

func doNothing () {
    return
}

doNothing()




print()
print()
//return multiple values from function


//Using array
func getUsers1() -> [String] {
    ["Taylor", "Swift"]
}

let user1 = getUsers1()

print("User: \(user1[0]) \(user1[1])")


//Using dictionary
func getUsers2() -> [String: String] {
    ["firstName": "Taylor", "lastName": "Swift"]
}

let user2 = getUsers2()

print("User: \(user2["firstName", default: "?"]) \(user2["lastName", default: "? "])")


//Using *TUPLES*
func getUsers() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
    // ("Taylor", "Swift")    this is also completely valid
}

var user = getUsers()
print("User: \(user.firstName) \(user.lastName)")

let (firstName, lastName) = getUsers()
print("User: \(firstName) \(lastName)")


let (firstNam, _) = getUsers()
print("User: \(firstNam)")



func getUsers(fName: String, lName: String) -> (String, String) {
    (fName, lName)
}

user = getUsers(fName: "Katy", lName: "Perry")
print("User: \(user.firstName) \(user.1)")


//customize parameters
func rollDice(sides: Int, count: Int) {
    var rolls: [Int] = []
    
    for _ in 1...count {
        var a = Int.random(in: 1...sides)
        rolls.append(a)
    }
    print(rolls)
}

rollDice(sides: 6, count: 20)

func hireEmployees(name: String) { }
func hireEmployees(title: String) { }
func hireEmployees(location: String) { }

let lyric = "I see a red door and i wanted it painted black."
print(lyric.hasPrefix("I see"))  //returns true

// when you use _ before parameter name you dont need to specify when function is called
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}
let string = "HELLOo, WORLD!"
print(isUppercase(string))


// (ExternalParameterName InternalParameterName: Int)
func printTimesTable(for number: Int) {
    for i in 1...12 {
        print("\(number) * \(i) = \(number * i)")
    }
}

printTimesTable(for: 32)


