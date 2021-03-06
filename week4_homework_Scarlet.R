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
#testdata <- readRDS("./test_data/fakeRNAseq_week2.RDS")
testdata <- readRDS(paste0(path,"fakeRNAseq_week2.RDS"))


# Following on from last weeks homework, we now have a merged dataframe with the gene counts for 7 samples.

# This week's task is to repeat the same procedure BUT instead of manually doing this, this time you need to make
# your own custom function capable of combining n samples.

# This function should include at least the following arguments -> function(dataframes, sample.names, by.col, counts.col), where:
#         dataframes = list of dataframes to be merged
#         sample.names = vector of sample names in order to rename the counts column. This is so the samples can be identified in the final dataframe
#         by.col = name of column you want to merge the dataframes by
#         counts.col = name of the counts column which are to be renamed by the sample.names

# Good luck!
for (i in names(testdata)) {
  colnames(testdata[[i]])[colnames(testdata[[i]]) == "counts"] <- paste0('counts',i)
  print(colnames(testdata[[i]]))
}
Merged.data<- testdata[[1]]
for (i in names(testdata)[2:7]) {
  Merged.data=merge(x=Merged.data, y=testdata[[i]], by='geneID')  
  
}


newfunction <- function(dataframes, by.col, counts.col){
 sample.names<- names(dataframes)
   for (i in sample.names) { 
     colnames(dataframes[[i]])[colnames(dataframes[[i]])==counts.col] <- paste0('counts_',i)
  }
 newmerged.data <- dataframes[[1]]
 for (i in sample.names[2:length(dataframes)]) {newmerged.data=merge(x=newmerged.data, y=dataframes[[i]], by=by.col)
    
 }
 return(newmerged.data)
}


newfunction(dataframes = testdata, by.col = 'geneID', counts.col = 'counts')

debug(newfunction)
newfunction(dataframes = testdata, by.col = 'geneID', counts.col = 'counts')
undebug(newfunction)



# you can add extra functionality to a function by adding an extra argument and assigniing defaults which you want the user to be able to change if they like
newfunction <- function(dataframes, sample.names = names(dataframes), by.col, counts.col){
  for (i in 1:length(dataframes)) {
    colnames(dataframes[[i]])[colnames(dataframes[[i]])==counts.col] <- paste0('counts_', sample.names[i])
  }
  newmerged.data <- dataframes[[1]]
  for (i in names(dataframes)[2:length(dataframes)]) {newmerged.data=merge(x=newmerged.data, y=dataframes[[i]], by=by.col)
  
  }
  return(newmerged.data)
}

newfunction(dataframes = testdata, by.col = 'geneID', counts.col = 'counts')

newfunction(dataframes = testdata, sample.names = c("a", "b", "c", "d", "e", "f", "g"), by.col = 'geneID', counts.col = 'counts')






