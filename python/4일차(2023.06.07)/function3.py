#지역변수와 전역변수
#지역변수 : 함수내에서만 존재한다.
#전역변수 : 함수외부에서 존재한다. 모든 함수가 하나의 변수를 사용하고자할 때 사용한다. 많이 쓰지 않는게 좋다.

g_x = 1

def myfunc():
    x = 2       #지역변수, 함수내에서만 사용가능하다.
    x = x + 1
    global g_x      #전역변수임을 지정해야 알아듣는다. 
     
    g_x = g_x + 1   #g_x는 누군지 모르겠는데 왜 값을 증가하지? error남. 위에 global g_x 표기 필수. 
    #g_x그냥 쓸때는 상관없음. 연산이 문제. interpreter는 그때그때 만들어쓰기 때문에 
     
    print('지역변수: ', x)
    print('전역변수: ', g_x)
    
myfunc()    #함수호출하기 2 2
myfunc()    #함수호출하기 2 3
myfunc()    #함수호출하기 2 4
myfunc()    #함수호출하기 2 5
myfunc()    #함수호출하기 2 6


#반환값문제 - 반환이 값이 하나만 된다. 
def doubleValue(x,y):
    #함수내의 매개변수는 함수 외부로부터 값을 읽어만 오고 보내지 못한다. (python에 아예만들지x)
    x = x * 2
    y = y * 2
    print("x = ", x)
    print("y = ", y)    #함수가 종료되면 지역변수가 사라진다. 
    
a = 5
b = 7
doubleValue(a, b)
print("a = ", a)    #결과값=5
print("b = ", b)    #결과값=7. a와 b를 함수에 매개변수로 복사만 하고 받지못함

#다른언어의 경우에는 a라는 변수의 주소와 b라는 변수의 주소를 전달할 방법이 있다.
#파이썬은 없음

def doubleValue2(x, y):
    #함수 내의 매개변수는 함수외부로부터 값을 읽어만 오고 보내지 못한다. 
    x = x * 2
    y = y * 2
    return x, y     #자동으로 tuple로 바뀌면서 하나가 리턴된다. (이럴때 쓰려고 만든게 tuple. python에만 있는 문법)

result = doubleValue2(a,b)
print( result, type(result))

a, b = doubleValue2(a, b)
print('a: ', a)
print('b: ', b)


