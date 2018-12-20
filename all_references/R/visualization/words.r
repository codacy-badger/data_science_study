if ("tm" %in% rownames(installed.packages()) == FALSE) {
  install.packages("tm")
}
library(tm)
if ("wordcloud" %in% rownames(installed.packages()) == FALSE) {
  install.packages("wordcloud")
}
library(wordcloud)

#load text in folder
speech <- Corpus(DirSource("testfiles/texts/"))

#to inspect corpus
inspect(speech)

#clean up text
speech <- tm_map(speech, content_transformer(tolower))
speech <- tm_map(speech, removeNumbers)
speech <- tm_map(speech, removePunctuation)
speech <- tm_map(speech, removeWords, stopwords("english")) #remove common words
speech <- tm_map(speech, removeWords, c("customwords", "toremove"))
#finally
speech <- tm_map(speech, stripWhitespace)

#create matrix with frequency of removeWords sorted by frequency
dtm <- TermDocumentMatrix(speech)
dtm_matrix <- as.matrix(dtm)
dtm_sorted <- sort(rowSums(dtm_matrix), decreasing = TRUE)
#above combined
dtm_sorted <- sort(rowSums(as.matrix(TermDocumentMatrix(speech))),
  decreasing = TRUE)
#final step
dtm_df <- data.frame(word = names(dtm_sorted), freq = dtm_sorted)

#finally make wordcloud
wordcloud(words = dtm_df$word, freq = dtm_df$freq)
wordcloud(words = dtm_df$word, freq = dtm_df$freq,
  min.freq = 1, max.words = 250, colors = brewer.pal(8, "Dark2"))
wordcloud(words = dtm_df$word, freq = dtm_df$freq,
  min.freq = 1, max.words = 250, colors = brewer.pal(8, "Dark2"),
  random.order = FALSE)
