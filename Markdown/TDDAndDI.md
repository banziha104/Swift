# Unit Testing

- 테스트 커버리지 : 전체 코드 대비 테스트 받은 코드량
    - cmd + shf + , -> test -> info -> gather coverage test
- 테스트 프로세스
    - given : 초기 설정
    - when : 실행
    - then : 결과 

- 테스트 빌드: 
    - cmd + shf + u  : 테스트 빌드
    

# Dependency Injection

- 커플링 : 의존성이강함
- 디커플링 : 나누어서 의존성을 낮추는 행위
- 테스트 대역(Test Double)
    - Dummy : 파라미터를 채우기 위해서 사용
    - Fake : 실제 작동을 흉내만 냄
    - Stub : 실제 작동을 조작해서 원하는 결과를 낼 수 있음
    - Spy : 메서드 호출 등을 기록함
    - Mock : 메소드 호출 등을 기록해서 검증까지함

- 의존성 주입
    - Constructor Injection : 생성자 주입
    - PropertyInjection
   
    
# TDD

> 테스트 주도 개발 방법론

- TDD Check List
    - 레드 : 테스트 코드 작성, 반드시 실패해야한다.
    - 그린 : 테스트 코드에 맞게 코드를 작성한다.
    - 리팩터 : 유지보수에 맞게 깔끔하게 정리한다.