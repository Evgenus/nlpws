library(ggplot2)
dat1 <- data.frame(
  Party = factor(c("NDP","Liberal","Conservative")), 
  party1 = factor(c("Tweets By Party")), levels=c("Tweets By Party"),
  Total_Tweets = c(234, 671, 331)
)

dat2 <- data.frame(
  Classifier = factor(c("Maximum Entropy", "Naive Bayes")),
  Party = factor(c("NDP","Liberal","Conservative", "NDP","Liberal","Conservative")), levels=c("NDP","Liberal","Conservative"),
  Percent_Positive = c(54.7008547009, 45.6035767511, 43.8066465257, 51.7094017094, 43.9642324888, 44.1087613293)
)


dat3 <- data.frame(
  Classifiers = factor(c("Maximum Entropy", "Naive Bayes")),
  Subject = factor(c("job","pm","women", "job","pm", "women")), levels=c("job","pm","women"),
  Percent_Positive_Tweets = c(68.4210526316, 61.7647058824, 47.619047619, 68.4210526316, 61.7647058824, 42.8571428571)
)

ggplot(data=dat1, aes(x=party1, y=Total_Tweets, fill=Party)) +
  geom_bar(stat="identity") + coord_polar(theta="y") + ggtitle("Uncleaned Data - Tweets by Party")

ggplot(data=dat2, aes(x=Party, y=Percent_Positive, fill=Classifier)) +
  geom_bar(stat="identity", position=position_dodge()) + theme(text = element_text(size=10), axis.text.x = element_text(angle=90, vjust=1))
ggtitle("Uncleaned Data - Percentage of Tweets with Positive Sentiment by Party")

ggplot(data=dat3, aes(x=Subject, y=Percent_Positive_Tweets, fill=Classifiers)) +
  geom_bar(stat="identity", position=position_dodge())  + theme(text = element_text(size=10), axis.text.x = element_text(angle=90, vjust=1)) +
  ggtitle("Cleaned Data - Percentage of Tweets with Positive Sentiment by Subject")

