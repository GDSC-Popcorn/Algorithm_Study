import sys
input = sys.stdin.readline

n = int(input())
change = 1000 - n
coin = [500, 100, 50, 10, 5, 1]
count = 0
for c in coin:
    count += change // c
    change %= c

print(count)