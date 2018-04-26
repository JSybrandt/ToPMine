#!/usr/bin/env python3

# Heavy Edits by Justin Sybrandt

import sys
mapperPath = sys.argv[1]
unStemmer = sys.argv[2]
phraseUnstemmer = sys.argv[3]
partition = sys.argv[4]
newPartition = sys.argv[5]

unMapper = {}
with open(mapperPath) as file:
    for line in file:
        word, number = line.strip().split('\t')
        unMapper[int(number)] = word

unStem = {}
with open(unStemmer) as file:
    for line in file:
        line = line.strip().split(":")
        base = line[0].strip()
        rest = line[1].strip().split('\t')
        maximum_count = -float('inf')
        unstemmed = None
        for word_count in rest:
            try:
                word, count = word_count.strip().split(" ")
                if int(count) > maximum_count:
                    maximum_count = int(count)
                    unstemmed = word
            except:
                print("Err:", word_count)
        if unstemmed:
            unStem[base] = unstemmed

phraseUndo = {}
with open(phraseUnstemmer) as file:
    for line in file:
        line = line.strip().split('\t')
        num_phrase = [int(x) for x in line[0].split(" ")]
        # num_phrase = map(int, line[0].split(" "))
        if len(line) < 2:
            line.append("ERROR")
        phrase = line[1]
        phraseUndo[tuple(num_phrase)] = phrase

with open(partition) as iFile, open(newPartition, 'w') as oFile:
    iFile.readline()
    for line in iFile:
        line = line.strip().split(',')
        phrases = []
        for cand in line:
            try:
                cand = [int(x) for x in cand.strip().split()]
                if len(cand) == 1:
                    phrases.append(unStem[unMapper[cand[0]]])
                else:
                    phrases.append(phraseUndo[tuple(cand)])
            except:
                print("err:", cand)
        oFile.write(','.join(phrases)+"\n")
