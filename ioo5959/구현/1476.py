import sys
input = sys.stdin.readline

E,S,M = map(int, input().split())
Es,Ss,Ms = 0,0,0
count = 0
while Es != E or Ss != S or Ms != M:
    count += 1
    Es = count % 15
    if Es == 0:
        Es = 15
    Ss = count % 28
    if Ss == 0:
        Ss = 28
    Ms = count % 19
    if Ms == 0:
        Ms = 19

print(count)