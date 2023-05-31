# width = input("가로: ")
# height = input("세로: ")
# surface = int(width)*int(height)

# print("면적은 ", surface, "입니다")


#문제: 주급계산하기, 근무시간(30), 시간당급여액(15000)
work_time = input("근무시간: ")
per_pay = input("시급: ")
pay = int(work_time)*int(per_pay)

total_pay = format(pay, ',')       #숫자에 콤마넣기
print("주급은 ", total_pay, "입니다. ")
print("주급은 " + str(total_pay) + "입니다. ")

#문자열과 숫자를 섞어서 출력하고자 할 때
#%d decimal(숫자)
#print(str.format("주급은 %d 입니다" % total_pay))  #구식 #예전거 - 웹프로그램, db에 데이터 읽고 쓸 때
print(f"주급은 {total_pay} 입니다" ) #fstring 3.6부터 문자열앞에 f를 쓴다.  #최신식





