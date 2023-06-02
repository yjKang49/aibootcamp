#튜플 - 사용법이 리스트와 유사하다. 단 읽기전용 메모리이다. 값수정이 안된다.
#아무때나 대충 데이터 묶어서 데리고 다닐 때, list타입보다 속도가 빠르다. 
#읽기 indexing 지원, 슬라이싱도 지원한다. 
# [] - list, () - tuple
fruits = ("사과", "배", "딸기", "포도")
print( fruits )
print( type(fruits))    #타입 출력
print( fruits[0])
print( fruits[1])
print( fruits[0:3])
print( fruits[::-1])

# fruits[0] = "망고"      #에러 x - 값 변경불가. 할당하지 못함.
# fruits.append('망고')   #에러
# fruits.remove("사과")   #tuple은 추가, 수정, 삭제가 불가함

name = "홍길동"
age = 12
phone = "010-0000-0000"
kor = 90
#str - 클래스, 파이썬이 제공하는 데이터 타입이다. 
# %s = 문자열, %d = 정수,  %f = 실수

#%s = name이 할당
#%d = age
#%s - 전화번호

s1 = str.format("이름 : %s 나이 : %d 전화번호: %s" % (name, age, phone))
print(s1)

s1 = str.format("이름 :%s 국어: %d 영어:%d 수학:%d" % ("임꺽정", 90, 70, 80))
print(s1)


##################################
#변수 3개를 한 번에 초기화. 이 때 시스템 내부에서 tuple 사용중 
a, b, c = 10, 20, 30

print( a )
print( b )
print( c )

##################################
#두 변수의 값을 맞바꾸고자 한다.
a = 5
b = 7
print(f"a: ", a)
print(f"b: ", b)

temp = a
a = b
b = temp
print(f"a={a} b={b}")

#파이썬에서 tuple사용
a, b = b, a
print(f"a={a}  b={b}")

for i in fruits: 
    print(i)
    
#튜플은 주로 함수와 관련되서 사용된다. 

