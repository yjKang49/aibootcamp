
class FourCal:
    # def __init__(self, first, second):      
    #     self.first = first                  ########fourcal2.py 참고
    #     self.second = second
        
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
    
a = FourCal()
a.setdata(4,2)      #a는 setdata, add를 가지고있다. 

b = FourCal()
b.setdata(7,3)

print(a.add())    
print(a.mul()) 
print(a.sub()) 
print(a.div()) 

print(b.add())    
print(b.mul()) 
print(b.sub()) 
print(b.div()) 

    
#이부분 주석처리하고 현재 주석처리된 부분 풀면 __init__ 부분 주석처리   
#__init__ 으로 초기화하면 a = FourCal() 와 a.setdata(4,2) 할필요없이 바로 a = FourCal(4,2) 사용가능 
# a = FourCal(4,2)
# print(a.first)
# print(a.second)
# print(a.add())    
# print(a.div())    
    
    
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

