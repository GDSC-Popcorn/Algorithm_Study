import sys
input = sys.stdin.readline

n = int(input())
lis = map(int, input().split())
lis = sorted(lis, reverse=True)

path = []
check = [False] * n
max_sum = 0
def relocation(path,check):
    global max_sum
    if len(path) == n:
        calcul = 0
        for i in range(n-1):
            calcul += abs(path[i] - path[i+1])
        max_sum = max(max_sum, calcul)
        return

    for i in range(n):
        if not check[i]:
            check[i] = True
            relocation(path + [lis[i]],check)
            check[i] = False


relocation(path, check)
print(max_sum)