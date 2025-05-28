import sys
input = sys.stdin.readline
from collections import deque

n, d, k, c = map(int, input().split())
lis = [int(input()) for _ in range(n)]

# 방법1 슬라이싱 -> 슬라이싱이 원형으로 진행되지 않아 right가 n을 넘어가면 k개로 슬라이싱이 안 됨
# left, right = 0,k
# max_value = 0
# for _ in range(n):
#     customer = lis[left:right]
#     if len(customer) == len(set(customer)):
#         if c in customer:
#             max_value = k+1
#         else:
#             max_value = k
#     left += 1
#     if right < n:
#         right += 1
#     elif right == n:
#         right = -1
#     else:
#         right -= 1

window = deque()
for i in range(k-1):
    window.append(lis[i])

max_value = 0
for i in range(n):
    window.append(lis[(i + k - 1) % n])

    susi_kind = set(window)
    if c not in susi_kind:
        max_value = max(max_value, len(susi_kind) + 1)
    else:
        max_value = max(max_value, len(susi_kind))

    window.popleft()

print(max_value)