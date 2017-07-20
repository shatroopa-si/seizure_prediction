library("R.matlab")
library(moments)

testFiles_patient1 = list.files(path = "./test_2_new/", pattern = "*.mat", full.names = F)

testset = matrix(,length(testFiles_patient1),(16*8 + 2))
testset = as.data.frame(testset)


colnames(testset) = c("path","target",paste("min_",rep(1:16),sep=""),paste("max_",rep(1:16),sep=""),paste("mean_",rep(1:16),sep=""),paste("median_",rep(1:16),sep=""),paste("sem_",rep(1:16),sep=""),paste("abssum_",rep(1:16),sep=""), paste("skewness_",rep(1:16),sep=""), paste("kurtosis_",rep(1:16),sep=""))

for (i in 1: length(testFiles_patient1)){
  
  data = readMat(paste("test_2_new/", testFiles_patient1[i], sep = ""))
  
  df = as.data.frame(data[[1]][[1]])
  
  sum_list = as.numeric(apply(df, 2, sum))
  
  mean_list = as.numeric(apply(df, 2, mean))
  
  median_list = as.numeric(apply(df, 2, median))
  
  sem_list = as.numeric(apply(df, 2, function (x) {sd(x)/length(x)}))     ##std. deviation / length i.e. avg std. deviation
  
  abssum_list = as.numeric(apply(df, 2, function (x) {sum(abs(x))}))
  
  min_list = as.numeric(apply(df, 2, min))
  
  max_list = as.numeric(apply(df, 2, max))
  
  skewnessInData = as.numeric(apply(df, 2, skewness))
  
  kurtosisInData = as.numeric(apply(df, 2, kurtosis))
  
  testset[i,] = c("test_2_new/", testFiles_patient1[i], min_list, max_list, mean_list, median_list, sem_list, abssum_list, skewnessInData, kurtosisInData)
}

write.table(testset,"test_2_set.csv",quote=F,row.names=F,col.names=T,sep=",")