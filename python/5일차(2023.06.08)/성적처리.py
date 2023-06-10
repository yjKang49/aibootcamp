#성적처리.py

scoreList = [
    {'name': '홍길동', 'kor': 90, 'eng':80, 'mat': 90},
    {'name': '홍가가', 'kor': 100, 'eng':40, 'mat': 90},
    {'name': '홍나나', 'kor': 100, 'eng':100, 'mat': 100},
    {'name': '홍다다', 'kor': 70, 'eng':60, 'mat': 70},
    {'name': '홍라라', 'kor': 90, 'eng':80, 'mat': 90}
]

#총점, 평균, 학점
def process(score):
    score['total'] = score['kor'] + score['eng'] + score['mat']
    score['avg'] = round(score['total']/3, 2)
    score['grade'] = ''
    if score['avg'] >= 90:
        score['grade'] = '수'
    elif score['avg'] >= 80:
        score['grade'] = '우'
    elif score['avg'] >= 70:
        score['grade'] = '미'
    elif score['avg'] >= 60:
        score['grade'] = '양'
    else:
        score['grade'] = '가'

#한명분만 출력
def output(s):
    print(f'{s["name"]}' , end = ' ')
    print(f'{s["kor"]}' , end = ' ')
    print(f'{s["eng"]}' , end = ' ')
    print(f'{s["mat"]}' , end = ' ')
    print(f'{s["total"]}' , end = ' ')
    print(f'{s["avg"]}' , end = ' ')
    print(f'{s["grade"]}')

def processAll():
    for score in scoreList:
        process(score)

def outputAll():
    for score in scoreList:
        output(score)
        
processAll()
outputAll()

#######################################################

#검색함수
def search():
    name = input('찾을이름: ')
    #result = list (filter(lambda x : x['name']==name, scoreList ))
    result = [x for x in scoreList if x['name'] == name ]
    
    if len(result) == 0:
        print(f"{name}을/를 찾을 수 없습니다.")
        return

    for item in result:
        output(item)

#수정
def modify():
    name = input('수정할 이름: ')
    #result = list (filter(lambda x : x['name']==name, scoreList ))
    result = [x for x in scoreList if x['name'] == name ]
    if len(result) == 0:
        print(f"{name}을/를 찾을 수 없습니다.")
        return

    result[0]['name'] = input('수정할 이름은: ')
    result[0]['kor'] = int(input('국어: '))
    result[0]['mat'] = int(input('수학: '))
    result[0]['eng'] = int(input('영어: '))
   
    process(result[0])        #다시계산하기. 총점과 평균을
    print(result[0])
    
#삭제
def delete():
    name = input('삭제할 이름: ')
    result = [x for x in scoreList if x['name'] == name ]
    
    if len(result) == 0:
        print(f"{name}을/를 찾을 수 없습니다.")
        return
    scoreList.remove(result[0])
    
#정렬
#   1. 이름으로
#   2. 총점으로
#   3. 국어성적
def sort():
    sel = input("1.이름 2. 총점 3.국어성적")
    if sel == '1':
        key = 'name'
        reverse = False
    elif sel == '2':
        key='total'
        reverse = True
    else:
        reverse = True
        key='kor'

    sortedList = sorted(scoreList , key=lambda score:score[key], reverse=reverse )      #reverse = False/True 해야 reverse=reverse에러안뜸
    for s in sortedList:
        output(s)
        
def append():
    score = dict()      #score = {} 같은문법
    score['name'] = input('이름: ')
    score['kor'] = int(input('국어: '))
    score['eng'] = int(input('영어: '))
    score['mat'] = int(input('수학: '))
    process(score)
    scoreList.append( score)
    
def menuDisplay():
    menus = ['1.추가', '2.출력', '3.검색', '4.수정', '5.삭제','6.정렬','0.종료']
    for menu in menus:
        print(menu)

def start():
    functionList = [None, append, outputAll, search, modify, delete, sort]#python에서 함수가 주소값이므로 가능. 코드1줄로 아래if elif 생략가능
    processAll()
    while True:
        menuDisplay()
        sel = int(input('선택: '))
        # if sel == '1':
        #     append()
        # elif sel == '2':
        #     outputAll()
        # elif sel == '3':
        #     search()
        # elif sel == '4':
        #     modify()
        # elif sel == '5':
        #     delete()
        # elif sel == '6':
        #     sort()
        # else:
        if sel < 1 or sel > len(functionList):        #위의 if elif쓸때보다 간략한 함수. 
            print('프로그램을 종료합니다.') 
            return  #함수 종료   
        
        functionList[sel]()     #함수호출    
        
start()