import sys
input = sys.stdin.readline

n = int(input())
#시도 1. list 하나를 만들어 index를 이동해 삽입 삭제 -> 시간초과
# for _ in range(n):
#     lis = list(input())
#     result = []
#     idx = 0
#     for x in lis:
#         if x == '<':
#             if idx == 0:
#                 idx = 0
#             else:
#                 idx -= 1
#         elif idx != len(lis) - 1 and x == '>':
#             idx += 1
#         elif x == '-' and result != []:
#             result.pop()
#         else:
#             result.insert(idx,x)
#             idx += 1
#
#     print(''.join(result))

for _ in range(n):
    line = input().strip()
    left = []
    right = []

    for ch in line:
        if ch == '<':
            if left:
                right.append(left.pop())
        elif ch == '>':
            if right:
                left.append(right.pop())
        elif ch == '-':
            if left:
                left.pop()
        else:
            left.append(ch)

    print(''.join(left + right[::-1]))