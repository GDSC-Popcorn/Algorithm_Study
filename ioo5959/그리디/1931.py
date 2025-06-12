import sys
input = sys.stdin.readline

n = int(input())
data = [list(map(int, input().split())) for _ in range(n)]
data.sort(key=lambda x: (x[1], x[0]))
count = 1
select = data[0][1]
for i in range(1, n):
    if data[i][0] >= select:
        select = data[i][1]
        count += 1

print(count)