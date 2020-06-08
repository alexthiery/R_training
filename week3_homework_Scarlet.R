# change user in order to change default path
user = "Scarlet"

if(user == "Alex"){
  path = "./test_data/"
} else if (user == "Vida"){
  path = "//kclad.ds.kcl.ac.uk/anywhere/UserData/RGStore04/k1772383/Desktop/Bioinformatics/Repository/R_training/test_data/"
} else if (user == "Scarlet"){
  path = "D:/Bioinfo/Repos/R_training/test_data/"
} else {cat("User has to be Alex, Vida or Scarlet")}

# here are two samples from a fake RNAseq dataset
testdata <- readRDS(paste0(path, "fakeRNAseq_week2.RDS"))

# The task this week is to combine the 7 dataframes from testdata into a single dataframe

# You need to make sure that you only keep the genes which are present in all of the samples,
# that all of the samples are ordered in the same, that the samples are renamed, and then combined 
# into a single dataframe

# 1) combine the dataframes using merge() - i.e. the easy way!

for (i in names(testdata)) {
  #colnames(testdata[[i]]['counts'])<- paste0('counts.',i)
  colnames(testdata[[i]])[2] <- paste0('counts.',i)
  print(colnames(testdata[[i]]))
}

Merged.data<- testdata[[1]]

for (i in names(testdata)[2:7]) {
  Merged.data=merge(x=Merged.data, y=testdata[[i]], by='geneID')  
  
}



# 2) combine using cbind() - this means you need to manually change the row order and subset shared rows

# Good luck!

Shared.genes<- testdata$SOX8_1$geneID [testdata$SOX8_1$geneID %in% testdata$SOX8_2$geneID &
                                         testdata$SOX8_1$geneID %in% testdata$SOX8_3$geneID &
                                         testdata$SOX8_1$geneID %in% testdata$control_1$geneID &
                                         testdata$SOX8_1$geneID %in% testdata$control_2$geneID &
                                         testdata$SOX8_1$geneID %in% testdata$control_3$geneID &
                                         testdata$SOX8_1$geneID %in% testdata$control_4$geneID]
Shared.genes.1<- testdata$SOX8_1$geneID [testdata$SOX8_1$geneID %in% testdata$SOX8_2$geneID &
                                        testdata$SOX8_2$geneID %in% testdata$SOX8_3$geneID &
                                        testdata$SOX8_3$geneID %in% testdata$control_1$geneID &
                                       testdata$control_1$geneID %in% testdata$control_2$geneID &
                                        testdata$control_2$geneID %in% testdata$control_3$geneID &
                                         testdata$control_3$geneID %in% testdata$control_4$geneID]
newdata <- list()
for (i in names(testdata)) {
  colnames(testdata[[i]])[2] <- paste0('counts',i)
  newdata [[i]] <- testdata [[i]][testdata[[i]][, 'geneID'] %in% Shared.genes,]
  newdata [[i]] <- newdata [[i]][order(newdata [[i]][,'geneID']),]
}  
 
newdata <- cbind(newdata[[1]], newdata[[2]], newdata[[3]], newdata[[4]],newdata[[5]], newdata[[6]], newdata[[7]])
newdata <- newdata[,!duplicated(colnames(newdata))]
