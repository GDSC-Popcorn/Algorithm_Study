import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    var result = Int.max
    var pickCosts = [           // 광물: 곡괭이 인덱스 별 피로도
        "diamond": [1, 5, 25],
        "iron": [1, 1, 5],
        "stone": [1, 1, 1]
    ]
    
    func bruteforce(_ picks: [Int], _ idx: Int, _ cost: Int) {
        if idx == minerals.count || picks.reduce(0, +) == 0 {
            result = min(result, cost)
            return
        }
        
        for pickIdx in 0..<3 {
            guard picks[pickIdx] > 0 else { continue }
            var picks = picks
            var cost = cost
            var idx = idx

            picks[pickIdx] -= 1

            for _ in 0..<5 {
                guard idx < minerals.count else { break }
                cost += pickCosts[minerals[idx]]![pickIdx]
                idx += 1
            }
            bruteforce(picks, idx, cost)
        }
    }
    
    bruteforce(picks, 0, 0)
    
    return result
}
