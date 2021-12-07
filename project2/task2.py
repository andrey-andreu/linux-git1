def is_palindrome(x):
    n = x
    r = 0
    while(x > 0):
        dig = x % 10
        r = r * 10 + dig
        x = x // 10
    if r == n:
        return "YES"
    else:
        return "NO"
