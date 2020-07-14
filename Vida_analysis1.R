
####chick ear vs kidney comparison:

# task 1
# subset columns of interest from ramyadata
ramyadata <- read.csv(file = "Vida/Ramya,Active_otic_enhancers_using_Hiseq_data.csv", skip = 1, stringsAsFactors = F)
head(ramyadata, n=3)
chickear.data <- ramyadata[,"Ensembl.gene.id"]
head(chickear.data)


# extract unique ensembl IDs
# pattern matching (grep/grepl)
chickear.data.matches <- chickear.data[grep("ENSGALG", chickear.data)]
print(chickear.data.matches)

# use unique to remove duplicated gene names
chickear.data.1 <- unique(chickear.data.matches)

#Task 2
# to get gene names for corresponding ENSIDs, use biomart 
##BiocManager::install("biomaRt")
library(biomaRt)

ensembl = useEnsembl(biomart="ensembl", dataset="ggallus_gene_ensembl", version=85)
chickear.data.final <- getBM(attributes = c("ensembl_gene_id", "external_gene_name"),
                             filters = "ensembl_gene_id",
                             values = chickear.data.1,
                             mart = ensembl)
head(chickear.data.final)


# Replace blank values from gene names with ensembl IDs
# apply(DF, 1, function(x){someoperation}) will apply the function over the rows
chickear.data.results <- chickear.data.final[,2] <- apply(chickear.data.final, 1, function(x){ifelse(x[2] == "", x[1], x[2])})
head(chickear.data.results)

##Alternative: chickear.data.final[chickear.data.final$external_gene_name == "",2] <- chickear.data.final[chickear.data.final$external_gene_name == "",1]

write.csv(chickear.data.results , "chickear.data.results.csv", row.names = F)  

# task 3
# subset columns of interest from human_mouse_kidney data
human_mouse_kidney <- read.csv(file = "Vida/TableS3.csv", stringsAsFactors = F)
summary(human_mouse_kidney, n=3)
kidney.data <- human_mouse_kidney [,"mouse_gene"]
print(kidney.data)
head(kidney.data)

# change vectors to uppercase
kidney.data.results <- toupper(kidney.data)
head(kidney.data.results)


# task 4
# find which gene names are shared between two dataframe columns
ear.kidney.sharedgenes <- intersect(kidney.data.results, chickear.data.results)
print(ear.kidney.sharedgenes)

# genes which are not in kidney.data.results
chickear.data.results[!chickear.data.results %in% kidney.data.results]

# to save R dataframe as a csv
chickear.mousekidney.shared <- ear.kidney.sharedgenes
write.csv(chickear.mousekidney.shared, "chickear.mousekidney.shared.csv", row.names = F)



####chick ear vs mouse ear comparison: 

# task 1
# subset columns of interest from ramyadata
ramyadata <- read.csv(file = "Vida/Ramya,Active_otic_enhancers_using_Hiseq_data.csv", skip = 1, stringsAsFactors = F)
head(ramyadata, n=3)
chickear.data <- ramyadata [,"Ensembl.gene.id"]
head(chickear.data)


# extract unique ensembl IDs
# pattern matching (grep/grepl)
chickear.data.matches <- chickear.data[grep("ENSGALG", chickear.data)]
print(chickear.data.matches)


# use unique to remove duplicated gene names
chickear.data.1 <- unique(chickear.data.matches)


#Task 2
# to get gene names for corresponding ENSIDs, use biomart 
##BiocManager::install("biomaRt")
library(biomaRt)

ensembl = useEnsembl(biomart="ensembl", dataset="ggallus_gene_ensembl", version=85)
chickear.data.final <- getBM(attributes = c("ensembl_gene_id", "external_gene_name"),
                             filters = "ensembl_gene_id",
                             values = chickear.data.1,
                             mart = ensembl)
head(chickear.data.final)


# Replace blank values from gene names with ensembl IDs
# apply(DF, 1, function(x){someoperation}) will apply the function over the rows
chickear.data.results <- chickear.data.final[,2] <- apply(chickear.data.final, 1, function(x){ifelse(x[2] == "", x[1], x[2])})
head(chickear.data.results)

##Alternative: chickear.data.final[chickear.data.final$external_gene_name == "",2] <- chickear.data.final[chickear.data.final$external_gene_name == "",1]


# task 3
# subset columns of interest from mouse E13.5 ear
Mouse.ear.e13.5 <- read.csv(file = "Vida/Supplemental_file_2-List_of_genes_associated_with_E13.5_Six1_peaks.csv")
tail(Mouse.ear.e13.5)
colnames(Mouse.ear.e13.5)
Mouse.data1 <- Mouse.ear.e13.5 [,"?..Gene.name"]
Mouse.data1.results <- toupper(Mouse.data1)
head(Mouse.data1.results)

##temp <- read.delim(file = "Vida/Supplemental_file_2-List_of_genes_associated_with_E13.5_Six1_peaks.csv", sep = ',')


# task 4
# subset columns of interest from mouse E16.5 ear
Mouse.ear.e16.5 <- read.csv(file = "Vida/Supplemental_file_3-List_of_genes_associated_with_E16.5_peaks.csv")
tail(Mouse.ear.e16.5)
Mouse.data2 <- Mouse.ear.e16.5 [,"Gene.name"]
Mouse.data2.results <- toupper(Mouse.data2)
print(Mouse.data2.results)


# task 5
# find which gene names are shared between two dataframe columns
Ear.sharedgenes1 <- intersect(chickear.data.results, Mouse.data1.results)
print(Ear.sharedgenes1)
Ear.sharedgenes2 <- intersect(chickear.data.results, Mouse.data2.results)
print(Ear.sharedgenes2)


# to save R dataframe as a csv
chickear.mouseear.sharede13.5 <- Ear.sharedgenes1
write.csv(chickear.mouseear.sharede13.5, "chickear.mouseear.sharede13.5.csv", row.names = F)

chickear.mouseear.sharede16.5 <- Ear.sharedgenes2
write.csv(chickear.mouseear.sharede16.5, "chickear.mouseear.sharede16.5.csv", row.names = F)




#### mouse kidney vs ear:

#Task 1
# subset columns of interest from mouse E13.5 ear
Mouse.ear.e13.5 <- read.csv(file = "Vida/Supplemental_file_2-List_of_genes_associated_with_E13.5_Six1_peaks.csv")
tail(Mouse.ear.e13.5)
colnames(Mouse.ear.e13.5)
Mouse.data1 <- Mouse.ear.e13.5 [,"?..Gene.name"]
Mouse.data1.results <- toupper(Mouse.data1)
head(Mouse.data1.results)


# task 2
# subset columns of interest from mouse E16.5 ear
Mouse.ear.e16.5 <- read.csv(file = "Vida/Supplemental_file_3-List_of_genes_associated_with_E16.5_peaks.csv")
tail(Mouse.ear.e16.5)
Mouse.data2 <- Mouse.ear.e16.5 [,"Gene.name"]
Mouse.data2.results <- toupper(Mouse.data2)
print(Mouse.data2.results)

#Task 3 
# combine mouse ear data
mouse.data.merged1 <- c(Mouse.ear.e13.5[, "?..Gene.name"], Mouse.ear.e16.5[, "Gene.name"])
mouse.data.merged2 <- unique(mouse.data.merged1)
summary(mouse.data.merged2)
mouse.data.merged <- toupper(mouse.data.merged2)


#Task4
# subset columns of interest from human_mouse_kidney data
human_mouse_kidney <- read.csv(file = "Vida/TableS3.csv", stringsAsFactors = F)
summary(human_mouse_kidney, n=3)
kidney.data <- human_mouse_kidney [,"mouse_gene"]
print(kidney.data)
head(kidney.data)

# change vectors to uppercase
kidney.data.results <- toupper(kidney.data)
head(kidney.data.results)


# task 5 
# find which gene names are shared between two dataframe columns
Mouse.kidney.ear.e13.5 <- intersect(kidney.data.results, Mouse.data2.results)
Mouse.kidney.ear.e16.5 <- intersect(kidney.data.results, Mouse.data1.results)
Mouse.kidney.ear <- intersect(kidney.data.results, mouse.data.merged)


# to save R dataframe as a csv
write.csv(Mouse.kidney.ear.e13.5 , "Mouse.kidney.ear.e13.5.csv", row.names = F)
write.csv(Mouse.kidney.ear.e16.5 , "Mouse.kidney.ear.e16.5.csv", row.names = F)
write.csv(Mouse.kidney.ear , "Mouse.kidney.ear", row.names = F)





####overall comparison:

# task 1
#combine mouse e13.5 and e16.5 data
Mouse.ear.e13.5 <- read.csv(file = "Vida/Supplemental_file_2-List_of_genes_associated_with_E13.5_Six1_peaks.csv", stringsAsFactors = F)

Mouse.ear.e16.5 <- read.csv(file = "Vida/Supplemental_file_3-List_of_genes_associated_with_E16.5_peaks.csv", stringsAsFactors = F)

mouse.data.merged1 <- c(Mouse.ear.e13.5[, "?..Gene.name"], Mouse.ear.e16.5[, "Gene.name"])
summary(mouse.data.merged)
mouse.data.merged2 <- unique(mouse.data.merged1)
summary(mouse.data.merged2)
mouse.data.merged <- toupper(mouse.data.merged2)

#task 2
# find which gene names are shared between two dataframe columns
##intersect(chickear.data.results, mouse.data.merged, kidney.data.results)
sharedgenes3 <- chickear.data.results[(chickear.data.results %in% mouse.data.merged) & (chickear.data.results %in% kidney.data.results)]
summary(sharedgenes3)

V <- c(1,2,3)
I <- c(4,5,6,2)
D <- c(7,8,9,10,2)
V[(V%in%I) & (V%in%D)]


# to save R dataframe as a csv
Chick_mouse_ear_kidney.shared <- sharedgenes3
write.csv(Chick_mouse_ear_kidney.shared , "Chick_mouse_ear_kidney.shared .csv", row.names = F)

