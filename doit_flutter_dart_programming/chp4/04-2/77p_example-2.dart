// fianl 변수

/*
  다음 코드를 보면 클래스에서 no2 변수를 final로 선언함
  하지만 초깃값을 대입하지 않았으며 객체 생성할 때 생성자에서 값을 대입하도록 함
  이렇게 해도 오류 발생하지 않음

  또한 no3 변수는 함수에서 final로 선언했는데 변수 선언과 동시에 초깃값을 주지 않고 그 이후에 값을 대입
*/

// final int no1; // 초깃값이나 이후에 값으 대입하지 않았기 때문에 오류

class MyClass {
  final int no2; // final 변수
  MyClass(this.no2); // 생성자에서 값을 대입

  void some() {
    final int no3; // final 변수
    no3 = 10; // 함수에서 값을 대입
    // no3 = 20; // 값을 바꿀 수 없기 때문에 오류
  }
}
