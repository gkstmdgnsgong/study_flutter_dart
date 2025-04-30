// 문자열 템플릿
main() {
  int no = 10;
  String name = 'kkang';

  String myFun() {
    return 'kim';
  }

  print('no = $no, name : $name, 10 + 20 : ${10 + 20}, myFun() : ${myFun()}');
  //문자열에 변수를 넣을 때는 $를 사용한다. $no, $name
  //문자열에 수식을 넣을 때는 ${}를 사용한다. ${10 + 20}
  //문자열에 함수를 넣을 때는 ${}를 사용한다. ${myFun()}
  //출력 결과 : no = 10, name : kkang, 10 + 20 : 30, myFun() : kim
}
