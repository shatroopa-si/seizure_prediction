###########-------------Logistic Regression-----------------------


# ##BUILD UP MODEL
# x = as.matrix(train, quote = F)
# names(x) = NULL
# y = Mod(fft(x))

trainSet = read.csv("pca_fft/pcaData.csv")
trainSet$class = train$class

model = glm(class ~ ., data = trainSet, family = binomial(), maxit = 2000)
print(summary(model))
