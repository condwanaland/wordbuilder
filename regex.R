input_raw <- c("o", "s", "t", "g", "h")

library(dplyr)
library(stringr)
df <- read.delim(
  "https://raw.githubusercontent.com/dwyl/english-words/master/words_alpha.txt",
  header = FALSE,
  col.names = c("words")
  )

letter_diff <- dplyr::setdiff(letters, input_raw)
letter_diff <- paste(letter_diff, collapse = "|")
unique_input <- length(unique(input_raw))
input_string <- paste(input_raw, collapse = "")


df <- df %>% 
  mutate(word_length = nchar(words)) %>% 
  filter(word_length <= 5 & word_length > 2) %>% 
  mutate(presence = str_detect(words, letter_diff)) %>% 
  filter(presence == FALSE) %>% 
  rowwise() %>% 
  mutate(word_unique = length(unique(strsplit(words, "")[[1]])),
         input_unique = unique_input,
         unique_diff = word_unique < input_unique) %>% 
  ungroup()
    

grepl(letter_diff, "hoots", fixed = TRUE)
