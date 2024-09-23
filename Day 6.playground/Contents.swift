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





