library(readxl)
library(naniar)
library(visdat)
library(ggplot2)
library(ggplot)
library(DataExplorer)

DadosAposRevisao <- read_excel("DadosAposRevisao.xlsx")
View(DadosAposRevisao)   
attach(DadosAposRevisao)
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

