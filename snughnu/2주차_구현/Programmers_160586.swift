func solution(_ keymap: [String], _ targets: [String]) -> [Int] {
    var result: [Int] = []
    for target in targets {
        let arrTarget = Array(target)
        var sumCount: Int = 0
        for i in (0..<arrTarget.count) {
            var minCount: Int = Int.max
            for keyString in keymap {
                let count = mapping(keyString, arrTarget[i])
                if count < minCount { minCount = count }
            }

            if minCount == Int.max {
                sumCount = -1
                break
            }

            sumCount += minCount
        }
        result.append(sumCount)
    }
    return result
}

func mapping(_ key: String, _ char: Character) -> Int {
    var result: Int = Int.max
    let arrKey: [Character] = Array(key)

    for i in (0..<arrKey.count) {
        if char == arrKey[i] {
            result = i + 1
            break
        }
    }

    return result
}
