# change user in order to change default path
user = "Alex"

if(user == "Alex"){
  path = "./test_data/"
} else if (user == "Vida"){
  path = "//kclad.ds.kcl.ac.uk/anywhere/UserData/RGStore04/k1772383/Desktop/Bioinformatics/Repository/R_training/test_data/"
} else if (user == "Scarlet"){
  path = "D:/Bioinfo/Repos/R_training/test_data/"
} else {cat("User has to be Alex, Vida or Scarlet")}

# here are two samples from a fake RNAseq dataset
testdata <- readRDS(file = '//kclad.ds.kcl.ac.uk/anywhere/UserData/RGStore04/k1772383/Desktop/Bioinformatics/Repository/R_training/test_data/fakeRNAseq_week2.RDS')


testdata <- readRDS(file = paste0(path, "fakeRNAseq_week2.RDS"))


# The task this week is to combine the 7 dataframes from testdata into a single dataframe

summary(testdata)
head(testdata$SOX8_1)
class(testdata)

# You need to make sure that you only keep the genes which are present in all of the samples,
# that all of the samples are ordered in the same, that the samples are renamed, and then combined 
# into a single dataframe


# 1) combine the dataframes using merge() - i.e. the easy way!

for(i in names(testdata)){
  colnames(testdata[[i]])[2] <- paste0("counts.",i)
} 
  
#why doesn`t this work:
 
for(i in names(testdata)){
  colnames(testdata[[i]]) <- c("geneID", paste0("counts.", i))
}  
    
#merge 

output <- testdata[[1]]
for(i in testdata[2:7]){
  output <- merge(x = output, y = i, by = "geneID")
}


# 2) combine using cbind() - this means you need to manually change the row order and subset shared rows

shared.genes <- testdata[[1]]$geneID[
 testdata[[1]]$geneID %in% testdata[[2]]$geneID &
   testdata[[1]]$geneID %in% testdata[[3]]$geneID &
   testdata[[1]]$geneID %in% testdata[[4]]$geneID &
   testdata[[1]]$geneID %in% testdata[[5]]$geneID &
   testdata[[1]]$geneID %in% testdata[[6]]$geneID & 
   testdata[[1]]$geneID %in% testdata[[7]]$geneID 
 ]


newdat <- list()
for(i in names(testdata)){
  colnames(testdata[[i]])[2] <- paste0("counts.", i)
  newdat[[i]] <- testdata[[i]][testdata[[i]][,"geneID"] %in% shared.genes,]
  newdat[[i]] <- newdat[[i]][order(newdat[[i]]$geneID),]
}


for(i in names(testdata)){
  colnames(testdata[[i]])[2] <- paste0("counts.", i)
  testdata[[i]] <- testdata[[i]][testdata[[i]][,"geneID"] %in% shared.genes,]
  testdata[[i]] <- testdata[[i]][order(testdata[[i]]$geneID),]
}


testdata <- cbind(testdata[[1]], testdata[[2]], testdata[[3]], testdata[[4]], testdata[[5]], testdata[[6]], testdata[[7]])

finaldata <- testdata[,!duplicated(colnames(testdata))]


# 2) combine using cbind() - this means you need to manually change the row order and subset shared rows


testdata <- readRDS(file = paste0(path, "fakeRNAseq_week2.RDS"))
shared.genes <- testdata[[1]]$geneID[
  testdata[[1]]$geneID %in% testdata[[2]]$geneID &
    testdata[[1]]$geneID %in% testdata[[3]]$geneID &
    testdata[[1]]$geneID %in% testdata[[4]]$geneID &
    testdata[[1]]$geneID %in% testdata[[5]]$geneID &
    testdata[[1]]$geneID %in% testdata[[6]]$geneID & 
    testdata[[1]]$geneID %in% testdata[[7]]$geneID 
  ]




newdat <- list()
for(i in names(testdata)){
  colnames(testdata[[i]])[2] <- paste0("counts.", i)
  newdat[[i]] <- testdata[[i]][testdata[[i]][,"geneID"] %in% shared.genes,]
  newdat[[i]] <- newdat[[i]][order(newdat[[i]]$geneID),]
}



newdat <- cbind(newdat[[1]], newdat[[2]], newdat[[3]], newdat[[4]], newdat[[5]], newdat[[6]], newdat[[7]])

newdat[,!duplicated(colnames(newdat))]

