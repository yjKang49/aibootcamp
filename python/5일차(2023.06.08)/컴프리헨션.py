#파이썬의 list타입에만 축약
wordList = ["school", "book", "bookstore", "desk", "hospital", "survey", "assembly", 
            "president", "python", "flower", "sky", "cloud", "language", "phone", "house"]

nums=[1,2,3,33,4,6,23,26,17,19,21,8,19,27]

#list타입에서 데이터 추출하기 위한 용도
#[변수명    for 변수명 리스트타입 ]
#[변수명    for 변수명 리스트타입 if 조건식]    조건식이 True인것만 추출
#[함수(변수명)    for 변수명 리스트타입 if 조건식]    조건식이 True인것 중에 값을 변경해서 추출

#소프트카피(얕은카피)와 하드카피(깊은카피)
#파이썬의 모든 변수는 데이터 자체가 아니라 데이터의 주소를 저장한다.
#만일 nums라는 변수가 있을 때 nums2 = nums 라고 하면 이때 nums2에는 nums에 저장된 주소값이 복사되어서 
#실제 데이터는 하나이고 두 개의 변수가 같은 데이터를 소유하게된다.
#이를 얕은 카피라고 하고 모든 참조형 또는 포인터형 변수의 기본 특징이다.
nums2 = nums    #이때 두 변수는 같은 데이터 공간을 소유하게된다.
nums2[0] = 100
print(nums2)    
print(nums)     #nums2와 num이 같다. 같은 주소값가짐.

nums2 = [ x for x in nums]   #하드카피 상황
nums2[0] = 50

print( 'nums: ', nums )
print( 'nums2: ', nums2 )

evenList = [ n for n in nums if n%2 == 0]       #n for n 에서 n과 n위치는 같은 문자여야함.
print( 'evenList: ', evenList )

#3의 배수만 추출하기
thirdList = [ nn for nn in nums if nn%3 == 0]
print(thirdList)

#wordList에서 문자열 크기가 5글자 넘어가는 것만 추출하기
wList = [ nn for nn in wordList if len(nn) > 5]
print(wList)

#wordList에서 문자열 크기가 5글자 넘어가는 것만 추출해서 대문자로
capList = [ nn.upper() for nn in wordList if len(nn) > 5]
print(capList)

dataList = [
    {"name" : "강하하", "age": 23},
    {"name" : "강나나", "age": 20},
    {"name" : "강다다", "age": 26},
    {"name" : "강차차", "age": 49},
    {"name" : "강마마", "age": 84},
    {"name" : "강카카", "age": 35},
    {"name" : "강사사", "age": 65},
    {"name" : "강파파", "age": 34},
    {"name" : "강자자", "age": 47},
    {"name" : "강라라", "age": 15},
    {"name" : "강바바", "age": 73},
    {"name" : "강타타", "age": 29},
    {"name" : "강아아", "age": 23},
    {"name" : "강가가", "age": 25},
]

#나이가 30세 넘어가는 사람
resultList = [ data for data in dataList if data['age'] > 30]
print( 'resultList:', resultList )
print( len(resultList) )

#외부에서 라이브러리를 들고 들어온다. 새로운 이름을 부여
import numpy as np
x = [1,2,3,4,5]     #list타입 
x = np.array(x)     #ndarray 타입으로 전환
y = 2*x + 1         #벡터연산, R언어
print(y)
