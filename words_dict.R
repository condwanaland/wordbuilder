library(jsonlite)
three <- read_json("three_letter.json", simplifyVector = TRUE)
four <- read_json("4letter.json", simplifyVector = TRUE)
five <- read_json("5letter.json", simplifyVector = TRUE)

words_dict <- rbind(rbind(three, four), five)
names(words_dict) <- "words"
