class Solution {
  double average(List<int> salary) {
    salary.sort();
    int min = salary
        .first; //최소값 구하기 salary.reduce((current,next)=>current>next?next:current);
    int max = salary
        .last; //최대값 구하기 reduce((current,next)=>current<next?next:current);
    int total = salary.fold(0, (a, b) => a + b);
    return ((total - min - max) / (salary.length - 2));
  }
}
// class Solution {
//   double average(List<int> salary) {
//     salary.sort();
//     salary.removeLast();
//     salary.removeAt(0);
//     int total=salary.reduce((a,b)=>a+b);
//     return((total)/(salary.length));

//   }
// }
