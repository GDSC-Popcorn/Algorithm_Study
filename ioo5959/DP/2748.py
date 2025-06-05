import sys
input = sys.stdin.readline

n = int(input())
lis = [0,1]
def fibo(f1, f2, count):
    if count >= n:
        return
    f3 = f1 + f2
    lis.append(f3)
    fibo(f2, f3, count+1)

fibo(0,1, 0)
print(lis[n])