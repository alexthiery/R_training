# Introduction to custom functions

# The examples functions have been made to replicate the base R sum() function and are therefore
# for illustrative purposes only.

# R has many base functions and thousands of packages which can handle most of the tasks you will need to
# carry out. However, there are instances that you will need to make your own functions.


# basic function syntax
function(arg1, arg2){
  someprocess
  return(output)
}


# custom function to add two elements together

add <- function(x,y){
  return(x+y)
}


add(1,2)
add(x = 1, y = 2)

add(1,2,3)


add <- function(x,y,z){
  return(x+y+z)
}


add(x = 1, y = 2)



add <- function(x = 0, y = 0, z = 0){
  return(x+y+z)
}


add(x = 1, y = 3, z = 5)

# There are many situations where you want to carry out an operation on a vector of variable lengths
# For example we might want to add the vector elements together without knowing how long our vector is

c(1,2,3,4,5)


sum.loop <- function(x){
  temp = x[1]
  for(i in x[2:length(x)]){
    temp = temp + i
  }
  return(temp)
}


sum.loop <- function(x){
  temp = 0
  for(i in x){
    temp = temp + i
  }
  return(temp)
}



# ellipsis used to supply non-hard coded arguments



ellip <- function(...){
  args <- c(...)
  temp = 0
  for(i in args){
    temp = temp + i
  }
  return(temp)
}

ellip(x = 1, y = 4, h = 8, v = 7)




# using sum function, include arg to substract if desired


sum.sub <- function(operation, ...){

  if(operation == "subtract"){
    return(sum(-c(...)))
  } else if (operation == "add"){
    return(sum(c(...)))
  } else if (operation == "multiply"){
    temp = 1
    for(i in c(...)){
      temp = temp*i
    }
    return(temp)
    
  } else {stop("can only add, subtract or multiply")}
    
}


if(){
}else if(){
}else if(){
}else{}











sum.sub(operation = "sum", 1,2,3,4)


