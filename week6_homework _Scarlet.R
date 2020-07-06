
# Task1.
# Run deseq pipeline
# intalll deseq2 and dependencies if not already installed
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("DESeq2")
BiocManager::install("apeglm")

library(DESeq2)

# DESeq2 vignette can be found here
vignette("DESeq2")

# You can find the basic steps under quickstart

# load RDS objects from previous week
merged.data <- readRDS("./test_data/week5_mergedData.RDS")
annotations <- readRDS("./test_data/week5_annotations.RDS")




head(merged.data)
coldata <- data.frame(condition=c(rep('control',4),rep('treated', 3)))

rownames(coldata)=colnames(merged.data)

dds <- DESeqDataSetFromMatrix(countData = merged.data,
                              colData = coldata,
                              design= ~condition)

dds <- DESeq(dds)
# lists the coefficients
resultsNames(dds) 
res <- results(dds, name="condition_treated_vs_control")

# or to shrink log fold changes association with condition:
res <- lfcShrink(dds, coef="condition_treated_vs_control", type="apeglm")

# you can access DE test results from results, and count matrix from counts(deseq)
genecounts<-counts(dds,normalized=T)
head(genecounts)
# Task 2.
# Once you have obtained a list of DE genes, filter only genes which pass a FC and padj(FDR) threshold
res1<- res[!is.na(res$log2FoldChange),]
res1<- res[!is.na(res$padj),]

res1 <- res[!is.na(res$padj) & !is.na(res$log2FoldChange),]

sum(is.na(res1$log2FoldChange))
sum(is.na(res1$padj))

DE_genes <- res1[res1$log2FoldChange > 2 & res1$padj < 0.05,]

# Task3.
# Subset the counts assay using these genes are plot a heatmap of the differentially expressed genes using pheatmap
install.packages("pheatmap")
library(pheatmap)
genecounts<-genecounts[rownames(DE_genes),]


pdf(file = "~/Desktop/temp.pdf")
pheatmap(genecounts, scale = 'row', annotation_col = coldata)
graphics.off()



