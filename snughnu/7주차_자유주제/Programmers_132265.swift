import Foundation

/*
오답: 시간초과
func solution(_ topping: [Int]) -> Int {
    var count: Int = 0

    for i in (1..<topping.count) {
        let leftSet = Set(Array(topping[..<i]))
        let rightSet = Set(Array(topping[i...]))

        if leftSet.count == rightSet.count { count += 1 }
    }

    return count
}
*/

func solution(_ topping: [Int]) -> Int {
    var count: Int = 0
    var leftSet: Set<Int> = []
    var rightDict: [Int: Int] = [:]

    // 먼저 모든 토핑을 rightDict에 저장
    for top in topping {
        rightDict[top, default: 0] += 1
    }

    // 왼쪽에서 하나씩 늘려가면서 비교하기
    for i in (0..<topping.count) {
        let t = topping[i]
        leftSet.insert(t)

        rightDict[t]! -= 1
        if rightDict[t]! == 0 {
            rightDict.removeValue(forKey: t)
        }

        if leftSet.count == rightDict.count {
            count += 1
        }
    }

    return count
}
