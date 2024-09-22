// Type Annotations

let surname = "Lasso"
var score = 0 // these are type inference
//here Swift infers surname and score is String and Int respectively

let surname1: String = "Lasso"
var score1: Int = 2
//here we are being specific that surname1 and score1 are String and Int respectively
//both does the same thing and there are no difference


//sometimes its not the same thing
var score3: Double = 3 //here 3 is not Int but a Double, which would have been inferred as an Int if we did not specify it.



//examples:
let playerName: String = "Gilchrit"
let luckyNumber: Int = 7
let isAuthenticated: Bool = true
var pi: Double = 3.14

var album: Array<String> = ["Red", "Fearless"]
var album1: [String] = ["Red1", "Fearless"]

var users: [Int: String] = [
    1: "Manish",
    7: "Ronaldo"
]

var books: Set<String> = [
    "It Ends With US",
    "Marry Me, Stranger",
    "Gone Girl",
    "Verity",
]


//these are all empty Array of String, for which values can be added later. but it can only be of String
var teams: [String] = [String]()
var clues: [String] = []
var cities = [String]()


//enums
enum UIStyle{
    case light, dark, system
}

var style = UIStyle.light
style = .dark  //once Swift knows what enums is chosen, no need to specify everytime
style = .system



//you can create a constant that doesnot have a value yet. And, once it has the value, it cannot be changes

let username: String
//after some complex code
username = "Mantie" //we cannot write other types than String because it is already annoted that username must be a String. And now it cannot be changed
print(username)




//checkpoint 2

var bookShelf = [String]()

bookShelf.append("Harry Potter")
bookShelf.append("Game of Thrones")
bookShelf.append("Silent Patient")
bookShelf.append("Harry Potter")
bookShelf.append("One of us is lying")
bookShelf.append("Rebecca")
bookShelf.append("Harry Potter")
bookShelf.append("Ugly Life")
bookShelf.append("Game of Thrones")
bookShelf.append("Reminders of Him")
bookShelf.append("It Ends With Us")
bookShelf.append("It Starts With Us")
bookShelf.append("Harry Potter")
bookShelf.append("Game of Thrones")
bookShelf.append("Rich Dad, Poor Dad")
bookShelf.append("Atomic Habits")


print("The number of books are: \(bookShelf.count)")

var uniqueBooks = Set(bookShelf)
//var uniqueBooks = Set<String>(bookShelf)
print("The number of unique books are: \(uniqueBooks.count)")

