"""
홍길동, 90,80,70
장길산, 100,100,90
임꺽정, 80,70,60
list안에 dict 으로 넣어놓고 총점, 평균 구해서 출력하기
"""

scoreList = [
    {"name": "홍길동", "국어": 90, "수학": 80, "영어": 70},
    {"name": "장길산", "국어": 100, "수학": 100, "영어": 90},
    {"name": "임꺽정", "국어": 80, "수학": 70, "영어": 60}
]

for i in range(0,len(scoreList)):
    sum = scoreList[i]["국어"] + scoreList[i]["수학"] + scoreList[i]["영어"]
    avg = sum/3
    name = scoreList[i]["name"]
    print(f"{name}은 총점{sum} 점이고 평균은 {avg}입니다.")


#강사님 코드
for score in scoreList:
    score['total']= score['국어'] + score['수학'] + score['영어']
    score['avg'] = score['total']/3
    
for s in scoreList:
    print(f"{s['name']} {s['국어']} {s['수학']} {s['영어']} {s['총점']} {s['평균']} ")
    
    