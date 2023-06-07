#변수가 배열 형태로 저장될 때 다 갖고있다. 
#list, tuple, str(문자열)

s1 = '아메리카노,에스프레소,카페라떼,카라멜마끼아또'
print(s1[0])
print(s1[1])
print(s1[2])
print(s1[6], s1[7], s1[8], s1[9], s1[10], s1[11], s1[12])

#str, tuple 둘다 readonly라 인덱싱을 통한 값 변경은 불가
#s1[0] = "어"    #TypeError: 'str' object does not support item assignment
#슬라이싱 [시작:종료:증감치]    시작과 종료에는 값을 생략할 경우
# 증감치를 생략한 경우에는 1이 기본값이다. 
# 처음부터 마지막까지 라는 의미가 있다.
print(s1[::2])  #0,2,4,6,8, ...
print(s1[:5])      #0~4까지 출력하기 
print(s1[6:11])
print(s1[::-1])     #뒤로부터 역순으로 출력하기

s2 = s1[6:11]
print(s2)

#토큰분리 : split함수는 반환값이 list타입, 문자열에서 특정 문자 기준으로 잘라낸다. 
wordList = s1.split(",")
print(wordList)

#"연결할 문자열".join(리스트타입) 리스트를 문자열로 합치기
s2 = " ".join(wordList)
print("s2: ", s2)

s2 = ",".join(wordList)
print(s2)

#문자열은 한 번 값이 정해지면 자체는 수정불가
s1 = "hello, python"
s1 = "H" + s1[1:]   #H, ello, python 문자하고 합친 문자가 다시 s1에 전달
print(s1)

s1 = "hello, python"

s1 = s1[:7] + "P" + s1[8:]
print(s1)

colorList = ["red", "white", "green", "cyan", "magenta", "violet", "blue"]

print(colorList[0])
print(colorList[2])
print(colorList[4])
print(colorList[5])

print(colorList[:4])
print(colorList[4::-1])     #4번부터 역순으로

#문제: colorList의 각 첫글자만 대문자로 바꾸어서 출력하기
print(chr(ord(colorList[0][0])-32), colorList[0][1: ])

print(colorList[0][0].capitalize(), colorList[0][1:])

colorList2 = []
for color in colorList:
    temp = color[0].capitalize() + color[1:]
    colorList2.append(temp)

print(colorList2)

#데이터 추가 수정 삭제
colorList2.append("Black")      #무조건 맨 뒤에
colorList2.insert(0, "Yellow")   #위치지정이 가능하다
colorList2[0] = "Yellow"
print(colorList2)

#삭제 - 값으로
colorList2.remove("Red")
#위치값으로 삭제하기
del colorList2[5]
print(colorList2)
