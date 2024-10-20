### **TITANIC DATASET PREPROCESS**

Here, I have tried to preprocess the popular Titanic dataset.

**DATASET DESCRIPTION**

The titanic dataset is a very popular dataset which is found in kaeggle.
This dataset contains various features to evaluate. The dataset's main
target is to find out how many survived the renowned titanic ship
sinking incident.

##### *Features:*

1.  PassengerId: Unique passenger number
2.  Survived: Survived or not. 0=Survived and 1=Not survived
3.  Pclass: 1=First class, 2=Second Class, 3=Third Class
4.  Name: Passenger name
5.  Sex: Gender of passengers. male and female
6.  Age: age of passanger
7.  SibSp: Number of siblings
8.  Ticket: ticket number
9.  Fare: Ticket fare of passanger

####### This is the dataset link from Kaeggle:[Titanic DataSet](https://www.kaggle.com/datasets/brendan45774/test-file)

**IMPLEMENTATION TECHNIQUE**

Here, I have implemented basic inspection before preprocess. Handling
missing values using median, dropping irrelevant column, create new
feature, one-hot encoding and splitting dataset for training and testing
purpose.
