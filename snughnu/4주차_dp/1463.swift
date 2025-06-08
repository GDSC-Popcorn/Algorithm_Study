/*
 1차 시도 문제점
 - 그냥 떠올리는데로 해봄
 - 모든 케이스를 생각하는 로직이 아님
 - BFS를 쓴다해도 시간초과가 날거임
 
 func solution(_ num: Int) {
     var calculatedNum = num
     var result = 0
 
     while calculatedNum != 1 {
         if calculatedNum % 3 == 0 {
             calculatedNum = calculatedNum / 3
         } else if calculatedNum % 2 == 0 {
             calculatedNum = calculatedNum / 2
         } else {
             calculatedNum -= 1
         }
         result += 1
     }

 print(result)
}
 */

/*
 재설계 -> DP문제임을 생각하고 점화식을 구해봄
 - 이전단계에서 +1이 되는 구조
 - 즉, dp[i] = dp[i-1] + 1
 */

func solution(_ num: Int) {
    var dp: [Int] = Array(repeating: 0, count: num + 1)

    if num == 1 {
        print(0)
    }

    for i in (2...num) {
        dp[i] = dp[i-1] + 1
        if i % 2 == 0 {
            dp[i] = min(dp[i], dp[i/2] + 1)
        }
        if i % 3 == 0 {
            dp[i] = min(dp[i], dp[i/3] + 1)
        }
    }

    print(dp[num])
}

let num = Int(readLine()!)!
solution(num)
