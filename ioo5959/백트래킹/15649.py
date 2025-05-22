import sys
input = sys.stdin.readline

n,m = map(int, input().split())
lis = []
for i in range(n):
    lis.append(i+1)

path = []
check = [False] * n
def backtrack(path, check):
    if len(path) == m:
        print(*path)
        return

    for i in range(n):
        if not check[i]:
            check[i] = True
            backtrack(path + [lis[i]], check)
            check[i] = False

backtrack(path, check)