#검색(search) - 데이터가 있는 곳의 위치를 찾는 것을 말한다. 
#선형검색, 이분검색, 해쉬검색
#시스템이 제공하는 검색을 사용한다. 

fruits =['사과', '참외', '오렌지', '바나나', '사과', '딸기', '사과', '포도', '배']
#단어 in 리스트 : 해당 리스트에 단어가 존재하면 True, 없으면, False를 반환한다. 

print("사과" in fruits)     #사과라는 단어가 fruits안에 있냐? 있으면 True, 없으면 False를 출력
print("망고" in fruits)

print(fruits.index("사과"))     #위치값을 준다.
#print(fruits.index("망고"))     #없으면 에러 발생, 혼자사용 못함, in연산자, count함수와 같이 사용

#count : 존재 개수를 카운트 한다. 
print( fruits.count("사과"))
print( fruits.count("망고"))
print( fruits.count("딸기"))
print( fruits.count("포도"))


#조건식 망고가 있을 때 없을 때
"""
indentation - 파이썬은 들여쓰기 내쓰기로 코드를 해석
if 조건식:
    들여쓰기 반드시 필요. 내쓰기 하는 순간 if문과 관련없는 코드가 된다. 
    탭키를 사용하기로 했으면 계속 탭키, 스페이스를 사용하기로 했으면 스페이스를 쓰자. 
    visual studio code는 탭키 눌러도 스페이스키로 바꿔준다. 
    다른 편집기는 탭키와 스페이스키를 별개로 인식. 

if 조건식: 조건식의 결과는 True or False가 와야한다. 
    조건식이 참일 때 처리코드
else:
    조건식이 거짓일 때 처리코드
"""

if "망고" in fruits:
    print("망고의 뮈치: ", fruits.index("망고"))
else:
    print("망고는 없습니다.")

if fruits.count("사과") > 0:
    print("사과의 위치: ", fruits.index("사과"))
else:
    print("사과는 없습니다.")






