
##This code reads in the appropriate Samsung datasets and combines then, and then creates a new dataset that is a summary of the provided data. 


##Read in the Activity Labels 
setwd("C:/Users/kdavison/Desktop/Coursera/Getting and Cleaning Data/Project/UCI HAR Dataset/")
activity_labels<- read.table("activity_labels.txt")
head(activity_labels)

##Read in the Features table
features<- read.table("features.txt")
head(features)

#################################Test Folder##################################################

##Read in Subject_Test
setwd("C:/Users/kdavison/Desktop/Coursera/Getting and Cleaning Data/Project/UCI HAR Dataset/test")
subject_test<- read.table("subject_test.txt")
head(subject_test)

##Read in x_Test
setwd("C:/Users/kdavison/Desktop/Coursera/Getting and Cleaning Data/Project/UCI HAR Dataset/test")
x_test<- read.table("x_test.txt")
head(x_test)

##Read in y_Test
setwd("C:/Users/kdavison/Desktop/Coursera/Getting and Cleaning Data/Project/UCI HAR Dataset/test")
y_test<- read.table("y_test.txt")
head(y_test)


#################################Train Folder##################################################


##Read in Subject_Train
setwd("C:/Users/kdavison/Desktop/Coursera/Getting and Cleaning Data/Project/UCI HAR Dataset/train")
subject_train<- read.table("subject_train.txt")
head(subject_train)

##Read in x_Train
setwd("C:/Users/kdavison/Desktop/Coursera/Getting and Cleaning Data/Project/UCI HAR Dataset/train")
x_train<- read.table("x_train.txt")
head(x_train)

##Read in y_Train
setwd("C:/Users/kdavison/Desktop/Coursera/Getting and Cleaning Data/Project/UCI HAR Dataset/train")
y_train<- read.table("y_train.txt")
head(y_train)


###Combine all of the data into one data frame (x test and x train)

x_test_train <- rbind(x_test,x_train)

#Assign the column names to the x data

colnames(x_test_train)<-features[,2]

##Combine the Y data sets (but dont merge with the activity names )

y_train_test <- rbind(y_test,y_train)

#Assign a column name to the y dataset and to the activity names 

colnames(y_test_train)<- c("Activity #")
colnames(activity_labels)<-c("Activity #", "Activity_Name")

##Combine the X data with the Y data 

combined_x_y <- cbind(y_test_train,x_test_train)

##Add in the subject data to the combined x data 

subject_test_train <- rbind(subject_test,subject_train)
colnames(subject_test_train)<-"Subject"
combined_all <- cbind(subject_test_train,combined_x_y)

#Merge in the activity names 

combined_final <- merge(combined_all,activity_labels, by.x = "Activity #",by.y = "Activity #",all.y)

#Which column names conatin the word mean or std? 

allmeans<- combined_final[grep("mean()",ignore.case = TRUE, colnames(combined_all))]
allstds <- combined_final[grep("std",ignore.case = TRUE, colnames(combined_all))]

#Subset the columns we know we want to keep - the first three 

subsetinfo <-combined_final[,c("Subject","Activity #","Activity_Name")]

#Combine all of the subsetted data

combinedmeanstd <- cbind(subsetinfo,allmeans,allstds)

#Condense the data into a summary form

Melted <- melt(combinedmeanstd,id=c("Subject","Activity_Name"),measure.vars = 4:89)
summarized <- dcast(Melted,Activity_Name+Subject~variable,mean)

#Write the table to a text file for review 

write.table(summarized,"C:/Users/kdavison/Desktop/Coursera/Getting and Cleaning Data/Project/Summarized_Tidy_Table.txt",sep="\t",row.names = FALSE)