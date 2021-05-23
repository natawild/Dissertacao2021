'''Criação de um heatmap para verificar os missing data
isnull() devolve os dados mapeados com True ou False
'''
nulos = train.isnull()
print(nulos)

sns.heatmap(train.isnull(),yticklabels=False,cbar=False,cmap='viridis')
#plt.show()

sns.countplot(x='Survived', data=train)
#plt.show()

sns.countplot(x='Survived',hue='Sex',data=train,palette='RdBu_r')
#plt.show()


sns.countplot(x='Survived',hue='Pclass',data=train)
#plt.show()

sns.distplot(train['Age'].dropna(),kde=False,bins=30)
#plt.show()

train['Age'].plot.hist(bins=35)
#plt.show()


info = train.info()
print(info)

sns.countplot(x='SibSp', data=train)
#plt.show()

train['Fare'].plot.hist(bins=40,figsize=(10,4))
#plt.show()

'''
#esta parte ainda não funciona 

cf.go_offline()
fig = train['Fare'].iplot(kind='hist', bins=30)
fig.write_html('first_figure.html', auto_open=True)
fig.show()

fig = go.Figure(data=go.Bar(y=[2, 3, 1]))
fig.write_html('first_figure.html', auto_open=True)
fig.show()
'''

#Cleaning missing data
print('_____________Cleaning Missing Data____________-')
plt.figure(figsize=(10,7))
sns.boxplot(x='Pclass',y='Age', data=train)



def impute_age(cols):
	Age = cols[0]
	Pclass = cols[1]

	if pd.isnull(Age):

		if Pclass == 1:
			return 37
		elif Pclass == 2:
			return 29
		else:
			return 24
	else:
		return Age

train['Age']=train[['Age','Pclass']].apply(impute_age,axis=1)



#eliminar a coluna cabin
train.drop('Cabin',axis=1,inplace=True)

#eliminar os na
train.dropna(inplace=True)

sns.heatmap(train.isnull(),yticklabels=False,cbar=False,cmap='viridis')


#converte variáveis nominais para variaveis binárias
#ex: F --> 0 M --> 1

sex = pd.get_dummies(train['Sex'],drop_first=True)
print(sex)

embark = pd.get_dummies(train['Embarked'],drop_first=True)
print(embark)

train= pd.concat([train,sex,embark],axis=1)
print(train)

train.drop(['Sex','Embarked','Name','Ticket'],axis=1,inplace=True)
print(train)

train.drop('PassengerId',axis=1,inplace=True)
print(train)


#TEST.CSV
X = train.drop('Survived',axis=1)
y = train['Survived']

X_train, X_test, y_train, y_test = train_test_split(X,y,test_size=0.3,random_state=101)

#criação do modelo

logmodel = LogisticRegression()
logmodel.fit(X_train,y_train)
predictions = logmodel.predict(X_test)

#classificação do modelo

print(classification_report(y_test,predictions))

print(confusion_matrix(y_test,predictions))

