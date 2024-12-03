# Machine learning works by featuring a dataset that we break up into a training 
# section and a testing section. We use the training data to come up with our model. 
# We can then prove or test that model against the remaining testing section data.
housing <- read.table("RStudioProjects/Data_Science/Lecture6_Modeling/housing.data")

colnames(housing) <- c("CRIM","ZN","INDUS","CHAS","NOX","RM","AGE",
                    "DIS","RAD","TAX","PRATIO","B","LSTAT","MDEV")
summary(housing)

plot(housing)


# We can produce a correlation matrix to prove the data
library(corrplot)
corrplot(cor(housing), method="number", tl.cex=0.5)


# Data Partitionling
set.seed(1234)
ind <- sample(2, nrow(housing), replace = T, prob = c(0.75, 0.25))
table(ind)

housingTraining <- housing[ind == 1,]
housingTesting <- housing[ind == 2,]

nrow(housingTraining)
nrow(housingTesting)


# Model
# Linear Model
linearModel <- lm(MDEV ~ CRIM + ZN + INDUS + CHAS + NOX + RM + AGE + 
                  DIS + RAD + TAX + PRATIO + B + LSTAT, data=housingTraining)
summary(linearModel)


# Stepwise Regression
library(MASS)
step <- stepAIC(linearModel, direction="both")

linearModel <- lm(step)
summary(linearModel)


# Prediction
predicted <- predict(linearModel,newdata=housingTesting)

summary(predicted)
summary(housingTesting$MDEV)

diff <- predicted - housingTesting$MDEV
diff
plot(predicted, housingTesting$MDEV)

MeanSquareError <- function(x) {return(sqrt(mean(x ^ 2)))}
MeanSquareError(diff)

# Decision Tree
library(rpart)
housing_tree <- rpart(MDEV ~ CRIM + ZN + INDUS + CHAS + NOX + RM + AGE + 
                  DIS + RAD + TAX + PRATIO + B + LSTAT, data = housingTraining)
plot(housing_tree)
text(housing_tree, all = T, use.n = T)
