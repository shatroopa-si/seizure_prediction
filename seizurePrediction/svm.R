library(e1071)

# model <- svm(Y ~ X , data)
# predictedY <- predict(model, data)
# points(data$X, predictedY, col = "red", pch=4)

trainingData = read.csv("pcaFeatures/pcaData.csv")
trainingData$class = train$class
# ExpectedOutput = subset(train, select = class)
# svmModel = svm(trainingData, ExpectedOutput, probability = T)
svmModel = svm(class ~ ., data = trainingData, probability = T)

testDataValues = pcaTestData#testDataValues[!rowSums(is.na(testDataValues)), ]
predictedOutput = predict(svmModel, testDataValues, probability = T)

print(predictedOutput)

# pred <- predict(svmModel,)
