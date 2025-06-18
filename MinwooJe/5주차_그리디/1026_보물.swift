// A: [Int], B: [Int] -> 길이 n
// 인덱스끼리의 곱
// 두 수의 합이 일정할 때 두 수의 차가 두 수의 곱은 작을 수록 커짐.
// Supp: a와 b의 합은 일정
//
// ex) a + b = 10일 때
// put: a = 1, b = 9 -> a * b = 9
// put: a = 2, b = 8 -> a * b = 16
// put: a = 3, b = 7 -> a * b = 21
// put: a = 4, b = 6 -> a * b = 24
// put: a = 5, b = 5 -> a * b = 25

// |A[i] - B[i]| 가 작도록 A 순서 바꾸면 됨.
// greedy: B의 가장 큰 원소 * A의 가장 작은 원소

let len = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
let seq = readLine()!.split(separator: " ").map { Int($0)! }
print(zip(arr.sorted(), seq.sorted { $0 > $1 }).reduce(0) { $0 + $1.0 * $1.1 })
