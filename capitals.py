#qaxaq mayraqaxaq 
#exanak 1: mek sxal patasxan xaxi dadar
import random 
mdquest={"Japan":"Tokyo","Armenia":"Yerevan","Russia":"Moscow","France":"Paris","Macedonia":"Skopje","Bulgaria":"Sofia","Cuba":"Havana","Afganistan":"Kabul",
         "Austria":"Vienna","South-Kores":"Seoul","Denmark":"Copenhagen","Thailand":"Bangkok","United Kingdom":"London","Ireland":"Dublin","Georgia":"Tbilisi",
         "India":"New Delhi","Lebanon":"Beirut","Poland":"Warsaw","Ukraine":"Kiev","Belarus":"Minsk","Switzerland":"Bern","Croatia":"Zagreb","Spain":"Madrid"
         }
countries=list(mdquest.keys())
count=0
while count<10:
    count += 1
    random_country = random.choice(countries)
    print("Answer number",count," What is the capital of ",random_country)
    a = input("\nInput the answer ")
    correct_capital = mdquest[random_country]
    if a.lower() == correct_capital.lower():
        print("Correct ")
        if count == 10:
            print("Congratulations you win ")
    else:
        print("Your answer is Wrong,You lose the game ")
        print("The correct answer for ",random_country,"is",correct_capital )
        break
    countries.remove(random_country)

#exanak 2: ereq sxalvelu hnaravorutyun 
import random 
mdquest={"Japan":"Tokyo","Armenia":"Yerevan","Russia":"Moscow","France":"Paris","Macedonia":"Skopje","Bulgaria":"Sofia","Cuba":"Havana","Afganistan":"Kabul",
         "Austria":"Vienna","South-Kores":"Seoul","Denmark":"Copenhagen","Thailand":"Bangkok","United Kingdom":"London","Ireland":"Dublin","Georgia":"Tbilisi",
         "India":"New Delhi","Lebanon":"Beirut","Poland":"Warsaw","Ukraine":"Kiev","Belarus":"Minsk","Switzerland":"Bern","Croatia":"Zagreb","Spain":"Madrid"
         }
countries=list(mdquest.keys())
count=0
chance=3
while count<10:
    count += 1
    random_country = random.choice(countries)
    print("\nAnswer number ",count,"What is the capital of ",random_country)
    print("You have",chance,"chances")
    a = input("Input the answer ")
    correct_capital = mdquest[random_country]
    if a.lower() == correct_capital.lower():
        print("Correct ")
        if count == 10:
            print("Congrats you win ")
    else:
        chance -= 1
        print("\nWrong")
        print("The correct answer for ",random_country,"is",correct_capital )
        print("You have ",chance,"chance")
    if chance == 0:
        print("\nYour chances are left, You lose the game")
        break
    countries.remove(random_country)

#exanak 3: 10 vayrkyan jamanak
import random
import time 

mdquest={"Japan":"Tokyo","Armenia":"Yerevan","Russia":"Moscow","France":"Paris","Macedonia":"Skopje","Bulgaria":"Sofia","Cuba":"Havana","Afganistan":"Kabul",
         "Austria":"Vienna","South-Kores":"Seoul","Denmark":"Copenhagen","Thailand":"Bangkok","United Kingdom":"London","Ireland":"Dublin","Georgia":"Tbilisi",
         "India":"New Delhi","Lebanon":"Beirut","Poland":"Warsaw","Ukraine":"Kiev","Belarus":"Minsk","Switzerland":"Bern","Croatia":"Zagreb","Spain":"Madrid"
         }
countries=list(mdquest.keys())
count=0
while count<10:
    count += 1
    start_time = time.time()
    random_country = random.choice(countries)
    print("\nAnswer number",count," What is the capital of ",random_country)
    print("You have 10 seconds for answer HURRY UP!!!")
    a = input("\nInput the answer ")
    elapsed_time = time.time() - start_time
    correct_capital = mdquest[random_country]
    if a.lower() == correct_capital.lower() and elapsed_time <= 10:
        print("Correct ")
        if count == 10:
            print("Congratulations you win ")
    elif elapsed_time > 10:
        print("The time is up You lose the game")
        break
    else:
        print("Your answer is Wrong,You lose the game ")
        print("The correct answer for ",random_country,"is",correct_capital )
        break
    countries.remove(random_country)
