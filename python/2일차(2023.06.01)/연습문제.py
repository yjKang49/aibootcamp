#list 관련한 문제

    # 1. flowers 변수에 다음 꽅들을 입력하세요 
    #     작약, 국화, 목련, 목단, 장미, 해바라기
    # 2. 0,2,4 번 데이터 출력하기(인덱싱, 슬라이싱 둘다 사용하기)
    # 3. 해바라기 => 백일홍으로 수정하기
    # 4. 사루비아, 맨드라미 두 종류 추가하기
    # 5. 목련 삭제
    # 6. 현재 데이터 재수 출력하기
    # 7. 마지막 데이터 삭제하기

#1
flowers = ['작약', '국화', '목련', '목단', '장미', '해바라기']

#2
print(flowers[0])
print(flowers[2])
print(flowers[4])
print(flowers[0], flowers[2], flowers[4])

#3
flowers[5] = '백일홍'

#4
flowers.append('사루비아')
flowers.append('맨드라미')
print(flowers)

#5
flowers.remove('목련')
print(flowers)

#6
print(len(flowers))

#7
flowers.remove(flowers[-1])
print(flowers)



