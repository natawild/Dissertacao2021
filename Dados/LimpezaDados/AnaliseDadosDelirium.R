library(readxl)
library(naniar)
library(visdat)
library(ggplot2)
library(dplyr)
library(DataExplorer)
library(corrplot)


DadosAposRevisao <- read_excel("DadosAposRevisao.xlsx", n_max = 435)
attach(DadosAposRevisao)

# Tranformação em factor: 
DadosAposRevisao$Genero <- factor(DadosAposRevisao$Genero, label = c("M", "F"), levels = c(0, 1))

DadosAposRevisao$Rosuvastatina <- factor(DadosAposRevisao$Rosuvastatina, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Atorvastatina <- factor(DadosAposRevisao$Atorvastatina, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Pravastatina <- factor(DadosAposRevisao$Pravastatina, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Sinvastatina <- factor(DadosAposRevisao$Sinvastatina, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Fluvastatina <- factor(DadosAposRevisao$Fluvastatina, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Alprazolam <- factor(DadosAposRevisao$Alprazolam, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Captopril <- factor(DadosAposRevisao$Captopril, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Desloratadine <- factor(DadosAposRevisao$Desloratadine, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Diazepam <- factor(DadosAposRevisao$Diazepam, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Lorazepam <- factor(DadosAposRevisao$Lorazepam, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Digoxin <- factor(DadosAposRevisao$Digoxin, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Dipyridamole <- factor(DadosAposRevisao$Dipyridamole, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Furosemide <- factor(DadosAposRevisao$Furosemide, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Fluvoxamine <- factor(DadosAposRevisao$Fluvoxamine, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Haloperidol <- factor(DadosAposRevisao$Haloperidol, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Hydrocortisone <- factor(DadosAposRevisao$Hydrocortisone, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Iloperidone <- factor(DadosAposRevisao$Iloperidone, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Morphine <- factor(DadosAposRevisao$Morphine, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Nifedipine <- factor(DadosAposRevisao$Nifedipine, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Paliperidone <- factor(DadosAposRevisao$Paliperidone, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Prednisone <- factor(DadosAposRevisao$Prednisone, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Ranitidine <- factor(DadosAposRevisao$Ranitidine, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Risperidone <- factor(DadosAposRevisao$Risperidone, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Trazodone <- factor(DadosAposRevisao$Trazodone, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Venlafaxine <- factor(DadosAposRevisao$Venlafaxine, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Warfarin <- factor(DadosAposRevisao$Warfarin, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Amitriptyline <- factor(DadosAposRevisao$Amitriptyline, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Hydroxyzine <- factor(DadosAposRevisao$Hydroxyzine, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Paroxetine <- factor(DadosAposRevisao$Paroxetine, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Quetiapine <- factor(DadosAposRevisao$Quetiapine, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Scopolamine <- factor(DadosAposRevisao$Scopolamine, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Trihexyphenidyl <- factor(DadosAposRevisao$Trihexyphenidyl, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Clonidine <- factor(DadosAposRevisao$Clonidine, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Sertralina <- factor(DadosAposRevisao$Sertralina, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Tramadol <- factor(DadosAposRevisao$Tramadol, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Mexazolam <- factor(DadosAposRevisao$Mexazolam, label = c("N", "S"), levels = c(0, 1))
DadosAposRevisao$Trospium <- factor(DadosAposRevisao$Trospium, label = c("N", "S"), levels = c(0, 1))

# Transformação de data de óbito em factor:
DadosAposRevisao$Obito <- factor(DadosAposRevisao$Obito, label = c("N", "S"), levels = c(0, 1))

# Transformação de alcoolico em factor:
DadosAposRevisao$Alcoolico <- factor(DadosAposRevisao$Alcoolico, label = c("N", "S"), levels = c(0, 1))


# Transformação do resultado de delirium para factor:
DadosAposRevisao$ResultDelirium <- factor(DadosAposRevisao$ResultDelirium, label = c("Sem delirium", "Delirium"), levels = c(0, 1))



# Transformando Grupo de diagnostico em factor:
DadosAposRevisao$GrupoDiagn <- factor(DadosAposRevisao$GrupoDiagn,
                                  label = c("Neurologico", "Cardiovascular", "Gastrointestinal", "Respiratório", "Genitourinário", "Musculoesquelético", "Toxicidade de Drogas", "Outro", "Hemato-Oncológico"),
                                  levels = 0:8)

vis_dat(DadosAposRevisao)
vis_miss(DadosAposRevisao, warn_large_data= FALSE)

create_report(DadosAposRevisao)
create_report(DadosAposRevisao, y= 'ResultDelirium')
introduce(DadosAposRevisao)
plot_intro(DadosAposRevisao)
plot_missing(DadosAposRevisao) + theme_bw() + ggtitle("Percentagem de valores omissos")


plot_bar(DadosAposRevisao)
plot_correlation(DadosAposRevisao, type="continuous")

ggplot(DadosAposRevisao,aes(ResultDelirium,fill = factor(DadosAposRevisao$ResultDelirium))) +
  geom_bar() + labs (fill = "Legenda") +
  geom_text(stat='count', aes(label=..count..),vjust=0,size=5,nudge_y=0.125) +
  ggtitle("Distribuição da variável dependente")


######################### Regressão Logística Binária #########################

# Passo 1: Carregar os pacotes que serão usados

if(!require(pacman)) install.packages("pacman")
library(pacman)

pacman::p_load(dplyr, psych, car, MASS, DescTools, QuantPsyc, ggplot2)


# Passo 2: Carregar dados

# Importante: selecionar o diretório de trabalho (working directory)
# Isso pode ser feito manualmente: Session > Set Working Directory > Choose Directory

dados <- read_excel("DadosAposRevisao.xlsx", n_max = 435)
View(dados)               # Visualização dos dados em janela separada
glimpse(dados)            # Visualização de um resumo dos dados


# Passo 3: Análise das frequências das categorias da VD

table(dados$ResultDelirium)
summary(dados)


# Passo 4: Verificação das categorias de referência

levels(dados$ResultDelirium)  # Não = categoria de referência



# Passo 5: Verificação dos pressupostos

## 1. Variável dependente dicotômica (categorias mutuamente exclusivas)
## 2. Independência das observações (sem medidas repetidas)


## Construção do modelo:

mod <- glm(ResultDelirium ~ Idade + Genero + Interna_Dias + GrupoDiagn + Glicose + Sodio + Ureia 
           + Creatinina + PCR + Rosuvastatina + Atorvastatina + Pravastatina + Sinvastatina + Fluvastatina + Alprazolam
           + Captopril + Desloratadine + Diazepam + Lorazepam + Digoxin + Dipyridamole + Furosemide + Fluvoxamine + Haloperidol
           + Hydrocortisone + Iloperidone + Morphine + Nifedipine + Paliperidone + Prednisone + Ranitidine + Risperidone + Trazodone
           + Venlafaxine + Warfarin + Amitriptyline + Hydroxyzine + Paroxetine + Quetiapine + Scopolamine + Trihexyphenidyl + Clonidine 
           + Sertralina + Tramadol + Mexazolam + Trospium + Obito + Alcoolico,
           family = binomial(link = 'logit'), data = dados)


## 3. Ausência de outliers/ pontos de alavancagem

plot(mod, which = 5)



## 4. Ausência de multicolinearidade

pairs.panels(dados)

### Multicolinearidade: r > 0.9 (ou 0.8)


vif(mod)
### Multicolinearidade: VIF > 10


## 5. Relação linear entre cada VI contínua e o logito da VD


# Passo 7 (opcional): Matrizes de correlação

## Criando a matriz:
matriz <- cor(dados[1:49], method = "pearson")
View(matriz)

## Arredondando para duas casas decimais:
matriz <- round(cor(dados[1:49], method = "pearson"), 2)
View(matriz)


## Criando uma matriz visual (pacote corrplot)
corrplot(matriz, method = "number")


### Opções de métodos: method = circle, color, pie
### Opções de tipos: type = upper, lower
### Ordenar: order = hclust

corrplot(matriz, method="color", 
         type="upper", order="hclust", 
         addCoef.col = "black", # adiciona o coeficiente à matriz
         tl.col="black", tl.srt=45, # cor e rotação do nome das variáveis
         diag=FALSE # não mostrar a diagonal principal
)



### Interação entre a VI contínua e o seu log não significativa (Box-Tidwell)

intlog <- dados$Idade * log(dados$Idade)

dados$intlog <- intlog

modint <- glm(ResultDelirium ~ Idade + Genero + intlog,
              family = binomial(link = 'logit'), data = dados)

summary(modint)


### Outra opção:

#### Cálculo do logito

logito <- mod$linear.predictors

### Outra opção para o cálculo do logito:
# prob <- predict(mod, type = "response")
# logito <- log(prob/(1-prob))

dados$logito <- logito


#### Análise da relação linear

ggplot(dados, aes(logito, Idade)) +
  geom_point(size = 0.5, alpha = 0.5) +
  geom_smooth(method = "loess") +
  theme_classic()


# Passo 6: Análise do modelo

## Overall effects

Anova(mod, type = 'II', test = "Wald")


## Efeitos específicos

summary(mod)


## Obtenção das razões de chance com IC 95% (usando log-likelihood)

exp(cbind(OR = coef(mod), confint(mod)))


## Obtenção das razões de chance com IC 95% (usando erro padrão = SPSS)

exp(cbind(OR = coef(mod), confint.default(mod)))



# Passo 7: Criação e análise de um segundo modelo

mod2 <- glm(ResultDelirium ~ Idade,
            family = binomial(link = 'logit'), data = dados)


## Overall effects

Anova(mod2, type="II", test="Wald")


## Efeitos específicos

summary(mod2)

## Obtenção das razões de chance com IC 95% (usando log-likelihood)

exp(cbind(OR = coef(mod2), confint(mod2)))


## Obtenção das razões de chance com IC 95% (usando erro padrão = SPSS)

exp(cbind(OR = coef(mod2), confint.default(mod2)))



# Passo 8: Avaliação da qualidade e comparação entre modelos

## Pseudo R-quadrado

PseudoR2(mod, which = "Nagelkerke")

PseudoR2(mod2, which = "Nagelkerke")


# Comparação de modelos
## AIC e BIC
AIC(mod, mod2)
BIC(mod, mod2)


## Qui-quadrado
anova(mod2, mod, test="Chisq")


# Tabela de classificação
ClassLog(mod, dados$ResultDelirium)
ClassLog(mod2, dados$ResultDelirium)



