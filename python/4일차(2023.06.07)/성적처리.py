#성적처리: 이름, 국어, 영어, 수학 입력받아서 총점하고 평균
#          ABCDE 까지 구하는걸로(90,80,70,60,50이하)

score = []

def input_score():
    data = dict()
    data['이름'] = input('이름: ')
    data['국어'] = int(input('국어: '))
    data['영어'] = int(input('영어: '))
    data['수학'] = int(input('수학: '))
    score.append(data)
    
def output_score():
    for data in score:
        average()
        sum()
        level()
        print(f'{data["이름"]}의 총점은 {data["합계"]}, 평균은 {data["평균"]}이고 등급은 {data["등급"]}입니다.')

def average():
    for data in score:
        data["평균"] = (data['국어'] + data['영어'] + data['수학'])/3

def sum():
    for data in score:
        data["합계"] = data['국어'] + data['영어'] + data['수학']

def level():
    average()
    for data in score:
        if data['평균'] >=90:
            data['등급'] = 'A'
        elif data['평균'] >=80:
            data['등급'] = 'B'
        elif data['평균'] >=70:
            data['등급'] = 'C'
        elif data['평균'] >=60:
            data['등급'] = 'D'
        else:
            data['등급'] = 'F'

def start():
    while True:
        choice = int(input("1.입력 2.출력 0.종료 : "))
        if choice == 1:
            input_score()
        elif choice == 2:
            output_score()
        else:
            return    
        
start()

##############밑은 강사님 코드#################위는 내코드



#위치를  찾는 함수인데 - 검색해서 출력, 수정, 삭제시에도 사용한다.
#선형검색 => 람다, 컴프리핸션(내일진도?)
#맨처음 데이터부터 찾는 데이터 나올때까지 차례대로 읽어본다. -데이터가 없으면 None을 반환
payList = []

def fine(name):
    for i in range(0, len(payList)):
        if name==payList[i]["name"]:
            return i    #서로 일치하는 데이터가 있으면 위치를 반환하고 함수를 종료한다.
    return None     #for문을 끝나도록 못찾은 경우에는 없다는 의미이다. None을 반환한다. 
    #파이썬의 경우에는 함수에서 목적을 달성못할 때 주로 None을 반환한다. 

def search():
    name = input('찾을 이름: ')
    pos = fine(name)
    if pos == None:
        print(name + '을 찾지 못했습니다.')
        return      #더이상 수행을 하지 않는다. 이미 오류임. 여기서 else를 쓰지 않는게 프로그램의 확장성을 더 높여준다.
                    #if error1: return 구조로 기술하면 함수를 보다 깔끔하고 확장성있게 만들 수 있다. 
    #에러가 아닐때 처리
    item = payList[pos]     #해당 위치 값을 가져와서 출력하자
    print(f'{item["name"]} {item["work_time"]} {item["per_pay"]} {item["pay"]}')

