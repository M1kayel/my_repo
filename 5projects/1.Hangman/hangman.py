import random
import os

class HangmanGame:
    def __init__(self):
        self.word_completion = ""
        self.guessed = False
        self.guessed_letters = []
        self.guessed_words = []
        self.tries = 6

    def check_file_existence(self):
        return os.path.exists('words.py')

    def get_word_list(self):
        if self.check_file_existence():
            from words import word_list
            return word_list
        print("Your file does not exist: Please check.")
        return False

    def get_word(self, word_list):
        word = random.choice(word_list)
        return word.upper()

    def display_hangman(self):
        stages = [
            """
              ----------
              |        |
              |        O
              |       \|/
              |       / \\
              |
              -
            """,

            """
            ----------
             |        |
             |        O
             |       \|/
             |       / 
             |
             -
             """,

            """
              ----------
              |        |
              |        O
              |       \|/
              |       
              |
              -
            """,

            """
              ----------
              |        |
              |        O
              |       \|
              |       
              |
              -
            """,

            """
              ----------
              |        |
              |        O
              |        |
              |       
              |
              -
            """,

            """
              ----------
              |        |
              |        O
              |       
              |       
              |
              -
            """,

            """
              ----------
              |        |
              |        
              |       
              |       
              |
              -
            """
        ]
        return stages[self.tries]

    def play(self, word):
        self.word_completion = "*" * len(word)

        print("The HANGMAN game begins")
        print(self.display_hangman())
        print(self.word_completion)
        print()

        while not self.guessed and self.tries > 0:
            guess = input("Input a letter: ").upper()
            if len(guess) == 1 and guess.isalpha():
                self.letter_guess(guess, word)
            elif len(guess) == len(word) and guess.isalpha():
                self.full_word_guess(guess, word)
            else:
                print("Invalid input. Try again...")

            print(self.display_hangman())
            print(self.word_completion)
            print()

        if self.guessed:
            print("Congrats, You Win!!!")
        else:
            print("You lose the game, the word was", word)

    def letter_guess(self, guess, word):
        if guess in self.guessed_letters:
            print("You already guessed the letter", guess)
        elif guess not in word:
            print(guess, "is not in the word.")
            self.tries -= 1
            self.guessed_letters.append(guess)
        else:
            print("Success", guess, "is in the word.")
            self.guessed_letters.append(guess)
            word_as_list = list(self.word_completion)
            # indices = []
            # for i, letter in enumerate(word):
            #     if letter == guess:
            #         indices.append(i)
            indices = [i for i, letter in enumerate(word) if letter == guess]
            for i in indices:
                word_as_list[i] = guess
            self.word_completion = "".join(word_as_list)
            if "*" not in self.word_completion:
                self.guessed = True

    def full_word_guess(self, guess, word):
        if guess in self.guessed_words:
            print("You already guessed the word", guess)
        elif guess != word:
            print(guess, "The guess is incorrect.")
            self.tries -= 1
            self.guessed_words.append(guess)
        else:
            self.guessed = True
            self.word_completion = word

    def main(self):
        file_exists = self.check_file_existence()
        if not file_exists:
            print("The file does not exist. Please check.")
            return
        while True:
            word_list = self.get_word_list()
            word = self.get_word(word_list)
            self.play(word)
            play_again = input("Do you want to play again? (y/n): ").upper()
            if play_again != "Y":
                print("Thanks for playing. Goodbye.")
                break
            self.guessed = False
            self.guessed_letters = []
            self.guessed_words = []
            self.tries = 6 

if __name__ == "__main__":
    game = HangmanGame()
    game.main()

