#클래스(class): 반복되는 변수나 메서드를 미리 정해놓은 틀(설계도)
#반복되는 변수: result, 반복되는 메서드: add

result1 = 0
result2 = 0

def add1(num):
    global result1 
    result1 += num
    return result1

def add2(num):
    global result2
    result2 += num
    return result2

print(add1(3))
print(add2(4))
print(add1(3))
print(add2(7))


