import Cocoa

let
files = ["me.jpg", "work.txt", "sophie.jpg"]

for file in files {
    if file.hasSuffix(".jpg") == false {
        print("Did not find it.")
    }else{
        print("Found picture: \(file)")
    }
    continue
    
    if !file.hasSuffix(".txt") {
        print("Its not txt file.")
    }else{
        print("It's txt file.")
    }
    
    print()
    
}



func printTimesTable(for number: Int) {
    for i in 1...10 {
        print("\(number) * \(i) = \(number * i)")
    }
}

printTimesTable(for: 4343)


class Vehicle {
    var isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    var isConvertibel: Bool
    
    init(convertibleHora: Bool, electricHora: Bool) {
        self.isConvertibel = convertibleHora
        super.init(isElectric: electricHora)
    }
}
