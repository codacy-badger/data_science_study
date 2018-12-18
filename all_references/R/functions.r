simplefunction <- function() {
  print("Hello World")
}

simplefunction()

basicaddfunction <- function(x, y) {
  return (x + y)
}

print(basicaddfunction(1, 2))

complexdefaultfunction <- function(input, threshold = 7) {
  if (input >= threshold) {
    print("Yes")
  } else {
    print("No")
  }
}

complexdefaultfunction(8)
complexdefaultfunction(8, 9)

#variables created in function with <- are local scope only
#variables created in function with <<- are global but linter will complain
