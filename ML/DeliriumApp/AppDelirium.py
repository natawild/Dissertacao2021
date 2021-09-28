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
dadosComGasometria = pd.read_csv('/Users/user/Documents/GitHub/AppDelirium/DeliriumcomGasometria.csv')

# configurar um sub titulo
st.subheader('Data Information:')

# Mostrar os dados como um dataframe/tabela
st.dataframe()

st.write(dadosComGasometria.describe())

chart = st.bar_chart(dadosComGasometria)

# dividir os dados en independentes 'x' e dependentes 'y'

X = dadosComGasometria.iloc[:, 0:8].values
Y = dadosComGasometria.iloc[:, -1].values
print(X)

# dividir os dados em 75% para treino e 25% para teste
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.25, random_state=0)


# Buscar o input do utilizador
diag = dadosComGasometria['Grupo_Diagn'].drop_duplicates()
res_rass = dadosComGasometria['RASS'].drop_duplicates()
res_sirs = dadosComGasometria['SIRS'].drop_duplicates()

def get_user_input_with_gasome():
    age = st.sidebar.slider('Idade', 18, 120, 29)
    gender = st.sidebar.selectbox('Selecione o grupo de diagnóstico:',diag)
    tempo = st.sidebar.slider('tempo', 0, 1, 1)
    glicose = st.sidebar.slider('glicose', 0, 1000, 1)
    sodio = st.sidebar.slider('sodio', 100, 170, 1)
    ureia = st.sidebar.slider('ureia', 1, 280, 1)
    creatinina = st.sidebar.slider('creatinina', 0, 30, 1)
    pcr = st.sidebar.slider('pcr', 2.9, 500, 1)
    ca = st.sidebar.slider('ca', 0.5, 1.4, 0.1)
    co2 = st.sidebar.slider('co2', 10, 130.0, 0.1)
    o2 = st.sidebar.slider('o2', 30, 180, 0.1)
    hco3 = st.sidebar.slider('hco3', 3, 45, 0.1)
    rosuvastatina = st.sidebar.selectbox('Medicação Habitual:',res_rass)
    atorvastatina = st.sidebar.selectbox('Selecione a quantidade de criérios SIRS:',res_sirs)

    # Guardar o dicionário numa variável
    user_data = {'age': age,
                 'gender': gender,
                 'tempo': tempo,
                 'glicose': glicose,
                 'sodio': sodio,
                 'ureia': ureia,
                 'creatinina': creatinina,
                 'pcr' : pcr,
                 'ca' : ca,
                 'ureia' : ureia,
                 'co2': co2,
                 'hco3': hco3,
                 'rosuvastatina' : rosuvastatina,
                 'atorvastatina' : atorvastatina, 
                 'pravastatina': pravastatina
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
