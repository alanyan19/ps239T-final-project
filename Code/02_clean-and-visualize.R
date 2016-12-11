#Alan Yan
#12-9-2016
'''This code will clean the profession column of the Vote Smart API candidate bios data. I will first create a corpus, and then follow the standard text analysis procedure to clean the corpus for visualization. I decided to make a word cloud to quickly visualize the data. There is still a lot of cleaning that needs to go into perfecting the profession column. However, the word cloud will give a quick answer to what profession occurs most often. Finally, I have included code for saving the word cloud.'''
rm(list=ls())
setwd(dir = "your path")
#install packages: "tm", "wordcloud", "dplyr" if you have not already
install.packages("tm")
install.packages("dplyr")
install.packages("wordcloud")
library(dplyr)
library(tm)
library(wordcloud)
#this is the data I got from the Vote Smart API
#when you look at my directory, this data is incomplete because I believe
#it would be unfair for me to post their API data publicly
vote_smart_data <- read.csv(file="c:/Users/Alan/ps239T-final-project/Data/CandidateBios.csv")
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
#this saves the word cloud 
png("ProfessionWordcloud.png", width=12, height=8, units="in", res=300)
wordcloud(profession_clean, scale=c(5,0.5), max.words=100, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Dark2"))

