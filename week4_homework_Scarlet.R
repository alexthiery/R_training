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

