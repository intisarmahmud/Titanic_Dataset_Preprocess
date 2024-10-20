### **INSTRUCTIONS**

Please follow the steps one by one to run each functions:

1.  Loading CSV file of Titanic Dataset into RStudio:

    ``` r
    Titanic <- read.csv("D:/Important Files Study/Titanic Dataset work/Titanic.csv")
    ```

    *!!Please note that the location of the file should be where you
    have kept your file after downloading from kaeggle into your
    drive.!!*

2.  Inspection of Dataset:

    ``` r
    #Datset vewing
    View(Titanic)
    #Displaying the first few rows of the Dataset
    head(Titanic)
    ```

        ##   PassengerId Survived Pclass                                         Name
        ## 1         892        0      3                             Kelly, Mr. James
        ## 2         893        1      3             Wilkes, Mrs. James (Ellen Needs)
        ## 3         894        0      2                    Myles, Mr. Thomas Francis
        ## 4         895        0      3                             Wirz, Mr. Albert
        ## 5         896        1      3 Hirvonen, Mrs. Alexander (Helga E Lindqvist)
        ## 6         897        0      3                   Svensson, Mr. Johan Cervin
        ##      Sex  Age SibSp Parch  Ticket    Fare Cabin Embarked
        ## 1   male 34.5     0     0  330911  7.8292              Q
        ## 2 female 47.0     1     0  363272  7.0000              S
        ## 3   male 62.0     0     0  240276  9.6875              Q
        ## 4   male 27.0     0     0  315154  8.6625              S
        ## 5 female 22.0     1     1 3101298 12.2875              S
        ## 6   male 14.0     0     0    7538  9.2250              S

    ``` r
    #Summary of the dataset
    summary(Titanic)
    ```

        ##   PassengerId        Survived          Pclass          Name          
        ##  Min.   : 892.0   Min.   :0.0000   Min.   :1.000   Length:418        
        ##  1st Qu.: 996.2   1st Qu.:0.0000   1st Qu.:1.000   Class :character  
        ##  Median :1100.5   Median :0.0000   Median :3.000   Mode  :character  
        ##  Mean   :1100.5   Mean   :0.3636   Mean   :2.266                     
        ##  3rd Qu.:1204.8   3rd Qu.:1.0000   3rd Qu.:3.000                     
        ##  Max.   :1309.0   Max.   :1.0000   Max.   :3.000                     
        ##                                                                      
        ##      Sex                 Age            SibSp            Parch       
        ##  Length:418         Min.   : 0.17   Min.   :0.0000   Min.   :0.0000  
        ##  Class :character   1st Qu.:21.00   1st Qu.:0.0000   1st Qu.:0.0000  
        ##  Mode  :character   Median :27.00   Median :0.0000   Median :0.0000  
        ##                     Mean   :30.27   Mean   :0.4474   Mean   :0.3923  
        ##                     3rd Qu.:39.00   3rd Qu.:1.0000   3rd Qu.:0.0000  
        ##                     Max.   :76.00   Max.   :8.0000   Max.   :9.0000  
        ##                     NA's   :86                                       
        ##     Ticket               Fare            Cabin             Embarked        
        ##  Length:418         Min.   :  0.000   Length:418         Length:418        
        ##  Class :character   1st Qu.:  7.896   Class :character   Class :character  
        ##  Mode  :character   Median : 14.454   Mode  :character   Mode  :character  
        ##                     Mean   : 35.627                                        
        ##                     3rd Qu.: 31.500                                        
        ##                     Max.   :512.329                                        
        ##                     NA's   :1

3.  Checking missing values in columns:

    ``` r
    colSums(is.na(Titanic))
    ```

        ## PassengerId    Survived      Pclass        Name         Sex         Age 
        ##           0           0           0           0           0          86 
        ##       SibSp       Parch      Ticket        Fare       Cabin    Embarked 
        ##           0           0           0           1           0           0

4.  Handling missing values using median:

    ``` r
    Titanic$Age[is.na(Titanic$Age)] <- median(Titanic$Age, na.rm = TRUE)
    # view columns again
    colSums(is.na(Titanic))
    ```

        ## PassengerId    Survived      Pclass        Name         Sex         Age 
        ##           0           0           0           0           0           0 
        ##       SibSp       Parch      Ticket        Fare       Cabin    Embarked 
        ##           0           0           0           1           0           0

5.  Dropping 'Fare' column(it should be determined by correlation
    coefficient but it is not implemented.):

    ``` r
    Titanic <- subset(Titanic, select = -c(Fare))
    #Viewing columns again
    colSums(is.na(Titanic))
    ```

        ## PassengerId    Survived      Pclass        Name         Sex         Age 
        ##           0           0           0           0           0           0 
        ##       SibSp       Parch      Ticket       Cabin    Embarked 
        ##           0           0           0           0           0

6.  Creating new feature named 'FamilySize' using the help of 'SibSp'
    and 'Parch' columns:

    ``` r
    Titanic$FamilySize <- Titanic$SibSp + Titanic$Parch + 1
    # view columns again
    colSums(is.na(Titanic))
    ```

        ## PassengerId    Survived      Pclass        Name         Sex         Age 
        ##           0           0           0           0           0           0 
        ##       SibSp       Parch      Ticket       Cabin    Embarked  FamilySize 
        ##           0           0           0           0           0           0

7.  Using one-hot encoding technique to convert categorical 'Sex' and
    'Embarked' columns into numerical variables and then remove the
    original columns:

    ``` r
    library(caret)
    Titanic <- cbind(Titanic, model.matrix(~ Sex + Embarked, Titanic))
    Titanic <- subset(Titanic, select = -c(Sex, Embarked))
    ```

    *!!DO PLEASE INSTALL THIS CARET PACKAGE BEFORE RUNNING ONE-HOT
    ENCODING!!*

8.  Splitting Dataset for train and test:

    ``` r
      library(caret)

      #Setting seed 40 for reproductibility
      set.seed(40)

      #Splitting Dataset for training and testing(85% for training and 15% for testing but you cant determine by yourself. It is better to always take more data for training purpose than testing)
      inTrain <- createDataPartition(Titanic$Survived, p = 0.85, list = FALSE)

      train <- Titanic[inTrain, ]

      test <- Titanic[-inTrain, ]
    ```
