//166p

질문 : Element 객체에 대해 상세히 알고 싶어 

https://coaspe.tistory.com/81

물론입니다. 아래는 주어진 글을 마크다운(Markdown) 형식으로 보기 좋게 정리한 것입니다. 내용은 변경하지 않고, 가독성 향상을 위해 제목, 소제목, 리스트, 코드 블록 등을 적절히 사용했습니다.

---

# Flutter - Element

> *작성자: aspe | 작성일: 2023. 2. 17. 13:57*

---

## 개요

**Element**는 트리의 특정 위치에 있는 인스턴스화된 Widget입니다.
위젯은 서브트리를 어떻게 구성할지를 묘사하지만, **위젯은 불변**이기 때문에 다수의 서브트리를 동시에 구성하기 위해 동일한 위젯들이 사용될 수 있습니다.

**Element는 위젯을 사용하여 트리에서 특정 위치를 구성하는 것을 나타냅니다.**
예를 들어 상위 위젯이 재구성되고 이 위치에 대한 새 위젯을 만드는 경우, 지정된 Element와 연관된 위젯이 시간이 지남에 따라 변경될 수 있습니다.

Elements는 트리를 형성하며, 대부분의 Elements는 고유한 자식을 가지지만, 일부 위젯은 다수의 자식을 가질 수 있습니다. (예: `RenderObjectElement`의 서브클래스들)

---

## Element의 생명주기

1. **Element 생성**

   * 프레임워크가 `Widget.createElement()`를 호출하여 Element를 생성합니다.

2. **mount**

   * 새로 생성된 Element를 지정된 부모 슬롯의 트리에 추가하기 위해 `mount()`가 호출됩니다.
   * 이 메서드는 자식 위젯을 **inflating(메모리에 올림)** 하고, 필요 시 `attachRenderObject()`를 호출하여 렌더 트리에 렌더 객체를 추가합니다.
   * 이 시점에서 Element는 **"active" 상태**이며, 스크린에 나타납니다.

3. **update**

   * 부모가 이 Element를 구성하는 데 사용한 위젯을 변경할 수 있습니다. (예: 부모가 새로운 상태로 rebuild하는 경우)
   * 이때 프레임워크는 `update()`를 호출합니다.
   * 새로운 위젯은 항상 이전의 위젯과 같은 \*\*`runtimeType`과 `key`\*\*를 가져야 합니다.
   * 만약 부모가 트리의 해당 위치에서 위젯의 `runtimeType`이나 `key`를 변경하고자 한다면, 이 Element를 `unmount()`하고 해당 위치에 새로운 위젯을 inflate해야 합니다.

4. **deactivateChild**

   * 조상이 자식 Element (혹은 중간의 조상)를 트리에서 제거할 경우 `deactivateChild()`가 호출됩니다.
   * 이는 해당 Element의 렌더 객체를 렌더 트리에서 제거하고 `deactivate()`를 호출합니다.
   * 이후 `owner`의 **비활성화된 Elements 리스트**에 추가됩니다.
   * 이 시점에서 Element는 **"inactive" 상태**입니다. (스크린에서 사라짐)
   * Element는 현재 **애니메이션 프레임이 끝날 때까지** inactive 상태로 유지될 수 있습니다.

5. **재활성화 또는 제거**

   * 만약 Element가 프레임이 끝나기 전에 트리로 **다시 합쳐진다면**, 프레임워크는:

     * `owner`의 비활성화된 Element 리스트에서 해당 Element를 제거하고
     * `activate()`를 호출하여 렌더 객체를 다시 렌더 트리에 추가합니다.
   * **프레임이 끝날 때까지 트리로 복귀하지 못하면**, `unmount()`가 호출됩니다.
   * 이 시점에서 Element는 **"defunct" 상태**가 되어 트리로 다시 돌아갈 수 없습니다.

---

## 주요 메서드 요약

### `mount()`

| 라인       | 설명                                                |
| -------- | ------------------------------------------------- |
| 3722\~27 | Element가 초기화된 상태인지 확인 (widget이 null인지, 부모가 있는지 등) |
| 3728\~31 | 멤버 변수 할당                                          |
| 3732\~37 | 부모가 있을 경우 `_owner`를 부모의 `owner`로 설정               |
| 3738     | 할당된 `owner`가 null인지 확인                            |
| 3739\~42 | key를 할당하고, GlobalKey일 경우 `owner`에 등록              |
| 3743     | 부모의 `InheritedWidgets`을 할당                        |
| 3744     | 부모의 `NotificationNode`를 할당                        |

---

### `update()`

| 라인       | 설명                                                             |
| -------- | -------------------------------------------------------------- |
| 3763\~69 | Element가 active 상태인지, widget이 null인지, runtimeType과 key가 같은지 확인 |
| 3769     | `canUpdate`: static 메서드, `runtimeType`과 `key`를 비교              |
| 3776\~81 | `Forgotten children`의 GlobalKey 예약 제거                          |
| 3782     | 새로운 위젯으로 할당 (갱신)                                               |

---

### `deactivateChild()`

| 라인       | 설명                                    |
| -------- | ------------------------------------- |
| 4010\~11 | 자식이 null인지, 부모와 현재 메서드 실행 주체가 같은지 확인  |
| 4012     | 자식의 부모 제거                             |
| 4013     | Render 트리에서 `renderObject` 제거 (재귀 호출) |
| 4014\~15 | owner의 `inactiveElements`에 자식 추가      |

> 💬 주석: `"this eventually calls child.deactive()"` → 1969라인 참조

---

### `deactivate()`

| 라인       | 설명                                       |
| -------- | ---------------------------------------- |
| 4139\~42 | active 상태인지, widget과 depth가 null이 아닌지 확인 |
| 4143\~46 | InheritedElement의 `_dependents`에서 자신 제거  |
| 4155     | Element를 inactive 상태로 변경                 |

---

### `unmount()`

| 라인       | 설명                                             |
| -------- | ---------------------------------------------- |
| 4186\~89 | inactive 상태인지, widget, depth, owner가 null인지 확인 |
| 4191\~94 | `GlobalKey`인 경우, `unregister` 실행               |
| 4197\~99 | widget, dependencies 초기화, 상태를 defunct로 설정      |

---

## 상속 구조

```plaintext
Object
 └── DiagnosticableTree
      └── Element
```

---

## 인터페이스 구현

* **BuildContext**

## 구현체

* **ComponentElement**
* **RenderObjectElement**

---

## 생성자

```dart
Element(Widget widget)
```

---
