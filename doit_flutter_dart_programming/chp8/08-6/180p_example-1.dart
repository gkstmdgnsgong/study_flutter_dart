//StatefulWidget 위젯

// mac: 'command + /' 로 주석을 해제해서 사용하세요
//chp8 부터는 플러터 프로젝트 main.dart 파일에 복사, 붙여넣기로 실행 요망

/*
MyColorItemWidget 객체를 생성하면서 생성자 매개변수로 키값을 대입했음
UniqueKey()함수는 유일한 키값을 생성함
이처럼 키값을 대입하면 위젯 객체의 타입이 같아도 각각 다른 키로 식별하므로 어떤 State 객체를 어느
위젯 객체와 연결해야 하는지 알 수 있음
*/

// class _MyListWidgetState extends State<MyListWidget> {
//   List<Widget> widgetList = [
//     MyColorItemWidget(Colors.red, key: UniqueKey()), //key: UniqueKey()에 주목!
//     MyColorItemWidget(Colors.blue, key: UniqueKey()),
//   ];

//   onChange() {
//     setState(() {
//       widgetList.insert(1, widgetList.removeAt(0));
//     });
//   }

//---실제 작동되는 코드

// import 'package:flutter/material.dart';

// class MyColorItemWidget extends StatefulWidget {
//   Color color;
//   MyColorItemWidget(this.color, {Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _MyColorItemWidgetState(color);
// }

// class _MyColorItemWidgetState extends State<MyColorItemWidget> {
//   Color color;
//   _MyColorItemWidgetState(this.color);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(child: Container(color: color, width: 150, height: 150));
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
//   List<Widget> widgetList = [
//     MyColorItemWidget(Colors.red, key: UniqueKey()),
//     MyColorItemWidget(Colors.blue, key: UniqueKey()),
//   ];

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
