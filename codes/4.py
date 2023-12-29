import numpy as np
import matplotlib.pyplot as plt

def f(b_count, alpha, beta):
    res = 0
    res += 0.25-(0.25*alpha**(b_count-1))
    res += (0.25*beta**(b_count-1))
    return res

alpha = 0.9
beta = 0.95
print(f(0, alpha, beta))
print(f(1, alpha, beta))
print(f(13, alpha, beta))
print(f(14, alpha, beta))
print(f(15, alpha, beta))

assert(f(1, alpha,beta)==0.25)
assert(f(13, alpha,beta)<f(14, alpha,beta)>f(15, alpha,beta))

k = np.arange(1, 40, 1)
plt.plot(k, f(k, alpha, beta))
plt.show()
