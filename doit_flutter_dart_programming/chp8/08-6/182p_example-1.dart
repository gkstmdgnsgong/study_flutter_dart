//다양한 형태의 키값 지정하기

// mac: 'command + /' 로 주석을 해제해서 사용하세요
//chp8 부터는 플러터 프로젝트 main.dart 파일에 복사, 붙여넣기로 실행 요망

/*

flutter: [#e1ebc], [<10>],kkang
flutter: print... 3
flutter: [<10>], [#e1ebc],kkang
flutter: print... 3

toggle을 누르면 다음과 같이 key 값이 바뀐 것처럼 출력된다
setState()는 이전 예제들에서 보았듯이 리스트에서 0번 인덱스를 꺼내서 1번 위치에 끼워넣음. 즉, 순서를 바꾼다.
원래는 0번이 UniqueKey를 가진 위젯이었고 1번이 ValueKey를 가진 위젯이었는데
(0번 인덱스에 위젯을 꺼내고 1번 인덱스에 위젯에 넣었고 1번 위젯은 0변으로 간 것)
순서가 바뀌었으니 0번이 ValueKey를 가진 위젯이 위치하고 1번은 UniqueKey를 가진 위젯으로 바뀌는 것이 맞다

여기서 의문점은 왜 출력까지도 바뀌는 것인가다. 왜냐하면 
print('${uniqueKey}, ${valueKey},${user.name}'); //[<10>], [#06854], kkang
다음과 같이 값을 고정해놓았기 때문임

UniqueKey()	매번 다른 값 → Flutter가 이전 위젯과 연결 불가 → 항상 다시 그림(rebuild)
ValueKey(10)	값이 같으면 같다고 판단 → Flutter가 해당 위젯을 재사용
ObjectKey(User(...))	User 객체가 같다고 판단되어야 재사용됨 → ==, hashCode 중요



*/

// class _MyListWidgetState extends State<MyListWidget> {
//   List<Widget> widgetList = [
//     MyColorItemWidget(Colors.red, key: UniqueKey()),
//     MyColorItemWidget(Colors.blue, key: ValueKey(10)),
//     MyColorItemWidget(Colors.green, key: ObjectKey(User('kkang', 30))),
//   ];

//   onChange() {
//     var uniqueKey = widgetList.elementAt(0).key;
//     var valueKey = widgetList.elementAt(1).key;
//     var objectKey = widgetList.elementAt(2).key as ObjectKey;

//     User user = objectKey.value as User;
//     print('${uniqueKey}, ${valueKey},${user.name}'); //[<10>], [#06854], kkang
//   }

//---실제 작동되는 코드

// import 'package:flutter/material.dart';

// class User {
//   final String name;
//   final int age;

//   User(this.name, this.age);
// }

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
//     MyColorItemWidget(Colors.blue, key: ValueKey(10)),
//     MyColorItemWidget(Colors.green, key: ObjectKey(User('kkang', 30))),
//   ];

//   onChange() {
//     var uniqueKey = widgetList.elementAt(0).key;
//     var valueKey = widgetList.elementAt(1).key;
//     var objectKey = widgetList.elementAt(2).key as ObjectKey;

//     User user = objectKey.value as User;
//     print('${uniqueKey}, ${valueKey},${user.name}'); 
// //[<10>], [#06854], kkang, setState의 주석을 풀고 toggle을 한 번만 하면 나오는 결과, uniqueKey는 단순 변수 '이름'일 뿐이니까 바뀌는게 맞음
// //[#72bfb], [<10>],kkang setState를 주석한 결과


//     // // 예시: 위젯 순서를 바꿔서 Key 테스트
//     // setState(() {
//     //   widgetList.insert(1, widgetList.removeAt(0));
//     // });
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
