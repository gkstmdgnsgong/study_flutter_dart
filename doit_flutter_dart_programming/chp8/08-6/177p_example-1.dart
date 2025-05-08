// //다른 타입의 객체 이용

// // mac: 'command + /' 로 주석을 해제해서 사용하세요
// //chp8 부터는 플러터 프로젝트 main.dart 파일에 복사, 붙여넣기로 실행 요망

// /*
// 상위 위젯에서 버튼 클릭 시 순서를 바꾸어 출력하는 예

// StatefulWidget은 데이터를 State가 가지고 있다(앞선 예에서는 StatelessWidget이 가지고 있었음)
// StatefulWidget와 State를 연결해 데이터를 출력함
// 그런데 위젯의 구조가 변경되면 그에 맞는 State를 연결해야함

// 코드처럼 위젯의 타입(클래스명)이 다르면 위젯과 State 객체를 연결하는 데 아무런 문제가 없다

// State 정보에 어떤 타입의 위젯인지 제네릭으로 명시하면서 사용하므로 
// 위젯의 구조가 변경되어도 식별에 문제가 없다

// State 객체는 어느 위젯을 위한 상태 정보인지를 타입으로 식별하므로
// (타입이 같으면 그때서야 키로 식별) 타입이 다르면 
// 객체가 여러 개더라도 식별에 문제가 없음

// */

// class _MyListWidgetState extends State<MyListWidget> {
//   List<Widget> widgetList = [MyREDItemWidget(), MyBLUEItemWidget()];

//   onChange() {
//     setState(() {
//       widgetList.insert(1, widgetList.removeAt(0));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('print... ${widgetList.length}');
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Key Test')),
//         body: Column(
//           children: [
//             Row(children: widgetList),
//             ElevatedButton(onPressed: onChange, child: Text('toggle')),
//           ],
//         ),
//       ),
//     );
//   }
// }

// //---실제 작동되는 코드

// import 'package:flutter/material.dart';

// class MyREDItemWidget extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _MyREDItemWidgetState(Colors.red);
// }

// class _MyREDItemWidgetState extends State<MyREDItemWidget> {
//   Color color;
//   _MyREDItemWidgetState(this.color);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(child: Container(color: color, height: 150, width: 150));
//   }
// }

// class MyBLUEItemWidget extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _MyBLUEItemWidgetState(Colors.blue);
// }

// class _MyBLUEItemWidgetState extends State<MyBLUEItemWidget> {
//   Color color;
//   _MyBLUEItemWidgetState(this.color);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(child: Container(color: color, height: 150, width: 150));
//   }
// }

// void main() {
//   runApp(MyListWidget());
// }

// class MyListWidget extends StatefulWidget {
//   @override
//   State<MyListWidget> createState() => _MyListWidgetState();
// }

// class _MyListWidgetState extends State<MyListWidget> {
//   List<Widget> widgetList = [MyREDItemWidget(), MyBLUEItemWidget()];

//   onChange() {
//     setState(() {
//       widgetList.insert(1, widgetList.removeAt(0));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('print... ${widgetList.length}');
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Key Test')),
//         body: Column(
//           children: [
//             Row(children: widgetList),
//             ElevatedButton(onPressed: onChange, child: Text('toggle')),
//           ],
//         ),
//       ),
//     );
//   }
// }

