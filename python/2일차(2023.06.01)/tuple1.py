#튜플 - 사용법이 리스트와 유사하다. 단 ㅇ릭기전용 메모리이다. 값수정이 안된다.
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











