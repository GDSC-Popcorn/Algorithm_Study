import sys
input = sys.stdin.readline

n = int(input())
lis = list(map(int, input().split()))

# 방법 1. 순차적으로 다 계산해보기
# mix_lis = []
# close = 0
# for i in range(n):
#     for j in range(i+1, n):
#         mix = lis[i] + lis[j]
#         if i == 0 and j == 1:
#             close = abs(mix)
#         close = min(close, abs(mix))
#         mix_lis.append(mix)

left = 0
right = n - 1
min_mix = abs(lis[left] + lis[right])
mix_lis = []
while left < right:
    mix = lis[left] + lis[right]
    min_mix = min(min_mix, abs(mix))
    mix_lis.append(mix)
    if mix < 0:
        left += 1
    elif mix > 0:
        right -= 1
    else:
        min_mix = 0
        break

result = 0
for mix in mix_lis:
    if abs(mix) == min_mix:
        result = mix
print(result)