# ord("문자") -> 해당 문자에 대한 unicode를 반환한다. 
print( ord("A"))    #65
print( ord("B"))    #66
print( ord("C"))    #67
print( ord("a"))    #97
print( ord("b"))    #98
print( ord("c"))    #99
print( ord("0"))    #48
print( ord("1"))    #49
print( ord("2"))    #50

#ord의 반대역할     chr(숫자) -> 문자
print( chr(65))
print( chr(66))
print( chr(67))

#알파벳을 for문 사용해서 대문자로 출력하도록
#ABCDEFGHIJKLMNOPQRSTUVWXYZ
#BCDEFGHIJKLMNOPQRSTUVWXYZA
#CDEFGHIJKLMNOPQRSTUVWXYZAB
#...

for i in range(0,26):
    k = i
    for j in range(0,26):
        print (chr(k+65), end = '')
        k = k+1
        if k > 25:
            k = 0
    print()    

#책 214p 2번, 3번
numbers = [273, 103, 5, 32, 65, 9, 72, 800, 99]

for number in numbers:
    if number>100:
        print("100 이상의 수: ", number)

for number in numbers:
    if number%2==1:
        print(f"{number}는 홀수입니다. ")
    else:
        print(f"{number}는 짝수입니다. ")
        
for number in numbers:
    if number//100 > 0:
        print(f"{number}는 3자리수입니다.")
    elif number//10 > 0:
        print(f"{number}는 2자리수입니다.")
    else:
        print(f"{number}는 1자리수입니다.")
        
