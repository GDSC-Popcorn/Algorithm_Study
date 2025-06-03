let rowCount = Int(readLine()!)!
var house = [[Int]]()
var table = Array(repeating: [0, 0, 0], count: rowCount)

for _ in 0..<rowCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    house.append(input)
}

table[0] = house[0]

for i in 1..<rowCount {
    table[i][0] = house[i][0] + min(table[i - 1][1], table[i - 1][2])
    table[i][1] = house[i][1] + min(table[i - 1][0], table[i - 1][2])
    table[i][2] = house[i][2] + min(table[i - 1][0], table[i - 1][1])
}

print(table[rowCount - 1].min()!)

