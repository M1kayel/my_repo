import speech_recognition as sr 

recognizer = sr.Recognizer()

def commande(command):
    if "open firfox" in command:
        print("Opening Firefox")
    elif "search" in command:
        q = command.replace("search","")
        print(f"Searching the web for '{query}'")
    else:
        print(f"Command not recognized: {command}")

with sr.Microphone() as source:
    print("Listening the command ...")
    try:
        audio = recognizer.listen(source, timeout=5)
        command = recognizer.recognize_google(audio)
        print(f"Recognized:{command}")
        commande(command)
    except sr.WaitTimeoutError:
        print("Listening timed out:")
    except sr.UnknownValueError:
        print("Could not understand audio:")
    except sr.RequestError as e:
        print(f"Could not request results: {e}")

