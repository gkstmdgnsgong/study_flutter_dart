// 상수 변숫값 바꾸기 오류

/*
  다음 코드는 const 변수를 선언하면서 초깃값을 대입해 오류가 발생하지는 않지만
  초깃값을 바꿀 수 없는 상수 변수에서 다시 값을 대입한 부분에서 오류가 발생
*/

const String data1 = 'hello';

class User {
  static const String data2 = 'hello';

  void some() {
    const String data3 = 'hello';

    // data1 = 'world'; // 오류
    // data2 = 'world'; // 오류
    // data3 = 'world'; // 오류
  }
}
