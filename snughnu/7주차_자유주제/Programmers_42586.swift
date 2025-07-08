func solution(_ progresses: [Int], _ speeds: [Int]) -> [Int] {
    // 남은 배포일 계산
    var days: [Int] = []
    for i in 0..<progresses.count {
        let remainDay = ((100 - progresses[i]) + (speeds[i] - 1)) / speeds[i]
        days.append(remainDay)
    }

    // 스택에 넣으면서 결과 만들기
    var stack: [Int] = []
    var result: [Int] = []
    for day in days {
        if stack.isEmpty {
            stack.append(day)
        } else if day <= stack.last! {              // day가 top과 같거나 작으면 같은 배포일
            stack.append(stack.last!)
        } else {                                    // day가 top보다 크면 날짜 기록하고, stack 초기화(pop)
            result.append(stack.count)
            stack = [day]
        }
    }

    if !stack.isEmpty {
        result.append(stack.count)
    }

    return result
}

// 스택을 사용하지 않는 버전
func solution2(_ progresses: [Int], _ speeds: [Int]) -> [Int] {
    var days: [Int] = []
    for i in 0..<progresses.count {
        let remainDay = ((100 - progresses[i]) + (speeds[i] - 1)) / speeds[i]
        days.append(remainDay)
    }

    var result: [Int] = []
    var current = days[0]
    var count = 1

    for i in 1..<days.count {
        if days[i] <= current {
            count += 1
        } else {
            result.append(count)
            current = days[i]
            count = 1
        }
    }

    result.append(count)
    return result
}
