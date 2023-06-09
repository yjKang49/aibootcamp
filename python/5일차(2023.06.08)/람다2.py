wordList = ["school", "book", "bookstore", "desk", "hospital", "survey", "assembly", 
            "president", "python", "flower", "sky", "cloud", "language", "phone", "house"]

nums=[1,2,3,33,4,6,23,26,17,19,21,8,19,27]
#map : 연산을 수행 후 값을 변형해서 반환한다. x => x' (연산이 가해진 변경된 x)

#nums에 값을 10씩 더하기
print( list(map(lambda x: x+10, nums)))

#wordList의 문자들을 대문자로 변경
print( list(map(lambda x: x.upper(), wordList)))

#zip(list1, list2, list3) => 각 원소들끼리 결합해서 새로운 튜플로 만들어서 반환한다. 

nameList = ['홍길동', '임꺽정', '장길산']
phoneList = ['010-0000-0001', '010-0000-0002', '010-0000-0003']
emailList = ['1', '2', '3']

for data in zip(nameList, phoneList, emailList):
    print(data, type(data))

#정렬 - 하나는 자기자신의 순서는 그대로, 바뀐순서만을 반환
#     - 자기자신의 순서를 바꾼다.

#list타입에 존재하는 함수가 sort - 자기 자신의 순서를 바꾼다. 
#특별히 말을 안하면 오름차순 정렬 - 작은것부터 큰것 순으로 늘어놓는 것을 오름차순이라고 한다. 
#반대는 내림차순

# nums.sort()
# print('increseN: ', nums)

# nums.reverse()
# print('decreseN: ', nums)

# wordList.sort()
# print('increseW: ', wordList)

# wordList.reverse()
# print('decreseW: ', wordList)

sortedList = sorted(nums)
print('정렬: ', sortedList)
print('원본: ', nums)

sortedwordList = sorted(wordList)
print('정렬: ', sortedwordList)
print('원본: ', wordList)

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

#dataList -> 각 요소가 dict 타입이다. x=dict 타입이다. (p.340)
#이름순으로 정렬
dataList.sort(key=lambda x: x['name'])      
print('dataList: ', dataList)

#이름을 역순으로 정렬
sortedDataList = sorted( dataList, key=lambda x:x['name'], reverse=True)
print( 'sortedDataList: ', sortedDataList)

#나이순으로 정렬하기
AgeDataList = sorted( dataList, key=lambda x:x['age'])
print( 'AgeDataList: ', AgeDataList)

#나이순으로 역정렬하기
sortedAgeDataList = sorted( dataList, key=lambda x:x['age'], reverse=True)
print( 'sortedAgeDataList: ', sortedAgeDataList)