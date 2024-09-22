import Cocoa

//if someCondition {
//    print("Do something")
//}
//
//if someCondition {
//    print("Do something")
//    print("Do something else")
//    print("Do a third thing")
//}


let score = 85

if score > 80 {
    print("Great job!")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}
// the above comparision is for which name comes first alphabetically not the length



// Make an array of 3 numbers
var numbers = [1, 2, 3]

// Add a 4th
numbers.append(4)

// If we have over 3 items
if numbers.count > 3 {
    // Remove the oldest number
    numbers.remove(at: 0)
}

// Display the result
print(numbers)

let country = "Canada"

if country == "Australia" {
    print("G'day!")
}

let name = "Taylor Swift"

if name != "Anonymous" {
    print("Welcome, \(name)")
}

// Create the username variable
var username = "taylorswift13"

// If `username` contains an empty string
if username == "" {
    // Make it equal to "Anonymous"
    username = "Anonymous"
}

// Now print a welcome message
print("Welcome, \(username)!")

if username.count == 0 {
    username = "Anonymous"
}

if username.isEmpty {
    username = "Anonymous"
}


//using Comparable to make it possible to compare
enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.medium

print(first<second)
//That will print “true”, because small comes before large in the enum case list.


let age1 = 16

if age1 >= 18 {
    print("You can vote in the next election.")
}

if age1 < 18 {
    print("Sorry, you're too young to vote.")
}

//if someCondition {
//    print("This will run if the condition is true")
//} else {
//    print("This will run if the condition is false")
//}


/*
 
let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}
 
*/

let temp = 25

if temp > 20 {
    if temp < 30 {
        print("It's a nice day.")
    }
}

//better way to write is using AND operator
if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

let userAge = 14
let hasParentalConsent = true

//OR operator
if userAge >= 18 || hasParentalConsent == true {
    print("You can buy the game")
}

// ==true is not necessary as this is a boolean and it is implied that it is true
if userAge >= 18 || hasParentalConsent {
    print("You can buy the game")
}


enum TransportationOption {
    case areoplane, helicopter, bike, pathao, car
}

let transport = TransportationOption.pathao

if(transport == .areoplane || transport == .helicopter){
    print("lets fly")
}else if transport == .car{
    print("oof, the traffic.")
}else if(transport == .bike) {
    print("Grab the helmet.")
}else {
    print("I guess I have to call pathao")
}

if score > 9000 {
    print("It's over 9000!")
} else {
    if score == 9000 {
        print("It's exactly 9000!")
    } else {
        print("It's not over 9000!")
    }
}

if score > 9000 {
    print("It's over 9000!")
} else if score == 9000 {
    print("It's exactly 9000!")
} else {
    print("It's not over 9000!")
}


/*
if (isOwner == true && isEditingEnabled) || isAdmin == true {
    print("You can delete this post")
}
`
any time you mix && and || in a single condition you should almost certainly use parentheses to make the result clear.
*/



// SWITCH

enum weather {
    case rainy, sunny, windy, snowy, unknown
}

let forecast = weather.sunny

switch forecast {
case .rainy:
    print("Get an umbrella")
case .snowy:
    print("School is cancelled")
case .sunny:
    print("It should be a nice day")
case .windy:
    print("Bring a jacket.")
case .unknown:
    print("Our forecast generator is broken")
}

let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}


let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
case 4:
    print("4 calling birds")
case 3:
    print("3 French hens")
case 2:
    print("2 turtle doves")
default:
    print("A partridge in a pear tree")
}

let day1 = 5
print("My true love gave to me…")

switch day1 {
case 6:
    print("6 silver spoons")
    fallthrough
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}








