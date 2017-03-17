raw <- read.delim("E:/WISE/WISER CLUB Insider/Advanced R CLASS/data/weather.txt",check.names = F, na.strings = ".")
a <- matrix(,nrow=12,ncol=31)
b <- as.matrix(raw)
c=matrix(as.numeric(b),nrow=nrow(b))
for(j in seq(2,22,2)){
  for(i in 4:34){
    if(is.numeric(c[j-1,i]-c[j,i]))
       a[j/2,i-3]=c[j-1,i]-c[j,i]
    else
       a[j/2,i-3]=0
  }
}
a