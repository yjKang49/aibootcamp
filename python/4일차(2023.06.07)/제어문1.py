# [시작:종료:증감치]
# range(시작, 종료, 증감치) - iterable      for 변수 in iterable객체:
for i in range(1,11):
    print(i)
    
print( range(1,11) )      #range(1,11)만 하면 실행하지x. list를 붙여줘야 실행.
print(list(range(1,101)))

for i in range(1, 11, 2):
    print(i, end = ' ')
print()
