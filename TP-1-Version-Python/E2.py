# -*- coding: utf-8 -*-
"""
Created on Tue Nov 7 10:40:00 2022
@author: Pascal Vigneau
"""

import re

"""
Language:

- assignment    : "="
- variable      : "[a-z]+[A-Z]"
- signe         : "+, -, /"
- struct        : "TantQue, Si"

"""


def syntax(folder: str) -> list:
    token = ""
    number_line = 0
    code = open(folder, "r")
    line = code.readline()
    while line:
        lst = line.split()
        if lst[0] != "START":
            print("Syntaxe error at line", number_line, "!")
        line = code.readline()
        number_line += 1
    code.close()


syntax("code.txt")


