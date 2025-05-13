#include <bits/stdc++.h>
using namespace std;

//1h

vector<int> val[100005];
int vis[100005];
unordered_map<int, int> um;
int arr[100005];


/* 처음엔 dfs로 풀려고 했는데
    시간초과가 뜨고 
    bfs로 생각을 바꿔보니 
    그리고 포인트는 각 출발지점에서 목적지까지 bfs를 돌리는 것이 아니라
    목적지가 정해져있으니 목적지가 가진 정점들로 bfs를 한 번만 돌리면 된다!
    
    void bfsonce(int e, const vector<int>& sources) {
    fill(vis,vis+100004, -1);
    queue<int> q;
    q.push(e);
    vis[e] = 0;
    
    while(!q.empty()) {
        auto cur = q.front();
        q.pop();
    
        for(auto nxt : val[cur]) {
            if(vis[nxt] != -1)continue;
            
            vis[nxt] = vis[cur] + 1;
            q.push(nxt);
            
        }
    }
    
    for(auto sc : sources) {
        arr[sc] = vis[sc];
    }
}
*/

//BFS에서 최단 경로를 구하려면 각 노드까지의 거리를 별도로 추적해야함.
void bfs(int s, int e) {
    if(s == e) {
        arr[s] = 0;
        return;
    }
    queue<int> q;
    q.push(s);
    vis[s] = 0;
    
    while(!q.empty()) {
        auto cur = q.front();
        q.pop();
    
        for(auto nxt : val[cur]) {
            if(vis[nxt] > 0)continue;
            
            vis[nxt] = vis[cur] + 1;
            q.push(nxt);
            if(nxt == e) {
                arr[s] = vis[nxt];
            }
        }
    }
}
/*
void dfs(int s, int e, int cnt, int st) {
    if(s == e) {
        arr[st] = cnt;
        return;
    }
    
    //cout << st<< "에서 출발" << s << ' ' << e << '\n';
    for(int i=0;i<val[s].size();i++) {
        if(vis[val[s][i]])continue;
        vis[val[s][i]] = true;
        dfs(val[s][i], e,cnt+1, st);
        vis[val[s][i]] =false;
    }
    
}*/

vector<int> solution(int n, vector<vector<int>> roads, vector<int> sources, int destination) {
    vector<int> answer;
    fill(arr, arr+100005, -1);
    for(int i=0;i<roads.size();i++) {
        val[roads[i][0]].push_back(roads[i][1]);
        val[roads[i][1]].push_back(roads[i][0]);
    }
    
    for(auto st : sources) {
        fill(vis,vis+100004, -1);
        bfs(st, destination);
        //dfs(st, destination,0, st);
        answer.push_back(arr[st]);
    }
 
    return answer;
}