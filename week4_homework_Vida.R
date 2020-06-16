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
testdata <- readRDS("./test_data/fakeRNAseq_week2.RDS")

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







#renaming: 
names()


function(x,y,s,d,g){}

name.change <- function(dataframes){
  for (i in names(dataframes)){
  }
  return(colnames(dataframes[[i]])[counts.col] <- paste0("counts.",i))
}




for (i in names(testdata)){
  
  return(colnames(testdata[[i]])[counts.col] <- paste0("counts.",i))
}
  

rename <- function(testdata, counts_col_name){
  for(i in names(testdata)){
    colnames(testdata[[i]])[colnames(testdata[[i]]) == counts_col_name] <- paste0("counts.", i)
  }
  return(testdata)
}

rename(testdata = testdata, counts_col_name = "counts")





#merging:


merge.data <- function(dataframes){
  
  for (i in datafarames[y:z]){
      y=i+1
      z=length(testdata)
  }
  return(merge(x=merge.data, dataframes[[i]], by.col='geneID'))
  
  print(merge.data)
}





merge.func <- function(dataframe, gene_col){
  first.dataframe = dataframe[[1]]
  for (i in dataframe[2:length(dataframe)]){
    first.dataframe <- merge(x=first.dataframe, y=i, by=gene_col)
  }
  return(first.dataframe)
}
merge.func(dataframe = testdata, gene_col = "geneID")



test <- function(x, y){
  Merged.data<- x[[1]]
  for (i in names(x)[2:7]) {
    Merged.data=merge(x=Merged.data, y=x[[i]], by=y)  
  }
  return(Merged.data)
}



test(x = testdata, y = "geneID")




