//StatefulWidget 위젯

// mac: 'command + /' 로 주석을 해제해서 사용하세요
//chp8 부터는 플러터 프로젝트 main.dart 파일에 복사, 붙여넣기로 실행 요망

/*
*/

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

//---실제 작동되는 코드

import 'package:flutter/material.dart';

class MyColorItemWidget extends StatefulWidget {
  Color color;
  MyColorItemWidget(this.color, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyColorItemWidgetState(color);
}

class _MyColorItemWidgetState extends State<MyColorItemWidget> {
  Color color;
  _MyColorItemWidgetState(this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(color: color, width: 150, height: 150));
  }
}

void main() {
  runApp(MyListWidget());
}

class MyListWidget extends StatefulWidget {
  @override
  State<MyListWidget> createState() => _MyListWidgetState();
}

class _MyListWidgetState extends State<MyListWidget> {
  List<Widget> widgetList = [
    MyColorItemWidget(Colors.red, key: UniqueKey()),
    MyColorItemWidget(Colors.blue, key: UniqueKey()),
  ];

  onChange() {
    setState(() {
      widgetList.insert(1, widgetList.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    print('print... ${widgetList.length}');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Key Test')),
        body: Column(
          children: [
            Row(children: widgetList),
            ElevatedButton(onPressed: onChange, child: Text('toggle')),
          ],
        ),
      ),
    );
  }
}
