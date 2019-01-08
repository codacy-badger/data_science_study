# LEGB [how to set from lower scope]
# Local Scope
#  Enclosing Functions aka, outer function [nonlocal]
#   Global [global]
#    Built-in


# inner flexible function using closure on scope
def power(n):  # n is set and closed when power() is called
    """Return the inner function."""

    # Define inner function
    def set_exp(value):  # when power() is called, value remains a variable
        """Create function to power of n."""
        return value ** n

    # return inner function
    return set_exp


square = power(2)
cube = power(3)

print(square(3))
print(cube(3))
