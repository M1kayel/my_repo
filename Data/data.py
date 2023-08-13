#data.txt
import os.path

def read_file(filename):
    ml = []
    f = open(filename,"r")
    q =f.read().split()
    for i in q:
        ml.append(i)
    f.close()
    return ml
ml = (read_file("data.txt"))

def check_file_existence(filename):
    if not os.path.isfile(filename):
        print(f"the file'{filename}'does not exist ")
        return False
    return True 

#1
def symbols_count(text):
    symbol_count = {}
    for i in text:
        if i.isalpha() and type(i) == str:
            symbol_count[i] = symbol_count.get(i, 0) + 1
    return symbol_count
res1 = symbols_count(ml)

#2
def longest_word(text):
    lonw = ""
    lenght = 0
    for i in text:
        if len(i) > lenght:
            lonw = i
            lenght = len(i)
    return lonw
res2 = longest_word(ml)
#3
def sentence_count(text):
    sc = 0
    for i in text:
        if i[-1] == ".":
            sc +=1
    return sc
res3 = sentence_count(ml)


#4
def reverse_word(text):
    ml = []
    for i in text:
        ml.append(i[::-1])
    return ml
res4 = reverse_word(ml)

#5
def write_everything(filename):
    with open("result.txt","w") as file:
        file.write("\nDef 1\n")
        file.write(str(res1))
        file.write("\nDef 2\n")
        file.write(res2)
        file.write("\nDef 3\n")
        file.write(str(res3))
        file.write("\nDef 4\n")
        file.write(str(res4))

def main():
    fex = check_file_existence("data.txt")
    if not fex:
        exit()
    ml = (read_file("data.txt"))
    result = symbols_count(ml)
    longest_word(ml)
    sentence_count(ml)
    reverse_word(ml)
    write_everything(ml)
main()
