import Cocoa

class Animal {
    let legs: Int = 4
}

class Dog: Animal {
    func speak() {
        print("Woof Woof!")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Yip Yip!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Arf Arf!")
    }
}


class Cat: Animal {
    var isTame: Bool = true
    init(isTame: Bool) {
        self.isTame = isTame
    }
    func speak() {
        print("Meow!")
    }
}

class Persian: Cat {
    override func speak() {
        print("Mew Mew!")
    }
}

class Lion: Cat {
    override func speak() {
        print("Roar!")
    }
    override init (isTame: Bool) {
        super.init(isTame: isTame)
    }
}

let elephant = Animal()
print("Legs: \(elephant.legs)")

let dog = Dog()
print("Legs: \(dog.legs)")
dog.speak()

let corgi = Corgi()
print("Legs: \(corgi.legs)")
corgi.speak()

let poodle = Poodle()
print("Legs: \(poodle.legs)")
poodle.speak()

let cat = Cat(isTame: true)
print("Legs: \(cat.legs)")







