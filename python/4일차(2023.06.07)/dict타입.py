#키와 값 쌍으로 정보를 저장한다. 
mydic = {"red": "빨간색", "green": "초록색"} 
mydic['blue'] = "파란색"    #추가 또는 수정. 키값이 없으면 추가, 키값이 있으면 수정으로 판단한다.

#keys() 함수는 키값들만 반환한다. 

if 'red' in mydic.keys():
    print('red가 있다')
else:
    print('red가 없다')

print(mydic.keys())

print(mydic['red'])
print(mydic['green'])
print(mydic['blue'])
#print(mydic['yellow'])         #key 값이 없으면 예외를 발생시킨다. 
 
 #삭제후 #remove와 del 일관성이 없음. interpreter라서 언어를만들때 일관성유지하기 어려울때 있음. 
del mydic['red']
print( mydic.keys())
 