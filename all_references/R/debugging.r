#provide error feedback
tryCatch(10 + "a", error = function(e) print("Oops, something went wrong!"))

#trycatch outside the loop to catch in the loop and stop loop after any error
tryCatch(
  for(i in 1:3){
    #for every number, i, in the sequence of 1,2,3:
    print(i + "a")
  }
  , error = function(e) print("Found error.") )

#trycatch warnings as well
tryCatch(as.integer("A"), warning = function(e) print("Warning.") )
