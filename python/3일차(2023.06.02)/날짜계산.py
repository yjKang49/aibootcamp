#년도 월 일을 입력받아서 그 날이 그 해의 몇 번째 날인지 맞추기
#윤년 4의 배수가 되면서 100의 배수가 되면 안되고 400의 배수는 윤년이다. 
#윤년의 경우 2월이 29일이 된다. 윤년이 아니면 28일이 된다. 

year = int(input("년도: "))

#and, or, not : 논리연산자 결과는 True or False 이다.
#조건식1 and 조건식2: 두 개의 조건식이 둘 다 True 일때 True 아니면 False
#조건식1 or 조건식2: 두 개의 조건식 중 하나라도 True이면 True 아니면 False
#not 조건식: True -> False 으로 False -> True
#우선순위: not-> and -> or 순으로 적용된다. 

if year%4 ==0 and year%100 != 0 or year%400==0:     #우선순위 중요
    print("윤년입니다.")
else: 
    print("윤년이 아니다.")


#오늘이 올해의 며칠째인지 계산
dayList = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
year = int(input("년도: "))
month = int(input("월: "))
day = int(input("일: "))

today = 0

for i in range(0, month-1):
    today = today + dayList[i]

if year%4 ==0 and year%100 != 0 or year%400==0:
    if month > 2:
        today = today+1
today = today + day
print(f"오늘은 올해의 {today}번째 날입니다.")   




