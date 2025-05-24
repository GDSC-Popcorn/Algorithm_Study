// 1차 구현 -> 재귀 사용
func solution(_ numbers: String) -> Int {
    let digits: [Character] = Array(numbers)
    var resultSet: Set<Int> = Set()

    func dfs(_ current: String, _ remain: [Character]) {
        if let num = Int(current), isPrime(num) {
            resultSet.insert(num)
        }

        for i in (0..<remain.count) {
            var newRemain = remain
            let nextChar = newRemain.remove(at: i)
            dfs(current + String(nextChar), newRemain)
        }
    }

    dfs("", digits)

    return resultSet.count
}

func isPrime(_ num: Int) -> Bool {
    let sqrtNum = Int(Double(num).squareRoot())

    if num < 2 { return false }
    if sqrtNum < 2 { return true }

    for i in 2...sqrtNum {
        if num % i == 0 { return false }
    }
    return true
}

// 개선 -> 백트래킹 적용
func solution(_ numbers: String) -> Int {
    let digits: [Character] = Array(numbers)
    var visited: [Bool] = [Bool](repeating: false, count: digits.count)
    var resultSet: Set<Int> = Set()

    func dfs(_ current: String) {
        if let num = Int(current), isPrime(num) {
            resultSet.insert(num)
        }

        for i in (0..<digits.count) {
            if visited[i] { continue }

            visited[i] = true
            dfs(current + String(digits[i]))
            visited[i] = false
        }
    }

    dfs("")
    return resultSet.count
}

func isPrime(_ num: Int) -> Bool {
    let sqrtNum = Int(Double(num).squareRoot())

    if num < 2 { return false }
    if sqrtNum < 2 { return true }

    for i in 2...sqrtNum {
        if num % i == 0 { return false }
    }
    return true
}
