## 1.Data Pre-Processing
## Load Data
data <- read.csv("Data_Science/FinalAssessment/housing.csv")


## Check Data
head(data)      # 查看前几行数据
summary(data)   # 查看摘要统计信息
str(data)       # 查看变量类型


## 2.Missing Value Processing
# Check for missing values
na_count <- sum(is.na(data))

# Delete rows containing missing values
data <- na.omit(data)

# Fill in missing values using average values
data$total_bedrooms[is.na(data$total_bedrooms)] <- mean(data$total_bedrooms, na.rm = TRUE)


## Data Transformer
# Converting character variables to factor variables
data$ocean_proximity <- as.factor(data$ocean_proximity)

# Standardised numeric variables
data$median_income <- scale(data$median_income)


## Feature Enginering
# Create new variables (e.g. add the number of rooms and the number of bedrooms)
data$total_rooms_bedrooms <- data$total_rooms + data$total_bedrooms

head(data)     
summary(data)   
str(data)       


## 3.Data Visualization
# Plotting box plots: 
library(ggplot2)

ggplot(data, aes(x = ocean_proximity, y = median_house_value)) +
  geom_boxplot(fill = "lightgreen", color = "black") +
  labs(x = "Ocean Proximity", 
       y = "Median House Value", 
       title = "Boxplot of Median House Value by Ocean Proximity")
  

# Creating a scatter plot
ggplot(data, aes(x = longitude, y = latitude)) +
  geom_point(color = "blue", size = 2) +
  labs(x = "Longitude", 
       y = "Latitude", 
       title = "Housing Locations")

# Create line graphs
# Reducing the number of data points
sampled_data <- data[seq(1, nrow(data), 10), ]

# Create line graphs and use smoothing curves
ggplot(sampled_data, 
       aes(x = seq_along(housing_median_age), 
       y = housing_median_age)) +
  geom_smooth(color = "blue", method = "loess", se = FALSE) +
  geom_point(color = "blue", size = 2) +
  labs(x = "Index", 
       y = "Housing Median Age", 
       title = "Housing Median Age Trend") +
  theme_minimal() +
  theme(plot.title = element_text(size = 18, face = "bold"),
        axis.title = element_text(size = 14),
        axis.text = element_text(size = 12),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  annotate("text", x = 1, y = max(sampled_data$housing_median_age), label = paste0("Max: ", max(sampled_data$housing_median_age)), hjust = 0, vjust = 0, size = 4, color = "red")


## 4.Regression Analysis
# Create training and testing sets
set.seed(123)  # set random seed
trainIndex <- sample(nrow(data), 0.7 * nrow(data))
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]
nrow(trainData)
nrow(testData)

# Creating a linear regression model
linearModel <- lm(median_house_value ~ ., data = trainData)
summary(linearModel)

# Stepwise Regression
library(MASS)
step <- stepAIC(linearModel, direction="both")

linearModel <- lm(step)
summary(linearModel)

# Making predictions on the test set
predicted <- predict(linearModel, newdata = testData)
summary(predicted)

diff <- predicted - data$median_house_value
diff
plot(diff, data$median_house_value)

MeanSquareError <- function(x) {return(sqrt(mean(x ^ 2)))}
MeanSquareError(diff)

R2 <- cor(predicted, testData$median_house_value)^2
R2


## 5.Cluster Analysis
library(cluster)
library(ggplot2)

# Select the numeric column to be used for clustering
numeric_data <- data[, sapply(data, is.numeric)]
summary(numeric_data)

# Perform data scaling
scaled_data <- scale(numeric_data)
summary(scaled_data)

# Performing cluster analysis
kmeansModel <- kmeans(scaled_data, centers = 3)
summary(kmeansModel)

# Create a new data box containing the original data and the clustering results
clusterData <- data.frame(data, cluster = as.factor(kmeansModel$cluster))

# Use ggplot2 to plot scatter plots with different colours to indicate different clusters
ggplot(clusterData, 
       aes(x = longitude, y = latitude, color = cluster)) +
  geom_point() +
  labs(x = "Longitude", y = "Latitude", title = "Cluster Analysis") +
  theme_minimal()
  

## 6.Decision Tree
library(rpart)
library(rpart.plot)

# Building a decision tree model
treeModel <- rpart(median_house_value ~ ., data = data)

# Visualisation for decision making
rpart.plot(treeModel)



## 7.Time-series Analysis
library(forecast)

# Converting data to time series objects
ts_data <- ts(data$median_house_value, 
              frequency = 12)  # Assuming data at monthly frequency

# Visualisation of time series data
plot(ts_data, main = "Time Series Plot", xlab = "Time", ylab = "Median House Value")

# Splitting the data into a training set and a test set
train_data <- window(ts_data, end = c(1500, 12))  # Use data up to December 1500 as training set

test_data <- window(ts_data, 
                    start = c(1501, 1), 
                    end = c(1704,1))  # Using data from January 1501 to January 1704 as a test set

# Fitting a time series model
model <- auto.arima(train_data)
summary(model)

# Print the diagnostic information of the model
print(model)

# Predicting future time series values
forecast <- forecast(model, h = length(test_data))  # Predicts values of the same length as the test set
summary(forecast)

# Visualisation of forecast results
plot(forecast, main = "Forecast Plot")
lines(test_data, col = "red")  # Adding a true value curve for the test set

# Model assessment
accuracy(forecast, test_data)

# Plot the error between the predicted results and the actual values of the test set
errors <- residuals(forecast)
plot(errors, main = "Forecast Errors", xlab = "Time", ylab = "Error")
abline(h = 0, col = "red", lty = 2)  # Add a horizontal line to indicate an error of 0