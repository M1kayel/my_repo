# X & O

import random

def print_board(board):
    for row in board:
        print(" | ".join(row))
        print("-" * 9)

def create_empty_board():
    return [[" " for _ in range(3)] for _ in range(3)]

def check_digit(row,col):
    if type (row) != int and type (col) != int:
        if not row.isdigit() or not col.isdigit():
            print("\nEnter only DIGIT")
            return True

def check_input(row,col):
    if row != "1" and row != "2" and row != "3" or col != "1" and col != "2" and col != "3":
        print("\nFalse input try again ")
        return True

def box_zanit(a,row,col):
    if a[int(row)-1][int(col)-1] != " ":
        print("\nBox is zanit. Try another.")
        return True 

def winner(a,player):
    for i in a:
        if all([cell == player for cell in i]):
            return True 
    for j in range(3):
        if all([a[i][j] == player for i in range(3)]):
            return True
    if all([a[i][i] == player for i in range(3)]) or all([a[i][2 - i] == player for i in range(3)]):
        return True
    return False

def draw(a):
    for i in a:
        if " " in i:
            return False
    return True

def empty_box(a):
    ml = []
    for i in range(3):
        for j in range(3):
            if a[i][j] == " ":
                ml.append((i+1,j+1))
    return ml

def pc_move(a):
    empty = empty_box(a)
    return random.choice(empty)

def choice(a):
    if a.upper() == "Y":
        PC = True
    else:
        PC = False
    return PC
def main():
    table = create_empty_board()
    current_player = "X"
    print("PLAY THE GAME")
    ch = input("Play with PC? Y/: ")
    choice(ch)
    while True:
        print_board(table)
        if choice(ch) is True:
            print("Play with PC! ")
            if current_player == "X":
                print("Players Turn!")
                row = input("Input the row (1,2,3)")
                col = input("Input the column (1,2,3)")
                if check_digit(row,col):
                    continue
                if check_input(row,col):
                    continue
                if box_zanit(table,row,col):
                    continue
            else:
                print("PC Turn!")
                row,col = pc_move(table)
                table[row-1][col-1] = "O"
        else:
            print("Play with Player! ")
            row = (input("Input the row (1,2,3)"))
            col = (input("Input the column (1,2,3)"))
            if check_digit(row,col):
                continue
            if check_input(row,col):
                continue
            if box_zanit(table,row,col):
                continue
        
        table[int(row)-1][int(col)-1] = current_player
        if winner(table,current_player):
            print_board(table)
            if choice(ch) is True and current_player == "X":
                print("\n",current_player,"WINS!")
                break
            elif choice(ch) is True:
                print("PC WINS!")
                break
            else:
                print("\n",current_player,"WINS!")
            break
        elif draw(table):
            print_board(table)
            print("\nDRAW: Thank's for playing")
            break
        if current_player == "X":
            current_player = "O"
        else:
            current_player = "X"
if __name__ == "__main__":
    main()

