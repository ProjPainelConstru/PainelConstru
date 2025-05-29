install.packages('devtools', dep = T)
devtools::install_github('filipezabala/jurimetrics')
library(tidyverse)
library(jurimetrics)

?jurimetrics::fits

setwd('C:\\Users\\HP\\Desktop\\Projeto\\Modelagem\\SP')  

# SP_CONSTRUCAO_CIVIL.csv

# Carrega os dados
file_path <- 'C:/Users/HP/Desktop/Projeto/Data/PreparedData/RJ/Semanal/SP_CONSTRUCAO_CIVIL.csv'  
fi <- read.csv(file_path)
fi$Proj_Date <- as.Date(fi$Proj_Date)
head(fi)

# Verifica as datas e monta a série temporal
first_date <- min(fi$Proj_Date)  
last_date <- max(fi$Proj_Date)  
start_year <- year(first_date)  
start_week <- week(first_date) 
end_year <- year(last_date)  
end_week <- week(last_date) 

timeseries <- ts(fi$BOM_Quant, start = c(start_year, start_week), end = c(end_year, end_week), frequency = 52) 
par(mfrow=c(1,1))
plot(timeseries)

fits(timeseries, train = 0.9, show.sec.graph = TRUE, PI = FALSE)

# SP_FERRAGENS

file_path <- 'C:/Users/HP/Desktop/Projeto/Data/PreparedData/RJ/Semanal/SP_FERRAGENS.csv'  
fi <- read.csv(file_path)
fi$Proj_Date <- as.Date(fi$Proj_Date)
head(fi)
first_date <- min(fi$Proj_Date)  
last_date <- max(fi$Proj_Date)  
start_year <- year(first_date)  
start_week <- week(first_date) 
end_year <- year(last_date)  
end_week <- week(last_date) 
timeseries <- ts(fi$BOM_Quant, start = c(start_year, start_week), end = c(end_year, end_week), frequency = 52) 
par(mfrow=c(1,1))
plot(timeseries)
fits(timeseries, train = 0.9, show.sec.graph = TRUE, PI = FALSE)


# SP_MATERIAIS_ELETRICOS

file_path <- 'C:/Users/HP/Desktop/Projeto/Data/PreparedData/RJ/Semanal/SP_MATERIAIS_ELETRICOS.csv'  
fi <- read.csv(file_path)
fi$Proj_Date <- as.Date(fi$Proj_Date)
head(fi)
first_date <- min(fi$Proj_Date)  
last_date <- max(fi$Proj_Date)  
start_year <- year(first_date)  
start_week <- week(first_date) 
end_year <- year(last_date)  
end_week <- week(last_date) 
timeseries <- ts(fi$BOM_Quant, start = c(start_year, start_week), end = c(end_year, end_week), frequency = 52) 
par(mfrow=c(1,1))
plot(timeseries)
fits(timeseries, train = 0.9, show.sec.graph = TRUE, PI = FALSE)
