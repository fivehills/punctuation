
######################################
re-plot google ngram for Figure 4
######################################
# install ngramr package

install.packages("ngramr", type="source")

#or
#require(devtools)
#install_github("ngramr", "seancarmody")

#or
#install_github("ngramr", "seancarmody", "develop")


require(ngramr)
#Loading required package: ngramr
require(ggplot2)
#ng  <- ngram(c("hacker", "programmer"), year_start = 1950)
#ggplot(ng, aes(x=Year, y=Frequency, colour=Phrase)) +
#+   geom_line()


#period
period  <- ngram(c("."), year_start = 1500)

str(period)
#Classes â€˜ngramâ€? and 'data.frame':	509 obs. of  4 variables:
# $ Year     : int  1500 1501 1502 1503 1504 1505 1506 1507 1508 1509 ...
# $ Phrase   : Factor w/ 1 level ".": 1 1 1 1 1 1 1 1 1 1 ...
# $ Frequency: num  0 0 0.00468 0.00401 0.0085 ...
# $ Corpus   : Factor w/ 1 level "eng_2012": 1 1 1 1 1 1 1 1 1 1 ...
# - attr(*, "smoothing")= num 3
# - attr(*, "case_sensitive")= logi TRUE
 head(period)
#Phrases: . 
#Case-sentitive: TRUE 
#Corpuses: eng_2012 
#Smoothing: 3 

#  Year Phrase Frequency   Corpus  
#1 1500 .      0.000000000 eng_2012
#2 1501 .      0.000000000 eng_2012
#3 1502 .      0.004684072 eng_2012
#4 1503 .      0.004014919 eng_2012
#5 1504 .      0.008503513 eng_2012
#6 1505 .      0.008503513 eng_2012

png(file = "period.jpg", width = 680, height = 480)
plot(period$Frequency~period$Year,type = "o", col = "blue", xlab = "Year", ylab = "Frequency",
   main = "period")
dev.off()


#semicolon
semicolon  <- ngram(c(";"), year_start = 1500)
png(file = "semicolon.jpg", width = 680, height = 480)
plot(semicolon$Frequency~semicolon$Year,type = "o", col = "blue", xlab = "Year", ylab = "Frequency",
   main = "semicolon")
dev.off()

#question mark
question  <- ngram(c("?"), year_start = 1500)
png(file = "question.jpg", width = 680, height = 480)
plot(question$Frequency~quesiton$Year,type = "o", col = "blue", xlab = "Year", ylab = "Frequency",
   main = "question_mark")
dev.off()


#exclamation
exclamation  <- ngram(c("!"), year_start = 1500)
png(file = "exclamation.jpg", width = 680, height = 480)
plot(exclamation$Frequency~exclamation$Year,type = "o", col = "blue", xlab = "Year", ylab = "Frequency",
   main = "exclamation mark")
dev.off()

#apostrophe
apostrophe  <- ngram(c("'"), year_start = 1500)
png(file = "apostrophe.jpg", width = 680, height = 480)
plot(apostrophe$Frequency~apostrophe$Year,type = "o", col = "blue", xlab = "Year", ylab = "Frequency",
   main = "apostrophe")
dev.off()

#dash
dash  <- ngram(c("--"), year_start = 1500)
png(file = "dash.jpg", width = 680, height = 480)
plot(dash$Frequency~dash$Year,type = "o", col = "blue", xlab = "Year", ylab = "Frequency",
   main = "dash")
dev.off()


#plot graphs into one figure


period  <- ngram(c("(.)"), year_start = 1500)
semicolon  <- ngram(c("(;)"), year_start = 1500)
question  <- ngram(c("(?)"), year_start = 1500)
exclamation  <- ngram(c("(!)"), year_start = 1500)
apostrophe  <- ngram(c("(')"), year_start = 1500)
dash  <- ngram(c("--"), year_start = 1500)

jpeg("gram_punct2.jpg", quality=100, width=1628, height=888)



par(mfrow=c(2,3),mar=c(6,6,3,3))

plot(period$Frequency ~ period$Year,type = "o", col = "blue", xlab = "Year", ylab = "Frequency",
   main = "period", cex.lab=2.2, cex.axis=2.5, cex.main=3)
plot(semicolon$Frequency ~ semicolon$Year,type = "o", col = "blue", xlab = "Year", ylab = "Frequency",
   main = "semicolon", cex.lab=2.2, cex.axis=2.5, cex.main=3)
plot(question$Frequency ~ question$Year,type = "o", col = "blue", xlab = "Year", ylab = "Frequency",
   main = "question_mark", cex.lab=2.2, cex.axis=2.5, cex.main=3)
plot(exclamation$Frequency~exclamation$Year,type = "o", col = "blue", xlab = "Year", ylab = "Frequency",
   main = "exclamation_mark", cex.lab=2.2, cex.axis=2.5, cex.main=3)
plot(apostrophe$Frequency ~ apostrophe$Year,type = "o", col = "blue", xlab = "Year", ylab = "Frequency",
   main = "apostrophe", cex.lab=2.2, cex.axis=2.5, cex.main=3)
plot(dash$Frequency ~ dash$Year,type = "o", col = "blue", xlab = "Year", ylab = "Frequency",
   main = "dash", cex.lab=2.2, cex.axis=2.5, cex.main=3)

dev.off()






######################################
plot data from COHA, Figure 5
#######################################



#import data
# colon.csv

co<-read.csv("colon.csv", header=FALSE, sep=",")
ca<-read.csv("comma.csv", header=FALSE, sep=",")
cp<-read.csv("twowordhy.csv", header=FALSE, sep=",")
pos<-read.csv("poshy.csv", header=FALSE, sep=",")

colnames(co)=c("Year", "Frequency")
colnames(ca)=c("Year", "Frequency")

colnames(cp)[1]="Year"
colnames(cp)[2]="two_word"
colnames(cp)[3]="three_word"
colnames(pos)=c("Year", "Noun", "Verb", "Adj", "Adv")

library(ggplot2)



p1<-ggplot(data=ca, aes(x=Year, y=Frequency, group=1)) +
   ggtitle("comma")+
  geom_line()+
  theme(plot.title = element_text(hjust = 0.5))





p2<-ggplot(data=co, aes(x=Year, y=Frequency, group=1)) +
  ggtitle("colon")+
  geom_line()+
  theme(plot.title = element_text(hjust = 0.5))



cpMelted <- reshape2::melt(cp, id.var='Year')
colnames(cpMelted)[3]="Frequency"
p3<-ggplot(cpMelted, aes(x=Year, y=Frequency, col=variable)) + 
   ggtitle("hyphen")+
  geom_line()
p3<-p3 + theme(legend.position="top",  legend.title = element_text(colour="blue", size=8),
               plot.title = element_text(hjust = 0.5))

# set transparency
#  theme(
#        panel.grid.major = element_blank(), 
#        panel.grid.minor = element_blank(),
#        panel.background = element_rect(fill = "transparent",colour = NA),
#        plot.background = element_rect(fill = "transparent",colour = NA)
#        )



posMelted <- reshape2::melt(pos, id.var='Year')
colnames(posMelted)[3]="Frequency"
p4<-ggplot(posMelted, aes(x=Year, y=Frequency, col=variable)) + 
  ggtitle("hyphen_pos")+
  geom_line()
p4<-p4 + theme(legend.position="top", legend.title = element_text(colour="blue", size=8),
              plot.title = element_text(hjust = 0.5))

# set transparency
#  theme(
#        panel.grid.major = element_blank(), 
#        panel.grid.minor = element_blank(),
#        panel.background = element_rect(fill = "transparent",colour = NA),
#        plot.background = element_rect(fill = "transparent",colour = NA)
#        )



#combine four ggplot graphs into one page

#install.packages("ggpubr")

library(ggpubr)


punc4<-ggarrange(p1, p2, p3, p4, labels = c("A", "B", "C", "D"), 
          ncol = 2, nrow = 2, font.label = list(size = 10, color = "black"))


ggsave(plot = punc4, file = "punct4.jpg", 
       type = "cairo",  bg = "transparent",
       width = 20, height = 15, units = "cm", dpi = 800)
