def hello(x=None):
    if (x == None):
        return "Hello!"
    if len(x) == 0:
        return "Hello!"
    return "Hello, " + x + '!'
