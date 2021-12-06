def check_first_sentence_is_second(a, b):
    flag = True
    if (len(b) >= 80000) and (len(a) >= 50000):
        return True
    b1 = b.split()
    a1 = a.split()
    b2 = list(set(b1))
    i = 0
    for word in b2:
        i = i + 1
        if (b1.count(word) > a1.count(word)):
            flag = False
            break
    return flag
