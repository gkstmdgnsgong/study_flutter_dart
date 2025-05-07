// mac: 'command + /' 로 주석을 해제해서 사용하세요
// 예시 1: DiagnosticableTreeMixin 예시 – 트리 구조 표현(※ DiagnosticableTree는 직접 mixin할 수 없으므로 대신 사용)

/*
Flutter 위젯 디버깅 시스템의 기반
Widget, Element, RenderObject 등 Flutter의 거의 모든 핵심 클래스는 Diagnosticable 혹은 DiagnosticableTreeMixin을 믹스인으로 포함하고 있습니다.

abstract class Widget extends DiagnosticableTree {
  // ...
}
🔎 이 덕분에 Flutter Inspector에서 위젯을 클릭하면 다음처럼 속성을 트리 구조로 확인할 수 있죠:

Padding
 │ padding: EdgeInsets.all(8.0)
 ╰ child: Text("Hello World")
*/
import 'package:flutter/foundation.dart';

class Category with DiagnosticableTreeMixin {
  //with : mixin 구조 //DiagnosticableTreeMixin은 Flutter에서 객체의 속성을 트리 구조로 디버깅 로그에 출력할 수 있게 해줍니다.
  final String name;
  final List<Category> subCategories;

  Category(this.name, [this.subCategories = const []]);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('name', name));
  }

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    return subCategories
        .map((cat) => cat.toDiagnosticsNode(name: 'subCategory'))
        .toList();
  }
}

void main() {
  final category = Category('Books', [
    Category('Fiction'),
    Category('Non-fiction', [Category('Biography'), Category('Science')]),
  ]);

  debugPrint(
    category.toStringDeep(),
  ); // 트리 구조로 출력 //toStringDeep()를 통해 계층 구조를 시각화.
}

/*
출력 결과

flutter: Category#3dda7
flutter:  │ name: "Books"
flutter:  │
flutter:  ├─subCategory: Category#8877f
flutter:  │   name: "Fiction"
flutter:  │
flutter:  └─subCategory: Category#249a7
flutter:    │ name: "Non-fiction"
flutter:    │
flutter:    ├─subCategory: Category#79086
flutter:    │   name: "Biography"
flutter:    │
flutter:    └─subCategory: Category#c11c4
flutter:        name: "Science"
flutter:

*/
