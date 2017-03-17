library(hflights)
a <- list(c(),c(),c(),c(),c(),c(),c(),c(),c(),c(),c(),c())
q <- list(c(),c(),c(),c(),c(),c(),c(),c(),c(),c(),c(),c())
for(i in 1:12)
{
  for(j in 1:length(hflights$ArrDelay))
  {
    if(hflights$Month[j]==i)
      a[[i]] <- c(a[[i]],hflights$ArrDelay[j])
  }
  q[[i]] <- quantile(a[[i]],0.1,na.rm=TRUE)
}
s <- 0
for(i in 1:12){
   s <- s+q[[i]]
}
m <- s/12
m

