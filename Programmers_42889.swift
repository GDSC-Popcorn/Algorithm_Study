func solution(_ N: Int, _ stages: [Int]) -> [Int] {
    var stageInfo: [(stage: Int, failureRate: Double)] = []
    var remainPlayer = stages.count
    var stageCounts = Array(repeating: 0, count: N+2)
    for stage in stages {
        stageCounts[stage] += 1
    }

    for i in (1...N) {
        let failed = stageCounts[i]
        let failureRate: Double = remainPlayer == 0 ? 0.0 : Double(failed) / Double(remainPlayer)
        stageInfo.append((i, failureRate))
        remainPlayer -= failed
    }

    let result: [Int] = stageInfo.sorted {
        if $0.failureRate == $1.failureRate {
            $0.stage < $1.stage
        }
        return $0.failureRate > $1.failureRate
    }.map { $0.stage }

    return result
}
