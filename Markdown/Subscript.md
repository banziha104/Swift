# 서브스크립트 

> 클래스, 구조체, 열거에는 컬렉션, 리스트, 시퀸스 등 타입의 요소에 접근하는 단축 문법인 서브스크립트를 정의할 수 있음.

- 서브스크립트 문법 : 인스턴스의 이름 뒤에 대괄호로 감싼 값을 써줌으로써 내부의 특정 값에 접근할 수 있음. subscript 키워드를 사용함

```swift
struct Student{
    var name : String
    var number : Int
}

class School{
    var number : Int = 0
    var students : [Student] = [Student]()
    
    func addStudent(name : String){
        let student : Student = Student(name : name, number : self.number)
        self.students.append(student)
        self.number += 1
    }
    
    func addStudent(names : String...) {
        for name in names {
            self.addStudent(name : name)
        }
    }
    
    subscript(index : Int) -> Student?{
        if index < self.number{
            return self.students[index]
        }
        return nil
    }
}
```

