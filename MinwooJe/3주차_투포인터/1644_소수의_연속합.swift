import Foundation

let n = Int(readLine()!)!
let primes = getPrimes(n)
var result = 0

// n이하의 소수가 존재하지 않는다면 (ex. n == 1) 실행하지 않음.
if !primes.isEmpty {
    var r = 0
    var sum = primes[0]

    for l in 0..<primes.count {
        while sum < n && r < primes.count - 1 {
            r += 1
            sum += primes[r]
        }
        
        if sum == n {
            result += 1
        }
        sum -= primes[l]
    }
}

print(result)

/// 에라토스테네스의 체를 이용해 n 이하의 모든 소수를 구함.
func getPrimes(_ n: Int) -> [Int] {
    guard n >= 2 else { return [] }
    var isPrime = Array(repeating: true, count: n + 1)
    let end = Int(sqrt(Double(n)))

    for i in 2..<end + 1 {
        guard isPrime[i] else { continue }
        for j in stride(from: i + i, through: n, by: i) {
            isPrime[j] = false
        }
    }
    
    return (2...n).filter { isPrime[$0] }
}
