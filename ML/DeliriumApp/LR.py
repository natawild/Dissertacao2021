# -*- coding: utf-8 -*-
import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import cufflinks as cf
import plotly.graph_objects as go
from plotly import __version__
import plotly.offline as py
from plotly.offline import download_plotlyjs, init_notebook_mode, plot, iplot


from sklearn.model_selection import train_test_split
from sklearn import metrics
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix

# ler csv
# dados = pd.read_csv('dados.csv')


# ler excel
dados = pd.read_excel('DadosEmManutencaoAmostra511.xlsx', sheet_name='BD_amostra_511_sem_avaliacao_ps')

print('---------------Impressão dos dados-------------')
print(dados)
print('Forma dos dados',dados.shape)

print('--------------- Descrição dos dados -------------')
print(dados.info())
print(dados.describe())

print('--------------- Matriz de correlaçao  -------------')
matriz_corr = dados.corr()
sns.heatmap(matriz_corr, cmap='coolwarm')
plt.show()

print('--------------- Impressão dos nulos  ---------------------')
print(dados.isnull())
sns.heatmap(dados.isnull(),yticklabels=False,cbar=False,cmap='viridis')
plt.show()


sns.barplot(x='Género',y='ResultDelirium',data=dados)
plt.show()


sns.barplot(x='Proveniência',y='Idade',data=dados)
plt.show()



sns.countplot(x='Proveniência',data=dados)
plt.show()

# Create a histogram of the Proveniência
sns.boxplot(x='Proveniência',y='ResultDelirium', data=dados, hue='Género')
plt.show()


sns.jointplot(x='Idade', y='ResultDelirium', data=dados)
plt.show()




'''

# Create a jointplot showing the kde distributions of Daily Time spent on site vs Age

sns.jointplot(x='Age', y='Daily Time Spent on Site', data=ad_data, kind='kde', color='red')

# Create a jointplot of 'Daily Time Spent on Site' vs 'Daily Internet Usage'

sns.jointplot(x='Daily Time Spent on Site', y='Daily Internet Usage', data=ad_data, color='green')


# Create a pairplot with the hue defined by the 'Clicked on Ad' column feature
sns.pairplot(ad_data, hue='Clicked on Ad')

# Split the data into training set and testing set using train_test_split
X = ad_data[['Daily Time Spent on Site', 'Age', 'Area Income', 'Daily Internet Usage', 'Male']]
y = ad_data['Clicked on Ad']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=101)

# Train and fit a logistic regression model on the training set

logmodel = LogisticRegression()
logmodel.fit(X_train, y_train)

# Predictions and Evaluations
predictions = logmodel.predict(X_test)

# Create a classification report for the model

print(classification_report(y_test, predictions))
print(confusion_matrix(y_test, predictions))

plt.show()
'''
