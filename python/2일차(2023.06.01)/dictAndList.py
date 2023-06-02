#list안에 dict타입을 둔다. - 주급

#데이터가 하나도 없는 list를 만들자 payList = []    payList = list()
payList = [
    {"name": "홍길동", "work_time": 40, "per_pay": 30000},
    {"name": "임꺽정", "work_time": 30, "per_pay": 20000},
    {"name": "장길산", "work_time": 50, "per_pay": 40000},
    {"name": "홍경래", "work_time": 20, "per_pay": 10000},
    {"name": "이정옥", "work_time": 10, "per_pay": 30000}
]

print( payList[0]["name"])
print( payList[1]["name"])
print( payList[2]["name"])

print( payList[0]["work_time"])
print( payList[1]["work_time"])
print( payList[2]["work_time"])

for pay in payList:
    print( pay["name"], pay["work_time"], pay["per_pay"])

#급여구하기
for pay in payList:
    pay["pay"] = pay["work_time"]*pay["per_pay"]
    
#다시출력
for pay in payList:
    print( pay["name"], pay["work_time"], pay["per_pay"], pay["pay"])
