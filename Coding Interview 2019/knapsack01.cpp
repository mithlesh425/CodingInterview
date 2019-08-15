
int solve(int n, int W, vector<int>& val, vector<int>& wt){
    /// either we can keep it or not
    vector<int> dp(W+1, 0);
    /// subproblem dp[i][w] = max(dp[i-1][w], dp[i-1][w-wt[i]])
    for(int i=1;i<=n;i++){
        // vector<int> tmp(dp);
        for(int w=W;w>=wt[i-1];w--){
            int max_ = dp[w];
            if(w-wt[i-1] >= 0){
                max_ = max({max_, val[i-1] + dp[w-wt[i-1]]});///optimize
            }
            dp[w] = max_;
        }
    }
        
    return dp[W];
}

int main()
 {
	int t;
	cin >> t;
	while(t--){
	    int n,w;
	    cin >> n >> w;
	    vector<int> val(n, 0), wt(n, 0);
	    for(int i=0;i<n;i++)
	        cin >> val[i];
	    for(int i=0;i<n;i++)
	        cin >> wt[i];
	    cout << solve(n, w, val, wt) << endl;
	}
	return 0;
}
