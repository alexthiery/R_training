
####chick ear vs kidney comparison:

# task 1
# subset columns of interest from ramyadata
ramyadata <- read.csv(file = "Vida/Active_otic_enhancer_using_miseq_data.csv", skip = 2, stringsAsFactors = F)
head(ramyadata, n=3)
chickear.data <- ramyadata [,"Gene.name"]
print(chickear.data)
head(chickear.data)


# 1
# extract unique ensembl IDs

# pattern matching (grep/grepl)

a <- c("abc", "bcd", "def")

matches <- a[grep("bc", a)]

matches <- a[grepl("bc", a)]

# use unique to remove duplicated gene names
unique(matches)


# 2
# to get gene names for corresponding ENSIDs, use biomart 
BiocManager::install("biomaRt")
library(biomaRt)


# define biomart object
mart <- useMart(biomart="ensembl", dataset="ggallus_gene_ensembl")
# query biomart
results <- getBM(attributes = c("ensembl_gene_id", "external_gene_name"),
                 filters = "ensembl_gene_id",
                 values = ramyadata$Ensembl.ID[2:10],
                 mart = mart)

# look through previous sessions for how to replace blank values from gene names with ensembl IDs
results$external_gene_name == ""




# task 2
# subset columns of interest from human_mouse_kidney data
human_mouse_kidney <- read.csv(file = "Vida/TableS3.csv", stringsAsFactors = F)
summary(human_mouse_kidney, n=3)
kidney.data <- human_mouse_kidney [,"mouse_gene"]
print(kidney.data)
head(kidney.data)

# change vectors to uppercase
toupper(kidney.data)


# task 3 (error)
# find which gene names are shared between two dataframe columns
sharedgenes <- intersect(kidney.data, chickear.data)

intersect(c("a", "c", "b"), c("a", "b"))

# to save R dataframe as a csv
chickear.mousekidney.shared <- sharedgenes
write.csv(chickear.mousekidney.shared, "chickear.mousekidney.shared.csv", row.names = F)




####chick ear vs mouse ear comparison: 

# task 1
# subset columns of interest from ramyadata
ramyadata <- read.csv(file = "Vida/Active_otic_enhancer_using_miseq_data.csv", skip = 2)
head(ramyadata, n=3)
chickear.data <- ramyadata [,"Gene.name"]
print(chickear.data)


# task 2 (error)
# subset columns of interest from mouse E13.5 ear
Mouse.ear.e13.5 <- read.csv(file = "Vida/Supplemental_file_2-List_of_genes_associated_with_E13.5_Six1_peaks.csv")
head(Mouse.ear.e13.5)
Mouse.data1 <- Mouse.ear.e13.5 [,"Gene.name"]
print(Mouse.data1)


# task 3
# subset columns of interest from mouse E16.5 ear
Mouse.ear.e16.5 <- read.csv(file = "Vida/Supplemental_file_3-List_of_genes_associated_with_E16.5_peaks.csv")
head(Mouse.ear.e16.5)
Mouse.data2 <- Mouse.ear.e16.5 [,"Gene.name"]
print(Mouse.data2)

# task 3 (error)
# find which gene names are shared between two dataframe columns
sharedgenes1 <- intersect(chickear.data[,"Gene.name"], Mouse.data1[,"Gene.name"])
sharedgenes2 <- intersect(chickear.data[,"Gene.name"], Mouse.data2[,"Gene.name"])

# to save R dataframe as a csv
chickear.mouseear.sharede13.5 <- sharedgenes1
write.csv(chickear.mouseear.sharede13.5, "chickear.mouseear.sharede13.5.csv", row.names = F)

chickear.mouseear.sharede16.5 <- sharedgenes2
write.csv(chickear.mouseear.sharede16.5, "chickear.mouseear.sharede16.5.csv", row.names = F)



###overall comparison:

# task 1
#combine mouse e13.5 and e16.5 data (error)
Mouse.ear.e13.5 <- read.csv(file = "Vida/Supplemental_file_2-List_of_genes_associated_with_E13.5_Six1_peaks.csv")
Mouse.data1 <- Mouse.ear.e13.5 [,"Gene.name"]

Mouse.ear.e16.5 <- read.csv(file = "Vida/Supplemental_file_3-List_of_genes_associated_with_E16.5_peaks.csv")
Mouse.data2 <- Mouse.ear.e16.5 [,"Gene.name"]

mouse.data.merged <- merge(Mouse.data1, Mouse.data2, by = "Gene.name")

#task 2
# find which gene names are shared between two dataframe columns
sharedgenes3 <- intersect(chickear.data[,"Gene.name"], mouse.data.merged[,"Gene.name"], kidney.data[,"mouse_gene"])


# to save R dataframe as a csv
Chick_mouse_ear_kidney.shared <- sharedgenes3
write.csv(Chick_mouse_ear_kidney.shared , "Chick_mouse_ear_kidney.shared .csv", row.names = F)









