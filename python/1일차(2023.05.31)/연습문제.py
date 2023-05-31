# 문제1. 미터를 입력받아 km와 m를 구하기
# 입력 예) 미터: 1234
# 출력 예) 1234m 는 1km와 234m 입니다.

meter = int(input("미터: "))
kilo = meter//1000
mod = meter%1000

print(f"{meter}m 는 {kilo}km와 {mod}m 입니다 ")

# 문제2. 섭씨온도를 입력받아 화씨온도 구하기
# 공식: (섭씨 * 9/5) + 32 = 화씨

celsius = int(input("섭씨온도: "))
fahrenheit = (celsius * 9/5) + 32

print(f"섭씨 {celsius}도는 화씨 {fahrenheit}도이다. ")

# 문제3. 식당에서 다섯명이 가서 다음과 같은 주문을 하였다. 총 지불액은 얼마인가?
#   다섯명이 같은 금액을 나누어서 지불한다고 할 때 한 명당 지불 금액은 얼마인가?
#   주문내용    김치찌개 - 8000, 된장찌개 - 7000, 제육볶음 - 10000
#   입력방식 김치찌개? 2
#           된장찌개? 1
#           제육볶음? 2
#   전체: 8000*2 + 7000*1 + 2*10000 = 43000
#   나눔: 43000/5 = 8600
k_choice_price = 8000
d_choice_price = 7000
j_choice_price = 10000

k_choice = int(input("김치찌개 수: "))
d_choice = int(input("된장찌개 수: "))
j_choice = int(input("제육볶음 수: "))
total_num = k_choice + d_choice + j_choice
total_price = k_choice_price*k_choice + d_choice_price*d_choice + j_choice_price*j_choice
sharing = total_price/total_num

print(f"1인당 지불금액은 {sharing}입니다.")



# 문제4. 동전 거스르기, 10만원이내
#     거스름돈: 78760
#             50000원 1장
#             10000원 2장
#             5000원 1장
#             1000원 3장
#             500원 1개
#             100원 2개
#             50원 1개
#             10원 1개

money = int(input("거스름돈 : "))
temp = money    #원금액을 보존하려고 임시 변수를 만들어서 값을 저장
m50000 = temp//50000  #50000 1장
temp = temp %50000      #나머지만 28760원 남음
m10000 = temp//10000  
temp = temp %10000      
m5000 = temp//5000  
temp = temp%5000 
m1000 = temp//1000  
temp = temp%1000 
m500 = temp//500  
temp = temp%500 
m100 = temp//100  
temp = temp%100 
m50 = temp//50 
temp = temp%50
m10 = temp//10 

print(f"50000 -> {m50000}장")
print(f"10000 -> {m10000}장")
print(f"5000 -> {m5000}장")
print(f"1000 -> {m1000}장")
print(f"500 -> {m500}장")
print(f"100 -> {m100}장")
print(f"50 -> {m50}장")
print(f"10 -> {m10}장")
