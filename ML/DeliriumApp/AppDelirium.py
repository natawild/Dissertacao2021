import pandas as pd
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from PIL import Image
import streamlit as st

# Criacao de um título e subtitulo
st.write("""
#Delirium Detection
Detect if someone has delirium using machine learning and python !
""")

# Abrir e mostrar uma imagem
image = Image.open('delirium.jpeg')
st.image(image, caption='Detecting Delirium using Machine Learning')

# Dados
df = pd.read_excel('DadosEmManutencaoAmostra511.xlsx', sheet_name='BD_amostra_511_sem_avaliacao_ps')

# configurar um sub titulo
st.subheader('Data Information:')

# Mostrar os dados como um dataframe/tabela
st.dataframe(df)

st.write(df.describe())

chart = st.bar_chart(df)

# dividir os dados en independentes 'x' e dependentes 'y'

X = df.iloc[:, 0:8].values
Y = df.iloc[:, -1].values
print(X)

# dividir os dados em 75% para treino e 25% para teste
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.25, random_state=0)


# Buscar o input do utilizador
diag = df['Grupo_Diagn'].drop_duplicates()
res_rass = df['RASS'].drop_duplicates()
res_sirs = df['SIRS'].drop_duplicates()

def get_user_input():
    idade = st.sidebar.slider('idade', 18, 120, 29)
    grupo_diagn = st.sidebar.selectbox('Selecione o grupo de diagnóstico:',diag)
    antihistminicos = st.sidebar.slider('antihistminicos', 0, 1, 1)
    antidepressivo = st.sidebar.slider('antidepressivo', 0, 1, 1)
    antipsicotico = st.sidebar.slider('antipsicotico', 0, 1, 1)
    antiespasmodicos = st.sidebar.slider('antiespasmodicos', 0, 1, 1)
    antihemetico = st.sidebar.slider('antihemetico', 0, 1, 1)
    analgesico = st.sidebar.slider('analgesico', 0, 1, 1)
    glicose = st.sidebar.slider('glicose', 0.0, 1000.0, 0.1)
    ureia = st.sidebar.slider('ureia', 0.0, 300.0, 0.1)
    osmolaridade = st.sidebar.slider('osmolaridade', 0.0, 500.0, 0.1)
    pcr = st.sidebar.slider('pcr', 0.0, 500.0, 0.1)
    rass = st.sidebar.selectbox('Selecione o resultado RASS:',res_rass)
    sirs = st.sidebar.selectbox('Selecione a quantidade de criérios SIRS:',res_sirs)

    # Guardar o dicionário numa variável
    user_data = {'idade': idade,
                 'grupo_diagn': grupo_diagn,
                 'antihistminicos': antihistminicos,
                 'antidepressivo': antidepressivo,
                 'antipsicotico': antipsicotico,
                 'antiespasmodicos': antiespasmodicos,
                 'antihemetico': antihemetico,
                 'analgesico' : analgesico,
                 'glicose' : glicose,
                 'ureia' : ureia,
                 'osmolaridade': osmolaridade,
                 'pcr': pcr,
                 'sirs' : sirs,
                 'rass': rass
                 }

    # Transformar os dados num dataframe
    features = pd.DataFrame(user_data, index=[0])
    return features


# guardar o input do utilizador numa variavel

user_input = get_user_input()

# Configurar uma subhead e mostrar aos utilizadores input
st.subheader('User Input:')
st.write(user_input)

# criar e treinar o modelo

RandomForestClassifier = RandomForestClassifier()
RandomForestClassifier.fit(X_train, Y_train)

# Mostar as métricas do modelo
st.subheader('Model Test Accuracy Score:')
st.write(str(accuracy_score(Y_test, RandomForestClassifier.predict(X_test)) * 100) + '%')

# Guardar o modelos preditos numa variavel
prediction = RandomForestClassifier.predict(user_input)

# configurar um subheader e mostrar a classificação
st.subheader('Classification:')
st.write(prediction)
