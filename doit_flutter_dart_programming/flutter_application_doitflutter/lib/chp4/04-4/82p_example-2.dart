// 리스트에 데이터 추가와 제거

/*

*/

main() {
  List<int> list2 = [10, 20, 30];

  print(list2); // [10, 20, 30]

  list2.add(40); // 리스트에 데이터 추가
  list2.add(50); // 리스트에 데이터 추가
  print(list2); // [10, 20, 30, 40, 50]

  list2.removeAt(0); // 리스트에서 데이터 제거, index 0번 제거
  print(list2); // [20, 30, 40, 50]
}
