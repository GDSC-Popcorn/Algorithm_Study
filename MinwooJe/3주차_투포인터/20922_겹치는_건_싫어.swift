let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var result = 0
var r = 0
var countDict = [Int: Int]()

countDict[arr[0]] = 1
for l in 0..<n {
    while r < n - 1 {
        guard countDict[arr[r + 1], default: 0] + 1 <= k else { break }
        r += 1
        countDict[arr[r], default: 0] += 1
    }
    
    result = max(result, r - l + 1)
    countDict[arr[l]]! -= 1
}

print(result)
