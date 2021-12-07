def check(s, filename):
    s1 = s.lower()
    s1 = s1.split()
    s_uniq = list(set(s1))
    print(s_uniq)
    s_count = []
    s_uniq.sort()
    for word in s_uniq:
        s_count.append(s1.count(word))
    print(s_count)
    f = open(filename, 'w')
    for i in range(len(s_uniq)):
        f.write(s_uniq[i] + ' ' + str(s_count[i]) + '\n')
    f.close()