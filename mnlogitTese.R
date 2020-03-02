setwd("~/Documents/GitHub/Tese")


library("mnlogit")

data("Fish", package = "mnlogit")
head(Fish, 8)
fm <- formula(mode ~ price | income | catch)
fit <- mnlogit(fm, Fish, ncores = 2)
print(fit, what = "eststat")

#O processo de estimativa termina quando qualquer uma das três condições maxiter, ftol ou gtol é conhecida. 
#Caso haja problemas de singularidade numérica durante as iterações de Newton, recomenda-se relaxar ftol ou gtol para 
#obter uma estimativa adequada. O método simples de Newton tem uma tendência a ultrapassar extremos. 
#No mnlogit, incluímos uma “pesquisa de linha” (minimização unidimensional ao longo da direção de Newton) que evita esse problema e garante convergência.
#Por conveniência, o método de impressão pode ser chamado para consultar um objeto 'mnlogit' quanto ao número e tipo de coeficientes do modelo.
print(fit, what = "modsize")

?lrtest