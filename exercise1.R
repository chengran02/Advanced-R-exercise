ds<-data.frame(id=seq(10,80,by=10),
               anest=c("baker","baker",rep("dow",6)),
               start=c("08:00","09:00","09:00","08:00","10:00","12:30","13:30","18:00"),
               end=c("11:00","13:00","15:30","13:30","11:30","13:30","14:30","19:00"))
library(dplyr)
count <- list()
rs <- na.omit(ds) %>%
  mutate(start=sapply(ds$start,as.character)) %>%
  mutate(end=sapply(ds$end,as.character)) 
id <- list()
f <- list()
maxnum <- list()
for(j in 1:nlevels(rs$anest)){  #对每类资产遍历
  ars <- rs[which(rs$anest==levels(rs$anest)[j]),]
  f[[as.character(j)]] <- list()
  count[[as.character(j)]] <- vector(length = length(ars$end))
  for(i in 1:length(ars$end)){               #对每一结束时间遍历
    for(z in 1:length(ars$start)){            #对每一开始时间遍历
      if((ars$start[z]<ars$end[i])&(ars$start[i]<ars$end[z])){             #如果开始时间早于结束时间则记录
        count[[j]][i] = count[[j]][i]+1   
        f[[j]][[as.character(i)]] <- c(f[[j]][[as.character(i)]],ars$id[z])
      }
    }
    maxnum[[as.character(j)]] <- max(count[[j]])
    id[[as.character(j)]] <- f[[j]][[which(count[[j]]==maxnum[[j]])]]
  }
}
result <- list(maxnum,id)




