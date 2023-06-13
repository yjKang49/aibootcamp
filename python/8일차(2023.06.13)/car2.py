#매개변수가 있는 생성자
# car.py 보다 개선된 방식의 코드

class Car:
    color = ''  #이 변수를 필드라 한다. 
    speed = 0   #필드
    
    def __init__(self, value1, value2):     # 클래스 시작할 때 값을 초기화. 매개변수2개 value1, value2
        self.color = value1
        self.speed = value2
        
    def upSpeed(self, value):  #self.speed는 3행의 speed 의미. 즉, 자신의 클래스에있는 speed 변수. upSpeed는 메서드
        self.speed += value
        if (self.speed > 150):      #150km가 넘으면 150km 출력
            self.speed = 150
        
    def downSpeed(self, value):  #메서드
        self.speed -= value
        
myCar1 = Car('빨강', 30)
myCar2 = Car('파랑', 60)

print(f'자동차1의 색상은 {myCar1.color} 이며, 현재 속도는 {myCar1.speed} 입니다.')
print(f'자동차2의 색상은 {myCar2.color} 이며, 현재 속도는 {myCar2.speed} 입니다.')
