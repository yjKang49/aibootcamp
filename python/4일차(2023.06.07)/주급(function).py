#1. 추가
#2. 수정
#3. 삭제
#4. 주급계산 및 출력
#함수를 잘 만드는 방법은 (클린코드-java) 1. 작게 만들어라   2.더작게만들어라    3. 더더작게만들어라
#함수는 '한 가지 기능'에 집중하라 
#만약에 같이 진행되어야하고 기능이 3가지라면 함수를 3개만든다. 기능1함수, 기능2함수, 통합함수를 만들어서 서로 연결해라.

payList = []    #공유메모리, 모든 함수가 사용한다.

def init():     #테스트를 쉽게하기 위해서 초기실행함수에 dict넣음
    payList.append({'name': '홍길동', 'work_time': 40, 'per_pay':20000})
    payList.append({'name': '임꺽정', 'work_time': 30, 'per_pay':20000})
    payList.append({'name': '장길산', 'work_time': 20, 'per_pay':30000})
    
def append():       #데이터 추가만 담당하는 함수
    data = dict()
    data['name'] = input('이름: ')
    data['work_time'] = int(input('일한시간: '))
    data['per_pay'] = int(input('시간당 단가: '))
    payList.append( data )

def output():
    for item in payList:
        print(f'{item["name"]} {item["work_time"]} {item["per_pay"]}')
        
def process():
    pass    #일부 코드가 구문상 필요는 하지만 프로그램이 아무 작업도 하지 않기를 원하는 경우에 사용
    for item in payList:        #item이 dict타입이라 아무키나 추가가능
        item["pay"] = item["work_time"] * item["per_pay"]
    output_pay()
    
def output_pay():
    for item in payList:
        print(f'{item["name"]} {item["work_time"]} {item["per_pay"]} {item["pay"]}')
  

"""
클래스나 함수에서 pass를 사용하는 경우는

클래스가 내부 동작은 필요 없고, 의미적으로 껍데기만 필요한 경우에 pass를 통해서 껍데기만 만들어 줄 수 있습니다.
함수 같은 경우에도 실제 내부 구현은 필요 없지만, 
추상 클래스에서 사용하는  경우에 이름을 전달해줄 필요가 있는 경우에 pass를 통해서 껍데기만 만들어 줄 수 있습니다.
"""



#위치를  찾는 함수인데 - 검색해서 출력, 수정, 삭제시에도 사용한다.
#선형검색 => 람다, 컴프리핸션(내일진도?)
#맨처음 데이터부터 찾는 데이터 나올때까지 차례대로 읽어본다. -데이터가 없으면 None을 반환

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
    print(f'{item["name"]} {item["work_time"]} {item["per_pay"]}')
    
def modify():
    name = input('수정할 이름: ')
    pos = fine(name)
    if pos == None:
        print(name + '을 찾지 못했습니다.')
        return      #더이상 수행을 하지 않는다. 이미 오류임. 여기서 else를 쓰지 않는게 프로그램의 확장성을 더 높여준다.
                    #if error1: return 구조로 기술하면 함수를 보다 깔끔하고 확장성있게 만들 수 있다. 
    #에러가 아닐때 처리
    data = payList[pos]     #해당 위치 값을 가져와서 출력하자
    data['name'] = input('이름: ')
    data['work_time'] = int(input('일한시간: '))
    data['per_pay'] = int(input('시간당 단가: '))   

def delete():
    name = input('삭제할 이름: ')
    pos = fine(name)
    if pos == None:
        print(name + '을 찾지 못했습니다.')
        return      #더이상 수행을 하지 않는다. 이미 오류임. 여기서 else를 쓰지 않는게 프로그램의 확장성을 더 높여준다.
                    #if error1: return 구조로 기술하면 함수를 보다 깔끔하고 확장성있게 만들 수 있다. 
    #에러가 아닐때 처리
    del payList[pos]     #해당 위치 값을 가져와서 출력하자
    
def menuDisplay():
    print('1. 추가')
    print('2. 출력')
    print('3. 계산')
    print('4. 검색')
    print('5. 수정')       
    print('6. 삭제')     
    print('0. 종료')

def start():
    init()
    while True:
        menuDisplay()       #메뉴 제시
        sel = input("선택: ")
        if sel == '1':
            append()
        elif sel == '2':
            output()
        elif sel == '3':
            process()
        elif sel == '4':
            search()
        elif sel == '5':
            modify()
        elif sel == '6':
            delete()            
        else:
            return      #함수가 종료, while도 종료한다. 

start()