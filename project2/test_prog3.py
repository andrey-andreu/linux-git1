def get_nonzero_diag_product(X):
    import numpy as np
    s = np.diag(X)
    if len(s[s != 0]) > 0:
        return np.prod(s[s != 0])
    return None
