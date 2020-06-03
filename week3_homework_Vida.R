# change user in order to change default path
user = "Vida"

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

# 2) combine using cbind() - this means you need to manually change the row order and subset shared rows

# Good luck!







