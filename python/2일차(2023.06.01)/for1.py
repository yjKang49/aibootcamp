"""
    iterable객체: list, tuple, range, filter, map, ...
    for 변수 in iterable 객체:
        문장
"""

for i in [1,2,3,4,5,6,7,8,9,10]: 
    print(i)
    
#range(시작값, 종료값, 증감치)
print( range(1,11) )      #출력값: range(1,11). range는 for문과 같은 것에서 끄집어낼 수 있어야함.

for i in range(1,11):   #1~10 출력
    print(i)

#짝수만 10개
for i in range(2, 21, 2):   #2 4 6 8 10 ...
    print(i)
    
#홀수만 10개
for i in range(1, 20, 2):   #1 3 5 7 9 ...
    print(i)

print("수평으로 나열", end=' ')     #end=' ' 
print("옆에 나와야 한다.")

print("1~10을 한 줄로 출력")
for i in range(1,11):
    print(i, end = ' ')
print()     #이때 줄바꿈을 한다

for i in range(2, 21, 2):
    print(i, end = ' + ')
print()     #이때 줄바꿈을 한다

for i in range(1, 20, 2):
    print(i, end = ' * ')
print()     #이때 줄바꿈을 한다


#문제1. 3의 배수를 10개만 한 줄로 출력하기
#문제2. 100, 90, 80, 70, ... , 10 까지 한 줄로 출력하기
#문제3. 다음 리스트에서 홀수번째 방 데이터만 출력하기 1,3,5,7,9, ...
colors = ['red', 'green', 'blue', 'cyan', 'magenta', 'black', 'brown', 'yellow', 'green']
#문제4. 구구단 4단 출력하기
#문제5. 정수를 1~100까지 출력하는데, 10개마다 줄바꿈을 할 것    힌트 if문 사용

print('******************연습문제******************')

#문제1
for i in range(3, 31, 3):
    print(i, end = ' ')
print()

#문제2
for i in range(100, 0, -10):
    print(i, end = ' ')
print()

#문제3
for i in range(0, len(colors), 2):
    print(colors[i], end = ' ')
print()

#문제4
for i in range(1, 10):
    dan = 4
    multi = i*dan
    print(f"{i} * {dan} = {multi}")

#문제5 
for i in range(1,101):
    print(i, end = ' ')
    if i%10 == 0:
        print()





