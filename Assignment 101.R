# Import dataset from the following link: AirQuality Data Set
# Perform the following written operations:
AirQualityUCI <- read.csv("~/Mathew's/ACGILD Data Analytics/Acad Assignment 10/AirQualityUCI.csv", sep=";")

# 1. Read the file in Zip format and get it into R

AirQualityUCI_Raw <- read.table(unz("~/Mathew's/ACGILD Data Analytics/Acad Assignment 10/AirQualityUCI.zip", "AirQualityUCI.csv"), header=T, sep=";")
colnames(AirQualityUCI_Raw)
AirQualityUCI <- AirQualityUCI_Raw[,-c(16,17)]

# 2. Create Univariate for all the columns
boxplot(AirQualityUCI)
summary(AirQualityUCI)
library(psych)
describe(AirQualityUCI)

# 3. Check for missing values in all columns

for (i in 1:ncol(AirQualityUCI)) {
  if (any(is.na(AirQualityUCI[,i]))) {
    print(paste(colnames(AirQualityUCI)[i]," has missing values"))
  }
}

# 4. Impute the missing values using appropriate methods
library(VIM)
AirQualityUCI_Cleaned <- kNN(AirQualityUCI)
colnames(AirQualityUCI_Cleaned)
AirQualityUCI_Cleaned <- AirQualityUCI_Cleaned[,-c(seq(16,30))]

# 5. Create bi-variate analysis for all relationships
str(AirQualityUCI_Cleaned)
library(corrplot)
scatterplot.matrix(AirQualityUCI_Cleaned)
# 6. Test relevant hypothesis for valid relations
# 7. Create cross tabulations with derived variables
# 8. Check for trends and patterns in time series
# 9. Find out the most polluted time of the day and the name of the chemical compound