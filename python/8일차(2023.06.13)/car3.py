#상속과 메서드 오버라이딩

class Car:
    color = ''  #이 변수를 필드라 한다. 
    speed = 0   #필드
    
    def __init__(self):     # 클래스 시작할 때 값을 초기화
        self.color = '빨강'
        self.speed = 0
        
    def upSpeed(self, value):  #self.speed는 3행의 speed 의미. 즉, 자신의 클래스에있는 speed 변수. upSpeed는 메서드
        self.speed += value

        print(f'현재 속도(상위클래스): {self.speed}')
        
    def downSpeed(self, value):  #메서드
        self.speed -= value
        
class Sedan(Car):
    def upSpeed(self, value):       #메서드 오버라이딩
        self.speed += value
        
        if self.speed > 150:
            self.speed = 150    
        
        print(f'현재 속도(상위클래스): {self.speed}')
        
class Truck(Car):
    pass

#변수선언부분
sedan1, truck1 = None, None
#메인코드부분
truck1 = Truck()
sedan1 = Sedan()

print('트럭-->', end = ' ')
truck1.upSpeed(200)

print('승용차-->', end = ' ')
sedan1.upSpeed(200)
        
###################문제######################
# Sonata 클래스를 추가해보자. 단 Sonata 클래스는 Car-> Sedan-> Sonata 순서로 상속을 받도록 하자. 
# Sonata 클래스에는 특별히 추가하는 필드나 메서드가 없다. 

class Sonata(Sedan):
    pass

sonata1 = None
sonata1 = Sonata()
print('트럭s-->', end = ' ')
truck1.upSpeed(200)

print('승용차s-->', end = ' ')
sedan1.upSpeed(200)

print('소나타s-->', end = ' ')
sonata1.upSpeed(100)