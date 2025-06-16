let n = Int(readLine()!)!
let people = readLine()!.split(separator: " ").map { Int($0)! }
var sum = 0
var temp = 0

for p in people.sorted() {
    temp += p
    sum += temp
}

print(sum)
