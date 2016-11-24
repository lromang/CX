#! /bin/Rscript

library(plyr)

## Read in dataset
good <- read.table("good.txt", sep = " ")
bad  <- read.table("bad.txt", sep = " ")
word <- read.table("word.txt", sep = " ")
word <- word[2:length(word)]

## Averaging good words
mean_good <- apply(good[,2:ncol(good)], 2, mean)
## Normalize good words
mean_good <- mean_good/sqrt(sum(mean_good*mean_good))

## Averaging bad words
mean_bad <- apply(bad[,2:ncol(bad)], 2, mean)
## Normalize bad words
mean_bad <- mean_bad/sqrt(sum(mean_bad*mean_bad))

## Normalize word
word <- word/sqrt(sum(word*word))

## Cosine distance
bad_dist  <- sum(word*mean_bad)
good_dist <- sum(word*mean_good)


## Classify with margin
epsilon <- .01
if(bad_dist > good_dist + epsilon){
    print("Malo")
}else if(bad_dist + epsilon < good_dist){
    print("Bueno")
}else{
    print("Neutro")
}
