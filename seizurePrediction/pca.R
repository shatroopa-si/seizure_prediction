##prcomp function of package stats

library(stats)

train[is.na(train)] = 0
pcaTrainModel = prcomp(train[, 1:ncol(train) - 1])
pcaTrainData = predict(pcaTrainModel, train)[, 1:16]


pcaTrainData = Mod(fft(pcaTrainData))

folder = "pca_fft"

write.table(pcaTrainData, paste(folder, "pcaData.csv", sep = "/"), quote=F, row.names=F, col.names=T, sep=",")
