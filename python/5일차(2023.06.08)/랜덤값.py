import random       #외부 라이브러리를 불러온다.
#파이썬의 import는 라이브러리를 메모리로 불러와서 결합한다. 

print( random.randint(1,3))     #1~3에 해당하는 랜덤값을 생성한다. 컴퓨터내부의 시계를 이용한다.
print( random.randint(1,3))
print( random.randint(1,3))
print( random.randint(1,3))
print( random.randint(1,3))
print( random.randint(1,3))
print( random.randint(1,3))
print( random.randint(1,3))

#리눅스 - 1993년에 리누스 토발즈라는 대학생이 os를 만들면서 unix(서버용) => linux(pc용)
#         다른사람들도 공부해라 소스공개 함
#이전부터 소스공개를 주장하던 협회분들이 같이 하자 GNU 협약
#오픈소스 - 파이썬 번역기 프로그램 소스를 공개한다. 
#오픈소스가 무료인 경우가 많은거지 무료여야하는건 아니다.
#하드웨어 => os : 번역을 할 때 os에 특화
#하드웨어 => os => java virtual machine(자바가상머신) 번역 : 자바가상머신이 알아듣게 실행할 때 다시 os가 알아듣는말로 
#GNU 협약을 따르는 경우 무조건 소스 공개를 해야한다.  
#python은 mysql과의 결합력이 좋음. mysql(무료)


#전역변수는 되도록 쓰지 않는게 좋음. 다른 함수나 변수에 영향을 미칠 수 있는 요소를 최대한 배제해야하기 때문.
"""
가위바위보 게임
1. 가위
2. 바위
3. 보

1. 컴퓨터 값을 하나 랜덤하게 생성해서 갖는다. -> 리스트에 보관
2. 사람에서 입력을 받는다. (1.가위  2. 바위  3.보) -> 리스트에 보관
3. 컴퓨터승, 사람승, 무승부 결정을 하고 -> 리스트에 보관
4. 출력

10게임 중 컴퓨터는 3승, 사람은 4승, 무승부는 2번이었다.

"""
gameList=[]
#1.가위 2.바위 3. 보
#컴퓨터승 1, 사람승 2, 무승부 3

def gameStart():
    #1. 컴퓨터가 값을 갖고있다.
    computer = random.randint(1,3)
    print("컴퓨터: ", computer)
    person = int(input("1.가위 2.바위 3. 보 : "))
    winner = whoWin(computer, person)
    gameInfo = {'computer': computer, 'person': person, 'winner': winner}
    output(gameInfo)
    gameList.append(gameInfo)
    
def output(gameInfo):
    temp1 = ['', '가위', '바위', '보']
    temp2 = ['', '컴퓨터승', '사람승', '무승부']
    c = gameInfo['computer']
    p = gameInfo['person']
    w = gameInfo['winner']
    print(f'컴퓨터: {temp1[c]} /사람: {temp1[p]} /승부:{temp2[w]}')

def whoWin(computer, person):
    if computer == person:
        return 3
    
    if computer == 1:
        if person==2:
            return 2    #사람승
        else:
            return 1
    
    if computer == 2:
        if person ==1:
            return 1
        else:
            return 2

    if computer == 3:
        if person ==1:
            return 2
        else:
            return 1
        
gameStart()