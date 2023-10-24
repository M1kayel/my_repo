import pygame
import sys
import random

class SnakeGame:
    def __init__(self):
        self.WIDTH, self.HEIGHT = 800, 600
        self.GRID_SIZE = 20
        self.GRID_WIDTH = self.WIDTH // self.GRID_SIZE
        self.GRID_HEIGHT = self.HEIGHT // self.GRID_SIZE
        self.SNAKE_SPEED = 1
        self.SPEED_INCREMENT = 1
        
        self.BLACK = (0, 0, 0)
        self.GREEN = (0, 255, 0)
        self.RED = (255, 0, 0)
        self.WHITE = (255, 255, 255)

        pygame.init()
        self.screen = pygame.display.set_mode((self.WIDTH, self.HEIGHT))
        pygame.display.set_caption('Snake Xenzia')

        self.font = pygame.font.Font(None, 36)
        self.score_font = pygame.font.Font(None, 24)

        self.score = 0
        self.snake, self.snake_direction = self.initialize_snake()
        self.food = self.initialize_food()
        self.game_over = False

    def initialize_snake(self):
        snake = [(self.GRID_WIDTH // 2, self.GRID_HEIGHT // 2)]
        snake_direction = (1, 0)
        return snake, snake_direction

    def initialize_food(self):
        food = (random.randint(0, self.GRID_WIDTH - 1), random.randint(0, self.GRID_HEIGHT - 1))
        return food

    def display_score(self):
        score_text = self.score_font.render(f"Score: {self.score}", True, self.WHITE)
        self.screen.blit(score_text, (10, 10))

    def show_start_menu(self):
        title_text = self.font.render("Snake Xenzia", True, self.WHITE)
        start_text = self.font.render("Press SPACE to start", True, self.WHITE)

        instruction_image = pygame.image.load("snake.jpg")
        self.screen.fill(self.BLACK)
        self.screen.blit(instruction_image, (10, 30))
        self.screen.blit(title_text, (self.WIDTH // 2 - 300, self.HEIGHT // 2 - 300))
        self.screen.blit(start_text, (self.WIDTH // 2 - 150, self.HEIGHT // 2 + 150))

        instructions = [
            "Instructions:",
            "1. Use arrow keys to control the snake's direction.",
            "2. Try to eat the red squares to grow your snake.",
            "3. Avoid running into the walls or yourself.",
            "4. Press SPACE to start the game.",
            "5. Have fun and achieve the highest score!",
        ]

        for i, instruction in enumerate(instructions):
            text = self.font.render(instruction, True, self.WHITE)
            self.screen.blit(text, (50, self.HEIGHT // 5 + i * 50))

        pygame.display.update()

        waiting_for_start = True
        while waiting_for_start:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    pygame.quit()
                    sys.exit()
                elif event.type == pygame.KEYDOWN and event.key == pygame.K_SPACE:
                    waiting_for_start = False
    
    def show_game_over_menu(self):
        game_over_font = pygame.font.Font(None, 36)
        game_over_text = game_over_font.render("Game Over", True, self.WHITE)
        score_text = game_over_font.render(f"Your Score: {self.score}", True, self.WHITE)
        play_again_text = game_over_font.render("Press SPACE to play again or ESC to quit", True, self.WHITE)

        self.screen.blit(game_over_text, (self.WIDTH // 2 - 100, self.HEIGHT // 2 - 50))
        self.screen.blit(score_text, (self.WIDTH // 2 - 100, self.HEIGHT // 2 + 50))
        self.screen.blit(play_again_text, (self.WIDTH // 2 - 300, self.HEIGHT // 2 + 150))
        pygame.display.update()

        waiting_for_choice = True
        while waiting_for_choice:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    pygame.quit()
                    sys.exit()
                elif event.type == pygame.KEYDOWN:
                    if event.key == pygame.K_SPACE:
                        self.reset_game()
                        waiting_for_choice = False
                    elif event.key == pygame.K_ESCAPE:
                        pygame.quit()
                        sys.exit()

    def reset_game(self):
        self.score = 0
        self.snake, self.snake_direction = self.initialize_snake()
        self.food = self.initialize_food()
        self.game_over = False
        self.SNAKE_SPEED = 1

    def game_loop(self):
        while not self.game_over:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    self.game_over = True
                elif event.type == pygame.KEYDOWN:
                    if event.key == pygame.K_UP and self.snake_direction != (0, 1):
                        self.snake_direction = (0, -1)
                    elif event.key == pygame.K_DOWN and self.snake_direction != (0, -1):
                        self.snake_direction = (0, 1)
                    elif event.key == pygame.K_LEFT and self.snake_direction != (1, 0):
                        self.snake_direction = (-1, 0)
                    elif event.key == pygame.K_RIGHT and self.snake_direction != (-1, 0):
                        self.snake_direction = (1, 0)

            new_head = (self.snake[0][0] + self.snake_direction[0], self.snake[0][1] + self.snake_direction[1])

            if new_head == self.food:
                self.snake.insert(0, self.food)
                self.food = (random.randint(0, self.GRID_WIDTH - 1), random.randint(0, self.GRID_HEIGHT - 1))
                self.score += 1
                self.SNAKE_SPEED += self.SPEED_INCREMENT
            elif (
                new_head in self.snake
                or new_head[0] < 0
                or new_head[0] >= self.GRID_WIDTH
                or new_head[1] < 0
                or new_head[1] >= self.GRID_HEIGHT
            ):
                self.game_over = True
            else:
                self.snake.insert(0, new_head)
                self.snake.pop()

            self.screen.fill(self.BLACK)
            for segment in self.snake:
                pygame.draw.rect(self.screen, self.GREEN, (segment[0] * self.GRID_SIZE, segment[1] * self.GRID_SIZE, self.GRID_SIZE, self.GRID_SIZE))
            pygame.draw.rect(self.screen, self.RED, (self.food[0] * self.GRID_SIZE, self.food[1] * self.GRID_SIZE, self.GRID_SIZE, self.GRID_SIZE))
            self.display_score()
            pygame.display.update()

            if self.game_over:
                self.show_game_over_menu()
            pygame.time.delay(1000 // self.SNAKE_SPEED)



    def main(self):
        self.show_start_menu()
        self.game_loop()
        pygame.time.delay(3000)
        pygame.quit()
        sys.exit()

if __name__ == "__main__":
    game = SnakeGame()
    game.main()

