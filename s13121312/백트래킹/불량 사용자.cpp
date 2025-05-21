#include <bits/stdc++.h>
using namespace std;

int ans = 0;
bool vis[12];

bool chk(string a, string b) {
    if(a.size() != b.size())return false;
    
    for(int i=0;i<a.size();i++) {
        
        if(b[i] == '*')continue; //banned_id에서 *면 continue
        if(a[i] != b[i])return false;
    }
    return true;
}

/*
    banned_id를 기준으로 dfs를 하는데 
    user_id기준으로 조합을 해버리면 테스트 3번에서 
    fradi frodo acb123 frodoc경우를 잡아채지못함
    
    -> 순열로 모든 경우를 구해서 string값으로 받아 set에 저장. set의 크기가 정답
    
*/
vector<string> v;
set<string> answerst;

void dfs(int depth, vector<string>& user_id, vector<string>& banned_id) {
    
    if(depth == banned_id.size()) {
        string st;
        vector<string> tmp = v; //v를 바로 정렬해버리면 dfs 과정이 무너짐!!
        sort(tmp.begin(), tmp.end());
        // for(auto an : tmp)cout << an << ' ';
        // cout << '\n';
        for(auto s : tmp)st += s;
        answerst.insert(st);
        return;
    }
    
    for(int i=0;i<user_id.size();i++) {
        if(vis[i] || !chk(user_id[i], banned_id[depth]))continue;
        vis[i] = true;
        v.push_back(user_id[i]);
        dfs(depth+1, user_id, banned_id);
        vis[i] = false;
        v.pop_back();
        
    }
    
}

int solution(vector<string> user_id, vector<string> banned_id) {
    
    dfs(0, user_id, banned_id);
    ans = answerst.size();
    for(auto an : answerst)cout << an << ' ';
    return ans;
}
