// //StatelessWidget 위젯

// // mac: 'command + /' 로 주석을 해제해서 사용하세요
// //chp8 부터는 플러터 프로젝트 main.dart 파일에 복사, 붙여넣기로 실행 요망

// /*
// StatelessWidget은 생성자 매개변수로 전달된 색상을 화면에 출력하는 단순 위젯
// */


// class MyColorItemWidget extends StatelessWidget {
//   Color color;
//   MyColorItemWidget(this.color);
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         color: color,
//         height: 150,
//         width: 150,
//       ),
//     );
//   }

// }