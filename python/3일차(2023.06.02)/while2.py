#정수를 입력받는다. 음수가 입력될 때 까지 양의정수나 0을 입력받아 합계와 평균을 구하자

#1. 입력변수를 지정한다.
numlist = []    #값들을 저장할 변수를 지정한다. [] 또는 list()
integer = int(input("정수를 입력하세요: "))

while integer >= 0:
    numlist.append(integer)
    integer = int(input("정수를 입력하세요: "))
print(numlist)

sum = 0
for i in range(0,len(numlist)):
    sum = numlist[i] + sum
print("sum: ", sum)
print("avg: ", sum/len(numlist))
#다른표현
print(f"합계: {sum} 평균: {sum/len(numlist)}")

#문제: 정수를 음수가 입력될 때까지 입력을 받아서 
#       각각 짝수와 홀수를 구분해서 분리 후 다른 리스트에 담아서 한 번에 출력
#       짝수의 합계와 홀수의 합계를 출력한다. 

print('*********************')

evenNumber = []
oddNumber = []
natural = int(input("정수를 입력: "))
while natural >=0:
    if natural%2 ==1:
        oddNumber.append(natural)
    else:
        evenNumber.append(natural)
    natural = int(input("정수를 입력: "))
print(oddNumber, '  ', evenNumber)
print(f"짝수의 개수: {len(evenNumber)}, 홀수의 개수: {len(oddNumber)} ", end = ' ')

oddSum = 0
evenSum = 0

#list를 [1,2,3,4,5,6] 입력했을 때 oddNumber는 oddNumber=[1, 3, 5]
#따라서 for i in oddNumber로 작성하면 안됨. 첫번째 수가 1, 두번째가 3 세번째가 5 이렇게 갈것임. 
#for i in oddNumber:         #i 는 리스트의 1번째부터 시작. 리스트의 0번째부터가 아님. 

for i in range(0, len(oddNumber)):
    oddSum = oddSum + oddNumber[i]
print("홀수의 합계: ", oddSum)

for i in range(0, len(evenNumber)):
    evenSum = evenSum + evenNumber[i]
print("짝수의 합계: ", evenSum)   


print('****************강사풀이**********************')



