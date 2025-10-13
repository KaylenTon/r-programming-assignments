# Assignment 7: Exploring R’s Object Oriented Systems (S3 &amp; S4)

mtcars <- mtcars
head(mtcars)
str(mtcars)
print(mtcars)

# creating an S3 class
profile <- list(character = "Chimmy", creator = "Jimin")
class(profile) = "BT21"
print(profile)

# custom function.class
print.BT21 <- function(obj) {
  cat("character: ", obj$character, "\n")
  cat("creator: ", obj$creator, "\n")
}
print(profile)
attributes(profile)

# adding an attribute
attr(profile, "color") <- c("yellow")
attributes(profile)

# Inheritance
profile <- function(n, r) {
  value <- list(character = n, creator = r)
  attr(value, "class") <- "BT21"
}
print.profile <- function(obj) {
  cat("character: ", obj$character, "\n")
  cat("creator: ", obj$creator, "\n")
}

RJ <- list(character = "RJ", creator = "Jin", color = "white")
class(profile) <- "BT21"
print.profile(RJ)

# creating an S4 class
setClass("Cast", slots = list(name = "character", age = "numeric"))
  # setClass(CLASSNAME, slots = list(ATTRIBUTE1 = "ABC", ATTRIBUTE2...))

# The new() function is used to create an object of the S4 class.
    # Note: $ operator not defined for this S4 class , so we will use @ operator instead.
Koffee <- new("Cast", name = "Koffee Morgan", age = 24)

# custom print method for S4 object
setMethod("print", "Cast", function(x) {
  cat("My main character is ", x@name, ".\n")
  cat("She debuts at age ", x@age, ".\n")
})
print(Koffee)

# Create S4 objects from the generator function
  # setClass() returns a generator function that helps in creating objects and it acts as a constructor.
cast <- setClass("Cast", slots = list(name = "character", age = "numeric"))
print(cast)
  # The new cast() function will act as the constructor for the Cast class. It will behave as the new() function.
  # EX:
    # Custom Show method
    setMethod("show", "Cast", function(object) { # In R’s S4 object system, the show() function is the default display (print) method for S4 objects.
      cat("name:", object@name, "\n")  # Use @ to access slots
      cat("age:", object@age, "\n")  # Use @ to access slots
    })
    
    Molly <- cast(name = "Molly Ichor", age = 15)
    show(Molly)
    Molly # basically redefined the basic print() function for S4 objects.

# Inheritance
setClass("cast",
         slots = list(name = "character", 
                      age = "numeric",
                      eyes = "character"))

setMethod("show", "cast",
          function(object){
            cat(object@name, "\n")
            cat(object@age, "\n")
            cat(object@eyes, "\n")
          })

setClass("VillainCharacter",
         slots = list(name = "character",
                      age = "numeric",
                      affiliation = "character"),
         contains = "cast"
        )

Glitch <- new("VillainCharacter", name = "Glitch", age = 28, affiliation = "cultist")
show(Glitch)
