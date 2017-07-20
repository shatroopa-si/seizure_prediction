train1 = read.csv("features/train_1_set.csv")
train1$class = as.matrix(read.table("features/train_1_class.txt", sep = "\n"))
train1$class = factor(train1$class)

train2 = read.csv("features/train_2_set.csv")
train2$class = as.matrix(read.table("features/train_2_class.txt", sep = "\n"))
train2$class = factor(train2$class)

train3 = read.csv("features/train_3_set.csv")
train3$class = as.matrix(read.table("features/train_3_class.txt", sep = "\n"))
train3$class = factor(train3$class)

train = rbind(train1,  train2)
train = rbind(train, train3)

train = train[3:ncol(train)]


# ## LOAD FILES AND MERGE
# train1 = read.csv("features/train_1_set.csv")
# train1$class = as.matrix(read.table("features/train_1_class.txt", sep = "\n"))
# train1$class = factor(train1$class)
# # train1 = train1[3:ncol(train1)]
# # model1 = glm(class ~ ., data = train1, family = binomial())
# 
# train2 = read.csv("features/train_2_set.csv")
# train2$class = as.matrix(read.table("features/train_2_class.txt", sep = "\n"))
# train2$class = factor(train2$class)
# # train2 = train2[3:ncol(train2)]
# # model2 = glm(class ~ ., data = train2, family = binomial())
# 
# train3 = read.csv("features/train_3_set.csv")
# train3$class = as.matrix(read.table("features/train_3_class.txt", sep = "\n"))
# train3$class = factor(train3$class)
# # train3 = train3[3:ncol(train3)]
# # model3 = glm(class ~ ., data = train3, family = binomial())
# 
# train = rbind(train1,  train2)
# train = rbind(train, train3)
# 
# 
# train = train[3:ncol(train)]
# # train$class = as.matrix(read.table("train_1_class.txt", sep = "\n"))
# # train$class = factor(train$class)