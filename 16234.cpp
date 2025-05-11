#include<bits/stdc++.h>
using namespace std;
int n,l,r;
int arr[55][55];
bool vis[55][55];
int dx[] = {1,0,-1,0};
int dy[] = {0,1,0,-1};

bool bfs(int x, int y, vector<pair<int, int>>& pos) {
    int cnt = 0, sum = 0;
    cnt = 1;
    sum = arr[x][y];
    queue<pair<int, int> > q;
    q.push({x, y});
    vis[x][y] = true;
    pos.push_back({x,y});

    while (!q.empty())
    {
        auto cur = q.front();
        q.pop();
        
        for(int i=0;i<4;i++) {
            int nx = cur.first + dx[i];
            int ny = cur.second + dy[i];
            if(nx<0 || nx>=n || ny<0 || ny>=n || vis[nx][ny])continue;
            int diff =abs(arr[cur.first][cur.second] - arr[nx][ny]);
            if(diff >= l && diff <= r){
                q.push({nx, ny});
                vis[nx][ny] = true;
                cnt++;
                sum += arr[nx][ny];
                pos.push_back({nx, ny});      
            }      
        }
    }
    
    if(cnt>1){
        int avg = sum/cnt;
        for(auto p : pos) {
            arr[p.first][p.second] = avg;
        }
        return true;
    }
    

    return false;
}

bool processingcombine() {
    bool moved = false;
    for(int i=0;i<n;i++) {
        fill(vis[i], vis[i]+n, false);
    }

    for(int i=0;i<n;i++) {
        for(int j=0;j<n;j++) {
            if(vis[i][j])continue;
            int cnt = 0;
            int sum = 0;
            vector<pair<int, int>> pos;
            if(bfs(i,j, pos)) {
                moved = true;
            }
        }
    }

    return moved;
}

void print() {
    for(int i=0;i<n;i++) {
        for(int j=0;j<n;j++) {
            cout << arr[i][j] << ' ';
        }
        cout << '\n';
    }
    cout << '\n';

}
int main() {

    cin >> n >> l >>r;
    for(int i=0;i<n;i++) {
        for(int j=0;j<n;j++) {
            cin >> arr[i][j];
        }
    }
    int cnt = 0;

    while(processingcombine()) {
        print();
        cnt++;
    }


    cout << cnt;
    return 0;
}