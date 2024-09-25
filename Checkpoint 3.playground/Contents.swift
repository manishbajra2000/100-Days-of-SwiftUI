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


