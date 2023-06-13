class Encore:
    def __init__(self, age, name):
        self.age = age
        self.name = name
    def hello(self):
        print(f"{self.age}살 {self.name}입니다")
lee = Encore(25, "이새싹")
lee.hello()
kim = Encore(25, "김새싹")
kim.hello()

class Encore:
    def __init__(self, age, name, ID):
        self.age = age
        self.name = name
        self.ID = ID
    def hello(self):
        print(f"{self.age}살 {self.name}입니다")
class Student(Encore):
    def encore_study(self):
        print(f"학번 : {self.ID}")
    def today(self):
        print("하루라도 문제를 풀지 않으면 손에 가시가 돋친다.\n비가 많이 내립니다")
lee = Student(25, "이새싹", 990011)
lee.hello()
lee.encore_study()
lee.today()