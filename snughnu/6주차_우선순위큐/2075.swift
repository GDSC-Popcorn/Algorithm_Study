// 백준 2075 N번째 큰 수

/*
최소힙 사용
- 최대 n개까지 유지
- 입력되는 수를 하나씩 힙에 삽입
- 힙 크기가 n이 넘으면 루트(가장 작은 값) 제거
- 마지막에 루트값이 n번째 큰 수가 됨
 */

/*
 오답1: solution1메서드: 배열을 사용해봤지만 역시 시간복잡도에서 문제가 됩니다.
 오답2: solution메서드: 구조체를 사용하면 조금 빨라져서 해봤는데 아직 문제가 됩니다.
 */

func solution1(_ arrays: [[Int]]) {
    let n: Int = arrays.count

    var heap: [Int] = [0]   // 0은 인덱스 처리를 위한 더미값,

    func insert(_ value: Int) {
        heap.append(value)

        // bubble up
        var index = heap.count - 1
        while index > 1 && heap[index] < heap[index/2] {
            heap.swapAt(index, index/2)
            index /= 2
        }
    }

    func removeMin() {
        heap[1] = heap.removeLast()

        // bubble down
        var index = 1
        while index*2 < heap.count {
            var child = index*2
            if child + 1 < heap.count &&
                heap[child + 1] < heap[child] {
                child += 1
            }
            if heap[index] <= heap[child] { break }

            heap.swapAt(index, child)
            index = child
        }
    }

    for array in arrays {
        for num in array {
            if heap.count <= n {
                insert(num)
            } else if num > heap[1] {
                removeMin()
                insert(num)
            }
        }
    }

    print(heap[1])
}

// heap 구조체 정의
struct MinHeap {
    private var heap = [Int]()

    init() {
        heap.append(0)
    }

    var count: Int {
        return heap.count - 1
    }

    var top: Int {
        return heap[1]
    }

    mutating func insert(_ value: Int) {
        heap.append(value)

        // bubble up
        var index = heap.count - 1
        while index > 1 && heap[index] < heap[index/2] {
            heap.swapAt(index, index/2)
            index /= 2
        }
    }

    mutating func removeMin() {
        guard heap.count > 1 else { return }
        heap.swapAt(1, heap.count - 1)
        _ = heap.removeLast()

        // bubble down
        var index = 1
        while index*2 < heap.count {
            var child = index * 2
            if child + 1 < heap.count &&
                heap[child + 1] < heap[child] {
                child += 1
            }
            if heap[index] <= heap[child] { break }

            heap.swapAt(index, child)
            index = child
        }
    }
}

func solution(_ arrays: [[Int]]) {
    let n = arrays.count
    var heap = MinHeap()

    for array in arrays {
        for num in array {
            if heap.count < n {
                heap.insert(num)
            } else if num > heap.top {
                heap.removeMin()
                heap.insert(num)
            }
        }
    }

    print(heap.top)
}

let n: Int = Int(readLine()!)!
var arrays: [[Int]] = []
for _ in (0..<n) {
    let line: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }
    arrays.append(line)
}

solution(arrays)
