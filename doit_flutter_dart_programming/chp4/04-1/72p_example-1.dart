// int 타입 사용 예
int? no = 10; //원래 타입별로 null값을 넣을 수 없는 타입이 있는데 null 값을 넣을 수 있게 만드는 연산자가 '?'이다.
void main() {
  bool? data =
      no?.isEven; //'?.' Null-aware Access 연산자, 객체가 널인지 여부 확인 후 널이 아닌 경우에만 속성에 접근, 객체이므로 .isEven에 접근 가능
  no = null; //객체 이므로 null 대입 가능
  Object? obj = no; //객체 이므로 최상위 클래스 Object에 대입 가능
}
