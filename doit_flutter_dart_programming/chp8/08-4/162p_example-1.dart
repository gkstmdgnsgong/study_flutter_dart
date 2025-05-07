// //상탯값 변경 예(화면에 반영되지 않음)

// // mac: 'command + /' 로 주석을 해제해서 사용하세요
// //chp8 부터는 플러터 프로젝트 main.dart 파일에 복사, 붙여넣기로 실행 요망

// /*
// 해당 코드를 보면 State 클래스에 enabled와 stateText라는 속성(변수) 선언
// 이 값을 changeCheck() 메서드에서 변경한다는 가정
// 하지만 다음처럼 작성하면 속성값은 변경되지만 변경 값이 화면에 반영되지 않음

// */

// class _MyWidgetState extends State<MyWidget> {
//  bool enabled = false;
//   String stateText = "disabled";

//   void changeCheck() {
//     if (enabled) {
//       stateText = "disabled";
//       enabled = false;
//     } else {
//       stateText = "enabled";
//       enabled = true;
//     }
//   }
//   // ...생략
// }
