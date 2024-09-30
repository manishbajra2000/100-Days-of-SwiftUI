import Cocoa


enum squareRootErrors: Error {
    case OutOfBounds
    case NoRoot
}

func SquareRoot(of number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw squareRootErrors.OutOfBounds
    }
    
    var root = 0
    for i in 1...100 {
        if i*i == number {
            root = i
            break
        }
    }
    
    if root != 0 {
        return root
    }
    else {
        throw squareRootErrors.NoRoot
    }
    
}

do {
    let number = 10_000
    let squareroot = try SquareRoot(of: number)
    print("Square root   of \(number) is \(squareroot)")
}catch squareRootErrors.OutOfBounds {
    print ("Set the number between 1 to 10,000")
}catch squareRootErrors.NoRoot {
    print ("It does not have any integer root")
}catch {
    print ("Error occured: \(error.localizedDescription)")
}


