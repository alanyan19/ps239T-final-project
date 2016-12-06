rm(list=ls())
setwd(dir = "your path")
#install packages: "tm", "wordcloud", "dplyr" if you have not already
library(dplyr)
library(tm)
library(wordcloud)
#this is the data I got from the Vote Smart API
#when you look at my directory, this data is incomplete because I belieave
#it would be unfair for me to post their API data publicly
vote_smart_data <- read.csv(file="Your data file")
#I made some initial crosstabs of states and gender just practice some basic visualizations
gender_state_tab <- table(vote_smart_data$gender,vote_smart_data$homeState)
gender_state_tab
round(prop.table(gender_state_tab,2),2)
#I'm first creating a corpus to create a wordcloud
#I chose to use "VectorSource" and referenced directly from the original dataframe
profession_corp <- Corpus(VectorSource(vote_smart_data$profession))
inspect(profession_corp)
#I'm cleaning up the corpus so I can put the data into a wordcloud
profession_corp <- tm_map(profession_corp,stripWhitespace)
#tolower makes everything lowercase
profession_corp <- tm_map(profession_corp,tolower)
#removing "stopwords" gets rid of words commonly used in the English language
#these words like "the" or "and" are commonly used and don't mean anything for analysis
profession_corp <- tm_map(profession_corp,removeWords,stopwords("english"))
#I removed numbers because they are not meaningful for analyzing occupations
profession_corp <- tm_map(profession_corp,removeNumbers)
#I removed punctuation because they don't add anything to the analysis of occupation
profession_corp <- tm_map(profession_corp,removePunctuation)
#I stemmed words so it would be easier to find matches by focusing on common roots in the data
profession_corp <- tm_map(profession_corp,stemDocument)
#I removed words that are both common and unsubstantive
#for example, "united" does not really mean anything because what we
#really care about is representative or politician
profession_corp <- tm_map(profession_corp,removeWords,c("former","united","present","states","district","county","public","private","new","department","vice","eastern","southern","northern","western"))
#I made the corpus into a PlainTextDocument so the wordcloud function can accept the corpus
profession_clean <- tm_map(profession_corp, PlainTextDocument)
#this creates the wordcloud
wordcloud(profession_clean, scale=c(5,0.5), max.words=100, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Dark2"))
png("ProfessionWordcloud.png", width=12, height=8, units="in", res=300)
wordcloud(profession_clean, scale=c(5,0.5), max.words=100, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Dark2"))
dev.off()
warnings()
#these are my initial code for understanding how to group and standardize profession
#I first created a subset with only candidates with the profession column filled
vote_smart_data.sub <- subset(vote_smart_data,vote_smart_data$profession != "")
#second, I took a random sample of 250 of these candidates so I can have 
#a manageable dataset. I'm going to learn from the sample to 
#learn how to best standardize the profession column
profession_sample <- vote_smart_data.sub[sample(nrow(vote_smart_data.sub),250),]


