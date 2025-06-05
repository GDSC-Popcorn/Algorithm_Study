import sys
input = sys.stdin.readline

n = int(input())
matrix = [list(map(int, input().split())) for _ in range(n)]

dp = [[0] *3 for _ in range(n)] # 가능한 경우의 수를 저장할 dp
dp[0] = matrix[0][:] # 첫 줄은 그대로 넣음

for i in range(1, n):
    dp[i][0] = matrix[i][0] + min(dp[i - 1][1], dp[i - 1][2])
    dp[i][1] = matrix[i][1] + min(dp[i - 1][0], dp[i - 1][2])
    dp[i][2] = matrix[i][2] + min(dp[i - 1][0], dp[i - 1][1])

print(min(dp[n-1])) #마지막 경우들 중 최솟값 출력