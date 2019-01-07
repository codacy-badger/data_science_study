####
# numpy
####

import numpy as np

# Lists - cannot calculate over
height = [1.73, 1.68, 1.71, 1.86, 1.79]
weight = [65.4, 59.2, 63.6, 88.4, 68.7]

# No type checking!! Careful!
mix = [1.0, "is", True]
np_mix = np.array(mix)  # array(['1.0', 'is', 'True'], dtype='<U32')
# note types are coerced to str
# true == 1, False == 0 if coerced to numbers
type(np_mix)  # numpy package DOT nparray [n-dimensional array]

# create numpy arrays
np_height = np.array(height)
np_weight = np.array(weight)

bmi = np_weight / (np_height ** 2)

# recall values
bmi[1]
bmi > 23
bmi[bmi > 23]
np.logical_and(bmi > 21, bmi < 24)
np.logical_or(bmi < 21, bmi > 24)
np.logical_not(bmi > 21)

# 2D arrays
np_2d = np.array([height, weight])
np_2d.shape  # (2, 5)
np_2d[0][2]  # OR
np_2d[0, 2]

np_2d[:, 1:3]  # all rows, col indeces 1 and 2
np_2d[1, :]  # all second row

# summarizing
np.mean(np_height)
np.median(np_height)
np.corrcoef(np_height, np_weight)
np.std(np_height)
