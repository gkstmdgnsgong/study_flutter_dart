//165p 질문

질문 : createState()와 setState()의 차이

좋은 질문입니다! `setState()`와 `createState()`는 모두 Flutter에서 **State 객체**와 관련이 있지만, **역할과 실행 시점이 완전히 다릅니다**. 아래에 그 차이를 명확하게 정리해드릴게요.

---

## 🟡 `createState()`란?

```dart
class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}
```

### ✅ 역할

* `StatefulWidget`이 **최초로 생성될 때 단 한 번만 호출**됩니다.
* 이 메서드는 `StatefulWidget`과 연결될 실제 `State` 객체(상태 로직이 있는 클래스)를 반환합니다.
* 반환된 `State` 객체는 이후 `build()`나 `setState()` 등 상태 변경 관리에 사용됩니다.

### 🔁 호출 시점

* 위젯이 화면에 처음 등장할 때 (`runApp()` → `MyWidget()` 호출될 때)
* 이후 위젯이 리빌드되어도 `createState()`는 다시 호출되지 않습니다.
  → 즉, **한 번 생성된 State는 계속 재사용**됩니다.

---

## 🔵 `setState()`란?

```dart
setState(() {
  // 상태 변경 코드
});
```

### ✅ 역할

* `State` 객체 내에서 상태가 변경되었음을 Flutter에 알리는 메서드입니다.
* 호출 시 `build()` 메서드를 다시 실행시켜 UI를 갱신하게 합니다.

### 🔁 호출 시점

* 사용자가 어떤 이벤트(버튼 클릭 등)를 발생시켰을 때
* 상태를 바꿔야 할 때마다 수시로 호출 가능
* 단, `setState()`는 반드시 **State 객체 내부에서만 사용** 가능

---

## 📌 차이점 요약

| 항목      | `createState()`        | `setState()`             |
| ------- | ---------------------- | ------------------------ |
| 소속 클래스  | `StatefulWidget`       | `State`                  |
| 호출 시점   | 위젯이 **최초 생성될 때 1번만**   | **상태가 바뀔 때마다 수시로 호출** 가능 |
| 주요 목적   | 연결된 `State` 객체를 반환     | UI를 **다시 빌드하도록 트리거**함    |
| 반환 타입   | `State<MyWidget>` 객체   | 반환값 없음 (`void`)          |
| 어디서 호출? | 자동 호출 (개발자가 직접 호출 안 함) | 개발자가 명시적으로 호출            |