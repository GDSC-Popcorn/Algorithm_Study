#include<bits/stdc++.h>
using namespace std;
int n;
vector<pair<int, int>> v;

bool cmp(pair<int, int> p1, pair<int, int> p2) {
    if(p1.second == p2.second) {
        return p1.first< p2.first;
    }
    return p1.second < p2.second;
}
//1 5
//5 7 
//6 7
int main() {

    cin >> n;
    for(int i=0;i<n;i++) {
        int a, b;
        cin >> a >>b;
        v.push_back({a, b});        
    }

    sort(v.begin(), v.end(), cmp);
    int ans = 1;
    int idx = 1;
    int curback = v[0].second;
    while (true)
    {
        if(idx == n)break;
        if(v[idx].first < curback) {
            idx++;
        } else {
            ans++;
            curback = v[idx++].second;
        }
    }
    cout << ans;

    return 0;
}