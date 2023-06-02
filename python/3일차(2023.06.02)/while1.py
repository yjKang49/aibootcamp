"""
while문은 몇 번 반복할지 알 수 없는 경우에 사용한다. 
while 조건식:       조건식의 결과가 True 일 때 반복한다. 
    처리
    처리
    ...
    조건식이 False가 될만한 수식
    
1~10까지 출력하겠다.
i = 1
while i <= 10:
    print(i)
    i = i + 1   #마지막에 조건식이 False가 되도록 하는 수식이 있어야 한다.

while문은 특징이 한 번도 수행 안 될 가능성이 있다.
""" 

i = 1
while i <= 10:
    print(i)
    i = i + 1       #무한루프 상황을 벗어나도록

#1~10 까지 옆으로 출력하기
i = 1
while i <= 10:
    print(i, end = ' ')
    i = i + 1       #무한루프 상황을 벗어나도록
print()

#1~n까지 더해간다. 합산이 최초로 1000을 넘는 n을 찾고싶다.
i = 0
sum = 0
while sum < 1000:
    i = i+1     #i++
    sum = sum+1     #1+2+3+4+5+...
print(i, sum)

