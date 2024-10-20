Titanic <- read.csv("D:/Important Files Study/Titanic Dataset work/Titanic.csv")

View(Titanic)

head(Titanic)

summary(Titanic)

colSums(is.na(Titanic))

Titanic$age[is.na(Titanic$Age)] <- median(Titanic$Age, na.rm = TRUE)

Titanic <- subset(Titanic, select = -c(Fare))

Titanic$FamilySize <- Titanic$SibSp + Titanic$Parch + 1

install.packages("caret")

library(caret)

Titanic <- cbind(Titanic, model.matrix(~ Sex + Embarked, Titanic))
Titanic <- subset(Titanic, select = -c(Sex, Embarked))

library(caret)
set.seed(40)
inTrain <- createDataPartition(Titanic$Survived, p = 0.85, list = FALSE)
train <- Titanic[inTrain, ]
test <- Titanic[-inTrain, ]