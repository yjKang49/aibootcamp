from GameData import GameData       #from 파일명 import 함수나 변수 클래스 등

class GameManager:
    gameList = list()       #앞으로 하는 게임은 여기에 저장하려고 함
    def __init__(self):
        print('게임을 시작합니다.')
        
    def gameStart(self):
        while True:
            game = GameData()
            game.output()
            self.gameList.append(game)
            again = input('계속 하시겠습니까? ')
            if again != 'Y' and again != 'y' :       #Y나 y가 아니면 종료한다
                return        
    
    #그동안 했던 게임의 히스토리를 모두 출력한다
    def gameOutput(self):
        for game in self.gameList:
            game.output()
            
    def gameStatics(self):
        statics = [0,0,0,0]
        for game in self.gameList:
            #컴퓨터가 이기면 1번방 증가
            #사람이 이기면 2번방 증가
            #무승부는 3번방 증가
            statics[game.winner] +=1
            statics[0] +=1
            
        print(f'컴퓨터승률: {statics[1]/statics[0]}')
        print(f'사람승률: {statics[2]/statics[0]}')
        print(f'무승부율: {statics[3]/statics[0]}')
            
if __name__ == '__main__':
    mgr = GameManager()
    mgr.gameStart()
    mgr.gameOutput()
    mgr.gameStatics()
