import matplotlib.pyplot as plt
# import numpy as np

year = [1950, 1970, 1990, 2010]
pop = [2.519, 3.692, 5.263, 6.972]

gdp = [974, 5937, 6223, 4797, 12779, 34435, 36126, 29796, 1391, 33692]
life_exp = [43.82, 76.42, 72.3, 42.73, 75.32, 81.23, 79.82, 75.63, 64.0, 79.44]
pop10 = [31, 3, 33, 12, 40, 20, 8, 0, 150, 10]
col = ['red', 'green', 'blue', 'blue', 'yellow', 'black', 'green', 'red']
col = col + ['red', 'green']

# line
help(plt.plot)
plt.plot(year, pop)  # x, y
plt.xlabel("Year")
plt.ylabel("Population")
plt.title("World Population")
plt.yticks([0, 2, 4, 6, 8, 10], ["0", "2B", "4B", "6B", "8B", "10B"])
plt.show()
plt.clf()

# scatter
help(plt.scatter)
plt.scatter(gdp, life_exp, s=pop10, c=col, alpha=0.8)  # x, y, s = size
plt.text(1550, 71, 'India')
plt.text(5700, 80, 'China')
plt.grid(True)
plt.xscale('log')
plt.show()
plt.clf()

# histogram
help(plt.hist)
values = [0, 0.6, 1.4, 1.6, 2.2, 2.5, 2.6, 3.2, 3.5, 3.9, 4.2, 6]
plt.hist(values, bins=3)  # x, y
plt.show()
plt.clf()
