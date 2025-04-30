// int와 String 형 변환
main() {
  int n1 = 10;
  String s1 = '10';

  String s2 = n1.toString(); // int -> String 성공
  int n2 = int.parse(s1); // String -> int 성공, parse(파서) : 분석하다
}
