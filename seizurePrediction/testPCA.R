library(stats)

testData1 = read.csv("features/test_1_set.csv")
testData2 = read.csv("features/test_2_set.csv")
testData3 = read.csv("features/test_3_set.csv")

testData = rbind(testData1, testData2)
testData = rbind(testData, testData3)

testDataValues = testData[3:ncol(testData)]

testDataValues[is.na(testDataValues)] = 0
pcaTestModel = prcomp(testDataValues)
pcaTestData = predict(pcaTestModel, testDataValues)[, 1:16]

pcaTestData = Mod(fft(pcaTestData))

folder = "pca_fft"


write.table(pcaTestData, paste(folder, "pcaTestData.csv", sep = "/"), quote=F, row.names=F, col.names=T, sep=",")
