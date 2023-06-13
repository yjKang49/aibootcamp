#클래스(class): 반복되는 변수나 메서드를 미리 정해놓은 틀(설계도)
#클래스를 쓰는 방법
# 1. class입력하고 
# 2. 대문자로 시작하는 클래스의 이름을 작성
# 3. 안에 들어갈 함수와 변수 설정

#클래스를 이용하면 계산기의 개수가 늘어나더라도 인스턴스를 생성하기만 하면 되기 때문에 함수를 사용하는 경우와 달리 매우 간단.
#클래스(class)는 똑같은 무엇인가를 계속 만들어낼 수 있는 설계도면
#객체(object): 클래스로 만든 피조물
#클래스는 과자틀, 객체는 과자틀로 만든 과자!^^


class Calculator:
    def __init__(self):     #생성자
        self.result = 0
        
    def add(self, num):
        self.result += num
        return self.result 
    
    def sub(self, num):
        self.result -= num
        return self.result

cal1 = Calculator()
cal2 = Calculator()
cal3 = Calculator()

print(cal1.add(3))
print(cal2.add(5))
print(cal1.add(9))
print(cal2.add(2))

print(cal3.add(4))

#아무기능도 없는 껍질뿐인 클래스도 객체생성이 가능
class Cookie:
    pass

a = Cookie()        #a는 객체. a 객체는 Cookie의 인스턴스이다.(관계)
b = Cookie()

#생성자
# 생성자는 인스턴스를 생성하면서 필드값을 초기화시키는 함수
# 생성자의 기본형태: __init__() 라는 이름
# tip. __init__()은 앞뒤로 언더바(_)가 2개씩, init은 initialize의 약자로 초기화 의미. 언더바가 2개 붙은것은 파이썬에서 예약해놓은것, 프로그램 작성시 이 이름을 사용해서 새로운 함수나 변수명을 만들지 말것.

#     def __init__(self):
#         초기화할 코드입력





