
BiocManager::install("pasilla")

library(pasilla)
datafile <-  system.file( "extdata/pasilla_gene_counts.tsv", package="pasilla" )

count.table <-  read.table( datafile, header=TRUE, row.names=1, quote="", comment.char="" )

temp <- read.delim("~/dev/repos/R_training/test_data/GSE69185_Count.txt", stringsAsFactors = F)
temp <- temp[,c(7:8)]

temp <- cbind(count.table, temp[1:nrow(count.table),])

temp2 <- temp

temp[,9] <- apply(temp, 1, function(x) ifelse(grepl("ENS", x[9]), NA, x[9]))
temp <- temp[grep("ENS", temp[,8]),]

dataframe.list <- list()
for(i in 1:7){
  dataframe.list[[i]] <- temp[,c(8,9,i)]
  rownames(dataframe.list[[i]]) <- NULL
}

names(dataframe.list) <- colnames(temp[1:7])


saveRDS(dataframe.list, "~/dev/repos/R_training/test_data/test_DESeq2.RDS")
