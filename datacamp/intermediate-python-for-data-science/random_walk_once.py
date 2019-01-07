import numpy as np
import matplotlib.pyplot as plt

# Constants
stepGoal = 60
random_walk = [0]
np.random.seed(123)

for x in range(100):
    step = random_walk[-1]

    dice = np.random.randint(1, 7)

    if dice <= 2:
        step = step - 1
    elif dice <= 5:
        step = step + 1
    else:
        step = step + np.random.randint(1, 7)

    random_walk.append(max(0, step))

plt.plot(random_walk)  # x, y
plt.show()
