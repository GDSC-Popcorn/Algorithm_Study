#include<bits/stdc++.h>
using namespace std;
int n;
int arr[100005];

int main() {

    cin >> n;
    for(int i=0;i<n;i++)cin >> arr[i];
    sort(arr, arr+n);
    int ans = 0;
    for(int i=1;i<=n;i++) {
        ans = max(ans, arr[n-i]*i);
    }

    cout << ans;
    return 0;
}