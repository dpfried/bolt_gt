import re, sys

def words(text): return re.findall('[a-z]+', text.lower())

def count(features):
    model = {}
    for f in features:
        if f in model:
            model[f] += 1
        else:
            model[f] = 1
    return model

def sort_counts(count_map):
    return reversed(sorted(count_map.iteritems(), key=lambda pair: pair[1]))

in_source = file(sys.argv[1]) if len(sys.argv) > 1 else sys.stdin
WMAP = count(words(in_source.read()))
for word, count in sort_counts(WMAP):
    print count, word
