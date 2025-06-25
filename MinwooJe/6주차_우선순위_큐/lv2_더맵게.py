import heapq as hq

def solution(scoville, K):
    hq.heapify(scoville)
    result = 0
    
    while len(scoville) >= 2:
        min1 = hq.heappop(scoville)
        min2 = hq.heappop(scoville)
        
        if min1 >= K: return result
        
        mixed = min1 + min2 * 2
        hq.heappush(scoville, mixed)
        result += 1
        
    if hq.heappop(scoville) >= K:
        return result
    else:
        return -1

