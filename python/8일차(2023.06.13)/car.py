#자동차 클래스의 개념을 실제 코드로 구현
#자동차의 속성은 지금까지 사용한 변수처럼 생성

#생성자
# 생성자는 인스턴스를 생성하면서 필드값을 초기화시키는 함수
# 생성자의 기본형태: __init__() 라는 이름
# tip. __init__()은 앞뒤로 언더바(_)가 2개씩, init은 initialize의 약자로 초기화 의미. 언더바가 2개 붙은것은 파이썬에서 예약해놓은것, 프로그램 작성시 이 이름을 사용해서 새로운 함수나 변수명을 만들지 말것.

#     def __init__(self):
#         초기화할 코드입력

class Car:
    color = ''  #이 변수를 필드라 한다. 
    speed = 0   #필드
    
    def __init__(self):     # 클래스 시작할 때값을 초기화
        self.color = '빨강'
        self.speed = 0
        
    def upSpeed(self, value):  #self.speed는 3행의 speed 의미. 즉, 자신의 클래스에있는 speed 변수. upSpeed는 메서드
        self.speed += value
        if (self.speed > 150):      #150km가 넘으면 150km 출력
            self.speed = 150
        
    def downSpeed(self, value):  #메서드
        self.speed -= value
        
myCar1 = Car()
myCar1.color='빨강'
myCar1.speed = 0

myCar2 = Car()
myCar2.color='파랑'
myCar2.speed = 0

myCar3 = Car()
myCar3.color='노랑'
myCar3.speed = 0

myCar1.upSpeed(40)
print(f'자동차1의 색상은 {myCar1.color} 이며, 현재 속도는 {myCar1.speed} 입니다.')
myCar2.upSpeed(50)
print(f'자동차2의 색상은 {myCar2.color} 이며, 현재 속도는 {myCar2.speed} 입니다.')
myCar3.upSpeed(200)
print(f'자동차3의 색상은 {myCar3.color} 이며, 현재 속도는 {myCar3.speed} 입니다.')

    