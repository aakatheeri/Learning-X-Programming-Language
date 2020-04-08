import os

# execute operating system program 
program = 'python'
arguments = ['mod.py']
print(os.execvp(program, (program,) +tuple(arguments)))
