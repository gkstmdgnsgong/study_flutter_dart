//lib/ch8_6_key/test.dart
// mac: 'command + /' 로 주석을 해제해서 사용하세요
//chp8 부터는 플러터 프로젝트 main.dart 파일에 복사, 붙여넣기로 실행 요망

/*
*/

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: MyListWidget()
//     );
//   }
// }

// class MyListWidget extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MyListWidgetState();
//   }
// }
// class _MyListWidgetState extends State<MyListWidget>{
//   List<Widget> widgetList = [
//     MyColorItemWidget(Colors.red, key: UniqueKey(),),
//     MyColorItemWidget(Colors.blue, key: UniqueKey()),
//   ];
//   onChange() {
//     print(widgetList.elementAt(0).key);
//     setState(() {
//       widgetList.insert(1, widgetList.removeAt(0));
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Key Test'),),
//         body: Column(
//             children: [
//               Row(children: widgetList,),
//               ElevatedButton(onPressed: onChange, child: Text("toggle"))
//             ]
//         )
//     );
//   }
// }

// class MyColorItemWidget extends StatefulWidget {
//   Color color;
//   MyColorItemWidget(this.color, {Key? key}): super(key: key);
//   @override
//   State<StatefulWidget> createState() {
//     return _MyColorItemWidgetState(color);
//   }
// }
// class _MyColorItemWidgetState extends State<MyColorItemWidget>{
//   Color color;
//   _MyColorItemWidgetState(this.color);
//   @override
//   Widget build(BuildContext context) {

//     return Expanded(
//         child: Container(
//           color: color,
//           width: 150,
//           height: 150,
//         )
//     );
//   }
// }
