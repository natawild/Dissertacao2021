import pandas as pd 

dadosDelirium = pd.read_csv("dados.csv")

#print(dadosDelirium.head())

nan = dadosDelirium[dadosDelirium.isna().any(axis=1)]
print(nan.head())

