// 1931 회의실 배정
func solution(_ meetings: [[Int]]) {
    // 완전탐색의 방법이 떠오르기도 하지만 시간복잡도가 너무 큼
    // 정렬된 meetings에서
        // 앞 회의 이후에서
            // 가장 빨리 시작하고 회의 시간이 가장 짧은거
            // -> 오류: 조금 늦게 시작하더라도 더 빨리 끝날 수 있음
        // 가장 먼저 끝나는 회의를 선택한다

    var result: Int = 0
    var endTime: Int = 0

    for meeting in meetings {
        let start = meeting[0]
        let end = meeting[1]

        if start >= endTime {
            endTime = end
            result += 1
        }
    }
    
    print(result)
}

let count: Int = Int(readLine()!)!
var meetings: [[Int]] = []
for _ in (0..<count) {
    let meeting = readLine()!.split(separator: " ").compactMap { Int($0) }
    meetings.append(meeting)
}

let sortedMeetings: [[Int]] = meetings.sorted {
    if $0[1] == $1[1] {         // 끝나는 시간이 같으면
        return $0[0] < $1[0]    // 시작 시간 기준으로 오름차순
    } else {                    // 끝나는 시간이 다르면
        return $0[1] < $1[1]    // 끝나는 시간 기준으로 오름차순
    }
}

solution(sortedMeetings)
