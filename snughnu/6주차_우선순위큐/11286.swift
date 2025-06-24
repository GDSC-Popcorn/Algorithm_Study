// 백준_11286 절댓값 힙
/*
 오답1. 절대값이 같은 값이 여러 개일 경우에는 작은 수를 먼저 출력해야함
 */
func solution(_ calculations: [Int]) {
    var heap: [Int] = [0]           // heap[0]은 0으로 더미 값

    func insert(_ value: Int) {
        heap.append(value)

        /* 오답 1
        // bubble up
        var index = heap.count - 1
        while index > 1 && abs(heap[index]) < abs(heap[index/2]) {
            heap.swapAt(index, index/2)
            index /= 2
        }
         */

        // bubble up
        var index = heap.count - 1
        while index > 1 {
            let parent = index / 2
            if abs(heap[index]) < abs(heap[parent]) ||
               (abs(heap[index]) == abs(heap[parent]) &&
                heap[index] < heap[parent]) {
                heap.swapAt(index, parent)
                index = parent
            } else {
                break
            }
        }
    }

    func removeMin() -> Int {
        if heap.count == 1 {
            return 0
        } else if heap.count == 2 {
            return heap.removeLast()
        } else {
            let minValue = heap[1]
            heap[1] = heap.removeLast()

            /*
             오답1.
             
            // bubble down
            var index: Int = 1
            while index*2 < heap.count {
                var child = index * 2
                if child + 1 < heap.count && abs(heap[child+1]) < abs(heap[child]) {
                    child += 1
                }

                if abs(heap[index]) <= abs(heap[child]) { break }

                heap.swapAt(index, child)
                index = child
            }

             */
            var index: Int = 1
            while index * 2 < heap.count {
                var child = index * 2
                if child + 1 < heap.count &&
                    (abs(heap[child + 1]) < abs(heap[child]) ||
                     (abs(heap[child + 1]) == abs(heap[child]) &&
                      heap[child + 1] < heap[child])) {
                    child += 1
                }

                if abs(heap[index]) < abs(heap[child]) ||
                   (abs(heap[index]) == abs(heap[child]) &&
                    heap[index] <= heap[child]) {
                    break
                }

                heap.swapAt(index, child)
                index = child
            }

            return minValue
        }
    }

    for calculation in calculations {
        if calculation == 0 {
            print(removeMin())
        } else {
            insert(calculation)
        }
    }
}

let n: Int = Int(readLine()!)!
var calculations: [Int] = []
for _ in (0..<n) {
    calculations.append(Int(readLine()!)!)
}
solution(calculations)
