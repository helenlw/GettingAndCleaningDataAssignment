


CreateDataInWS <- function(){
  
  library(sqldf)
  library(reshape2)
  
  #Read the "Test" tables
  
  XTest <- read.table("./X_test.txt")
  YTest <- read.table("./y_test.txt")
  STest <- read.table("./subject_test.txt")
  
  #Read the "Train" tables
  
  XTrain <- read.table("./X_train.txt")
  YTrain <- read.table("./y_train.txt")
  STrain <- read.table("./subject_train.txt")
  
  #Assign column names
  
  colnames(STest)[1] <- "Subject"
  colnames(YTest)[1] <- "Label"
  colnames(STrain)[1] <- "Subject"
  colnames(YTrain)[1] <- "Label"
  
  #Add Subject and Label to Test data
  
  XTest$Subject <- STest[,"Subject"]
  XTest$Label <- YTest[,"Label"]
  
  #Add Subject and Label to Train data
  
  XTrain$Subject <- STrain[,"Subject"]
  XTrain$Label <- YTrain[,"Label"]
  
  #Combine Test and Train data
  
  TotalDF <- rbind(XTest, XTrain, deparse.level = 1)
  
  #Read features
  
  features <- read.table("./features.txt")
  
  #Read acitivity labels
  activity_labels <- read.table("./activity_labels.txt")
  
  #Assign descriptive column names
  colnames(activity_labels)[1] <- "Label"
  colnames(activity_labels)[2] <- "Label Description"
  
  #Create a list of variable names for the mean and standard deviation
  
  MeanList <- sqldf("Select * from features where v2 like '%-mean()'")
  
  STDList <- sqldf("Select * from features where v2 like '%-std()'")
  
  #Extract the list of variable you are interested in
  
  TotalDFMeanSTD <- TotalDF[, c(MeanList$V1, STDList$V1, 562,563)]
  
  #Assign useful column names
  
  colnames(TotalDFMeanSTD) <- c(as.vector(MeanList[,2]), as.vector(STDList[,2]), "Subject", "Label")
  
  #merge combined dataset with activity label data
  
  TotalMerged <- merge(TotalDFMeanSTD, activity_labels, by="Label")
  
  #"Melt" data to produce final required product.  Listing only the average variable (mean)
  #For each combination of activity and subject.
  
  TotalMeanMelt <- melt(TotalMerged, id = c("Label Description", "Subject"), measure.vars=c(as.vector(MeanList[,2])))
  
  #if output file already exists remove it
  
  if(file.exists("./FinalAnalyst.txt")){
    file.remove("./FinalAnalyst.txt")
  }
  
  #output final file
  
  write.table(TotalMeanMelt, "FinalAnalyst.txt", row.name = FALSE)
  
}