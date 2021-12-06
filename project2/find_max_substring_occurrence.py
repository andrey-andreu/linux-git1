def find_max_substring_occurrence(input_string):
    n = len(input_string)
    for i in range(1, len(input_string) + 1):
        a = input_string[:i]
        s = input_string.split(a)
        if s.count("") == n/len(a) + 1:
            return int(n/len(a))
