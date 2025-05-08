// 170p

질문 : 리스너는 어떻게 항상 감시할 수 있지? C언어의 포인터처럼 메모리 주소값 수준에서 설명해줘

아주 수준 높은 질문입니다.
"리스너가 어떻게 항상 감시할 수 있냐?"라는 질문은 결국,

> "리스너는 어떻게 이벤트 발생을 실시간으로 감지하고 콜백을 실행할 수 있을까?"
> 라는 의문이며, 이를 C언어식 메모리 구조 관점(예: 포인터, 주소 참조)에서 설명해달라는 요청입니다.

---

## 🔧 결론부터 말하면:

**리스너(listener)는 내부적으로 "관찰 대상 객체의 상태 변화"를 감지하는 구조 안에 콜백 함수의 *함수 포인터*를 저장해두고**,
**이벤트가 발생하면 해당 포인터를 통해 콜백 함수를 호출**합니다.
→ 이 구조는 C 언어에서 **콜백 함수 포인터를 등록하고, 필요할 때 호출하는 방식**과 본질적으로 동일합니다.

---

## 💡 C 언어에서의 콜백 구조 예시

```c
#include <stdio.h>

void on_event() {
    printf("이벤트 발생!\n");
}

void addListener(void (*callback)()) {
    // 이벤트가 발생했을 때 callback을 호출한다고 가정
    // 지금은 수동으로 호출
    callback(); // = (*callback)();
}

int main() {
    addListener(on_event); // 함수 포인터 등록
    return 0;
}
```

여기서 중요한 점은:

* `addListener()`가 **콜백 함수의 주소**를 인자로 받아 저장 또는 실행한다는 것
* 이벤트가 발생하면 그 **함수 포인터를 통해 콜백을 실행**한다는 것

---

## 🔁 Dart에서의 대응 구조

Dart에서 `_scrollController.addListener(() { ... })`를 호출하면:

1. `ScrollController` 내부에는 **리스너 콜백들을 담아두는 리스트(List<Function>)** 가 존재함.
2. 스크롤 위치가 변할 때마다 `ScrollController` 내부 로직이 이 리스트에 저장된 콜백들을 **하나씩 호출**함.

즉, 마치 C 언어에서 함수 포인터를 저장해두고 `(*callback)()` 하듯이,
Dart는 \*\*`Function` 타입으로 전달된 익명 함수의 참조(주소)\*\*를 저장해두고, 이벤트 발생 시마다 호출합니다.

---

## 🔬 메모리 수준 설명 요약

| 개념     | C 언어 방식                     | Dart (또는 고수준 언어) 방식            |
| ------ | --------------------------- | ------------------------------ |
| 콜백 등록  | `void (*callback)()` 포인터 저장 | `List<Function>`에 함수 참조 저장     |
| 콜백 호출  | `(*callback)();`            | `callback();` or `listener();` |
| 메모리 관점 | 함수의 주소를 저장하고 실행             | 함수 객체를 참조값으로 저장하고 호출           |

---

## ✅ 요약 정리

* 리스너는 "콜백 함수의 주소(참조)를 저장해두고, 이벤트 발생 시 해당 주소를 참조하여 함수 실행"하는 구조.
* 이는 C 언어의 함수 포인터와 동일한 구조적 개념.
* Dart에서는 함수 자체가 객체(Function 객체)이므로, 이 객체를 리스트 등에 저장하고 필요할 때 실행함.

---

후속 질문 : 감지하는 구조, 이것에 대해 좀 더 상세하게 설명해줘, 이벤트가 발생하는 걸 어떻게 알아차리지?

좋습니다. 이제 핵심을 더 깊이 파고들어 보겠습니다.
질문은 결국 **"리스너는 이벤트가 발생하는 걸 어떻게 *감지*하느냐?"**, 즉

> \*\*이벤트를 *자동으로 인식하는 구조(감지하는 구조)*는 어떻게 동작하는가?**
> 입니다.

Dart(또는 일반적인 GUI 프레임워크)에서는 이 감지 구조가 크게 두 가지 방식으로 나뉩니다:

---

## 🔸 1. **상태 변경 감지 (State Change Detection)** – 내부 상태를 추적하는 방식

### ✅ 개념

* 어떤 객체(예: `ScrollController`)는 \*\*내부 상태(예: 스크롤 위치)\*\*를 갖고 있음.
* 이 객체는 상태가 바뀌었는지를 항상 알고 있고, **상태가 바뀌는 메서드를 통해만 바뀌도록 설계**됨.
* 이 메서드에서, 바뀌었다는 것을 알면 **등록된 리스너를 자동 호출함**.

### 🧠 동작 흐름 (예: ScrollController)

```dart
ScrollController.jumpTo(100.0);  // 스크롤 위치를 100으로 이동

→ 내부 offset 값이 바뀜
→ 이 때 감지됨
→ addListener(...)에 등록된 콜백 함수가 호출됨
```

### 💡 핵심:

* 상태 변경은 반드시 특정 메서드(jumpTo, animateTo 등)를 통해서만 이루어짐
* 그 메서드 내부에서 `notifyListeners()` 같은 메서드가 호출되어 **리스너에게 알림**

```dart
// 내부에 이런 구조가 있다고 생각할 수 있음
void _updateScrollPosition(double newOffset) {
  offset = newOffset;
  notifyListeners(); // 모든 등록된 콜백을 호출
}
```

> 이 방식은 *C 언어에서 setter 함수를 통해 값이 바뀔 때 콜백을 실행하는 구조*와 유사합니다.

---

## 🔸 2. **이벤트 루프 & 메시지 큐 (Event Loop & Message Queue)** – 프레임워크 기반 이벤트 감지

### ✅ 개념

* Flutter/Dart는 내부적으로 \*\*이벤트 루프(Event Loop)\*\*를 갖고 있음.
* 사용자의 제스처, 터치, 시스템 이벤트 등은 **비동기 이벤트 큐에 쌓임**.
* 이벤트 루프는 이 큐를 하나씩 꺼내서 처리함.
* 처리 대상이 특정 위젯이나 컨트롤러인 경우, 해당 객체가 **자신의 상태를 업데이트하고, 리스너에게 알려줌**.

### 🧠 동작 흐름 (예: 사용자가 화면을 스크롤함)

1. 사용자의 터치 → 화면 위에서 드래그 발생
2. Flutter의 **GestureDetector → Scrollable → ScrollController**로 이벤트 전파
3. `ScrollController`의 offset 값 변경됨
4. 내부에서 `notifyListeners()` 호출
5. 등록된 콜백 함수 실행

---

## 🔍 실제 Flutter 내부 구조 (대표적으로 `ChangeNotifier` 예시)

많은 위젯이나 객체들은 `ChangeNotifier`를 상속합니다.
이 클래스에는 다음과 같은 구조가 숨어 있습니다:

```dart
class ChangeNotifier {
  final List<VoidCallback> _listeners = [];

  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  @protected
  void notifyListeners() {
    for (final listener in _listeners) {
      listener(); // 콜백 호출
    }
  }
}
```

> 결국 **상태가 바뀌는 시점에 `notifyListeners()`를 직접 호출함으로써 감지를 발생**시키는 구조입니다.

---

## 📌 요약

| 감지 구조 유형         | 설명                                       | 예시                                          |
| ---------------- | ---------------------------------------- | ------------------------------------------- |
| **내부 상태 변경 감지**  | 상태가 바뀌는 순간 직접 리스너 호출 (`notifyListeners`) | `ScrollController`, `TextEditingController` |
| **이벤트 루프 기반 감지** | Flutter가 이벤트 큐로 사용자 행동을 감지하고 전달          | 터치, 드래그, 클릭 등 UI 이벤트                        |

---

## 🔚 결론

> 리스너는 스스로 감지하는 게 아닙니다.
> **감시 대상 객체**가 자신의 상태 변화를 감지하고, **등록된 콜백을 호출함으로써 이벤트를 알리는 구조**입니다.

즉, "리스너가 감지한다"는 표현은 실제로는
→ \*\*"이벤트를 감지하는 주체가 내부에 있고, 리스너에 콜백을 전달해줄 뿐"\*\*이라는 구조로 이해하는 것이 정확합니다.

---

참고 문헌 : 
https://velog.io/@osung/Flutter-이벤트-루프Event-Loop와-isolate
https://gee6809.github.io/posts/event_loop/#google_vignette