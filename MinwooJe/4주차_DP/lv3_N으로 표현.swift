func solution(_ N:Int, _ number:Int) -> Int {
    // arr[0]: N을 1번 사용해 만든 수들, arr[1]: 2번 사용, arr[2]: 3번 사용, ...
    var arr = Array(repeating: Set<Int>(), count: 8)
    
    for repeating in 1...8 {        // 숫자 N을 repeating만큼 사용했을 때
        var numbers = Set<Int>()
        numbers.insert(Int(String(repeating: "\(N)", count: repeating))!)       // 5, 55, 555, ... 미리 넣기.

        for i in 1..<repeating {
            let (left, right) = (i, repeating - i)      // ex. N = 4일때 (1, 3), (2, 2), (3, 1)
            numbers = numbers.union(operate(arr[left - 1], arr[right - 1]))
        }
        
        arr[repeating - 1] = arr[repeating - 1].union(numbers)
    }


    // 가장 작은 반복 횟수 찾기.
    for i in 0..<arr.count {
        if arr[i].contains(number) {
            return i + 1
        }
    }

    return -1
}

/// 두 집합의 모든 원소를 사칙연산. CROSS JOIN 입니다..ㅋㅋ
func operate(_ left: Set<Int>, _ right: Set<Int>) -> Set<Int> {
    var result = Set<Int>()
    
    for l in left {
        for r in right {
            result.insert(l + r)
            result.insert(l - r)
            result.insert(l * r)
            if r != 0 {
                result.insert(l / r)
            }
        }
    }
    
    return result
}
