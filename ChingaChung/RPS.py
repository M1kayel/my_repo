import random 

def Get():
    while True:
        user = input("Enter Choice, 'r','p','s'")
        if user in ["r","p","s"]:
            return user
        else:
            print("False Input")

def PC():
    choices = ["r","p","s"]
    return random.choice(choices)

def Winner(Get, PC):
    if Get  == PC:
        return "Its a tie!"
    elif Get == "r" and PC == "s":
        return "You win the round"
    elif Get  == "p" and PC == "r":
        return "You win the round"
    elif Get == "s" and PC == "p":
        return "You win the round"
    else:
        return "Computer wins the round"

def Score(result,userscore,pcscore):
    if result == "You win the round":
        userscore += 1
    elif result == "Computer wins the round":
        pcscore += 1
    return userscore, pcscore

def End(userscore, pcscore):
    if userscore == 3:
        return "YOU WIN THE GAME!"
    if pcscore == 3:
        return "YOU LOSE THE GAME PC WINS!"
    return None

def main():
    print('GAME START')
    userscore = 0
    pcscore = 0
    while True:
        Userget = Get()
        PCget = PC()
        print('You choose',Userget,'PC choose',PCget)
        Result = Winner(Userget,PCget)
        print('\n',Result)
        userscore, pcscore = Score(Result,userscore,pcscore)
        print('\nThe score is ',userscore,':',pcscore)
        Game_end = End(userscore,pcscore)
        if Game_end:
            print(Game_end)
            break

if __name__ == "__main__":
    main()
    
