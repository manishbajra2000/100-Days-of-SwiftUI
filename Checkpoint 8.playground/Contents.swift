import Cocoa

protocol Building {
    var noOfRooms: Int { get set }
    var cost: Int { get set }
    var realEstateAgent: String { get set }
    func summary()
}

extension Building {
    func summary() {
        print(
            """
            Number of Rooms: \(noOfRooms)
            Cost: \(cost)
            Agent: \(realEstateAgent)
            """
        )
    }
}

struct House: Building {
    var noOfRooms: Int
    var cost: Int
    var realEstateAgent: String
}

struct Office: Building {
    var noOfRooms: Int
    var cost: Int
    var realEstateAgent: String
}


let bajracharyaResidence = House(noOfRooms: 4, cost: 1000000, realEstateAgent: "Bajracharya")
let bajraTech = Office(noOfRooms: 5, cost: 2000000, realEstateAgent: "Bajra")

bajracharyaResidence.summary()
bajraTech.summary()
