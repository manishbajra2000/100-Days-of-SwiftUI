import Cocoa

let opposites = ["Mario":"Wario", "Luigi":"Waluigi"]
let peachOpposites: String? = opposites["Peach"]
print(peachOpposites as Any)

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String?
username = "Peach"
if let unwrappedName = username {
    print("The \(unwrappedName) is a valid username")
}
else {
    print("The username is invalid")
}
username = nil
if let unwrappedName = username {
    print("The \(unwrappedName) is a valid username")
}
else {
    print("The username is invalid")
}


var num1: Int = 100_000_000
var num2 = 0
var num3: Int? = nil

var str1 = "Hello World"
var str2 = ""
var str3: String? = nil

var arr1: [Int] = [1,2,3]
var arr2: [Int] = []
var arr3 = [Int]()
var arr4: [Int]? = nil

var dict1: [String:Int] = ["a":1,"b":2,"c":3]
var dict2: [String:Int]? = nil


func square(of number: Int) -> Int{
    number * number
}

var number: Int? = nil

if let unwrappedNumber = number {
    print(square(of: unwrappedNumber))
}else {
    print("Invalid number")
}

number = 9

if let number = number {
    print(square(of: number))
}else {
    print("Invalid number")
}

number = 10

if let number {
    print(square(of: number))
}else{
    print("Invalid number")
}

let album = "Red"
let albums = ["Reputation", "Red", "1989"]
if let position = albums.firstIndex(of: album) {
    print("Found \(album) at position \(position).")
}

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Invalid number")
        return
    }
    print(number * number)
}
printSquare(of: nil)

func printSquare1(of number: Int?) {
    if let number = number {
        print(number * number)
    }else{
        print("Invalid")
    }
    
}
printSquare1(of: nil)


var myVar: Int? = 5

if let myVar {
    // run if myVar has a value
}


func print() {
    var myVar: Int? = 5
    guard let myVar else {
        // run if myVar does not have a value
        return
    }
}



// nil coalescing

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "Unknown"
let new1 = captains["Enterprise", default: "Unknown"]   //it produces the same result, but...
print(new)

let tvShows = ["Peaky Blinders", "Ted Lasso", "Suits"]
let tvShows1 = [String]()
let favorite = tvShows.randomElement() ?? "None"
let favorite1 = tvShows1.randomElement() ?? "None"
print(favorite)
print(favorite1)


struct Book {
    let name: String
    let author: String?
}

let alchemist = Book(name: "The Alchemist", author: "Paulo Coelho")
let harryPotter = Book(name: "Harry Potter", author: nil)
print(alchemist.author ?? "anonymous")
print(harryPotter.author ?? "anonymous")


let str = "five"
let num = Int(str) ?? 0
print(num)

var conferenceName: String? = "WWDC"
var conference: String? = conferenceName ?? nil


// optinal chaining

struct Books {
    let title: String
    let author: String?
}

let book: Books? = Books(title: "The Alchemist", author: "Paulo Coelho")
let author = book?.author?.first?.uppercased() ?? "A"

print(author)


let names = ["Taylor", "Paul", "Adele"]
let lengthOfLast = names.last?.count ?? 0
print(lengthOfLast)
 

enum userError: Error {
    case BadID, networkError
}

func fetchUser(id: Int) throws -> String {
    if(id == 123) { return "Id: \(id) User: Manish" }
    else { throw userError.BadID }
}

if let user = try? fetchUser(id: 123) {
    print(user)
}

let user1 = (try? fetchUser(id: 1223)) ?? "Anonymous"
print(user1)


// Define a function that can throw an error
func divide(numerator: Int, divisor: Int) throws -> Int {
    if divisor == 0 {
        throw NSError(domain: "DivisionError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Cannot divide by zero"])
    }
    return numerator / divisor
}

// 1. Using try with do-catch
do {
    let result = try divide(numerator: 10, divisor: 2)
    print("Result using try: \(result)") // This will print: Result using try: 5
} catch {
    print("Caught an error: \(error.localizedDescription)")
}

// 2. Using try? (returns optional)
let resultWithTryOptional = try? divide(numerator: 10, divisor: 0)
if let value = resultWithTryOptional {
    print("Result using try?: \(value)")
} else {
    print("Result using try?: nil because an error occurred") // This will print
}

// 3. Using try! (forces execution, crashes if error occurs)
let resultWithTryForce = try! divide(numerator: 10, divisor: 2)
print("Result using try!: \(resultWithTryForce)") // This will print: Result using try!: 5


