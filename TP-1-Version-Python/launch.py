from E1 import *

if __name__ == '__main__':
    # TODO Test pour la STEP 1
    P_CODE = ["INT 2", "LDA 0", "INN", "LDA 1", "LDA 0", "LDV", "LDA 1", "LDV", "ADD", "STO", "LDA 0",
              "LDV", "LDI 0", "EQL", "BZE 1", "LDA 1", "LDV", "PRN", "HTL"]
    interp(P_CODE)

