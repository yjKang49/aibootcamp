# 람다(lambda) : 이름이 없는 함수이다. 잠깐 만들어서 쓰고 버리는 일회용 함수.
#                함수중에 계속적으로 존재해야하는 함수가 있고, 잠깐 쓰고 버리는 일회용 함수가 있다.

#filter(함수, iterable객체) : 함수, 반환값이 True 또는 False이다. 이 함수의 실행결과가 참이면 그 데이터만 보내주고
#                               False이면 데이터 안준다.
#                               특정조건에 맞는 데이터를 추출하고자 한다.

nums=[1,2,3,33,4,6,23,26,17,19,21,8,19,27]
#짝수만 필터링

evenList = []       #리스트타입 객체를 만든다.
for n in nums:
    if n%2 ==0:     #조건식만 바꾸면 사용가능하다
        evenList.append(n)
    print(evenList)

#위의 기능과 아래가 같음.
#함수의 매개변수로 함수 전달하기(p.322) #함수를 함수의 매개변수로 전달한다. 
#함수도 주소이다. 변수에 함수를 저장할 수 있다. 파이썬은 리스트, 변수, 함수 등 모두 주소로 저장한다.
#함수에 매개변수로 전달되는 함수는 콜백함수(callback function)라고 부른다.
#호출자가 내가 직접하는게 아니고 다른 함수(또는 시스템이다.)
#함수의 매개변수나 반환값의 결정자는 내가 아니다. 약속된 형태만 보내야한다.
      
def myfilter( compare, nums ):      #myCompare함수가 compare위치에 대입됨.
    evenList = []       #리스트타입 객체를 만든다.
    for n in nums:
        if compare(n):     #조건식만 바꾸면 사용가능하다. #myCompare함수가 compare위치에 대입됨.
            evenList.append(n)
    return evenList

def myCompare(x):
    return x%2 == 0

print(myfilter(myCompare, nums) )

##############################################

def add(x,y):
    return x + y

calc = add      #함수의 주소를 변수에 저장이 가능하다. c language의 기능인데 자바가 버림. python은 가능
print("calc(4,5): ", calc(4,5))
print("add(4,5): ", add(4,5))

#프로그램중에 일부만 살짝 고칠 수 있다면 함수를 미리 만들어놓고 나머지는 사용자가 완성하도록.

filter(myCompare, nums)
print(filter(myCompare, nums))      #호출이 안됨.     
print(list(filter(myCompare, nums)))

#myCompare함수를 람다형식으로 바꾸기
# lambda x : x%2 == 0, return문 사용 못함, python에서 한줄로만 쓸 수 있음
print(list(filter(lambda x: x%2 ==0, nums)))


wordList = ["school", "book", "bookstore", "desk", "hospital", "survey", "assembly", 
            "president", "python", "flower", "sky", "cloud", "language", "phone", "house"]

#단어길이가 5개 이상인 단어만 추출해보자
print( len('school')>=5 )
for item in filter(lambda w : len(w) >= 5, wordList):
    print(item)
    
#단어가 b로 시작하는 것만 추출하기
#1
for item in filter(lambda w: w[0] =='b', wordList):
    print('b로시작하는 단어추출: ', item)

#2    
print(list(filter(lambda w: w[0]=='b', wordList)))

#b를 포함하고 있는 단어 추출하기
print(list(filter(lambda w: 'b' in w, wordList)))
    
    
    
    
    
    
    
    
    
    
    
    
    
    