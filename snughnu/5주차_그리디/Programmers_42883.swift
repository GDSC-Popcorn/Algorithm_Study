func solution(_ number: String, _ k: Int) -> String {
    // 완전탐색을 생각해보면
        // 1924 -> [19, 12, 14, 92, 94, 24].max()를 사용하면 되지만
        // number가 10^6까지 가능하므로 시간초과가 발생할거임

    // number를 순회하면서 i번째 자리숫자가 i+1보다 작으면 삭제 (삭제횟수가 k까지)
    // 시간복잡도 생각해보면
        // number순회 -> O(n)
        // 삭제하는걸 -1로 변경하거나 실제로 삭제 -> 스택을 써도 될듯
        // -1이 아닌 숫자를 모아서 리턴
    // 예시
        // 4177252841 / 0
        // 477252841  / 1
        // 77252841   / 2
        // 7752841    / 3
        // 775841     / 4

    /*
    오답 1. 스택기반(삭제하는 로직)을 사용안하고 -1로 변경하는 걸로 했더니 case3의 예시처럼 다시 검사해야하는걸 놓침

    // var number: [Int] = number.compactMap { Int(String($0)) }
    // var deleteCount: Int = k
    // var result: String = ""

    // // i-1 자릿수가 i보다 작으면 i-1 자릿수를 -1로 변경
    // var i: Int = 1
    // while deleteCount != 0 && i < number.count {
    //     if number[i-1] < number[i] {
    //         number[i-1] = -1
    //         deleteCount -= 1
    //     }
    //     i += 1
    // }
    //
    //     // 결과 만들기
    // for num in number {
    //     if num != -1 {
    //         result += String(num)
    //     }
    // }

    */

    var stack: [Character] = []
    var deleteCount: Int = k

    // 스택기반으로 수정
        // top이 넣을 수 보다 작으면 removeLast()
    for digit in number {
        while !stack.isEmpty && deleteCount > 0 && stack.last! < digit {
            stack.removeLast()
            deleteCount -= 1
        }
        stack.append(digit)
    }

    /*
    오답 2. deleteCount가 남아있는 경우(마지막부분을 삭제해야하는 경우)가 있었음
    */
    if deleteCount > 0 {
        stack.removeLast(deleteCount)
    }

    return String(stack)
}
