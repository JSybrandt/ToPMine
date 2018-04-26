#!/usr/bin/env python3

import sys

inPath = sys.argv[1]

with open(inPath) as file:
    for line in file:
        phrases = line.strip().split(',')
        # print label in caps
        print(phrases[0].upper(), end=" ")
        for phrase in phrases[1:]:
            print(phrase.replace(" ", "_"), end=" ")
        print()
