#include<bits/stdc++.h>
using namespace std;

int solve(vector<int>& val, vector<int>& wt, int n, int W){
    vector<int> dp(W+1, 0);
    for(int w=1;w<=W;w++){
        for(int i=0;i<n;i++){
            if(w>=wt[i])
                dp[w] = max(dp[w], val[i] + dp[w-wt[i]]);
        }
    }
    return dp[W];
}

int main()
 {
	int t;
	cin >> t;
	while(t--){
	    int n, w;
	    cin >> n >> w;
	    vector<int> val(n,0), wt(n,0);
	    for(int i=0;i<n;i++)
	        cin >> val[i];
	    for(int i=0;i<n;i++)
	        cin >> wt[i];
	    cout << solve(val, wt, n, w) << endl;
	}
	return 0;
}
