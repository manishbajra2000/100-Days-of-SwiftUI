import Cocoa

func printTimesTable(for number: Int, end: Int = 10) {
    for i in 1...end {
        print("\(number) * \(i) = \(number * i)")
    }
}

printTimesTable(for: 7, end: 15)
print()
print()
printTimesTable(for: 9)     //default value of end is 10.

print()
print()

var characters = ["Samwell", "Jon", "Brook"]
characters.count
characters.removeAll(keepingCapacity: true)
characters.count
characters.removeAll() //by default, keepingCapacity = false

print()

func navigateRoute(from: String, destination: String, route: String = "fastest", avoidHighways: Bool = false) {
    //code here
}

//we can call navigateRoute function by:
navigateRoute(from: "Samakhusi", destination: "Balkhu")
navigateRoute(from: "Samakhusi", destination: "Balkhu", route: "Scenic")
navigateRoute(from: "Samakhusi", destination: "Balkhu", route: "Scenic", avoidHighways: true)


print()
print()
print()

enum passwordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String{
    if password.count < 6 { throw passwordError.short }
    if password == "123456" { throw passwordError.obvious }
    
    if password.count < 7 {
        return "Short"
    }
    else if password.count < 9 {
        return "Good"
    }
    else {
        return "Excellent"
    }
}

let password = "123456"

do {
    var result = try checkPassword(password)
    print("Your password rating is \(result)")
}catch passwordError.obvious {
    print("Try longer password.")
}catch passwordError.short {
    print("My 3 year old cousin have the same password.")
}catch {
    print("Error found.")
}
