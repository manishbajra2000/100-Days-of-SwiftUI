
//Day 1
var name = "Temporary" //var creates variable. you can change it later
let character = "Permanent" //let creates constants. you cannot change this ever

var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

let managerName = "Michael Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "How many roads must a man walk down?"

let quote = "Then he tapped a sign saying \"Believe\" and walked away."
print(quote) //use forward slash "\" to include double quotations in the string

let movie = """
A day in
the life of an
Apple engineer
"""
print(movie) //use three """ to include multiple line in strings

print(quote.count)

let movieLength = movie.count
print(movieLength)

print(dogBreed.uppercased())

//if you need swift to read something, you dont need (), and if you need swift to do something for you then you need ()

let fileName = "image.jpg"
print(movie.hasPrefix("A day"))
print(fileName.hasSuffix(".jpg"))




//Integer (whole number)
let score = 10
let reallyBigScore = 1_000_000_000_000  //swift ignores _, even multiple ___

let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score/2

//compound assignment operators
var counter = 10
print(counter)
counter += 5
print(counter)
counter *= 10
print(counter)
counter -= 5
print(counter)
counter /= 2
print(counter)

let number = 120
print(number.isMultiple(of: 3))


//Decimal Numbers
let number1 = 0.1 + 0.2
print(number1)  //error

let a = 1
let b = 2.0
let c = Double(a) + b  //or a + Int(b)

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

var name1 = "Nicolas Cage"
//name1 = 3 this is not allowed

var rating = 5.0
rating *= 2 //double also supports compounding operators




