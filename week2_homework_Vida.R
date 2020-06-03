user = "Vida"

if(user == "Alex"){
  path = "./test_data/"
} else if (user == "Vida"){
  path = "//kclad.ds.kcl.ac.uk/anywhere/UserData/RGStore04/k1772383/Desktop/Bioinformatics/Repository/R_training/test_data/"
} else if (user == "Scarlet"){
  path = "D:/Bioinfo/Repos/R_training/test_data/"
} else {cat("User has to be Alex, Vida or Scarlet")}

testdata <- readRDS(paste0(path, "fake_bulkdata.RDS"))
summary(testdata)

# for this example I have replaced gene names with ensembl IDs to keep them unique
# the data is stored as a list of dataframes
# REMEMBER - individual elements of a LIST can be accessed using the double brackets data[[1]]

# task 1: check whether ALL of the ensembl IDs in the first dataframe are present in the second

# RDS files need to be read in using readRDS
read.table(paste0(path, "fakeRNAseq_week2.RDS"))[1:2]

testdata <- readRDS(paste0(path, "fakeRNAseq_week2.RDS"))[1:2]

all(testdata$SOX8_1[,"geneID"] %in% testdata$SOX8_2[,"geneID"])


# task 2: 'intersect' the two dataframes to see which ensembl IDs are shared

intersect(testdata$SOX8_1[,"geneID"], testdata$SOX8_2[,"geneID"])

# task 3: use the vector of shared genes to subset both dataframes

sharedgenes <- intersect(testdata$SOX8_1[,"geneID"], testdata$SOX8_2[,"geneID"])

testdata$SOX8_1[testdata$SOX8_1[,'geneID'] %in% sharedgenes, ]
testdata$SOX8_2[testdata$SOX8_2[,'geneID'] %in% sharedgenes, ]


# task 4: use the 'order' function to re-order the second dataframe, based on the order of geneIDs in the first
# HINT - look back at week 1 to see how to re-order a dataframe




# task 5: now that your dataframes are in the same order combine the two dataframes into one




### Sami - below 'testdata' is a list with 7 samples instead of 2
# task 6: try to make for loops to carry out these tasks on all 7 samples rather than just 2.
# some of this might be quite hard! so dont worry if you get stuck. feel free to drop me a message and 
# I can give you some clues

testdata <- readRDS("test_data/fakeRNAseq_week2.RDS")



