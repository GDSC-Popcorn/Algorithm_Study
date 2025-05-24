func solution(_ numbers: [Int], _ target: Int) -> Int {
    var result: Int = 0

    func dfs(_ index: Int, _ currentSum: Int) {
        if index == numbers.count {  // 리프 노드이면
            if currentSum == target {
                result += 1
            }
            return
        }

        let number = numbers[index]
        dfs(index + 1, currentSum + number)
        dfs(index + 1, currentSum - number)
    }
    
    dfs(0, 0)
    
    return result
}
