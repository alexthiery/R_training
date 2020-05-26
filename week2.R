
# loading data
vida_data <- read.csv(file = 'test_data/bulk_RNA-seq_Chen.csv')

head(vida_data)


# reading in bulk RNAseq data
RNAseq.data <- readRDS(file = 'test_data/fake_bulkdata.RDS')

# RNAseq.data is a list
summary(RNAseq.data)

# it contains 7 dataframes
length(RNAseq.data)

# how do lists work?

mylist <- list("a" = c(1,2,3,4,5),
               "b" = matrix(data = 1:100, nrow = 10),
               "c" = list("a" = "b"))

length(mylist)

names(mylist)

# subsetting a list
mylist["a"]
mylist[1]
mylist$a



# looking at our actual data
# we have 7 samples - each with a dataframe contains gene name and gene counts
head(RNAseq.data$SOX8_1)

# the order of the rows is clearly not the same between the datasets
head(RNAseq.data$SOX8_1)
head(RNAseq.data$SOX8_2)


# are all genes in sample a present in sample b - here comes boolean operator %in%
colnames(RNAseq.data$SOX8_1)


c("a", "d") %in% c("a", "b", "c")

# however the order in which you specify the arguments can give different outputs
# i.e this will give all T, even through 'e' is not present in the first vector
c("a", "b", "c", "d") %in% c("a", "b", "c", "d", "e")

# intersect compares both arguments against each other and only returns those which are shared
intersect(c("a", "b", "c", "d", "f", "h"), c("a", "b", "c", "d", "e", "z", "h"))


# any will check to see if any of the elements are true, all will check to see if ALL are true
any(c("a", "b", "c") %in% c("a", "b"))
all(c("a", "b", "c") %in% c("a", "b"))

# all genes are shared between the datasets, however they are not in the same order
all(RNAseq.data$SOX8_1[,"gene_name"] %in% RNAseq.data$SOX8_2[,"gene_name"])


length(intersect(RNAseq.data$SOX8_1$gene_name, RNAseq.data$SOX8_2$gene_name))
length(RNAseq.data$SOX8_1$gene_name)

# genes can have multiple ENSEMBL IDs and therefore once you lose this information you will end up with
# duplicate gene names
RNAseq.data$SOX8_1$gene_name[duplicated(RNAseq.data$SOX8_1$gene_name)]

# you can make values unique using make.unique which will append a suffix if they are duplicated
make.unique(c("a", "b", "c", "c", "c", "b", "d"))

# for now lets remove the genes which are duplicated
# using ! inverses a T/F vector
temp2 <- RNAseq.data$SOX8_1[!duplicated(RNAseq.data$SOX8_1$gene_name),]

any(duplicated(temp2$gene_name))



# we now need to remove duplicated gene names in ALL 7 samples!!! HOW DO WE DO THIS?

# we use the magic of loops! specifically for loops

# let's look at the basics of for loops

for(i in 1:5){
  print(i)
}

names = c("Alex", "Scarlet", "Vida")

for(i in names){
  print(i)
}

for(i in names){
  print(i == names)
}


# accessing elements of a list

mylist <- list(a = c("Alex", "Scarlet", "Vida"),
               b = c(1,2,3))

mylist[1]
class(mylist[1])

mylist[[1]]
class(mylist[[1]])


class(RNAseq.data[1])
names(RNAseq.data[1])

class(RNAseq.data[[1]])
RNAseq.data[[1]][,"gene_name"]


# create empty list
mylist <- list()
for(i in names(RNAseq.data)){
  mylist[[i]] <- RNAseq.data[[i]][!duplicated(RNAseq.data[[i]]$gene_name),]
}

length(mylist)
names(mylist)

class(mylist[1])
all(duplicated(mylist[[1]]$gene_name))




