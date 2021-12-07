def get_new_dictionary(input_dict_name, output_dict_name):
    f1 = open(input_dict_name, 'r')
    n = f1.readline()
    n = int(n[:-1])
    j = 0
    f2 = open(output_dict_name, 'w')
    d = []
    if n == 0:
        f2.write(str(n) + '\n')
    else:
        for l in f1:
            j += 1
            if l[-1] == '\n':
                line = l[:-1]
            else:
                line = l
            l1 = line.split(" - ")
            if len(l1[1].split(', ')) == 1:
                st = l1[1] + " - " + l1[0]
                d.append(st)
            else:
                l2 = l1[1].split(', ')
                for i in range(len(l2)):
                    st = l2[i] + ' - ' + l1[0]
                    d.append(st)
        d.sort()
        d_new = []
        for i in range(len(d)-1):
            d1 = d[i].split(' - ')
            d2 = d[i+1].split(' - ')
            if d1[0] == d2[0]:
                d[i] = d[i] + ', ' + d2[1]
                d[i+1] = d[i]
            else:
                d_new.append(d[i])
        d_new.append(d[-1])
        print(d_new)
        f2.write(str(len(d_new)) + '\n')
        for s in d_new:
            f2.write(s + '\n')
    f1.close()
    f2.close()
