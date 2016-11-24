#! /bin/bash

## Input word
word=$1
nwords=2
word_vec=$(cat ../data/spanish_billion_words_vecs/SBW-vectors-300-min5.txt | grep -E -m 1 "^$word ")

## Sentiment vectors: replace with clusters...
good_vec=$(cat ../data/spanish_billion_words_vecs/SBW-vectors-300-min5.txt | grep -E -m $nwords "^buen.* ")
bad_vec=$(cat ../data/spanish_billion_words_vecs/SBW-vectors-300-min5.txt | grep -E -m $nwords "^mal.* ")

echo "$good_vec" > good.txt
echo "$bad_vec"  > bad.txt
echo "$word_vec" > word.txt

./average.R
