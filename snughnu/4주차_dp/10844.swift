// 쉬운 계단 수
func solution(_ len: Int) {
    /*
     점화식 생각하기
     - 길이가 N인 계단 수는 N-1에서 확장해서 생각
     - dp[i][j]는 길이가 i이고 시작하는 숫자가 j인 계단 수의 개수 (dp[2][1]: 10, 12)

     점화식
     - i-1의 길이면 시작하는 숫자가 j-1 또는 j+1
     - dp[i][j] = dp[i-1][j-1] + dp[i-1][j+1]

     점화식 주의
     - j==0 일때 dp[i][0] = dp[i-1][1] 임 (0은 1다음에만 가능)
     - j==9 일때 dp[i][9] = dp[i-1][8] 임 (9는 8다음에만 가능)

     초기값
     - dp[1][0] = 0
     - dp[1][1] ~ dp[1][9] = 1
     */

    let MOD: Int = 1000000000
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: len + 1)

    // 초기값
    for i in (1...9) {
        dp[1][i] = 1
    }

    if len >= 2 {
        for i in (2...len) {
            for j in (0...9) {
                if j == 0 {
                    dp[i][j] = dp[i-1][1] % MOD
                } else if j == 9 {
                    dp[i][j] = dp[i-1][8] % MOD
                } else {
                    dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % MOD
                }
            }
        }
    }

    let sum = dp[len].reduce(0, +)
    let result = sum % MOD
    print(result)
}

let len = Int(readLine()!)!
solution(len)
