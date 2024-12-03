library("tidyverse")
# 读取csv文件
data <- read.csv("RStudioProjects/Data_Science/FinalAssessment/Death_rates_for_suicide__by_sex__race__Hispanic_origin__and_age__United_States.csv")

# 查看数据概要信息
head(data, 5)
summary(data)

# 统计各年龄段自杀人数
ggplot(data = data) +
    stat_count(aes(x = AGE))

# 绘制散点图
plot(data$YEAR ~ data$AGE_NUM)
