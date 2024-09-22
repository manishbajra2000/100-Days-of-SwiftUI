//Day 2

//Boolean
let file1Name = "Nepal.jpeg"
let line = "A curly brown fox tries to run away."
print(file1Name.hasSuffix(".jpeg"))
print(line.hasPrefix("A cat"))

let number3 = 120
print(number3.isMultiple(of: 3))

let goodDogs = true
var gameOver = false
gameOver.toggle()  //toggles boolean value, true
gameOver.toggle()  // toggles again, false


var isAuthenticated = false
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)
//data type is Bool like Int and Double

//Strings join
let firstPart = "Hello, "
let secondPart = "World!"
let greeting = firstPart + secondPart
print(greeting)

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

let name4 = "Taylor"
let age = 27
let message = "Hello, my name is \(name4) and I'm \(age) years old."
print(message)
print("5x5 is \(5*5)")



//Checkpoint 1
let celsius = 36.6
let fahrenheit = ((celsius * 9) / 5) + 32

var celsiusMsg = "Temperature in Celsius is \(celsius)"
var fahrenheitMsg = "Temperature in Fahrenheit is \(fahrenheit)"
print(celsiusMsg)
print(fahrenheitMsg)
