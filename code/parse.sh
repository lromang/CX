#! /bin/bash

## Parses text
query='localhost:9000/?properties={"annotators":"tokenize,ssplit,pos,lemma,ner,dcoref,relation","outputFormat":"json"}'
query=$(echo "wget --post-data " "'"$1"'" "'"$query"'" "--quiet -O - | jq '.'")
eval $query
