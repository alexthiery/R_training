
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

# or to shrink log fold changes association with condition:
results <- lfcShrink(deseq, coef="treatment_treated_vs_control", type="apeglm")


# you can access DE test results from results, and count matrix from counts(deseq)


# Task 2.
# Once you have obtained a list of DE genes, filter only genes which pass a FC and padj(FDR) threshold


# Task3.
# Subset the counts assay using these genes are plot a heatmap of the differentially expressed genes using pheatmap
install.packages("pheatmap")
library(pheatmap)



