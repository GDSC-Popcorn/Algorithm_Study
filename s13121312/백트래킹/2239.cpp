#include<bits/stdc++.h>
using namespace std;
char board[12][12];

/*
    board[i][j] != 0
    char형인데 '0'으로 안하고 0으로 해서 틀림

    2. int nr = index/3;
        int nc = index%3; 로 계산함 

    3. vis 배열을 굳이 쓰지않고 board배열에서만 '0'인지 아닌지 확인해도됨

    4. fill(배열, 배열+9,false) 는 배열열[0]~[8]까지 false로 초기화 시키는것
        fill(배열, 배열+10, false)로 해줘야 배열[0]~[9]까지 false로 초기화가 됨.
*/
//index를 나누는 거 생각못함
void dfs(int index) {
    int row = index / 9; //행
    int column = index % 9; //열

    if(index >= 81) {
        for(int i=0;i<9;i++) {
            for(int j=0;j<9;j++) {
                cout << board[i][j];
            }
            cout << '\n';
        }
        exit(0);
    }
    if(board[row][column] != '0') {
        dfs(index+1);
        return;
    }

    bool num[12];
    fill(num,num+10,false);
    //행 체크
    for(int i=0;i<9;i++) {
        if(board[row][i] != '0') {
            num[board[row][i]-'0'] = true;
        }
    }
    //열 체크
    for(int i=0;i<9;i++) {
        if(board[i][column] != '0') {
            num[board[i][column]-'0'] = true;
        }
    }

    //3*3체크
    int nr = row/3;
    int nc = column/3;
    for(int i=3*nr;i<=3*nr+2;i++) {
        for(int j=3*nc;j<=3*nc+2;j++) {
            if(board[i][j] != '0') {
                num[board[i][j]-'0'] = true;
            }
        }
    }

    for(int i=1;i<=9;i++) {
        if(num[i])continue;
        board[row][column] = i + '0';
        dfs(index + 1);
        board[row][column] = '0';
    }

}