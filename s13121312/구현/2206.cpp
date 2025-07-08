#include<bits/stdc++.h>
using namespace std;
char arr[1005][1005];
int n, m;
int dist[1005][1005][2];  
//[0] 벽을 하나도 안 부수고 (x,y)까지 오는데 걸리는 비용 
//[1] 벽을 하나만 부수고 (x,y)까지 오는데 걸리는 비용, (x,y)가 벽이라서 부수는 경우 포함
int dx[] = {1,0,-1,0};
int dy[] = {0,1,0,-1};

void input() {
    cin >> n >> m;
    for(int i=0;i<n;i++) {
        for(int j=0;j<m;j++) {
            cin >> arr[i][j];
        }
    }
}

int bfs() {

    for(int i=0;i<n;i++) {
        for(int j=0;j<m;j++) {
            dist[i][j][0] = dist[i][j][1] = -1;
        }
    }
    //(0,0) -> (n-1,m-1)
    queue<tuple<int, int, int>> q;
    q.push({0, 0, 0});
    dist[0][0][0] = dist[0][0][1] = 1;
    
    while(!q.empty()) {
        int x, y, broken;
        tie(x,y,broken) = q.front();
        
        if(x == n-1 && y ==m-1) {
            return dist[x][y][broken];
        }
        q.pop();
        int nxtdist = dist[x][y][broken] + 1;
        for(int i=0;i<4;i++) {
            int nx = x + dx[i];
            int ny = y + dy[i];
            if(nx<0 || nx>=n ||ny<0 || ny>=m)continue;
            if(arr[nx][ny] == '0' && dist[nx][ny][broken] == -1) { //온적 없고 벽이아니면
                dist[nx][ny][broken] = nxtdist;
                q.push({nx,ny,broken});
            }
            if(!broken && arr[nx][ny] == '1' && dist[nx][ny][broken] == -1) { // broken이 0(벽을 한 번도 한 부숨) 다음에 갈게 벽이고 간 적 없으면
                dist[nx][ny][1] = nxtdist;
                q.push({nx, ny, 1});
            }

            /*아래와 같이하면 broken을 따로 체크안해주니까 여러번 부술 수 있음 */
            // if(arr[nx][ny] == '1' && dist[nx][ny][broken] == -1) { //다음에 갈게 벽이고 간 적없으면
            //     dist[nx][ny][1] = nxtdist;
            //     q.push({nx, ny, 1});
            // }
        }
    }
    return -1; //답을 못찾으면 -1 반환

}

int main() {

    input();

    cout << bfs();



    return 0;
}