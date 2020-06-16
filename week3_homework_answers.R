# here are two samples from a fake RNAseq dataset
testdata <- readRDS("./test_data/fakeRNAseq_week2.RDS")

# The task this week is to combine the 7 dataframes from testdata into a single dataframe

# You need to make sure that you only keep the genes which are present in all of the samples,
# that all of the samples are ordered in the same, that the samples are renamed, and then combined 
# into a single dataframe

# 1) combine the dataframes using merge() - i.e. the easy way!

for (i in names(testdata)) {
  colnames(testdata[[i]])[2] <- paste0('counts_',i)
}

Merged.data<- testdata[[1]]
for (i in names(testdata)[2:7]) {
  Merged.data=merge(x=Merged.data, y=testdata[[i]], by='geneID')  
  
}

# 2) combine using cbind() - this means you need to manually change the row order and subset shared rows

Shared.genes<- testdata$SOX8_1$geneID [testdata$SOX8_1$geneID %in% testdata$SOX8_2$geneID &
                                         testdata$SOX8_1$geneID %in% testdata$SOX8_3$geneID &
                                         testdata$SOX8_1$geneID %in% testdata$control_1$geneID &
                                         testdata$SOX8_1$geneID %in% testdata$control_2$geneID &
                                         testdata$SOX8_1$geneID %in% testdata$control_3$geneID &
                                         testdata$SOX8_1$geneID %in% testdata$control_4$geneID]

newdata <- list()
for (i in names(testdata)) {
  colnames(testdata[[i]])[2] <- paste0('counts_',i)
  newdata [[i]] <- testdata [[i]][testdata[[i]][, 'geneID'] %in% Shared.genes,]
  newdata [[i]] <- newdata [[i]][order(newdata [[i]][,'geneID']),]
}  

newdata <- cbind(newdata[[1]], newdata[[2]], newdata[[3]], newdata[[4]],newdata[[5]], newdata[[6]], newdata[[7]])

newdata <- newdata[,!duplicated(colnames(newdata))]

# Good luck!







