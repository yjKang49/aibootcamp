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
if __name__ == '__main__':
    p1 = Pay('홍길동', 20, 20000)
    p1.output()
    