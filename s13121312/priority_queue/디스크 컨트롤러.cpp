#include <bits/stdc++.h>
using namespace std;

struct comp {
    bool operator() (const vector<int>& a, const vector<int>& b) {
        return a[1] > b[1];
    }
};


bool cmp(vector<int>& a, vector<int>& b) {
    if(a[0] == b[0])return a[1] < b[1];
    return a[0] < b[0];
}

//작업의 소요시간이 짧은 것, 
//작업의 요청 시각이 빠른 것,   0, 1, 3
//작업의 번호가 작은 것 순으로 우선순위가 높습니다.
int solution(vector<vector<int>> jobs) {
    int answer = 0;
    int time = 0;
    int j =0 ;
    sort(jobs.begin(), jobs.end(), cmp);
    priority_queue<vector<int>, vector<vector<int>>, comp> pq; //작업의 소요시간
    
    //남은게 없고 우선순위 큐가 빌때까지 반복
    while(j < jobs.size() || !pq.empty()) {
        if(j< jobs.size() && time >= jobs[j][0]) {
            pq.push(jobs[j++]);
            continue;  //같은 시간대에 들어온게 있을수 있으니 한 번 체크해줘야함
        }
        
        if(!pq.empty()) {
            time += pq.top()[1];
            answer += time - pq.top()[0];
            pq.pop();
        } else {
            //큐가 비어있을때는 
            time = jobs[j][0];  //바로 다음 시작 시간으로 초기화해줌
        }
    }
    
    
    
    return answer / jobs.size();
}