// //상탯값 변경하기

// // mac: 'command + /' 로 주석을 해제해서 사용하세요
// //chp8 부터는 플러터 프로젝트 main.dart 파일에 복사, 붙여넣기로 실행 요망

// /*
// setState()의 매개변수는 함수
// 매개변수에 지정한 함수가 끝난 후에 자동을 build() 메서드가 호출됨

// 본 예제에서는 화면에 갱신할 속성값을 setState()의 매개변수에 지정한 함수에서 변경했다
// 하지만 꼭 그래야 하는 것은 아님
// 속성값을 다른 곳에서 변경해도 어차피 setState()가 호출되면 build() 메서드가 호출되기 때문에 변경 사항이 적용됨
// */

// class _MyWidgetState extends State<MyWidget> {
//   bool enabled = false;
//   String stateText = "disabled";

//   void changeCheck() {
//     setState(() {
//       // setState() 메서드를 호출하여 상태를 변경합니다.
//       // 이 메서드는 Flutter에게 상태가 변경되었음을 알리고,
//       // UI를 다시 그리도록 요청합니다.
//     if (enabled) {
//       stateText = "disabled";
//       enabled = false;
//     } else {
//       stateText = "enabled";
//       enabled = true;
//     }

//     });
//   }
//   // ...생략
// }
