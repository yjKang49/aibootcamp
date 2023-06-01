names = ["홍길동", "임꺽정", "장길산"]
work_times = [40,30,20]
per_pays = [20000, 15000, 30000]

pays = []       #연산을 해서 데이터를 추가해야한다. 비어있는 리스트를 하나 만든다. 
for i in range(0,2):        #range(시작, 종료, 증감): 해당하는 일련의 값을 준다
    pays.append(work_times[i] * per_pays[i])

#출력하기
for i in range(0,2):        #시작 숫자와 끝 숫자를 지정하려면 range(시작 숫자, 끝 숫자) 형태를 사용하는데, 이때 끝 숫자는 포함되지 않는다.
    print(names[i], "의 급여는 ", pays[i], "입니다.")







