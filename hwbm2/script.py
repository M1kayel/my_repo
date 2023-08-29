def append_questions(file_name,text_append,right_answer,mstr):
    try:
        with open(file_name,'a') as file:
            file.write(text_append+right_answer+mstr+'\n')
        print('Text appended')
    except Exception as Error:
        print('Error')

def text_app(text_append):
    text_append += '?'
    return text_append

def right_ans(right_answer):
    right_answer += ','
    return right_answer

def wrong_var(a):
    while True:
        if len(a) == 3:
            mstr = ','.join(map(str,a))
            break
        else:
            print("Wrong input try again")
            a = input("Input the 3 wrong variants in one line").split()
            continue
    return mstr

def yes_no():
    while True:
        yn = input('do you want to add more? y/n')
        if yn == 'y':
            break
        elif yn == 'n':
            break
        else:
            print("wrong input try again")
            continue
    return yn

def question_exists(file_name, text_append):
    with open (file_name, 'r') as file:
        lines = file.readlines()
        for i in lines:
            if text_append  in i:
                return True
    return False

def main():
    file_name = 'questions.txt'
    while True:
        text_append = input('Enter the question')
        text_append = text_app(text_append)
        if question_exists(file_name, text_append):
            print("Question is alredy goten.Enter another one")
            continue
        right_answer = input('Enter the right answer')
        right_answer = right_ans(right_answer)
        a = input("Input the 3 wrong variants in one line").split()
        mstr = wrong_var(a)
        append_questions(file_name, text_append, right_answer, mstr)
        yn = yes_no()
        if yn == 'y':
            continue
        else:
            break
    print('Over')
main()
