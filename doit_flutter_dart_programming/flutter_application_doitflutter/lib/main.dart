//lib/ch8_3_stateless_widget/test.dart

// mac: 'command + /' 로 주석을 해제해서 사용하세요
//chp8 부터는 플러터 프로젝트 main.dart 파일에 복사, 붙여넣기로 실행 요망

/*
아이콘을 클릭하면 위젯의 데이터가 변경되게 만듬
다만 StatelessWidget은 상태를 변경할 수 없으므로
변경된 데이터가 화면에 반영되지는 않음

-> 내부적으로 값은 바뀌나 화면에는 반영되지 않음
*/

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool enabled = false; //enable : 가능하게 하다, 허가하다
    String stateText = "disabled";

    void changeCheck() {
      if (enabled) {
        stateText = "disabled";
        enabled = false;
      } else {
        stateText = "enabled";
        enabled = true;
      }
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stateless Test')),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon:
                    enabled
                        ? Icon(Icons.check_box, size: 20)
                        : Icon(Icons.check_box_outline_blank, size: 20),
                color: Colors.red,
                onPressed: changeCheck,
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  '$stateText',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
