//다른 타입의 StatefulWidget

// mac: 'command + /' 로 주석을 해제해서 사용하세요
//chp8 부터는 플러터 프로젝트 main.dart 파일에 복사, 붙여넣기로 실행 요망

/*
*/

import 'package:flutter/material.dart';

class MyREDItemWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyREDItemWidgetState(Colors.red);
}

class _MyREDItemWidgetState extends State<MyREDItemWidget> {
  Color color;
  _MyREDItemWidgetState(this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(color: color, height: 150, width: 150));
  }
}

class MyBLUEItemWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyBLUEItemWidgetState(Colors.blue);
}

class _MyBLUEItemWidgetState extends State<MyBLUEItemWidget> {
  Color color;
  _MyBLUEItemWidgetState(this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(color: color, height: 150, width: 150));
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
  List<Widget> widgetList = [MyREDItemWidget(), MyBLUEItemWidget()];

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
