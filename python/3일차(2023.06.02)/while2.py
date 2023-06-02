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

evenNumbers = []
oddNumber = []
natural = int(input("정수를 입력: "))
while natural >=0:
    if natural%2 ==1:
        oddNumber.append(natural)
    else:
        evenNumbers.append(natural)
    natural = int(input("정수를 입력: "))
print(oddNumber, '  ', evenNumbers)

