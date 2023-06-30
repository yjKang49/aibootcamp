dic = []
for i in range(3):
    mylist = {}
    name = input('이름: ')
    tel = input('번호: ')
    mylist['name'] = name
    mylist['tel'] = tel
    dic.append(mylist)
    
menu = int(input("1. 검색  2. 종료: "))   
cnt = 0
if menu == 1:
    name2 = input("검색할 이름: ")
    for row in dic:
        compareN = row['name']
        if name2 == compareN:
            print(row['tel'])
            cnt = cnt+1
            break
    if cnt ==0:
        print(f"{name2}의 전화번호는 저장되어있지 않습니다.")
            
elif menu ==2:
    print("리스트내용", "\n", dic)
else:
    print("숫자를 잘못 입력했습니다.")
