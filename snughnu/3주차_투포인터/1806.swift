func solution(_ nums: [Int], _ s: Int) {
    let n: Int = nums.count
    var length: Int = Int.max
    var i: Int = 0
    var sum: Int = 0

    for j in (0..<n) {
        sum += nums[j]

        while sum >= s {
            length = min(length, j - i + 1)
            sum -= nums[i]
            i += 1
        }
    }

    if length == Int.max {
        length = 0
    }

    print(length)
}

let input: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }
let nums: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }
solution(nums, input[1])
