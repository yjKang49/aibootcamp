#for문 안에 또 for문이 있다. 
"""
for i in range(1,6):        i=1, j=1,2,3,4,5
    for j in range(1,6):    i=2, j=1,2,3,4,5
        코드                i=3, j=1,2,3,4,5
                            i=4, j=1,2,3,4,5
                            i=5, j=1,2,3,4,5
""" 

for i in range(1,6):
    print("i=", i, "j=", end = ' ')
    for j in range(1,6):
        print( j , end = ' ')     #옆으로 출력하기
    print()     #줄바꿈
                        
#이중 for문을 사용하여 도형을 만들 수 있다. 
for i in range(1,6):
    for j in range(1,6):
        print("*", end='')
    print() 

for i in range(1,6):
    for j in range(1,i+1):
        print("*", end='')
    print() 

#별모양탑쌓기 (규칙성찾기)
line = 5
for i in range(0,line):
    #공백출력
    for j in range(1, line-i):
        print(" ", end='')
    #별그리기
    for j in range(0,2*i-1):
        print('*', end='')
    print() 

#역으로 별그리기
line = 5
for i in range(0, line-1):   
    for j in range(0,i):
        print(' ', end='')
    for j in range(0, (line-i)*2-1):
        print('*', end = '')
    print()

#문제: 
#1 2 3 4 5 6 7 8 9 10
#11 12 13 14 15 16 17 18 19 20
#1~100까지 한 줄에 열 개씩, 이중for문 사용하기

#방법1
for i in range(1,101):
    if i%10 ==0:
        print(i, end = ' ')
        print()
    else:
        print(i, end = ' ')
  

#방법2  
for i in range(0,10):
    for j in range(1,11):
        print(i*10+j, end=' ')
    print()


#방법3
k=1
for i in range(1,11):
    for j in range(1, 11):
        print(k, end = ' ')
        k = k + 1
    print()








