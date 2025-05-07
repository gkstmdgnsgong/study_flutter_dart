// // mac: 'command + /' 로 주석을 해제해서 사용하세요
// //화면 구성 예
// //chp8 부터는 플러터 프로젝트 main.dart 파일에 복사, 붙여넣기로 실행 요망

// /*
// Myapp 클래스 : 앱 화면 전체 구성 위젯, StatelessWidget 상속
//   (08-3 상세 설명하겠지만 StatelessWidget을 상속 받은 위젯은 화면에 보일 뷰를 갱신할 수 없음 즉, 정적인 화면)

// 위젯 클래스 : 주요 작업은 다른 위젯을 계층으로 조합해 build() 함수를 구현
//   예제에서는 7개 위젯을 계층 조합하여 MyApp 클래스의 build() 함수 구현
//   - MaterialApp : 머티리얼 디자인 적용
//   - Scaffold : 화면 구조 설계
//   - AppBar : 화면 위쪽 앱바 구성
//   - Text : 앱바 제목
//   - Center : 가운데 정렬
//   - GestureDetector : 사용자 이벤트 처리
//   - Text : 본문에 문자열 출력
// */
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Test')),
//         body: Center(child: GestureDetector(child: Text('Hello, World!'))),
//       ),
//     );
//   }
// }
