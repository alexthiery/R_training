
# task 1
# subset columns of interest from ramyadata
ramyadata <- read.csv(file = "Vida/Active_otic_enhancer_using_miseq_data.csv", skip = 2)


# task 2
# subset columns of interest from human_mouse_kidney data
human_mouse_kidney <- read.csv(file = "Vida/TableS3.csv")


# task 3
# find which gene names are shared between two dataframe columns



# to save R dataframe as a csv
temp <- ramyadata[1:10,]
write.csv(temp, "test.csv", row.names = F)
