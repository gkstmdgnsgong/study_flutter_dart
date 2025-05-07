아래는 Dart에서의 `mixin`, `abstract class`, `interface` 개념을 **기술 면접 수준**으로 **비교·정리한 표**입니다.

---

## ✅ Dart의 클래스 재사용 구조 정리

| 구분                  | mixin                              | abstract class               | interface                    |
| ------------------- | ---------------------------------- | ---------------------------- | ---------------------------- |
| **정의 목적**           | 기능(behavior) 주입                    | 공통 규약 + 기본 구현 제공             | 구현 강제 (계약)                   |
| **사용 키워드**          | `mixin` / `class with`             | `abstract class`             | 모든 class가 자동적으로 interface 역할 |
| **상속 키워드**          | `with`                             | `extends`                    | `implements`                 |
| **생성자 포함 가능 여부**    | ❌ 불가능                              | ⭕ 가능                         | ⭕ 구현 시 생성자 필요 없음             |
| **상태(필드) 포함 가능 여부** | ⚠️ 제한적 (final 또는 static은 허용)       | ⭕ 가능                         | ❌ 구현체에서 구현 필요                |
| **다중 적용 가능 여부**     | ✅ 가능 (`with A, B`)                 | ❌ 단일 상속만 가능                  | ✅ 가능 (`implements A, B`)     |
| **사용 목적**           | 여러 클래스에 기능만 재사용                    | 추상 메서드 + 부분 구현 제공            | 메서드 정의 강제 (다형성 활용)           |
| **상속 구조**           | 수평적 기능 공유                          | 계층적                          | 계약적                          |
| **기본 구현 가능 여부**     | ✅ 가능                               | ✅ 가능                         | ❌ 불가능 (메서드 시그니처만 정의)         |
| **대표 예시**           | `Diagnosticable`, `TickerProvider` | `State<T>`, `ChangeNotifier` | `Comparable`, `Iterable`     |

---

## ✅ 면접에서 쓸 수 있는 핵심 문장 정리

* **mixin**은 다중 상속이 아니라, "기능의 재사용"을 위한 수단입니다.
* **abstract class**는 상태와 구현을 일부 포함할 수 있으며, 상속을 통해 구체 클래스에서 확장합니다.
* **interface**는 명시적 선언이 없어도 모든 클래스가 인터페이스처럼 작동합니다. `implements`로 다중 구현이 가능합니다.
* Dart에서는 **다중 상속을 허용하지 않지만**, `with`와 `implements`를 통해 다중 기능 조합과 계약 기반 프로그래밍이 가능합니다.

---

## ✅ 실전 예시 코드

```dart
// mixin
mixin Logger {
  void log(String msg) => print('Log: $msg');
}

// abstract class
abstract class Animal {
  void speak();
  void move() => print('The animal moves.');
}

// interface 역할
class Flyable {
  void fly(); // 구현 없음
}

// concrete class
class Bird extends Animal with Logger implements Flyable {
  @override
  void speak() => print('Chirp');

  @override
  void fly() => print('Flies high');

  void perform() {
    log('Bird is performing.');
    speak();
    fly();
    move();
  }
}
```
