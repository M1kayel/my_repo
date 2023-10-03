#1
def gumar(a,b):
    if type(a) != int() and type(b) != int:
        print("Input only digits ")
        return None
    else:
        return(a+b)
#a,b=map(input("Input the two digits ").split())
#print("the count of digits is  ",gumar(a,b))

#2
def toxeri_qanak(text):
    text=text.split('\\n')
    return(len(text))

#print("Input the many line text with using \\n ")
#text=input()
#print("the count of lines is ",toxeri_qanak(text))

#3
def mijin_tvabanakan(a):
    if type(a) != int:
        print("Input only digits ")
    else:
        mt=0
        q=0
        for i in range(1,a+1):
            mt += i
            q += 1
        return(mt/q)
#a=int(input("Input the digit "))
#print("The mijin tvabanakan for",a,"is",mijin_tvabanakan(a))

#4
def math_gorc(a,b):
    if not a.isdigit() and not b.isdigit() :
        print("INput only digits ")
    else:
        a=float(a)
        b=float(b)
        if b == 0:
            print("imposible divide on 0 ")
            return(a+b,a-b,a*b)
        else:
            return(a+b,a-b,a*b,a/b)
#a=input("Enter firs number ")
#b=input("Enter second number ")
#print(math_gorc(a,b))

#5
def f_upper(text):
    ml=list(text)
    ml2=[]
    for i in ml:
        if 'a'<=i<='z':
            a=chr(ord(i)-32)
            ml2.append(a)
        else:
            ml2.append(i)
    return(mstr)
#print(f_upper('Hello my WorlD'))

#6
def f_lower(text):
    mstr=""
    for i in text:
        if 'A'<=i<='Z':
            a=chr(ord(i)+32)
            mstr += a
        else:
            mstr += i 
    return(mstr)
#print(f_lower("Hello MY WORLd"))

#7
def f_title(text):
    tt=""
    if 'a'<=text[0]<='z':
        tt=chr(ord(text[0])-32)
    else:
        tt += text[0]
    for i in range(1,len(text)):
        if text[i-1] == " " and 'a' <= chr(ord(text[i])) <= 'z':
            tt += chr(ord(text[i])-32)
        else:
            tt += text[i]
    return(tt)
#print(f_title("hello my best World"))

#8
def line_reverse(text):
    rt=""
    for i in text[::-1]:
        rt += i
    return(rt)
#print(line_reverse("Hello My best World"))

#9
def tveri_aranqi_text(tiv1,tiv2,text):
    tat=""
    for i in range(len(text)):
        if i == tiv1:
            tiv2 -= tiv1
            while i <= tiv2:
                tat += text[i]
                i += 1
    return(tat)
#print(tveri_aranqi_text(2,10,"Hello MY Best World"))

#10
def amenaerkar_bar(text):
    bar=text.split()
    ab=""
    for i in bar:
        if len(i) > len(ab):
            ab = i
    return(ab)
#print(amenaerkar_bar("Hello my best beautifull baby girl "))

#11
def maximal_tar(text):
    text = text.lower()
    tar_qan = [0] * 26 
    for i in text:
        if i.isalpha():
            ind=(ord(i)-ord('a'))
            tar_qan[ind] += 1
    max_tar = ""
    max_qan = 0
    for i in range(len(tar_qan)):
        if tar_qan[i] > max_qan:
            max_qan = tar_qan[i]
            max_tar =chr(i+ord('a'))
    return('maximal ogtvac tar=',max_tar,max_qan,'angam')
#print(maximal_tar("Hello my best world in worolooooold"))

#12
def amenaer_bari_amenash_tar(text):
    bar=text.split()
    max_bar=""
    for i in bar:
        if len(i) > len(max_bar):
            max_bar = i
    max_bar=max_bar.lower()
    #print(max_bar)
    maxi=0
    for i in max_bar:
        if i.isalpha() and  max_bar.count(i) >= maxi:
            maxi = max_bar.count(i)
            max_qan = max_bar.count(i)                       #ashxatel ete erku tarern el nuyn qanakutyan en 
    #print(max_qan)
    for i in max_bar:
        if max_bar.count(i) == max_qan:
            max_tar = i
    return(max_tar)
#print(amenaer_bari_amenash_tar("Hello my bbbbbbbbbbbeautifuulllllllllll world"))

#13
def tvi_ind_el(tiv,text):
    for i in range(len(text)):
        if i == tiv:                                    #parzabanum (pahanji sxal hasknal)
            return(text[i-1],text[i+1])
#print(tvi_ind_el(9,"hello world"))

#14
#14 is missing from txt file

#15
def polindrome(tiv):
    pol = ""
    for i in range(tiv):
        for j in str(tiv):
            pol += j
    if str(tiv) == pol[::-1]:
        return("Yes digit is polindrome")
    else:
        return("NO digit isnt polindrome")
#print(polindrome(120))

#16
def nearest_polindrome(tiv):
    for i in range(1,tiv):
        right = tiv + i 
        left  = tiv - i
        if str(right) == str(right)[::-1] or str(left) == str(left)[::-1]:
            return(left)
        elif str(left) == str(left)[::-1]:
            return(left)
#print("nearest polindrome ",nearest_polindrome(122))

#17
def arj_verj_tv_art(tiv):
    ta=0
    tv=tiv%10
    while tiv > 0:
        ta = tiv 
        tiv = tiv//10
    return(ta*tv)
#print(arj_verj_tv_art(3349))

#18
def ml_str_qanak(ml):
    strq = 0
    for i in ml:
        if isinstance(i,str):
            strq += 1
    return(strq)
mstr=["hello",1,2,3,"world"]
#print(ml_str_qanak(mstr))

#19
def ml_max_digit(ml):
    ml2=[]
    for i in ml:
        if isinstance(i,int or float):
            ml2.append(i)
    max_dig = 0
    for i in ml2:
        if i > max_dig:
            max_dig = i
    return max_dig
a = [3,2,1,3,99,1000,9999,-1]
#print(ml_max_digit(a))

#20
def ml_2nish_zuyg(ml):
    ml2=[]
    for i in ml:
        if isinstance(i,int) and 9<i<100 and i%2 == 0:
            ml2.append(i)
    return ml2
a=[1,2,8,12,24,68,"70",222,"2"]
#print(ml_2nish_zuyg(a))

#21
def mijin_tv(ml):
    ml2 = []
    mt = 0
    for i in ml:
        if isinstance(i,int):
            ml2.append(i)
    for i in ml2:
        mt += i 
    return mt/len(ml2)
a = ['hello','12',1,2,3,4,5]
#print(mijin_tv(a))

#22
def toxeri_erk(ml):
    ml2 = []
    for i in ml:
        if type(i) == str:
            ml2.append(len(i))
    return ml2
a = ['22','hello my good world','hello world',24]
#print(toxeri_erk(a))

#23
def nvazum_int(ml):
    ml2 =[]
    for i in ml:
        if type(i) == int or type(i) == float:
            ml2.append(i)
    ml2.sort(reverse = True)
    return ml2
a = ['1000',1,-1,'hello',75,32,980]
#print(nvazum_int(a))

#24
def nvazum_str(ml):
    ml2 = []
    for i in ml:
        if type(i) == str:
            ml2.append(i)
    ml2.sort(reverse = True)
    return ml2
a = [1000,'22','hello','hello beautifull','hello my good world']
#print(nvazum_str(a))

#25
def amenashat_dzaynavor(ml):
    ml2 = []
    for i in ml:
        if type(i) == str:
            ml2.append(i)
    vowels = "euioa"
    count_vowels = 0 
    max_word = ""
    max_count = 0
    print(1)
    for i in ml2:
        print(i)
        if i.lower() in vowels:
            count_vowels += 1
            print(count_vowels)
        for j in ml2:
            if count_vowels > max_count:
                max_count = count_vowels
                max_word = j
                print(max_word)
    return max_word
            
a = [1000,'22','hello','good world',]
#print(amenashat_dzaynavor(a))



#26
def amenaerkar_naxad(text):
    max_words = 0
    max_naxad = ""
    for i in text:
        words = i.split()
        num_words = len(words)
        if num_words > max_words:
            max_words = num_words
            max_sentence = i
    return max_sentence
a = ["hello world ","hello my good world","hello my good and best hi hi hi world","hi hi hihi hi hi hi hi"]
#print(amenaerkar_naxad(a))

#27
def amenamec_tiv(text):
    text = text.split()
    ml = []
    for i in text:
        if i.isdigit():
            ml.append(int(i))
    for i in range(len(ml)-1):
        for j in range(0,len(ml)-i-1):
            if ml[j] > ml[j+1]:
                ml[j],ml[j+1] = ml[j+1],ml[j]
    return ml[-1]

a = "Hello good 123 2 999 bye"
#print(amenamec_tiv(a))

#28
def amenamec_tariq_dict(md):
    sorted_dict = dict(sorted(md.items(), key=lambda x: x[1]))
    for k,v in sorted_dict.items():
        print(k,v)
    return "Sorted by ages"

a = {"Hamo":24,"Gago":25,"Grno":26,"Ara":99,"Rafo":8}
#print(amenamec_tariq_dict(a))

#29    sxalllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
def usanox_miavor_dict(md):
    sorted_dict = sorted(md, key=lambda x: int(x)['ball'])
    return sorted_dict
a = {'name':'Hamo','surname':'Hamoyan','ball':5,
     'name':'Gago','surname':'Gagoyan','ball':6,
     'name':'Grno','surname':'Grnoyan','ball':2,
     'name':'Rafo','surname':'Rafoyan','ball':9
     }
#print(usanox_miavor_dict(a))

#30

