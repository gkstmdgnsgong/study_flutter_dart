// 문자열 템플릿에 상수 변수 사용

/*
  다음 코드를 보면 s5는 
*/

// final int no1; // 초깃값이나 이후에 값으 대입하지 않았기 때문에 오류

main() {
  String s1 = 'hello';
  const String s2 = 'world';
  final String s3 = 'hello world';

  String s4 = '$s1, $s2';
  const String s5 = '$s2';

  // const String s6 = '$s1, $s2, $s3';
  //오류 : 왜냐하면 s6는 const 변수이고 s1는 const가 아니고 s3는 const가 아닌 final 변수이기 때문

  final String s7 = '$s1, $s2, $s3';
  // 정상 : s7는 final 변수이고 s1, s3는 const가 아니며 s2는 const 컴파일 타임 변수이기 때문에
}
