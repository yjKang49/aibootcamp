import streamlit as st

# 터미널(cmd)에서 파일 실행방법: streamlit run 파일명
# (STR) C:\Users\lenovo\Documents\aibootcamp\streamlit>streamlit run app.py

# document
# https://docs.streamlit.io/library/api-reference/text

# 타이틀, 헤더, 서브헤더
st.title('Title')
st.header('Title *Markdown* 인식')
st.subheader('Title *Markdown* 인식')
st.title('Title')
st.title('Title')

# 텍스트
st.text('title *Markdown* 인식 못함. ')
st.markdown('*Markdown* 출력.')

# 수식을 넣을 때
import pandas as pd
x = 10
y = 20
st.write('x=', x, 'y=', y)

# 데이터 프레임
df = pd.DataFrame({'col1': [1, 2, 3]})
df
st.write('데이터 프레임 ', df)

# 그래프 출력
import matplotlib.pyplot as plt
import numpy as np
arr = np.random.normal(1, 1, size = 100)
fig, ax = plt.subplots()
ax.hist(arr, bins = 20)

fig

# 프로그램 코드를 쓸 때
code = '''def hello():
        print("Hello, Streamlit!" )'''
st.code(code, language = 'python')

# 캡션 출력
st.caption('This')
st.caption('A _italics_ :blue[colors] :sunglasses: ')

# Markdown 텍스트 컬러 적용
'This is :blue[blue]'
'This is :red[red]'
'This is :green[green]'

# 재미있는 이모티콘을 텍스트에 삽입해본다. 
'여름엔 딱 좋아 :sunglasses:'
':100:점 ~ :smile:'
':100:점 ~ :smile:ㅎㅎ  :thumbsup:최고!!'

# agree여부 체크박스 함수
agree = st.checkbox('I agree')

if agree:
    st.write('Great!')



