#include<bits/stdc++.h>
using namespace std;
int n;
int arr[1005];
int dp[1005]; //i번쩨일때 가장 긴 증가하는 부분 수열의 길이
int pre[1005];

int main() {

    cin >> n;
    for(int i=1;i<=n;i++)cin>> arr[i];
    fill(dp, dp+n, 1);

    for(int i=1;i<=n;i++) {
        for(int j=1;j<i;j++) {
            if(arr[i] > arr[j] && dp[i] < dp[j] + 1) {
                dp[i] = dp[j] + 1;
                pre[i] = j;
            }
        }
    }

    int maxidx = 1, maxl = dp[1];
    for(int i=2;i<=n;i++) {
        if(maxl < dp[i]) {
            maxidx = i; maxl = dp[i];
        }
    }
    int cur = maxidx;
    vector<int> ans;
    deque<int> an;

    while (cur)
    {
        //an.push_front(arr[cur]);
        ans.push_back(arr[cur]);
        cur = pre[cur];
    }

    sort(ans.begin(), ans.end());
    cout << ans.size() <<'\n';
    for(auto x: ans)cout << x << ' ';

    return 0;
}