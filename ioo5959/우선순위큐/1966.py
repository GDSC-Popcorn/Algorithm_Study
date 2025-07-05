import sys
input = sys.stdin.readline
from collections import deque

m = int(input())

for i in range(m):
    n, target = map(int, input().split())
    lis = list(map(int, input().split()))
    lis_print = []
    queue = deque((i, val) for i, val in enumerate(lis))
    while queue: #큐가 빌 때까지 반복
        max_value = max(queue, key=lambda x: x[1])
        check = queue.popleft()
        if check == max_value:
            lis_print.append(check)
        else:
            queue.append(check)

    count = 0
    for k in lis_print:
        count += 1
        if k[0] == target:
            print(count)
            break