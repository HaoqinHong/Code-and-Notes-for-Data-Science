setwd("RStudioProjects/Data_Science/Lecture6_Modeling")
breast <- read.table("breast-cancer-wisconsin.data", sep = ",", header = FALSE, na.strings = "?")
names(breast) <- c(
  "ID", "clumpThickness", "sizeUniformity",
  "shapeUniformity", "maginalAdhesion",
  "singleEpithelialCellSize", "bareNuclei",
  "blandChromatin", "normalNucleoli", "mitosis", "class"
)
# install.packages("https://access.togaware.com/RGtk2_2.20.36.2.zip", repos=NULL)
df <- breast[-1]
head(df)
df$class <- factor(df$class, levels = c(2, 4), labels = c("benign", "malignant"))
set.seed(1234)
train <- sample(nrow(df), 0.7 * nrow(df))
df.train <- df[train, ]
df.validate <- df[-train, ]
table(df.train$class)
table(df.validate$class)

# 拟合逻辑回归
fit.logit <- glm(class ~ ., data = df.train, family = binomial())
prob <- predict(fit.logit, df.validate, type = "response") # 对训练集外的样本进行分类
logit.pred <- factor(prob > .5, levels = c(F, T), labels = c("benign", "malignant")) # 评估预测的准确性
logit.pref <- table(df.validate$class, logit.pred, dnn = c("Actual", "Predicted"))
logit.pref # 混淆矩阵

# 决策树
library(rpart)
set.seed(1234) # 生成树
dtree <- rpart(class ~ ., data = df.train, method = "class", parms = list(split = "information"))
plotcp(dtree)  # 剪枝
dtree.pruned <- prune(dtree, cp = .0125)
library(rpart.plot)
prp(dtree.pruned, type = 2, extra = 104, fallen.leaves = T, main = "decision tree") # 对训练集外的样本单元分类
dtree.pred <- predict(dtree.pruned, df.validate, type = "class")
dtree.pref <- table(df.validate$class, dtree.pred, dnn = c("Actual", "Predict"))
dtree.pref

# 条件推断树
library(sandwich)
library(libcoin)
library(party)
library(partykit)
fit.tree <- ctree(class ~ ., data = df.train)
plot(fit.tree, main = "Condition Inference Tree")
ctree.pred <- predict(fit.tree, df.validate, type = "response")
ctree.pref <- table(df.validate$class, ctree.pred, dnn = c("Actual", "Predicted"))
ctree.pref

# 随机森林
library(randomForest)
set.seed(1234) # 生成森林
fit.forest <- randomForest(class ~ ., data = df.train, na.action = na.roughfix, importance = T)
importance(fit.forest, type = 2)
forest.pred <- predict(fit.forest, df.validate) # 对训练集外的样本点分类
forest.pref <- table(df.validate$class, forest.pred, dnn = c("Actual", "Predicted"))
forest.pref

# 支持向量机
library(e1071)
set.seed(1234)
fit.svm <- svm(class ~ ., data = df.train)
svm.pred <- predict(fit.svm, na.omit(df.validate))
svm.pref <- table(na.omit(df.validate)$class, svm.pred, dnn = c("Actual", "Predicted"))
svm.pref

# 带有RBF内核的支持向量机
set.seed(1234) # 通过调整gamma和c来拟合模型
tuned <- tune.svm(class ~ ., data = df.train, gamma = 10^(-6:1), cost = 10^(-10:10))
tuned
fit.svm <- svm(class ~ ., data = df.train, gamma = .01, cost = 1)
svm.pred <- predict(fit.svm, na.omit(df.validate))
svm.pref <- table(na.omit(df.validate)$class, svm.pred, dnn = c("Actual", "Predicted"))
svm.pref

# 编写函数选择预测效果最好的解
performance <- function(table, n = 2) {
  if (!all(dim(table) == c(2, 2))) {
    stop("Must be a 2 * 2 table")
  }
  tn <- table[1, 1]
  fp <- table[1, 2]
  fn <- table[2, 1]
  tp <- table[2, 2]
  sensitivity <- tp / (tp + fn)
  specificity <- tn / (tn + fp)
  ppp <- tp / (tp + fp)
  npp <- tn / (tn + fn)
  hitrate <- (tp + tn) / (tp + tn + fn + fp)
  result <- paste("Sensitivity = ", round(sensitivity, n),
    "\nSpecificity = ", round(specificity, n),
    "\nPositive Predictive Value = ", round(ppp, n),
    "\nNegative Predictive Value = ", round(npp, n),
    "\nAccuracy = ", round(hitrate, n), "\n",
    sep = ""
  )
  cat(result)
}
performance(logit.pref)
performance(dtree.pref)
performance(ctree.pref)
performance(forest.pref)
performance(svm.pref)
