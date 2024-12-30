import Cocoa

func returnANumber(arr: [Int]?) -> Int { return arr?.randomElement() ?? Int.random(in: 1...100) }

print(returnANumber(arr: []))



