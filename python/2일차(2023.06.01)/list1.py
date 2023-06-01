# name = '홍길동'
# work_time = 30
# per_pay = 20000

# name2 = '임꺽정'
# work_time2 = 40
# per_pay2 = 15000

# pay = work_time * per_pay
# pay2 = work_time2 * per_pay

# print(name, work_time, per_pay, pay)
# print(name2, work_time2, per_pay2, pay2)

#리스트 - 배열, 하나의 메모리에 여러 개의 데이터를 저장할 수 있다. 
nums = [1,2,3,4,5,6,7,8,9,10]   #리스트안에 10개의 데이터를 저장한다. 
#데이터 공간을 10개 만들고 0번부터 번호를 부여한다. 0,1,2,3,4,5,6,7,8,9
print( f"nums1: ", nums )
print( nums[0])     #0번 방의 데이터만 추출. 인덱싱
print( nums[1])
print( nums[2])
print( nums[3])
print( nums[4])
print( nums[5])
print( nums[6])

nums[0] = 10    #인덱싱을 이용해 값을 변경한다.
nums[1] = 20
nums[2] = 30
print(f"nums2: ", nums)

nums = [10, 20, 30]     #새로 메모리를 만들어서 10, 20, 30을 저장. 위의 리스트는 사라진다. 
print(f"nums3: ", nums)

#반복문
for n in nums:      #for 변수명 in 리스트타입: --데이터를 하나씩 차례대로 변수로 옮겨준다.
    print(n)









