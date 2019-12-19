"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.

"""

import random
import sys


a = input('Enter minimum string length: ')
b = input('Enter maximum string length: ')
n = input('How many random strings to generate? ')


def RandomStringGenerator(l=12, a=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9']):
    p = 0
    s = ''
    while p<l:

        s += random.choice(a)
        p += 1
    return s

def BatchStringGenerator(n, a=8, b=12):
    r = [RandomStringGenerator(random.choice(range(a, b))) if (a < b) else RandomStringGenerator(a) if a == b else sys.exit('Incorrect min and max string lengths. Try again.') for i in range(n)]

    return r

print(BatchStringGenerator(int(n), int(a), int(b)))