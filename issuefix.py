import random
import time
from inputimeout import inputimeout


mdquest={"Japan":"Tokyo","Armenia":"Yerevan","Russia":"Moscow","France":"Paris","Macedonia":"Skopje","Bulgaria":"Sofia","Cuba":"Havana","Afganistan":"Kabul",
         "Austria":"Vienna","South-Kores":"Seoul","Denmark":"Copenhagen","Thailand":"Bangkok","United Kingdom":"London","Ireland":"Dublin","Georgia":"Tbilisi",
         "India":"New Delhi","Lebanon":"Beirut","Poland":"Warsaw","Ukraine":"Kiev","Belarus":"Minsk","Switzerland":"Bern","Croatia":"Zagreb","Spain":"Madrid"
         }
countries=list(mdquest.keys())
count=0
while count<10:
    count += 1
    random_country = random.choice(countries)
    print("\nAnswer number",count," What is the capital of ",random_country)
    print("You have 10 seconds for answer HURRY UP!!!")
    try:
        timing  = inputimeout(prompt="\nInput the answer ", timeout=10)
    except:
        print("The time is up you lose ")
        break
    correct_capital = mdquest[random_country]
    if timing.lower() == correct_capital.lower():
        print("Correct ")
        if count == 10:
            print("Congratulations you win ")
    else:
        print("Your answer is Wrong,You lose the game ")
        print("The correct answer for ",random_country,"is",correct_capital )
        break
    countries.remove(random_country)

