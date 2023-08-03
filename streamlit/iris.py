import streamlit as st
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# 메인 타이틀을 중앙에 달아보기.
_, col, _ = st.columns([2, 6, 2])     #
col.header('Streamlit 시각화')
# 터미널에서 ctrl + c 를 눌러 이전 것에서 빠져나오기
# 실행하기 streamlit run iris.py

''  # 한 칸 듸우기
dfIris = sns.load_dataset('iris') 
st.write(dfIris.head())
colors = {'setosa': 'red', 'virginica': 'green', 'versicolor': 'blue'}
st.sidebar.title('Iris Species')

with st.sidebar:
    selectX = st.selectbox(
        'X 변수 선택: ', ['sepal_length', 'sepal_width', 'petal_length', 'petal_width'])
    ''
    selectY = st.selectbox(
        'Y 변수 선택: ', ['sepal_length', 'sepal_width', 'petal_length', 'petal_width'])
    ''
    selectSpecies = st.multiselect('붓꽃 유형 선택 (:blue[다중]): ', ['setosa', 'versicolor', 'virginica'])
    ''
    selectAlpha = st.slider('alpha 설정: ', 0.1, 1.0, 0.5)

# 선택된 붓꽃 유형별 산점도로 시각화 표현
if selectSpecies:
    fig = plt.figure(figsize = (7,5))
    for aSpecies in selectSpecies:
        df = dfIris[dfIris.species == aSpecies]
        plt.scatter(df[selectX], df[selectY], color = colors[aSpecies], alpha = selectAlpha, label = aSpecies)
    plt.legend(loc = 'lower right')
    plt.xlabel(selectX)
    plt.ylabel(selectY)
    plt.title('Iris Scatter Plot')
    st.pyplot(fig)
else:
    st.warning('붓꽃의 유형을 선택해 주세요.')
        