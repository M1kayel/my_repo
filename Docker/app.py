from flask import Flask
import random 
app = Flask(__name__)

@app.route('/')
def hello_world():
    return "HELLO WORLD!!!"

@app.route('/int')
def generate_int():
    random_int = random.randint(1,99999)
    #print('random int')
    return str(random_int)

@app.route('/color')
def generate_random_color():
        return "#{:06x}".format(random.randint(0, 0xFFFFFF))
