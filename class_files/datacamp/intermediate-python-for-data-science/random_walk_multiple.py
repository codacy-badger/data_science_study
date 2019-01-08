import numpy as np
import matplotlib.pyplot as plt

# Constants
num_of_simulations = 500
fall_ratio = 0.001
np.random.seed(123)

stepGoal = 60
all_walks = []
num_won = 0

for i in range(num_of_simulations):
    random_walk = [0]
    isWon = False
    for x in range(100):
        step = random_walk[-1]
        dice = np.random.randint(1, 7)

        if dice <= 2:
            step = step - 1
        elif dice <= 5:
            step = step + 1
        else:
            step = step + np.random.randint(1, 7)

        if np.random.rand() <= fall_ratio:
            step = 0

        random_walk.append(max(0, step))

        if step >= 60:
            isWon = True
    all_walks.append(random_walk)
    if isWon:
        num_won = num_won + 1
np_allwalks = np.array(all_walks)
print(num_won)

plt.plot(np.transpose(np_allwalks))  # x, y
plt.show()
