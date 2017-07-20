# cor = matrix(,1, 15 * 16/2)
# k = 0
# for (i in 1: (ncol(df2)-1)){
#   for (j in (i+1): ncol(df2)){
#     k = k+1
#     cor[1,k] = cor(df2[,i],df2[,j])
#   }
# }
# 
# ## get E distance between two channels
# dist = matrix(,1, 15 * 16/2)
# k = 0
# for (i in 1: (ncol(df2)-1)){
#   for (j in (i+1): ncol(df2)){
#     k = k+1
#     dist[1,k] = sqrt(sum((df2[,i]-df2[,j])^2))
#   }
# }


library("R.matlab")
library(stats)
library(moments)


# 
# Matlab$startServer()
# matlab <- Matlab()
# open(matlab)    #open connection to matlab server
# print(matlab)

filterFile = "train_and_test_data_labels_safe.csv"
filter = read.csv(filterFile)

####LOAD PRE_ICTAL DATASET AND EXTRACT BASIC FEATURES
trainFiles_patient1 = list.files(path = "./train_2/", pattern = "*.mat", full.names = F)
# grep(trainFiles_patient1[1], filter$image)
filenames = list()
j = 1
##pick the safe files
for(i in 1:length(trainFiles_patient1))
{
  if(filter$safe[grep(trainFiles_patient1[i], filter$image)] == 1)
  {
    filenames[j] = trainFiles_patient1[1]
    j = j + 1
  }
}
trainset = matrix(,length(filenames), (16*8 + 1))
trainset = as.data.frame(trainset)

expectedOutput = list()

colnames(trainset) = c("target", paste("min_",rep(1:16),sep=""),paste("max_",rep(1:16),sep=""),paste("mean_",rep(1:16),sep=""),paste("median_",rep(1:16),sep=""),paste("sem_",rep(1:16),sep=""),paste("abssum_",rep(1:16),sep=""), paste("skewness_",rep(1:16),sep=""), paste("kurtosis_",rep(1:16),sep=""))

for (i in 1: length(filenames)){
  
  #targets = strsplit(filenames[i],"/")
  
  #name = strsplit(targets[[1]][4],"_")
  
  #target = strsplit(name[[1]][3],".mat")
  
  data = readMat(paste("train_2/", filenames[i], sep = ""))
  
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
  
  trainset[i,] = c(filenames[i], min_list, max_list, mean_list, median_list, sem_list, abssum_list, skewnessInData, kurtosisInData)
  
  expectedOutput[i] = filter$class[grep(trainFiles_patient1[i], filter$image)]
}

write.table(trainset, "train_2_set.csv", quote=F, row.names=F, col.names=T, sep=",")
write(expectedOutput, "train_2_class.txt", quote = F, row.names = F, col.names = F, sep = "\n")
# for(i in 1:length(preIctal_trainFiles))
# {
# fileName = paste("train_1/", preIctal_trainFiles[1], sep = "")
# print(fileName)
# temp = readMat(fileName, NULL)$dataStruct[1]
# 
# }
# trainFileNamePreIctal = "1_7_1.mat"
# 
# preIctal_dataContent = readMat(trainFileNamePreIctal, NULL)
# 
# preIctal_data = preIctal_dataContent$dataStruct[1]                        ##data (iEEG sample values): matrix(time sample x electrode) : data frame
# preIctal_nSamplesSegment = preIctal_dataContent$dataStruct[3]             ##number of rows in data = total time samples : data frame = 240000 = preIctal_nSamplesSegment[[1]][1]
# preIctal_iEEGsamplingRate = preIctal_dataContent$dataStruct[2]            ##data sampling rate = number of data samples in 1s : data frame = 400 = preIctal_iEEGsamplingRate[[1]][1]
# preIctal_channelIndices = preIctal_dataContent$dataStruct[4]              ##columns in the data field(electrodes) : data frame =  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 = preIctal_channelIndices[[1]][1,]
# preIctal_sequence = preIctal_dataContent$dataStruct[5]                    ##index of data segment within 1 hour series of clips : data frame = 1 = preIctal_sequence[[1]][1]
# 
# preIctal_data[[1]] = Mod(fft(preIctal_data[[1]]))                         ##take the mod value in case of complex numbers so the output is always real
# 
# 
# ####LOAD INTER_ICTAL DATASET AND PERFORM FFT
# trainFileNameInterIctal = "1_7_0.mat"
# 
# interIctal_dataContent = readMat(trainFileNameInterIctal, NULL)
# 
# interIctal_data = interIctal_dataContent$dataStruct[1]                        ##data (iEEG sample values): matrix(time sample x electrode) : data frame
# interIctal_nSamplesSegment = interIctal_dataContent$dataStruct[3]             ##number of rows in data = total time samples : data frame = 240000 = interIctal_nSamplesSegment[[1]][1]
# interIctal_iEEGsamplingRate = interIctal_dataContent$dataStruct[2]            ##data sampling rate = number of data samples in 1s : data frame  = 400 = interIctal_iEEGsamplingRate[[1]][1]
# interIctal_channelIndices = interIctal_dataContent$dataStruct[4]              ##columns in the data field(electrodes) : data frame =  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 = interIctal_channelIndices[[1]][1,]
# interIctal_sequence = interIctal_dataContent$dataStruct[5]                    ##index of data segment within 1 hour series of clips : data frame = 1 = interIctal_sequence[[1]][1]
# 
# interIctal_data[[1]] = Mod(fft(interIctal_data[[1]]))

