// // mac: 'command + /' 로 주석을 해제해서 사용하세요
// // 예시 1: Diagnosticable 사용 – 객체 상태 출력

// import 'package:flutter/foundation.dart';

// class Book with Diagnosticable {
//   final String title;
//   final String author;

//   Book(this.title, this.author);

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties); //debugFillProperties로 properties의 객체의 상태(객체에 저장된 실제 값)을 알아냄
//     properties.add(StringProperty('title', title));
//     properties.add(StringProperty('author', author));
//   }
// }

// void main() {
//   final book = Book('1984', 'George Orwell');
//   debugPrint(book.toString()); // toString 호출 시 보기 좋은 상태 문자열이 생성됨.
//   //출력결과
//   //flutter: Book#1246f(title: "1984", author: "George Orwell")
//   // Book → 클래스 이름
//   // #1246f → Book 인스턴스의 hashCode를 16진수로 표현한 것, 실행할 때마다 달라질 수 있습니다 (hashCode는 기본적으로 메모리 위치 기반이기 때문에).
//     /*
//     왜 hashCode를 보여줄까?
//     Flutter(Dart)의 toString() 기본 구현은 다음과 비슷합니다:

//     @override
//     String toString() => '${runtimeType}#${shortHash(this)}';
//     여기서 shortHash(this)는 this.hashCode.toRadixString(16)처럼 객체의 hashCode를 16진수 문자열로 바꾼 것입니다.
//     이건 Flutter에서 디버깅 시 객체를 식별하기 쉽게 하기 위해 쓰이는 표현 방식이에요.
//     */

//   // (title: ..., author: ...) → 객체의 속성(상태)

// }
