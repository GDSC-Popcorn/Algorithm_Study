import sys
input = sys.stdin.readline

n,m = map(int, input().split())
dna = [input() for _ in range(n)]
result = ''
count = 0
for i in range(m):
    dic = {'A':0, 'C':0, 'G':0, 'T':0}
    for j in range(n):
        dic[dna[j][i]] += 1
    min_keys = [key for key, value in dic.items() if value == max(dic.values())]
    dna_key = min(min_keys) # 최소값을 가지는 key들 중 사전순으로 최소
    result += dna_key
    #최소값의 key를 제외한 나머지 key들의 value값 합
    count += sum(value for key,value in dic.items() if key != dna_key)

print(result)
print(count)

