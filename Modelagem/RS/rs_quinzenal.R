install.packages('devtools', dep = T)
devtools::install_github('filipezabala/jurimetrics')
library(tidyverse)
library(jurimetrics)

?jurimetrics::fits

setwd('C:\\Users\\HP\\Desktop\\Projeto\\Modelagem\\RS')  

# RS_CONSTRUCAO_CIVIL.csv

# Carrega os dados
file_path <- 'C:/Users/HP/Desktop/Projeto/Data/PreparedData/Interpolado/RS/Quinzenal/RS_CONSTRUCAOhttp/CIVIL.csv'  
fi <- read.csv(file_path)
fi$Proj_Date <- as.Date(fi$Proj_Date)
head(fi)

# Verifica as datas e monta a série temporal  
first_date <- min(fi$Proj_Date)  
last_date <- max(fi$Proj_Date)  

# Extrair ano e quinzena das datas  
start_year <- year(first_date)  
start_quinzena <- ceiling(day(first_date) / 15) + ((month(first_date) - 1) * 2)  

end_year <- year(last_date)  
end_quinzena <- ceiling(day(last_date) / 15) + ((month(last_date) - 1) * 2)  
fi$log_BOM_Quant <- log(fi$BOM_Quant) 
# Criar a série temporal quinzenal  
timeseries <- ts(fi$BOM_Quant, start = c(start_year, start_quinzena), end = c(end_year, end_quinzena), frequency = 24)
par(mfrow=c(1,1))
plot(timeseries)

fits(timeseries, train = 0.9, show.sec.graph = TRUE, PI = FALSE)

# RS_FERRAGENS

file_path <- 'C:/Users/HP/Desktop/Projeto/Data/PreparedData/Interpolado/RS/Quinzenal/RS_FERRAGENS.csv'  
fi <- read.csv(file_path)
fi$Proj_Date <- as.Date(fi$Proj_Date)
head(fi)
first_date <- min(fi$Proj_Date)  
last_date <- max(fi$Proj_Date)  
start_year <- year(first_date)  
start_quinzena <- ceiling(day(first_date) / 15) + ((month(first_date) - 1) * 2)  
end_year <- year(last_date)  
end_quinzena <- ceiling(day(last_date) / 15) + ((month(last_date) - 1) * 2)  
fi$log_BOM_Quant <- log(fi$BOM_Quant) 
timeseries <- ts(fi$BOM_Quant, start = c(start_year, start_quinzena), end = c(end_year, end_quinzena), frequency = 24)
par(mfrow=c(1,1))
plot(timeseries)
fits(timeseries, train = 0.9, show.sec.graph = TRUE, PI = FALSE)


# RS_MATERIAIS_ELETRICOS

file_path <- 'C:/Users/HP/Desktop/Projeto/Data/PreparedData/Interpolado/RS/Quinzenal/RS_MATERIAIS_ELETRICOS.csv'  
fi <- read.csv(file_path)
fi$Proj_Date <- as.Date(fi$Proj_Date)
head(fi)
first_date <- min(fi$Proj_Date)  
last_date <- max(fi$Proj_Date)  
start_year <- year(first_date)  
start_quinzena <- ceiling(day(first_date) / 15) + ((month(first_date) - 1) * 2)  
end_year <- year(last_date)  
end_quinzena <- ceiling(day(last_date) / 15) + ((month(last_date) - 1) * 2) 
fi$log_BOM_Quant <- log(fi$BOM_Quant) 
timeseries <- ts(fi$BOM_Quant, start = c(start_year, start_quinzena), end = c(end_year, end_quinzena), frequency = 24)
par(mfrow=c(1,1))
plot(timeseries)
fits(timeseries, train = 0.9, show.sec.graph = TRUE, PI = FALSE)
