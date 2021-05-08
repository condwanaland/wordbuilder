### Input data
input_raw <- c("o", "s", "t", "g", "h")


### Permute word combinations
library(gtools)
library(dplyr)

n_perms <- function(n_char, input_chars){
  
  prm <- gtools::permutations(n=5, r=n_char, v=input_chars)
  prm_out <- as.data.frame(apply(prm, 1, function(x)paste0(x, collapse='')))
  names(prm_out) <- "words"
  
  return(prm_out)
  
}

word_permutations <- lapply(3:5, n_perms, input_raw)
word_permutations <- do.call(rbind, word_permutations)


### Load word dictionary
df <- read.delim(
  "https://raw.githubusercontent.com/dwyl/english-words/master/words_alpha.txt",
  header = FALSE,
  col.names = c("words")
)

df_filtered <- df %>% 
  mutate(word_length = nchar(words)) %>% 
  filter(word_length <= 5 & word_length > 2)


valid_words <- word_permutations %>% 
  semi_join(df_filtered)
