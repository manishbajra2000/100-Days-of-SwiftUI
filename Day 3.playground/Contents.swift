//Day 3

//Array

//array: hold multiple values of same types

var beatles = ["John", "Pau", "George", "Ringo"]
let numbers = [4, 8, 3, 21, 33]
var temperatures = [28.3, 32.4, 24,4]

//starts index from 0 (not 1)

print(beatles[0])
print(numbers[1])
print(temperatures[2])

//make sure always index you ask for actually exists inside the array, error otherwise

beatles.append("Adrian")
beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")

//cannot append other data types in array than the assigned one
//eg: temperatures.append("Chris")     cannot do this because array tempreatures hold Double values only


let firstBeatle = beatles[0]
let firstNumber = numbers[0]
let firstTemperature = temperatures[0]
let isAllowed = firstTemperature + Double(firstNumber)
print(isAllowed)
//let notAllowed = firstBeatle = firstNumber   this is called Type Safety

var scores = Array<Int>()  //assign array to some Data Type
//  () is used to customize the way you create the array like starting with 100 elements with zeros
scores.append(100)
scores.append(80)
scores.append(65)
print(scores[1])

var albums = Array<String>()
albums.append("Fearless")
albums.append("Folklore")
albums.append("Red")

//we can also refer array like :
var anotherAlbums = [String]()  //works same like earlier one just shorthand
anotherAlbums.append("Fearless")
anotherAlbums.append("Folklore")
anotherAlbums.append("Red")

//another way to refer an array is to give an element and Swift will recognize it itself
var alternateWay = ["Fearless"]
alternateWay.append("Folklore")
alternateWay.append("Red")


//to count
print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 3)
print(characters.count)

characters.removeAll()
print(characters.count)

let bondMovies = ["Casino Royale", "Spectre", "No Time to Die"]
print(bondMovies.contains("Frozen"))

print(bondMovies)
print("Sorted list: \(bondMovies.sorted())")

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedCollectionOfPresidents = presidents.reversed()
print(reversedCollectionOfPresidents)  //this if of type ReversedCollection; not an array
let reversedPresidents = Array(reversedCollectionOfPresidents)
print(presidents)
print(reversedPresidents)
print(presidents[2])
print(reversedPresidents[2])


let name = "ThisIsName"
let reversedName = name.reversed()
print(reversedName)
let rName = String(reversedName)
print(rName)









//Dictionaries
let employee = [        //key: value
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]


//this could either have a value or not so we use default to return Unknown
print(employee["name", default:"Unknown"])
print(employee["job", default:"Unknown"])
print(employee["location", default:"Unknown"])
print(employee["satatus", default:"Unknown"])
print(employee["manager", default:"Unknown"])


//String: Bool dictionary
let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false
]


//Int: String dictionary
let olympics = [
    2012: "London",
    2016: "Rio de Janerio",
    2020: "Tokyo",
    2024: "Paris"
]
print(olympics[2012, default: "Unknown"])

//String: Int dictionary
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaq O'Neal"] = 216
heights["Lebron James"] = 206

//String: String dictionary
var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Spiderman"] = "Dr. Octopus"
//cannot have multiple same keys. so it overwrites
archEnemies["Batman"] = "Penguin"


//heights.removeAll()
print(archEnemies)
print(heights.count)







//Sets

let actors1 = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
//its like creating an array and putting them in the Set([Array])
//print(actors)

//another way to do
var actors = Set<String>()
actors.insert("Denzel Washington")
actors.insert("Tom Cruise")
actors.insert("Nicolas Cage")
actors.insert("Samuel L Jackson")
actors.insert("Nicolas Cage") //duplicates will not be added

print(actors)
print("No. of actors are: \(actors.count)")
print(actors.contains("Tom Cruise"))
print(actors.sorted())


var actress: Set<String> = ["Emma Watson", "Anne Hathaway"]






//Enum
    //state upfront the range of values the Enum can possible have
    
    
    
var selectedDay = "Monday"
selectedDay = "January" //A month????
selectedDay = "Friday " //has an extra space
//problem problem problem
    
    

enum Weekday{
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    //or like this
    //case monday, tuesday, wednesday, thursday, friday
}

print(Weekday.self)

var day = Weekday.monday
print(day)

day = Weekday.tuesday
print(day)

day = .wednesday //Swift knows .wednesday is Weekday because day was created to be Weekday
print(day)

day = .thursday
print(day)

day = Weekday.friday
print(day)














