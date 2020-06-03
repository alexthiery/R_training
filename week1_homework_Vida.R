# so this week we went through setting variables. making vectors, matrices and dataframes. Here are a few questions for you to work your way through.
# I don't want the answers - I want you to provide the code which I can use to get the answers. They are tricky and might require you to google a bit,
# but it's not supposed to be easy so spend some time doing these and we can recap next week.

# Good luck!

# task 1: make a character vector named my_vector containing 5 elements

my_vector1 <- c(1,2,3,4,5)
my_vector2 <- c("hello", "goodmorning", "Streitlab", "bankholiday", "byebye")
my_vector3 <- c(1, "hello", 3, 5, "streitlab")

class(my_vector3)

# task 2: make a matrix containing numbers 1:100 split across 10 columns
matrix(data=1:100, ncol=10) 



# Here is a test dataframe I have created from the metadata for my 10x scRNSseq data
test <- read.csv("./test_data/week1_homework_scRNAseq_test.csv")



# task 3: how many columns does the dataframe have?

test.dataframe[rownum,colnum]=size(A)

??size
9



# task 4: how many cells are female? Hint: you can use sum and the boolean operator to count TRUE values i.e. sum(x %in% y)

"female" %in% test.dataframe [,9]
test.dataframe[,9] %in% "female"
# test.datafarme sum([,9] %in% "female")




# task 5: subset the rows which are male

"male" %in% test.dataframe [,9]

test.datafarme [,9] %in% "male"

test.datafarme [test.dataframe [,9]%in% "male"]




# task 6: subset a vector of the cell_IDs which are from stage hh4 (orig.ident column)

cell_IDs <- c (test.datafarme[test.dataframe[,2] %in% "hh4",])



