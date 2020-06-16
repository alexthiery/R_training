# bulk RNAseq differential expression analysis


# list count files from alignment
files <- list.files("./test_data/Sox8_data", full.names = T)
# make dictionary of sample names and readcount files
# samples are renamed from original sample sheet for downstream analysis. Original sample IDs can be found under Sample_ReadMe.txt
samples.IDs <- data.frame(Sample = c("Sox8OE1", "Sox8OE2", "Sox8OE3", "Control1", "Control2", "Control3"),
                          ID = c("WTCHG_706842_201108", "WTCHG_706842_202120", "WTCHG_706842_203132", "WTCHG_706842_205156",
                                 "WTCHG_706842_207180", "WTCHG_706842_208192"),
                          stringsAsFactors = F)


# Here I am reading in the dataframes and assigning them to a list

# read in the data tables for each sample, remove the extra columns which label chr pos etc, and add relevant column names
# read in samples >> select columns for reads and annotations >> rename columns
read.counts <- list()
for(ID in samples.IDs$ID){
  sample = samples.IDs[['Sample']][samples.IDs$ID %in% ID]
  read.counts[[sample]] <- as.data.frame(read.table(files[grepl(ID, files)], header = T, stringsAsFactors = F))
  read.counts[[sample]] <- read.counts[[sample]][,c('Geneid', "gene_name", colnames(read.counts[[sample]])[grepl(ID, colnames(read.counts[[sample]]))])]
  names(read.counts[[sample]]) <- c('Gene.ID', 'Gene.ann', sample)
}


# You can see that whereas in previous sessions we had two columns, we now have three: gene IDs, gene annotations and sample
head(read.counts$Sox8OE1)

# the aim is to create two dataframes from these data. First, we want a dataframe of the gene IDs and corresponding annotations. This is 
# so that we can identify the ENS_ID for a gene of interest later. The second will be a dataframe of our gene counts.

# All of our samples were aligned together, so all of the gene IDs are present in all the dataframes
# this can be seen by the fact that all of the gene ids in DF1 are in the intersected DFs
all(length(read.counts$Sox8OE1$Gene.ID) %in% length(Reduce(intersect, lapply(read.counts, function(x){x[,1]}))))

# This means that we can generate our annotation DF directly from the dataframe from the first sample. However given that we have NAs in our gene
# annotations, we need to edit this column so that if there is an NA present, we take the ensembl ID.

# This requires you to apply an ifelse statement across the first dataframe (read.counts$Sox8OE1)
# apply works similarly to lapply, however instead of operating over a list, it operates over a dataframe.
# apply(DF, 1, function(x){someoperation}) will apply the function over the rows of a dataframe, whereas
# apply(DF, 2, function(x){someoperation}) will apply the function over the columns

# Task 1.
# Use apply to check whether the value in the annotation column is NA. If so, then take the Ensembl ID, otherwise take the gene name

# Task 2.
# Generate a dataframe with the ens IDs and corresponding gene names

# Task 3.
# Generate a dataframe for the gene counts and ensembl IDs (refer to week 2/3 homework if needed)

# Task 4.
# Make a metadata dataframe in order to initialise the deseq object. This should be a dataframe with two columns:
# sampleID (Sox8OE1, Sox8OE2, etc) and group (Sox8, Sox8, Control, Control etc)
