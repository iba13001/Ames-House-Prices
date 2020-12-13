library(kknn)
library(VIM)
library(dplyr)
library(tidyr)
library(Metrics)
#----- Imputation of Train Set-------
data=read.csv('imputation_train_set.csv')
data=data[-c(1)]
head(data)
summary(data)

# add replace randomly selected values with NAs
train_data= data %>% drop_na(LotFrontage)
select_data=train_data

set.seed(0)
percentage=0.15
NA_idx<- sample(seq_len(nrow(train_data)), size = percentage*nrow(train_data))
select_data[NA_idx,]$LotFrontage<-NA

n=round((nrow(select_data))**0.5)
imputed_train_data = kNN(select_data[-c(1)], variable=c('LotFrontage'), k=n, weightDist=TRUE)
imputed_LotFrontage<-imputed_train_data[NA_idx,c("LotFrontage")]
actual_LotFrontage<-train_data[NA_idx,c("LotFrontage")]

mae(actual_LotFrontage,imputed_LotFrontage)
error=mae(actual_LotFrontage,imputed_LotFrontage)/mean(train_data$LotFrontage)*100
error
# the error is about 12.62 which is 18% of the mean Lot Frontage.

# Now we can Impute the missing values in Lot Frontage
n=round((nrow(data))**0.5)
imputed_data = kNN(data, variable=c('LotFrontage'), k=n, weightDist=TRUE)
#imputed_data$Id=data$Id
head(imputed_data)
write.csv(imputed_data,'imputed_train_data.csv',row.names = FALSE)


#----- Imputation of Test Set-------
data=read.csv('imputation_test_set.csv')
data=data[-c(1)]
head(data)
summary(data)
# Train-Test split
set.seed(0)
test_data= data %>% drop_na(LotFrontage)
select_data=test_data

set.seed(0)
percentage=0.15
NA_idx<- sample(seq_len(nrow(test_data)), size = percentage*nrow(test_data))
select_data[NA_idx,]$LotFrontage<-NA

n=round((nrow(select_data))**0.5)
imputed_test_data = kNN(select_data[-c(1)], variable=c('LotFrontage'), k=n, weightDist=TRUE)
imputed_LotFrontage<-imputed_test_data[NA_idx,c("LotFrontage")]
actual_LotFrontage<-test_data[NA_idx,c("LotFrontage")]

mae(actual_LotFrontage,imputed_LotFrontage)
error=mae(actual_LotFrontage,imputed_LotFrontage)/mean(test_data$LotFrontage)*100
error
# the error is about 11.04 which is 15% of the mean Lot Frontage.

# Now we can Impute the missing values in Lot Frontage
n=round((nrow(data))**0.5)
imputed_data = kNN(data[-c(1)], variable=c('LotFrontage'), k=n, weightDist=TRUE)
imputed_data$Id=data$Id
head(imputed_data)
write.csv(imputed_data,'imputed_test_data.csv',row.names = FALSE)
