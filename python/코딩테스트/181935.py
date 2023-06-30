def solution(n):
    answer = 0
    if n%2 == 0:
        evenlist = [i**2 for i in range(n+1) if i%2==0]
        answer = sum(evenlist)
    else : 
        oddlist = [i for i in range(n+1) if i%2==1]
        answer = sum(oddlist)
        print(answer)
    return answer

solution(7)