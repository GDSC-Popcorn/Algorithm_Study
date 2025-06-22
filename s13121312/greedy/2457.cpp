#include<bits/stdc++.h>
using namespace std;

int n;
vector<pair<int, int>> v; 

int main() {

    cin >> n;
    for(int i=0;i<n;i++) {
        int a,b,c,d;
        cin >> a >> b >> c >> d;
        v.push_back({a*100+b, c*100+d});
    }
    //sort(v.begin(), v.end());


    int st = 301;
    int ans = 0;

    while(st < 1201) {
        int nxt_st = st; 
        for(int i=0;i<n;i++) {
            if(v[i].first <= st && v[i].second > nxt_st) { //후보를 뽑는것  현재(st)보다 같거나 작고 & 끝점(nxt_st)보다 크면 후보가됨 더 긴거로 갱신
                nxt_st = v[i].second;   
            }
        }

        if(nxt_st == st) {
            //못빠져나갔는데 전진 더이상 못하는 상태
            cout << 0;
            return 0;
        }
        ans++;
        st = nxt_st;
    }
    
    cout << ans;
    

    return 0;
}

// #include <iostream>
// #include <vector>
// #include <algorithm>
// using namespace std;

// int main() {
//     int n;
//     cin >> n;

//     vector<pair<int,int>> v;
//     for(int i = 0; i < n; ++i) {
//         int a, b, c, d;
//         cin >> a >> b >> c >> d;
//         v.push_back({a * 100 + b, c * 100 + d});
//     }

//     sort(v.begin(), v.end());

//     int st = 301;
//     int ans = 0;

//     int i = 0;
//     while(st < 1201) {
//         int nxt_st = st;

//         // st 기준 가능 후보군 내에서 종료일이 가장 긴 꽃 찾기
//         while(i < n && v[i].first <= st) {
//             nxt_st = max(nxt_st, v[i].second);
//             ++i;
//         }

//         if(nxt_st == st) {
//             cout << 0;
//             return 0;
//         }

//         ans++;
//         st = nxt_st;
//     }

//     cout << ans;

//     return 0;
// }
