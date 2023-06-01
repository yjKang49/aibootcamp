#1~10까지의 합계 구하기
#sum = 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10
"""
f(n) = 1~n까지의 합계 
        = n(1+n)/2
        = f(n-1) + n

sum     i     sum
0       1       1
1       2       3   
3       3       6
6       4       10

sum = 0     #값이 누적되어야 하기 때문에 처음에 0으로 시작
sum = sum + i   #누적하기, i =1,10까지
"""
n = int(input("n(1+n)/2 를 계산합니다. n을 입력: "))
sum = 0
for i in range(1,n+1):
    sum += i

print(sum)


#문제1. 1~100 중에 홀수의 합계만 구하기

#문제2. 1~100 중에 7의 배수의 개수 세기

print('**********************************')
#문제1
sum = 0
for i in range(1, 100, 2):
    sum = sum + i
print(f"sum: ", sum)

#문제2
count = 0
for i in range(1, 100):
    if i%7 ==0:
        count = count+1         #python 은 count++ 증감연산자가 없다.   
print(f"count: ", count)



