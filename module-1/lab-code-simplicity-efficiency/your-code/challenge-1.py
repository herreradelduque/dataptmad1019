"""
This is a dumb calculator that can add and subtract whole numbers from zero to five.
When you run the code, you are prompted to enter two numbers (in the form of English
word instead of number) and the operator sign (also in the form of English word).
The code will perform the calculation and give the result if your input is what it
expects.

The code is very long and messy. Refactor it according to what you have learned about
code simplicity and efficiency.
"""



print('Welcome to this calculator!')
print('It can add and subtract whole numbers from zero to five')
a = str(input('Please choose your first number (zero to five): '))
b = input('What do you want to do? plus or minus: ')
c = str(input('Please choose your second number (zero to five): '))

num = {'zero':0, 'one':1, 'two':2, 'three':3, 'four':4, 'five':5}
key_num = {0:'zero', 1:'one', 2:'two', 3:'three', 4:'four', 5:'five', 6:'six', 7:'seven', 8:'eight', 9:'nine', 10:'ten'}
op = {'plus':'+', 'minus':'-'}
def calculator(a,b,c):
    if a or c not in num:
        print("I am not able to answer this question. Check your input.")
        print("Thanks for using this calculator, goodbye :)")
    else:
        if b == 'plus':
            print(f'{a} plus {c} equals {key_num.get(num.get(a)+num.get(c))}')
        elif b == 'minus' and a < c:
            print(f'{a} minus {c} equals {key_num.get(num.get(a) - num.get(c))}')
        else:
            print(f'{a} minus {c} equals minus {key_num.get(num.get(c) - num.get(a))}')


calculator(a,b,c)