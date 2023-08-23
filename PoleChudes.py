#pole chudes 
quest='What is capital of Armenia'  #harc 
answer='YEREVAN'                     #patasxan miayn mecatar     
lena=len(answer)                   #patasxani erkarutyun     
chance=3                           #shanseri qanak
X='-'*lena                         #gcikneri qanak patasxani erkarutyamb
print('Welcome to Pole Chudes\nWrite your name and press ENTER')
a=input()                          #xaxacoxi anun
print('HI',a,quest)
while True:
    print(a,'you have ',chance,'chance')
    print(' '.join(X))
    guess=input('input only upper alpha').upper()            #tari mutq
    print('\n')
    if guess.isalpha() and len(guess) == 1:                  #mutq erac tari stugum 
        if guess in answer:
            XX=''                                            #nor str stexcum 
            for i in range(len(answer)):
                if guess == answer[i]:
                    XX=XX+guess
                else:
                    XX=XX+X[i]
            X=XX                                             #stexcvac gcikneri havasarecum mer norastexc str-i het 

            if X == answer:
                print('Congratulations',a,'You WIN\n',answer)
                break
        else:
            chance=chance-1
            print ('incorrect alpha try again')
            print ('\n')
        if chance == 0:
            print (a,'Your chances are left , YOU LOSE THE GAME')
            break
    else:
        print('Incorrect input , TRY AGAIN')
        print('\n')

