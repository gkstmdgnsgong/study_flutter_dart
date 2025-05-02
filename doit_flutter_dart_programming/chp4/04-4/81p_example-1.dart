// 리스트 사용 예

/*

*/

main() {
  List list1 = [
    10,
    'hello',
    true,
  ]; // List 타입으로 선언, 타입 지정은 하지 않았기 때문에 dynamic 타입 리스트가 됨, 따라서 모든 타입 데이터 저장 가능
  list1[0] = 20; // 정수 대입
  list1[1] = 'world'; // 문자열 대입
  print(
    'List : [${[list1[0], list1[1], list1[2]]}]',
  ); // List : [20, world, true]
}
