// //동적인 화면 만들기

// // mac: 'command + /' 로 주석을 해제해서 사용하세요
// //chp8 부터는 플러터 프로젝트 main.dart 파일에 복사, 붙여넣기로 실행 요망

// /*
// */

// class MyWidget extends StatefulWidget {
//   @override //createState() 메서드는 부모 클래스인 StatefulWidget에 이미 정의되어 있는데, 이 줄은 우리가 그 메서드를 재정의(override) 하고 있다는 것을 명시합니다. //컴파일러가 실수나 오류 없이 재정의하고 있는지를 검사해 줍니다.

//   State<StatefulWidget> createState() { //실제 타입은 State<MyWidget>이지만, 부모 클래스인 StatefulWidget의 타입을 사용합니다.
//     // createState() 메서드는 Flutter가 StatefulWidget을 생성할 때 호출하는 메서드입니다.
//     // createState()가 반환하는 State 객체를 통해 상태 관리와 UI 갱신이 이루어집니다.

//     return _MyWidgetState(); 
//     //'_(underscore)'로 시작하는 클래스는 private 클래스입니다. 즉, 이 클래스는 MyWidget 클래스 내부에서만 사용됩니다.
//     // State 클래스의 하위 클래스인 _MyWidgetState의 인스턴스를 생성합니다.
//   }
// }

// //"MyWidget은 상태를 가질 수 있는 위젯이며, 이 위젯이 생성될 때 _MyWidgetState라는 상태 객체를 만들어 연결해 주세요."