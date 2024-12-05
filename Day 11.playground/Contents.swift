import Cocoa

struct BankAccount {
    private(set) var funds: Int = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        }
        else {
            return false
        }
    }
}

var account =  BankAccount()
account.deposit(amount: 100)

let success = account.withdraw(amount: 50)

if success {
    print("Withdrawal successful")
}else {
    print("Insufficient funds")
}
print(account.funds)

//account.funds -= 1000

print(account.funds)


//access controls
/*
 private                 Don't let anything outside the struct use this.
 fileprivate             Don't let anything outside the current file use this.
 public                  Let anyone, anywhere use this.
 private(set)            Don;t let anything outside write to this, but can read this.
 */



//TIP: if you have a private access control value property inside your struct there is a good chance you have to create your own initializer


struct SecretAgent {
    private var actualName: String
    public var codeName: String
    init(name: String, codeName: String) {
        self.actualName = name
        self.codeName = codeName
    }
}
let bond = SecretAgent(name: "James Bond", codeName: "007")
print(bond.codeName)


struct RebelBase {
    private var location: String
    private var peopleCount: Int
    
    init(location: String, people: Int) {
        self.location = location
        self.peopleCount = people
    }
}

let rebels = RebelBase(location: "Galactic Republic", people: 100000)

struct School {
    var staffNames: [String]
    private(set) var studentNames: [String]
    init(staff: [String]) {
        self.staffNames = staff
        self.studentNames = ["Mr. Potter"]
    }
}
let royalHigh = School(staff: ["Mrs Hughes"])
print(royalHigh.studentNames)

struct Toy {
    var customerPrice: Double
    private var actualPrice: Int
    init(price: Int) {
        actualPrice = price
        customerPrice = Double(actualPrice) * 2
    }
}
let buzz = Toy(price: 10)


struct LittleAngels {
    nonisolated(unsafe) static var studentCount: Int = 0
    
    static func addStudent(student: String) {
        print("\(student) has joined the Little Angels")
        studentCount += 1
    }
}

LittleAngels.addStudent(student: "Mr. Potter")
LittleAngels.addStudent(student: "Mrs. Hughes")
print(LittleAngels.studentCount)

