#dict 타입은 키와 값 쌍으로 데이터를 저장하는 타입이다. 
#키와 값 자체는 어떤 타입이든 상관없는데 보통 키의 경우에는 문자열을 많이 사용한다. 

#해쉬테이블, 딕셔너리
colors = {"red" : '빨간색', "blue": '파란색', 'green' : '초록색', 'black' : '검정색'}
print( colors['red'])       #red, blue, black 값 등을 키라고 하고 키를 데이터를 접근한다. 
print( colors['blue'])      #인덱싱, 슬라이싱 적용 안됨
print( colors['green'])
print( colors['black'])

#dict 타입은 추가, 키값이 이미 존재한다면 수정, 값바꾸기, 키값이 없었다면 추가
colors['pink'] = '분홍색'   #추가
colors['black'] = '까만색'  #수정
print( colors)

#삭제
del colors['red']
print( colors)

#키값 목록만 - 키 값 순서는 내부적으로 알아서 정해짐. 입력한 순서대로 나오지 않는다. 
for key in colors:
    print(key, colors[key])
    



