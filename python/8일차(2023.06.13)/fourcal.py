# 클래스 안에 구현된 함수를 메서드(method)라 부른다. 
# setdata 메서드의 입력 인수는 self, first, second라는 3개의 입력값을 받는다
# set 메서드의 첫번째 인수에는 자동으로 a라는 인스턴스가 입력으로 들어가게 된다.

#생성자
# 생성자는 인스턴스를 생성하면서 필드값을 초기화시키는 함수
# 생성자의 기본형태: __init__() 라는 이름
# tip. __init__()은 앞뒤로 언더바(_)가 2개씩, init은 initialize의 약자로 초기화 의미. 언더바가 2개 붙은것은 파이썬에서 예약해놓은것, 프로그램 작성시 이 이름을 사용해서 새로운 함수나 변수명을 만들지 말것.

#     def __init__(self):
#         이부분에 초기화할 코드입력

class FourCal:
    def __init__(self, first, second):      # __init__부분 주석처리하면 맨 밑 47~53 line주석처리. 30~44line 주석풀기. 
        self.first = first                  ########fourcal2.py 참고. fourcal.py가 fourcal2.py보다 개선된 방식.
        self.second = second
        
    def setdata(self, first, second):       #파이썬 메서드의 첫번째 매개변수 이름은 관례적으로 self를 사용한다. 
        self.first = first                  #a.setdata(3,4) 일때 self는 a, first는 3, second는 4
        self.second = second
        
    def add(self):
        result = self.first + self.second
        return result
    
    def mul(self):
        result = self.first * self.second
        return result
    
    def sub(self):
        result = self.first - self.second
        return result
    
    def div(self):
        result = self.first / self.second
        return result 
    
# a = FourCal()
# a.setdata(4,2)      #a는 setdata, add를 가지고있다. 

# b = FourCal()
# b.setdata(7,3)

# print(a.add())    
# print(a.mul()) 
# print(a.sub()) 
# print(a.div()) 

# print(b.add())    
# print(b.mul()) 
# print(b.sub()) 
# print(b.div()) 

    
#이부분 주석처리하고 현재 주석처리된 부분 풀면 __init__ 부분 주석처리   
#__init__ 으로 초기화하면 a = FourCal() 와 a.setdata(4,2) 할필요없이 바로 a = FourCal(4,2) 사용가능 
a = FourCal(4,2)
print(a.first)
print(a.second)
print(a.add())    
print(a.div())    
    
    
#클래스의 상속
class MorFourCal(FourCal):
    pass

inheritance = MorFourCal(4,2)
inheriAdd = inheritance.add()
inheriMul = inheritance.mul()
inheriSub = inheritance.sub()
inheriDiv = inheritance.div()

print('inheriAdd: ', inheriAdd) 
print('inheriMul: ', inheriMul)
print('inheriSub: ', inheriSub)
print('inheriDiv: ', inheriDiv)

