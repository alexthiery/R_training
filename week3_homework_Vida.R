# change user in order to change default path
user = 

if(user == "Alex"){
  path = "./test_data/"
} else if (user == "Vida"){
  path = "//kclad.ds.kcl.ac.uk/anywhere/UserData/RGStore04/k1772383/Desktop/Bioinformatics/Repository/R_training/test_data/"
} else if (user == "Scarlet"){
  path = "D:/Bioinfo/Repos/R_training/test_data/"
} else {cat("User has to be Alex, Vida or Scarlet")}

# here are two samples from a fake RNAseq dataset
testdata <- readRDS(file = '//kclad.ds.kcl.ac.uk/anywhere/UserData/RGStore04/k1772383/Desktop/Bioinformatics/Repository/R_training/test_data/fakeRNAseq_week2.RDS')


# The task this week is to combine the 7 dataframes from testdata into a single dataframe

summary(testdata)
head(testdata$SOX8_1)
class(testdata)

# You need to make sure that you only keep the genes which are present in all of the samples,
# that all of the samples are ordered in the same, that the samples are renamed, and then combined 
# into a single dataframe


# 1) combine the dataframes using merge() - i.e. the easy way!

testdata <- list()
 testdata1 <- for(i in names(testdata)){
  colnames(testdata[[i]])[2] <- paste0("counts.",i)
  print(testdata1)
 } 
  
#why doesn`t this work:
 
  for(i in names(testdata)){
    colnames(testdata[[i]]) <- c("geneid", paste0("counts.", i))
  }  
    
#merge 

output <- testdata1[[1]]
    for(i in testdata1[2:7]){
    output <- merge(x = output, y = i, by = "geneid")
    }


# 2) combine using cbind() - this means you need to manually change the row order and subset shared rows

shared.genes <- testdata[[1]]$geneid[
 testdata[[1]]$geneid %in% testdata[[2]]$geneid &
   testdata[[1]]$geneid %in% testdata[[3]]$geneid &
   testdata[[1]]$geneid %in% testdata[[4]]$geneid &
   testdata[[1]]$geneid %in% testdata[[5]]$geneid &
   testdata[[1]]$geneid %in% testdata[[6]]$geneid & 
   testdata[[1]]$geneid %in% testdata[[7]]$geneid 
 ]


newdat <- list()
for(i in names(testdata)){
  colnames(testdata[[i]])[2] <- paste0("counts.", i)
  newdat[[i]] <- testdata[[i]][testdata[[i]][,"geneid"] %in% shared.genes,]
  newdat[[i]] <- newdat[[i]][order(newdat[[i]]$geneid),]
}

newdat <- cbind(newdat[[1]], newdat[[2]], newdat[[3]], newdat[[4]], newdat[[5]], newdat[[6]], newdat[[7]])

newdat[,!duplicated(colnames(newdat))]


# Good luck!



