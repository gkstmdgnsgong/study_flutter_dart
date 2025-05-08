// //순서 바꾸기

// // mac: 'command + /' 로 주석을 해제해서 사용하세요
// //chp8 부터는 플러터 프로젝트 main.dart 파일에 복사, 붙여넣기로 실행 요망

/*
상위 위젯에서 MyColorItemWidget을 여러 개 생성해서 화면에 출력한 후 버튼을 
클릭하면 두 위젯의 위치를 교체하는 코드임

위젯이 빨-파에서 파-빨로 바뀌어 출력됨, 중요한 점은 색을 출력하는 위젯이 StatelessWidget이며
key를 사용하지 않았음에도 불구하고 색이 바뀜

코드를 보면 MyColorItemWidget의 객체를 2개 생성해서 이용함
화면의 toggle 버튼을 클릭하면 onChange() 메소드가 호출되어서 위젯의 순서를 바꿈

onChange()의 경우
- widgetList.removeAt(0)으로 0번 인덱스를 꺼내고 해당 요소는 리스트에서 삭제됩니다.
->removedWidget = redWidget
->widgetList = [blueWidget]
- widgetList.insert(1, removedWidget)에서는
리스트의 1번 인덱스 위치에 removedWidget을 삽입합니다.
리스트가 다시 두 개가 되며 순서가 바뀝니다.

onChange()가 순서를 바꾼 뒤, setState()가 호출
화면을 다시 빌드함, build() 함수가 호출되어 위젯 트리의 구조가 교체
그러나 StatelessWidget은 화면 구성을 하는 데이터를 위젯 자체에 유지함
따라서 키로 객체를 식별하지 않아도 문제가 없음

즉, 파랑 위젯이 트리 구조에서 두 번째에 있다가 첫 번째로 위치가 바뀌더라도
자신이 파랑이라는 데이터를 가지고 있으므로 첫 번재 위젯 화면이 파랑으로 나오게 하는 데 문제가 없다는 뜻

*/

// class _MyListWidgetState extends State<MyListWidget> {
//   List<Widget> widgetList = [
//     MyColorItemWidget(Colors.red),
//     MyColorItemWidget(Colors.blue),
//   ];

//   onChange(){
//     setState((){
//       widgetList.insert(1, widgetList.removeAt(0))
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Key Test'),
//       ),
//       body: Column(
//         children: [
//           Row(
//             children: widgetList,
//           ),
//           ElevatedButton(
//             onPressed: onChange,
//             child: Text('toggle'),
//           )
//         ],
//       ),
//     );
//   }
// }

// //---실제 작동하는 코드

// import 'package:flutter/material.dart';

// class MyColorItemWidget extends StatelessWidget {
//   Color color;
//   MyColorItemWidget(this.color);
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
//   List<Widget> widgetList = [
//     MyColorItemWidget(Colors.red),
//     MyColorItemWidget(Colors.blue),
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
