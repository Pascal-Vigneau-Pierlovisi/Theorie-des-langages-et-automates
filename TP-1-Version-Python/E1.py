# -*- coding: utf-8 -*-
"""
Created on Tue Nov 7 10:40:00 2022
@author: Pascal Vigneau
"""

MEM = []  # Pile
SP = 0  # Pointeur de pile
PC = 0  # Pointeur d'instruction


def add_PC():
    """
    La fonction add_PC() permet d'incrémenter la valeur du pointeur d'instruction
    :return:
    """
    global PC
    PC += 1


def ADD():
    """
    >
    :return:
    """
    if len(MEM) >= 2:
        somme = MEM.pop() + MEM.pop()
        MEM.append(somme)
    add_PC()


def SUB():
    """
    La fonction SUB() permet de faire la soustraction des 2 derniers éléments de la pile.
    :return:
    """
    if len(MEM) >= 2:
        sub = MEM.pop() - MEM.pop()
        MEM.append(sub)
    add_PC()


def MUL():
    """
    La fonction MUL() permet de faire la multiplication des 2 derniers éléments de la pile.
    :return:
    """
    if len(MEM) >= 2:
        mult = MEM.pop() * MEM.pop()
        MEM.append(mult)
    add_PC()


def DIV():
    """
    La fonction DIV() permet de faire la division des 2 derniers éléments de la pile.
    :return:
    """

    if len(MEM) >= 2:
        div = MEM.pop() // MEM.pop()
        MEM.append(div)
    add_PC()


def EQL():
    """
    La fonction EQL() laisse 1 au sommet de la pile si le sous sommet = sommet, 0 sinon
    :return:
    """
    if len(MEM) >= 2:
        if MEM.pop() == MEM.pop():
            MEM.append(1)
        else:
            MEM.append(0)
    add_PC()


def NEQ():
    """
    La fonction NEQ() permet de savoir si les 2 derniers eléments de la pile sont !=
    :return:
    """
    if len(MEM) >= 2:
        if MEM.pop() != MEM.pop():
            MEM.append(1)
        else:
            MEM.append(0)
    add_PC()


def GTR():
    """
    La fonction GTR() permet de savoir si la dernière valeur de la pile est plus grande que l'avant dernière valeur
    :return:
    """
    if len(MEM) >= 2:
        if MEM.pop() > MEM.pop():
            MEM.append(1)
        else:
            MEM.append(0)
    add_PC()


def LSS():
    """
    La fonction LSS() permet de savoir si le dernier élément de la pile est plus petit que l'avant dernier
    :return:
    """
    if len(MEM) >= 2:
        if MEM.pop() < MEM.pop():
            MEM.append(1)
        else:
            MEM.append(0)
    add_PC()


def GEQ():
    """
    La fonction GEQ() permet de savoir si la dernière valeur de la pile est >= à l'avant dernière valeur de la pile
    :return:
    """
    if len(MEM) >= 2:
        if MEM.pop() >= MEM.pop():
            MEM.append(1)
        else:
            MEM.append(0)
    add_PC()


def LEQ():
    """
    >
    :return:
    """
    if len(MEM) >= 2:
        if MEM.pop() <= MEM.pop():
            MEM.append(1)
        else:
            MEM.append(0)
    add_PC()


def PRN():
    """
    La fonction PRN() permet d'imprimer le sommet de la pile puis depile la pile
    :return:
    """
    print(MEM.pop())
    add_PC()


def INN():
    """
    La fonction INN() lit un entier, le stocke à l'adresse trouvée au sommet de pile, dépile
    :return:
    """
    if len(MEM) >= 1:
        temp = int(input("Merci de rentrer un nombre : "))
        MEM[MEM.pop()] = temp

        add_PC()


def INT(c: int):
    """
    La fonction INT incrémente de la constante c le pointeur de pile (la constante c peut être négative)
    :return:
    """
    global SP

    SP = c
    MEM.extend([0 for i in range(SP)])
    add_PC()


def LDI(v: int):
    """
    La fonction LDI() empile la valeur v
    :param v: Représente la valeur v à empiler
    :return:
    """
    try:
        MEM.append(int(v))
    except ValueError:
        print("Erreur l'entrée doit être un entier")
    add_PC()


def LDA(a):
    """
    La fonction lDA() empile l'adresse a
    :param a: Représente l'adresse
    :return:
    """
    MEM.append(a)
    add_PC()


def LDV():
    """
    La fonction LDV() remplace le sommet par la valeur trouvée à l'adresse indiquée par le sommet (déréférence)
    :return:
    """
    if MEM[-1] <= len(MEM):
        MEM.append(MEM[MEM.pop()])
    add_PC()


def STO():
    """
    La fonction STO() stocke la valeur au sommet à l'adresse indiquée par le sous-sommet, dépile 2 fois
    :return:
    """
    value = MEM.pop()
    address = MEM.pop()
    MEM[address] = value
    add_PC()


def BRN(i):
    """
    La fonction BRN() branchement inconditionnel à l'instruction i
    :param i: indice
    :return:
    """
    global PC

    PC = i


def BZE(i):
    """
    La fonction BZE() branchement à l'instruction i si le sommet = 0, dépile
    :param i: indice
    :return:
    """
    global PC

    if MEM.pop() == 0:
        PC = i
    else:
        add_PC()


def HLT():
    add_PC()
    quit()


def interp(p_code):
    while True:
        print(MEM)
        INST = p_code[PC]  # Instruction en cours initialisée sur la premieère du Pcode
        INST = INST.split()
        print("INSTRUCTION ", INST[0])
        match INST[0]:
            case "ADD":
                ADD()
            case "SUB":
                SUB()
            case "MUL":
                MUL()
            case "DIV":
                DIV()
            case "EQL":
                EQL()
            case "NEQ":
                NEQ()
            case "GTR":
                GTR()
            case "LSS":
                LSS()
            case "GEQ":
                GEQ()
            case "LEQ":
                LEQ()
            case "PRN":
                PRN()
            case "INN":
                INN()
            case "LDV":
                LDV()
            case "STO":
                STO()
            case "HTL":
                HLT()
            case "INT":
                INT(int(INST[1]))
            case "LDI":
                LDI(int(INST[1]))
            case "LDA":
                LDA(int(INST[1]))
            case "BRN":
                BRN(int(INST[1]))
            case "BZE":
                BZE(int(INST[1]))
