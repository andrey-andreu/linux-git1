def find_word_in_circle(circle, word):
    c = circle * 5
    pos = c.find(word)
    n = len(circle)
    if pos >= 0:
        return (pos, 1)
    c = c[::-1]
    pos = c.find(word)
    if pos >= 0:
        return (n - pos-1, -1)
    else:
        return -1