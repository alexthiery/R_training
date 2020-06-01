
# installs packages from CRAN repository online
#install.packages('pheatmap')

# this will remove the package from your library - this will only take place once the current R session is restarted
#remove.packages('pheatmap')

# loads installed package into current R session - you need to load the package every time
library(pheatmap)

# functions have brackets after them
# c stands for concatenate/combine - it will combine the arguments you provide it with
c()




# functions take arguments which are separated by commas
a <- c(1, 4, 7)

class(a)

# using quotation marks to set character data
b <- c("hello", "world")

class(b)


c <- c("1", "2", "3")

class(c)

# vectors can only take one type of data - this will become a character vector
d <- c("hello", "world", 1, 3)

class(d)

# cannot turn non-numeric characters into numeric data types - this will force NAs instead
as.numeric(d)

as.character(a)


# to access elements of a vector, use squared brackets
a[3]


# vectors are 1 dimensional
1:10
c(1,2,3,4,5,6,7,8,9,10)



mat_1 <- matrix(data = 1:10, ncol = 2)

# to access elements of a matrix or dataframe - specify row and column position
mat_1[3,2]

mat_1[,1]


test.heights <- data.frame("names" = c("Alex", "Scarlet", "Fereshteh"), "height" = c(200, 160, 155), stringsAsFactors = F)

class(test.heights[,2])

test.heights[,"names"]




# here I am setting 4 vectors (3 numeric - 1 character)
a <- 1:5
b <- 6:10
c <- 11:15
d <- c("Alex", "Scarlet", "Vida", "Ailin", "Owen")

# cbind turns these into a matrix
test.matrix <- cbind(a, b, c, d)

matrix(data = c(a,b,c,d), ncol = 4)

# matrices can only store one class of data!
class(a)
class(d)

test.matrix[,1]
class(test.matrix[,1])

# however dataframes can store different types of data
test.dataframe <- data.frame(a,b,c,d, stringsAsFactors = F)

class(test.dataframe[,1])


# subsetting a row of a dataframe by a match in a column

# one way to do this would be to assign the rownames as the column you are searching for - and then subset based on rowname match
test.dataframe2 <- test.dataframe
rownames(test.dataframe2) <- test.dataframe[,4]
test.dataframe2["Vida",]

# another way would be to use boolean operators
"Vida" %in% test.dataframe[,4]

test.dataframe[,4] %in% "Vida"

test.dataframe[test.dataframe[,4] %in% "Vida",]

test.dataframe[test.dataframe[,4] %in% "Vida", 4]

# what are factors?

test.array <- c(1,3,6,7,2,4,5)

test.array

order(test.array)

test.array[order(test.array)]


test.array <- factor(c("Alex", "Vida", "Scarlet"))

test.array[order(test.array, decreasing = T)]

levels(test.array) <- c("Scarlet", "Alex", "Vida")

faco








