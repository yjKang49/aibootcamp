# 클래스 상속
# 상속(inheritance)
# 어떤 클래스를 만들 때 다른 클래스의 기능을 물려받을 수 있게 만드는 것. 
# FourCal 클래스를 상속하는 MorFourCal 클래스
# class MoreFourCal(FourCal):
#     pass

# class 자식클래스(부모클래스):  #부모클래스 또는 상위클래스, 자식클래스 또는 하위클래스
#     자식클래스의 내용
# 메서드 오버라이딩: 부모가 가지고있는 메서드를 자식클래스가 똑같은 이름의 메서드를 정의하고 기능을 추가한 것.

from fourcal import FourCal         #from 파일명 import class명

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


class MorFourCal(FourCal):
    def pow(self):
        result = self.first ** self.second
        return result
    
a = MorFourCal(4,2)
power = a.pow()      
print(power)

#메서드 오버라이딩
#상속받은 대상인 클래스의 메서드와 이름은 같지만 그 행동을 다르게 해야할 때 메서드 이름을 동일하게 다시 구현하는 것을 메서드 오버라이딩이라 한다. 
# a = FourCal(4,0)        #메서드 오버라이딩은 부모와 이름이 같은데 기능을 추가한 것
# a.div()     #에러남. 0으로 나눔

class SafeFourCal(FourCal):
    def div(self):      #부모(상속받은 대상)의 메서드와 이름이 같지만 기능이 다름
        if self.second == 0:        #부모의 메서드는 0으로 나눴을 때 에러나지만 에러나지 않고 0 리턴하도록.
            return 0
        else:
            return self.first / self.second