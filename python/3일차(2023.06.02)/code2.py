#거스름돈을 구해보자

#화폐단위
money_unit = [50000, 10000, 5000, 1000, 500, 100, 50, 10]
#화폐개수
money_cnt = [0, 0, 0, 0, 0, 0, 0, 0]

coins = 78670
temp = coins


for i in range(0, len(money_unit)):
    money_cnt[i] = temp // money_unit[i]
    temp = temp % money_unit[i]
print(money_cnt)








