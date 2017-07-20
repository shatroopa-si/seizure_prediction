# ##USE MODEL TO PREDICT
# # testData1 = train1[1:ncol(train1) - 1]
# testData1 = read.csv("features/test_1_set.csv")
# # testData11 = testData1[3:ncol(testData1)]
# # actualOutput1 = predict(model1, testData11, type="response", probability = T)
# # actualOutput1[is.na(actualOutput1)] = 0
# 
# # testData2 = train2[1:ncol(train2) - 1]
# testData2 = read.csv("features/test_2_set.csv")
# # testData21 = testData2[3:ncol(testData2)]
# # actualOutput2 = predict(model2, testData21, type="response", probability = T)
# # actualOutput2[is.na(actualOutput2)] = 0
# 
# # testData3 = train3[1:ncol(train3) - 1]
# testData3 = read.csv("features/test_3_set.csv")
# # testData31 = testData3[3:ncol(testData3)]
# # actualOutput3 = predict(model3, testData31, type="response", probability = T)
# # actualOutput3[is.na(actualOutput3)] = 0
# 
# 
# testData = rbind(testData1, testData2)
# testData = rbind(testData, testData3)
# 
# # expectedOutput = rbind(train1$class, train2$class)
# # expectedOutput = rbind(expectedOutput, train3$class)
# 
# testDataValues = testData[3:ncol(testData)]

pcaTestData = read.csv("pca_fft/pcaTestData.csv")
actualOutput = predict(model, pcaTestData, type="response", probability = T)


actualOutput[is.na(actualOutput)] = 0

# print(expectedOutput == actualOutput)

# actualOutput = rbind(actualOutput1, actualOutput2)
# actualOutput = rbind(actualOutput, actualOutput3)

files = as.character(testData[[2]])
result = matrix(,nrow(testData), 2)
result = as.data.frame(result)
colnames(result) = c("File", "Class")
for (i in 1:nrow(testData)) {
  result[i,] = c(files[i], format(round(actualOutput[i], 2), nsmall = 2))
}

opFileName = "Result_pca16_fft_lm.csv"
write.table(result, paste("results/", opFileName, sep = ""), quote = F, row.names = F, col.names = T, sep=",")
print(result)
# format(round(actualOutput[i], 2), nsmall = 2)
# threshold = mean(actualOutput, na.rm = T)
# 
# for(i in 1:length(actualOutput))
# {
#   if(actualOutput[i] >= threshold)
#   {
#     actualOutput[i] = "pre_Ictal"
#   }
#   else
#   {
#     actualOutput[i] = "inter_Ictal"
#   }
# }
# 
# print(actualOutput)

