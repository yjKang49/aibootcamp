#과제였음. 스스로 완성
#클래스 설계할 때 - 한 사람분의 데이터 처리
class Pay:
    def __init__(self, name = '홍길동', work_time=40, per_pay = 10000):
        self.name = name
        self.work_time = work_time
        self.per_pay = per_pay
        self.calculate()

    def calculate(self):
        self.pay = self.work_time * self.per_pay    #중간에 변수 추가를 해도 된다.
        
    def output(self):
        print(f'{self.name} {self.work_time} {self.per_pay} {self.pay}')


#객체 하나만 만들거라서
class PayManager:
    payList = []
    def __init__(self):
        self.payList.append(Pay('A', 30, 20000))
        self.payList.append(Pay('B', 40, 30000))
        self.payList.append(Pay('C', 20, 10000))
        self.payList.append(Pay('D', 15, 20000))
        self.payList.append(Pay('E', 25, 30000))
    
    def append(self):
        pay = Pay()
        pay.name = input('이름: ')
        pay.work_time = int(input('일한시간: '))
        pay.per_pay = int(input('시간당 급여액: '))
        pay.calculate()
        self.payList.append(pay)
    
    def output(self):
        for pay in self.payList:
            pay.output()
    
    def search(self):
        pay = Pay()
        pay.name = input('이름: ')
        result = [x for x in self.payList if x[0] == pay.name ]
        print('self.name: ', self.name)
        
    def modify(self):
        pay = Pay()
        pay.name = input('이름: ')
        pay.work_time = int(input('일한시간: '))
        pay.per_pay = int(input('시간당 급여액: '))
        pay.calculate()
        self.payList.append(pay)
        
    def delete(self):
        pass
        
    def sort(self):
        pay = Pay()
        pay.name = input('기준항목: ')

    
    
    def menuDisplay():
        print('1. 추가 ')
        print('2. 출력 ')
        print('3. 검색 ')
        print('4. 수정 ')
        print('5. 삭제 ')
        print('6. 정렬 ')
        print('0. 종료 ')
            
    def start(self):
        while True:     #무한루프
            self.menuDisplay()
            sel = input('선택: ')
            if sel == '1':
                self.append()
            elif sel == '2':
                self.output()
            elif sel == '3':
                self.search()
            elif sel == '4':
                self.modify()
            elif sel == '5':
                self.delete()
            elif sel == '6':
                self.sort()
            else:
                print('프로그램을 종료합니다.')
                return

#하나의 파일에 하나의 클래스를 만든다,
#남의 파일에 있을 때 모듈을 가져오려면 import를 사용한다.
#외부 모듈 불러오기
        
mgr = PayManager()
mgr.start()

