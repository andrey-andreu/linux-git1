def longestCommonPrefix(x):
    x1 = x
    m = 10**6
    m_i = -1
    ret_j = 0
    j = 0
    flag = False
    for i in range(len(x1)):
        x1[i] = x1[i].lstrip()
        if m > len(x1[i]):
            m = len(x1[i])
            m_i = i
    for j in range(m,-1,-1):
        if flag:
            break
        for i in range(len(x1)):
            if m_i != i:
                if (x1[i].find(x1[m_i][:j]) >= 0):
                    ret_j = j
                    flag = True
                else:
                    flag = False
                    break
                
    if flag:
        return x1[m_i][:ret_j]
        
