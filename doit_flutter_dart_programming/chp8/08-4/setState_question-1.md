질문 : "속성값을 다른 곳에서 변경해도 어차피 setState()가 호출되면 build() 메서드가 호출되기 때문에 변경 사항이 적용됨" <-의 예시는 무엇이 있나?


아래 예제는 **setState() 바깥에서 값을 변경한 뒤**, 나중에 `setState()`만 호출해서 **화면 갱신을 트리거**하는 구조를 보여줍니다.

---

## ✅ 예시: setState() 안에서 값 변경하지 않고 화면 갱신하기

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  // setState() 밖에서 값만 먼저 변경
  void increaseCounter() {
    counter++; // 값만 먼저 변경
    setState(() {}); // 화면 갱신만 요청
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("setState 밖에서 변경 예시")),
      body: Center(
        child: Text(
          '카운터: $counter',
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increaseCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
```

---

## ✅ 설명

* `increaseCounter()` 함수에서 `counter++`로 값을 먼저 변경합니다.
* 그 후 `setState(() {})`는 아무 내용 없이 단순히 \*\*Flutter에게 “변경 사항이 있으니 화면 다시 그려줘”\*\*라고만 알립니다.
* 이렇게 해도 `build()`가 호출되기 때문에 **텍스트에 반영된 `counter` 값이 갱신**됩니다.

---

## ✅ 요점 정리

| 변경 방식                    | 화면에 반영됨? | 설명                                                          |
| ------------------------ | -------- | ----------------------------------------------------------- |
| setState 안에서 값 변경        | ✅        | 일반적이며 직관적                                                   |
| setState 바깥에서 값 변경 후 호출만 | ✅        | Flutter는 **상태가 변경되었는지**를 확인하지 않음. 오직 **setState 호출 여부**만 본다 |

---

