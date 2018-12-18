####
#Conditionals
####

testvar <- 2002
testvar <- 1999

if (testvar > 2000){
  print("Greater than 2000")
}else{
  print("Less than or equal to 2000")
}

testvar > 2000 #greater than
testvar < 2000 #less than
testvar >= 2000 #greater than or equal to
testvar <= 2000 #less than or equal to
testvar == 2000 #equal to
testvar != 2000 #not equal to

testvar != 2000 & testvar > 2000 #and
testvar != 2000 | testvar > 2000 #or

####
#For Loops
####

values <- c(125, 81, 118, 81, 106, 121, 95, 100, 104)
for (val in values) {
  print(val)
}

for (i in 1:3) {
  print(i)
}

####
#While Loops
####

iteration <- 1

while (iteration <= 5) {
  print(c("Value# ", as.character(iteration), values[iteration]))
  iteration <- iteration + 1
}
