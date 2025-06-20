#include<bits/stdc++.h>
using namespace std;
int dp[1005][1005]; //a의 i 번째 일때와 b의 j번쨰 일때의 lcs
string a, b;

int main() {

    cin >> a;
    cin >> b;
    int n = a.size(), m = b.size();

    for(int i=1;i<=n;i++) {
        for(int j=1;j<=m;j++) {
            if(a[i-1] == b[j-1]) {
                dp[i][j] = dp[i-1][j-1] + 1;
            }
            dp[i][j] = max(dp[i][j], max(dp[i-1][j], dp[i][j-1]));
        }
    }

    cout << dp[n][m];


    return 0;
}