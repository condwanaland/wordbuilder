In the newspaper there is a daily puzzle called wordbuilder where you have to find all the words of at least three letters, from 5 provided letters. Plurals are allowed. 

This repo has two attempts at this. Both attempts use the list of english words found [here](https://github.com/dwyl/english-words). `perms` takes a naive approach by permuting all possible 3 to 5 letter combinations of the supplied inputs, and matching them against the list of english words. This is inefficient, although due to the small length, still computes in less than a second. 

`regex` tries to filter the list of english words by matching with regexes. This attempt is currently in progress, as there may be duplicates in the input vector, and I cant find a way to make a regex only match exactly those letters (i.e., an input might be ostgh, and this script would return 'hoots' as a valid word, even though there's only one 'o')

