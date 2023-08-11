#!/usr/bin/python3

import random
import os.path

def fifty_fifty(options, correct):
    incorrect = []
    for i in options:
        if i != correct:
           incorrect.append(i)
    chosen_incorrect = random.sample(incorrect, 1)
    help_options = [correct] + chosen_incorrect
    random.shuffle(help_options)
    return help_options

def call_to_friend(options,correct):
    friend_answer = []
    friend_answer = random.choice([correct])
    return friend_answer

def hall_support(options):
    digits = []
    for i in options:
        i = random.randint(1,30)
        digits.append(i)
    total_votes = sum(digits)
    help_options = list(zip(options, digits))
    help_answers = []
    for i,j in help_options:
        j = j * 100 // total_votes
        j = str(j)
        help_answers.append(i+":"+j+"%")
    return help_answers

def get_random_5_questions(questions):
	tmp = []
	while len(tmp) < 5:
		num = random.randint(0, len(questions) -1)
		if questions[num] not in tmp:
			tmp.append(questions[num])
	return tmp

def structure_questions(tmp):
	gquestions = {}

	for el in tmp:
		q, a = el.split("?")
		gquestions[q] = a.split(",")
	return gquestions
def game(gquestions):
    A=True
    B=True
    C=True 
    cnt = 0
    for q,a in gquestions.items():
        print(q)
        correct = a[0]
        lifeline_used = False
        lifeline_options = []
        random.shuffle(a)
        for el in a:
            print(el)
        while True:
            if not lifeline_used:
                lifeline = input("Do you want to use support? y/n")
                if lifeline == "n":
                    break
                if lifeline == "y":
                    while True:
                        print("\nA)50/50\nB)Call to friend\nC)Hall support")
                        chosen_lifeline = input("\nInput (A) or (B) or (C) or (Z) for go back ").upper()
                        if chosen_lifeline == "Z":
                            break
                        if chosen_lifeline == "A":
                            if A == False:
                                print("You alredy used this option ")
                                continue
                            else:
                                lifeline_options = fifty_fifty(a, correct)
                                A = False
                                break
                        elif chosen_lifeline == "B":
                            if B == False:
                                print("You alredy used this option ")
                                continue
                            else:
                                lifeline_options = [call_to_friend(a, correct)]
                                B = False
                                break
                        elif chosen_lifeline == "C":
                            if C == False:
                                print("You alredy used this option ")
                                continue
                            else:
                                lifeline_options = hall_support(a)
                                C = False 
                                break
                        else:
                            print("Incorrect Input, INPUT ONLY A , B or C ")
                            continue
                    for i, opt in enumerate(lifeline_options):
                        print(f"{i+1}:{opt}")
                    lifeline_used = True
                    break
        print()
        answer = input("Enter your answer:")
        if answer == correct:
            cnt += 1
            print("Correct")
        else:
            print("Incorrect. The correct answer was", correct)

    print("You got %d/5" %cnt)
    return cnt

def get_questions_from_file(fname):
	with open(fname) as f:
		return f.readlines()

def sanitize_data(ml):
	return [el.strip() for el in ml]

def check_file_existence(fname):
	if not os.path.isfile(fname):
		print("Your files does not exists: %s. Please check" %fname)
		return False
	return True

def get_top_players_from_file(fname):
	with open(fname) as f:
		return f.readlines()

def create_file(fname):
	f = open(fname, "w")
	f.close()

def create_players_dict(data):
	# should be written "username: XP"
	md = {}
	for el in data:
		p,x = el.split(": ")
		md[p] = int(x)
	return md
	
def confirm_username(username, players):	
	if username in players:
		ans = input("Would you like to rewrite your XP? ")
		if ans.lower() == "y":
			pass
		else:
			username = input("Enter your username: ")
			while username in players:
				username = input("Enter your username: ")
	return username

def sort_players_by_xp(players):
	ml = list(players.items())
	ml.sort(key=lambda x: x[1], reverse=True)
	return ml

def write_player_xp(fname, ml):
	with open(fname, "w") as f:
		for pl, xp in ml:
			f.write(pl + ": " + str(xp) + "\n")

def main():
	username = input("Enter your username: ")
	question_file = "questions.txt"
	fl = check_file_existence(question_file)
	if not fl:
		exit()
	top_file = "top_players.txt"
	fl = check_file_existence(top_file)
	if not fl:
		create_file(top_file)
	players_data = get_top_players_from_file(top_file)
	players = sanitize_data(players_data)
	players_dict = create_players_dict(players)
	username = confirm_username(username, players_dict)
	questions = get_questions_from_file(question_file)
	questions = sanitize_data(questions)
	random5 = get_random_5_questions(questions)
	game_questions = structure_questions(random5)
	xp = game(game_questions)
	players_dict[username] = xp
	players = sort_players_by_xp(players_dict)
	write_player_xp(top_file, players)


main()





