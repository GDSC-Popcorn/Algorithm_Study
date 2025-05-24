#include<bits/stdc++.h>
using namespace std;
int n;
int arr[100005];

int calc(int k) {
    if(k==1)return 1;
    return k*calc(k-1);
}

int main() {

    cin >> n;
    for(int i=0;i<n;i++)cin >> arr[i];

    unordered_map<int, int> um;
    long long cnt = 0;  // n은 10만이므로 예제 1번처럼 1~n가지 주어지면 n*(n+1)/2이므로 int 자료형초과 됨 그니깐 long long으로
    int en = 0;
    for(int st = 0;st<n;st++) {
        
        while (en<n) {
            if(um[arr[en]] != 0)break;
            um[arr[en]]++;
            en++;
        }
        cnt += (en-st);
        //cout << cnt << ' ';
        um[arr[st]]--;
    }

    cout << cnt;
    return 0;
}