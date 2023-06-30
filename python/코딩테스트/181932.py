def solution(code):
    answer = ''
    mode = 0
    ret = []
    for idx in range(0,len(code)):
        if mode == 0:
            if code[idx] == str(1):
                mode = 1
            elif code[idx] != str(1) and idx%2 == 0:
                ret.append(code[idx])
        elif mode == 1:
            if code[idx] == str(1):  
                mode = 0
            elif code[idx] != str(1) and idx%2 == 1:
                ret.append(code[idx])
        answer = ''.join(ret)
        if ret != []:
            answer = ''.join(ret)
        else:
            answer = 'EMPTY'
    return answer

print(solution("abc1abc1abc"))