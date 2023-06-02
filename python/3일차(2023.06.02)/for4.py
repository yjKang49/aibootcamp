count = int(input("몇 개? "))
nums = list()   #데이터를 여러개 저장하려면 list()타입으로 만들어야 한다. nums=[]

for i in range(1, count+1):
    n = int(input("숫자: "))
    nums.append(n)
    
print(nums)
