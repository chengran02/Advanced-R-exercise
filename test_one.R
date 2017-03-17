findNum <- function(y,x,I){
  a <- NULL
  n <- length(y)
  for(i in 1:(n-I+1)){
     if(all(y[i:(i+I-1)]==x))
         a <- c(a,i)
  }
  return(a)
}
y <- c(1,0,0,1,1,1,0,1,1)
findNum(y,1,2)

GOTIT

IE

WE