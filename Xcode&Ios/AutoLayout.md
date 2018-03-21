# AutoLayout

> 모든 해상도에 대응하기 위해 하는 View 작업
> <br> 직접 x,y 좌표를 정해주는 절대좌표가 아닌 제약을 통한 상대좌표로 구현
> <br> 가장 인접한 UI를 기준으로 제약 추

- Constrain to margins : 기준점을 잡음
- Preview : 런타임 된 뷰를 미리 볼 수 있음
- 실선 : 필수제약
- 점선 : 선택제약 
- 제약 우선 순위 : 제약 클릭 후 attribute inspector에서 prioty 설
- Multiplier : 동일한 뷰의 비율을 맞춤
- Alignments : 뷰를 컨테이너에 맞게 넣어줌
- Alignments Vs Constrain : 정렬은 width, height에 맞게 변경되지만, Constrains은 할 수 없음
- Vertical Spacing : 해당 뷰를 기준으로 상단 제약을 걸음
- ViewController -> Edit -> Embed in -> Navigation Controller


# 코드로 제약 변경하기 
# View as : IPhone 8(wC hR)

- Vary for Traits : 화면 커스터마이징
