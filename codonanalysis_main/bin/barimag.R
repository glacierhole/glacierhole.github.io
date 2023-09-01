FileName <- "thisisfile"
#FileName <- "CPR-cal-num.txt"
Data <- read.table(FileName,header =  FALSE, sep = ":")
library(ggplot2)
PP<-ggplot(Data,aes(x=V1, y=V2)) +
  geom_col() +
  xlab("范围") + 
  ylab("值")
ggsave("thisisname.png",PP,width = 16, height = 10, dpi = 150)
