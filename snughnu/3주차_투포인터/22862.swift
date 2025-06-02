func solution(_ nums: [Int], _ k: Int) {
    // 홀수를 최대 k개 삭제할 수 있다는 말은
    // 홀수의 개수가 k개 이하인 부분수열의 최대길이를 구하고 홀수의 개수를 빼면 됨

    let n: Int = nums.count
    var evenCount: Int = 0
    var oddCount: Int = 0
    var i: Int = 0              // 부분수열의 왼쪽
    var j: Int = 0              // 부분수열의 오른쪽

    while j < n {
        if nums[j] % 2 == 1 {
            oddCount += 1
        }

        while oddCount > k {
            if nums[i] % 2 == 1 {
                oddCount -= 1
            }
            i += 1
        }

        evenCount = max(evenCount, j - i + 1 - oddCount)
        j += 1
    }

    print(evenCount)
}

let input: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }
let nums: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }

solution(nums, input[1])
