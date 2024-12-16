class Solution {
  int largestAltitude(List<int> gain) {
    int altitude = 0;
    int sum = 0;
//list[0]=0;
//list[1]=gain[0];
//list[2]=gain[0]+gain[1];
//...
//list[n]=gain[0]+gain[1]+...+gain[n-1];
    for (int i = 0; i < gain.length; i++) {
      sum += gain[i];
      if (altitude < sum) altitude = sum;
    }
    return altitude;
  }
}
