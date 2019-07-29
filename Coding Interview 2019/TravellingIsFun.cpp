#include <bits/stdc++.h>

using namespace std;
// const int MAX = 200001;
// vector<int> adj[MAX];

int gcd(int a, int b){
    if(b==0) return a;
    return gcd(b, a%b);
}

class DisjointSet{
private:
    vector<int> parent, rank;
public:
    void init(int n){
        parent.clear();
        rank.clear();
        for(int i=0;i<n;i++){
            parent.push_back(i);
            rank.push_back(0);
        }
    }
    
    int find(int i){
        if(i != parent[i])
            parent[i] = find(parent[i]);
        return parent[i];
    }
    
    void union_(int x, int y){
        x--, y--; //// all are 1indexed
        int X = find(x), Y = find(y);
        if(X != Y){
            if(rank[X] > rank[Y]){
                parent[Y] = X;
            }
            else{
                parent[X] = Y;
                if(rank[X] == rank[Y])
                    rank[Y]++;
            }
        }
    }
    
};

vector <int> connectedCities(int n, int g, vector <int> originCities, vector <int> destinationCities) {
    //// this can be solved using union by rank coz we want to check whether path exists or not
    //// for this if two nodes are same component then there exists a path
    // for(int i=0;i<n;i++)
    //         adj[i].clear();
    vector<int> res;
    if(g==0){ //fully connected graph
        res.resize(originCities.size(), 1);
        return res;
    }
    
    if(g==n){ //gcd>g not possible
        res.resize(originCities.size(), 0);
        return res;
    }
    
    
    DisjointSet dsu;
    dsu.init(n);
    // for(int i=1;i<=n;i++){
    //     for(int j=i+1;j<=n;j++){
    //         if(gcd(i, j) > g){
    //             dsu.union_(i, j); //// all are 1 indexed
    //         }
    //     }
    // } //// this will lead to TLE
    
    //// think something different
    //// all the multiples of "i" will have i as a common divisor /////////////////////////////
    for(int i=g+1;i<=n;++i){
        for(int j=2;j*i<=n;++j)        //all the multiples of "i" will have i as a common divisor
        {   
            int a=j*i;
            dsu.union_(a, i);
        }
    }
    
    
    for(int i=0;i<originCities.size();i++){
        int u = originCities[i], v = destinationCities[i];
        if(dsu.find(u-1)==dsu.find(v-1)) res.push_back(1);
        else res.push_back(0);
    }
    return res;
}

int main() {
    int n;
    cin >> n;
    int g;
    cin >> g;
    int originCities_cnt;
    cin >> originCities_cnt;
    vector<int> originCities(originCities_cnt);
    for(int originCities_i = 0; originCities_i < originCities_cnt; originCities_i++){
        cin >> originCities[originCities_i];
    }
    int destinationCities_cnt;
    cin >> destinationCities_cnt;
    vector<int> destinationCities(destinationCities_cnt);
    for(int destinationCities_i = 0; destinationCities_i < destinationCities_cnt; destinationCities_i++){
        cin >> destinationCities[destinationCities_i];
    }
    vector <int> res = connectedCities(n, g, originCities, destinationCities);
    for (ssize_t i = 0; i < res.size(); i++) {
        cout << res[i] << (i != res.size() - 1 ? "\n" : "");
    }
    cout << endl;


    return 0;
}