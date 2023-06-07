#파이썬의 함수는 def키워드로 시작하고 함수이름(변수들을 놓을 수 있다):
#함수를 정의함
def display():
    print('--------------------출력중-------------------')

#함수를 호출한다- call
display()
display()
display()
display()
display()
display()

#자바의 overloading - 함수의 이름이 같은데 매개변수의 형태나 수치를 바꾸는 기술
#동일한 이름의 함수 못만든다
def display2(line):
    for i in range(0, line):
        print('*******************************')

#이 함수는 매개변수가 있다.
display2(3)
display2(5)



####알고리즘 참고
#백준 - 문제찾고 풀이는 github    백준 문제 1004 => github 1004
#greedy(욕심쟁이, 정렬이 필요), floodfill(스택,큐)
#동적계획법: 너무 고급이라 시험에 잘 안나옴
#정보올림피아드 중고등학교 내용까지 공부. 중학교까지만해도o
#구글링 '프로그래머스', '정보올림피아드'
# https://programmers.co.kr/

def display3(mark, line, cnt):
    for i in range(0,line):
        for j in range(0,cnt):
            print(mark)
        print()

display3('hello world', 2, 3)
display3('^', 3, 5)
display3('$', 4, 10)
display3('@', 5, 30)



#함수가 일을 처리하고 값을 반환하는 경우를 작성하자

def add(x, y):
    return x + y    #return 구문이 함수를 종료하는 기능, 값을 바환하는 기능이 있다.
                    #값은 하나만 반환할 수 있다. 
                    
#함수 호출시 매개변수에 값을 전달해야한다. 
#매개변수 - 함수 외부와 함수 내부를 연결하는 역할, 외부에서 값 전달목적으로 사용하는 변수
#def add(x,y): 이때 x와 y가 매개변수이다. 매개체가 되는 변수(parameter, argument)라고도 부른다.

print( add(4,5) )
sum = add(4,5)
print("sum: ", sum)

print( display() )      #파이썬은 return이 없으면 None이 반환된다. print는 출력됨


#1~N까지 의 합계를 구해서 방환하는 함수 만들기
def sigma(limit):
    result = 0
    for i in range(1, limit+1):
        result += i     #result = result + i 일때 좌변에 동일한 변수일때 이렇게 쓸 수 있다. 
    return result

print(sigma( 10 ))
print(sigma( 100 ))
print(sigma( 1000 ))