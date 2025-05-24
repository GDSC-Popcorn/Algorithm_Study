import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    var (zeroCount, oneCount) = (0, 0)
    
    func divideOrCount(_ len: Int, _ baseRow: Int, _ baseCol: Int) {
        let element = arr[baseRow][baseCol]
        
        // 모든 수가 같은지 확인
        for row in baseRow..<baseRow + len {
            for col in baseCol..<baseCol + len {
                if arr[row][col] != element {   // 다른 수가 나온다면 4등분
                    let nextLen = len / 2
                    divideOrCount(nextLen, baseRow, baseCol)
                    divideOrCount(nextLen, baseRow, baseCol + nextLen)
                    divideOrCount(nextLen, baseRow + nextLen, baseCol)
                    divideOrCount(nextLen, baseRow + nextLen, baseCol + nextLen)
                    return       // 해당 영역의 모든 수가 같지 않으니 더 이상 볼 것도 없이 등분하고 끗.
                }
            }
        }
        
        // 해당 영역의 모든 수가 같을 때만 실행됨.
        if element == 0 {
            zeroCount += 1
        } else {
            oneCount += 1
        }
    }
    
    divideOrCount(arr.count, 0, 0)

    return [zeroCount, oneCount]
}
