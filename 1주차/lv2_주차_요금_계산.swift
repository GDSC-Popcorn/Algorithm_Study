import Foundation
/**
- 입차 후 출차 내역 없다면 23:59에 출차한 것.
- 초과한 시간이 단위 시간으로 나누어 떨어지지 않으면 올림
- 차량 번호가 작은 자동차부터 주차 요금 리턴
- 요금은 하루 주차 시간을 통해 "일괄 정산"

로직
1. 차 번호 별 총 주차 시간 구하기 => [차량 번호: 총 주차 시간] 딕셔너리에 저장
    1) 해당 차량의 OUT이 나올 때까지 IN 기록 저장 필요 => [차량 번호: 입차 시간] 딕셔너리에 저장
    2) OUT이 나온다면 [차량 번호] = nil 저장 -> 시간 계산해서 [차량 번호: 총 주차 시간] 딕셔너리 갱신
2. 총 주차 시간 -> 요금 변환 => [차량 번호: 요금] 딕셔너리에 저장
3. 결과 배열 리턴
*/

/// fees: [기본 시간, 기본 요금, 단위 시간, 단위 요금], records: [시각, 차량번호, 내역]
func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var enterTime = [String: Int]()
    var totalParkingTime = [String: Int]()
    var totalFee = [String: Int]()
    var result = [Int]()

    // 1. 총 주차 시간 구하기
    for record in records {
        let (time, carNum, isIn) = parseRecord(record)
        
        if isIn {
            enterTime[carNum] = time
        } else {
            let parkingTime = time - enterTime[carNum, default: 0]
            totalParkingTime[carNum, default: 0] += parkingTime
            enterTime[carNum] = nil
        }
    }
    
    // 출차하지 않은 차량 확인
    for (carNum, time) in enterTime {
        let parkingTime = parseToMinute(from: "23:59") - time
        totalParkingTime[carNum, default: 0] += parkingTime
    }

    // 2. 요금 변환
    for (carNum, time) in totalParkingTime {
        totalFee[carNum] = calculateFee(time, fees)
    }
    
    // 3. 정렬
    result = totalFee.sorted { $0.key < $1.key }.map { $0.value }
    
    return result
}

func parseRecord(_ record: String) -> (Int, String, Bool) {
    let components = record.components(separatedBy: " ")
    let time = parseToMinute(from: components[0])
    let carNum = components[1]
    let isIn = components[2] == "IN" ? true : false
    return (time, carNum, isIn)
}

func parseToMinute(from time: String) -> Int {
    let components = time.components(separatedBy: ":")
    let hour = Int(components[0])!
    let minute = Int(components[1])!
    return hour * 60 + minute
}

func calculateFee(_ time: Int, _ fees: [Int]) -> Int {
    if time <= fees[0] {
        return fees[1]
    } else {
        let additionalFee = (((time - fees[0] - 1) / fees[2]) + 1) * fees[3]
        return fees[1] + additionalFee
    }
}
