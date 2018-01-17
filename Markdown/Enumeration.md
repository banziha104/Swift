# 열거형

> 스위프트는 열거형을 일급시민으로 취급, 제한된 범위를 가지는 상수를 사용함 <br>
> Style, Alignment , Result, Option 이 뒤에 붙는 경우, 열거형일 확률이 높음 <br>
> 

- 문법

```swift

enum Alignment {
   case left
   case center
   case right
}

let alignment1: Alignment = .center
let alignment2: Alignment = .center //단축형으로 사용
var alignment3 = Alignment.center 
alignment3 = .right

// 열거형의 경우 default 값이 없어도 가능
switch alignment {
case .left:
   print("left")
case .center:
   print("center")
case .right:
   print("right")
}

```

- 원시 값을 이용한 초기값 저

```swift
/*String, Character, Number Type 만 저장 가*/
WeekdayName.sunday
WeekdayName.sunday.rawValue
WeekdayName.monday
WeekdayName.monday.rawValue

enum WeekdayName2: String {
   case sunday, monday = "Mon", tuesday, wednesday, thursday, friday, saturday
}

WeekdayName2.sunday
WeekdayName2.sunday.rawValue

WeekdayName2.monday
WeekdayName2.monday.rawValue
```