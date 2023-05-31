#문제2. 이름, 국어, 영어, 수학을 입력받아 총점과 평균을 구한다.
#이름: 홍길동
#국어: 90
#수학: 80
#영어: 80
#홍길동님의 총점은 250이고 평균은 83.333333 입니다. 

#strategy
#1. 입력
name = str(input("이름: "))
korean = int(input("국어: "))
math = int(input("수학: "))
english = int(input("영어: "))

#2. 계산
total = korean + math + english
avg = total/3

#3. 출력
print(f"{name} 님의 총점은 {total} 이고 평균은 {avg} 입니다. ")

