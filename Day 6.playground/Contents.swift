// Day 6

// LOOPS

let platforms = ["iOS", "macOS", "watchOS", "tvOS"]

for os in platforms {
    print("Swift works great on \(os)")
}


for platform in platforms {
    print("Swift works great on \(platform)")
}
print()
print()
print()
print()

for i in 1...12{
    print("Multiplication Table of \(i)")
    for j in 1...12{
        print("    5 x \(j) = \(5*j)")
    }
    print()
}


for i in 1...5{
    print("Counting 1 through 5: \(i)")
}

print()

for i in 1..<5{
    print("Counting 1 up to 5: \(i)")
}

var lyric = "Haters gonna "
for _ in 1...5 {
    lyric += "hate"
}

var rep = 1
for _ in 1...10{
    print(rep)
    rep += 1
}


let names = ["Piper", "Alex", "Suzanne", "Gloria"]
print(names[0])

print(names[1...3])

print(names[2...])



//WHILE LOOP

var countDown = 10

while countDown > 0 {
    print("\(countDown)...")
    countDown-=1
}
print("BLAST OFF!!!")

let randomInt: Int = Int.random(in: 0...1000)
let randomDouble: Double = Double.random(in: 0...100)
print(randomInt)
print(randomDouble)

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll).")
}

print("Critical Hit!!!")


let fileNames = ["hello.jpg", "hola.jpg", "sayonara.txt", "bonjour.jpg"]

for fileName in fileNames {
    if !fileName.hasSuffix("jpg") {
        continue
    }
    
    print("Found an image: \(fileName)")
}


let number1 = 5
let number2 = 9
var multiples = [Int]()


for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}
print(multiples)


let options = ["up", "down", "left", "right"]

let secretCombination = ["right", "left", "up"]

outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            
            let attempt = [option1, option2, option3]
            if attempt == secretCombination {
                print("The combination is \(attempt)")
                break outerLoop
            }
        }
    }
}


print()
print()
print()
print()


// CHECKPOINT 3

for i in 1...100{
    if i.isMultiple(of: 3){
        print("Fizz")
    }
    else if i.isMultiple(of: 5){
        print("Buzz")
    }
    else if i.isMultiple(of: 5) && i.isMultiple(of: 3) {
        print("FizzBuzz")
    }
    else {
        print(i)
    }
}
//
//print()
//print()
//print()
//print()
//
//var i = 1
//while i<=100 {
//    if i.isMultiple(of: 3){
//        print("Fizz")
//    }
//    else if i.isMultiple(of: 5){
//        print("Buzz")
//    }
//    else if i.isMultiple(of: 5) && i.isMultiple(of: 3) {
//        print("FizzBuzz")
//    }
//    else {
//        print(i)
//    }
//    i += 1
//}
//
//var j = 1
//repeat {
//    if j.isMultiple(of: 3){
//        print("Fizz")
//    }
//    else if j.isMultiple(of: 5){
//        print("Buzz")
//    }
//    else if j.isMultiple(of: 5) && j.isMultiple(of: 3) {
//        print("FizzBuzz")
//    }
//    else {
//        print(i)
//    }
//    j += 1
//} while j<=100







