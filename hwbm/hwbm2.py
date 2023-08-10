#Who wants to become a millionaire 
import random

def read_questions(filename):
    ml = []
    f = open(filename, "r")
    q = f.read().strip().split("\n")
    for i in q:
        a = i.split(":")
        md = {}
        md["question"] = a[0]
        md["options"]  =a[1].split(",")
        md["answer"]  = md["options"][0]
        ml.append(md)
    f.close()
    return(ml)
questions = read_questions("questions.txt")

def read_top_players(filename):
    md = {}
    f = open(filename,"r")
    q = f.read().strip().split("\n")
    for i in q:
        a = i.split(":")
        md[a[0]] = a[1]
    f.close()
    return md 

top_players=read_top_players("top_players.txt")

              
print("Welcome to Who Wants to Become a Millionaire!\n Write your game_name")
nickname = input()
def get_answer():
    while True:
        answer=input("Input A,B,C or D ").upper()
        if answer != "A" and answer != "B" and answer != "C" and answer != "D":
            print("False Input!! Input only A,B,C or D")
            continue
        else:
            break
    return ord(answer)-65
def nick_check(nickname):
    while nickname  in top_players:
        print("The name is alredy got , Do you want to continue on that name?")
        agree = input("Input Yes/No").lower()
        if agree == "yes":
            top_players.pop(nickname)
            break
        elif agree == "no":
            nickname = input("Input new name ")
        else:
            print("Invalid input: try again ")
            continue
    return(nickname)
nickname=nick_check(nickname)
print("Hello ",(nickname),'\n')
player_rating = 0
def game(questions,player_rating):
    correct_answers = 0
    total_answers = 0
    question_number = 1    
    for l in questions:
        random.shuffle(l["options"])
        print("\n",str(question_number)+")",l["question"])
        question_number += 1
        mla=["A)","B)","C)","D)"]
        n=-1
        for option in l["options"]:
            print(mla[n+1],option)
            n += 1
        answer_int=get_answer()
        if (l["options"][answer_int]) == (l["answer"]):
            correct_answers += 1
            total_answers += 1
            print("Correct Answer")
        else:
            total_answers += 1
            print("Incorrect Answer ")
    player_rating = correct_answers        
    return correct_answers , total_answers

correct, total = game(questions, top_players)

def update_top_players(questions,top_players):
    top_players.setdefault(nickname, correct)
    with open("top_players.txt", "w") as f :
        for k, v in top_players.items():
            a = k + ":" + str(v) + "\n"
            f.write(a)
    f.close()
def sort_top_players(players):
    ml = []
    ml = (sorted(players.items(), key=lambda item: int(item[1]), reverse = True))
    return ml

update_top_players(questions, top_players)
print(sort_top_players(top_players))
print("\nYou have",correct,"correct answers from ",total,"\nThank you for playing Who Wants to Become a Millionaire!")



     #during lessons
#def sort_players(players):
#    ml = list(players.items())
#    ml.sort(key=lambda x: x[1], reverse = True)
#    return ml 


