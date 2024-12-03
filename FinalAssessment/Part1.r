# 读取csv文件
data <- read.csv("RStudioProjects/Data_Science/FinalAssessment/Crime_Data_from_2020_to_Present.csv")

# 查看数据概要信息
summary(data)
head(data, 3)

# 绘制直方图
hist(data$Crm.Cd)

# 绘制箱线图
boxplot(data$Vict.Age ~ data$AREA)



