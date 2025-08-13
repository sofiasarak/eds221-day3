## Basic if statement practice
burrito <- 1.5 #assigning an object value

#write a short if statement; prints I love burritos! will change depending on burrito value, if rerun
if (burrito > 2) {
  print("I love burritos")
} 
#*good way to debug is to run lines of code within the {} to see if they work independently

#example with strings
my_ships <- c("Millenium Falcon", "X-wing", "Tie-Fighter", "Death Star")
stringr::str_detect(my_ships, pattern = "r") #which ships have an r in their name; didn't load stringr but can use w ::
#output is list of TRUE/FALSE

#using str_detect in an if statement
phrase <- "I hate burritos!"

if(stringr::str_detect(phrase, "love")){
  print("Big burrito fan")
}

#basic if-else statement

pika <- 59.1 #storing a value to an object

if(pika>60){ #define size of mega pikas
  print("mega pika")
} else { #otherwise print normal
  print("normal pika")
}

#another example with strings

food <- "I love burritos!"

if(stringr::str_detect(food, pattern = "burritos")){
  print("yay burritos")
} else {
  print("what about burritos?")
}

#more than two outcomes (stringing together if-else statements)

marmot <- 3.8

if(marmot < 0.5){ #defining small marmots
  print("small")
} else if(marmot>= 0.5 & marmot<3){ #defining medium marmots
  print("medium")
} else { #defining large marmots
  print("large")
}
#good idea to test out values that go in each of the categories to make sure you get the right thing back!

#using the switch function to write complicated if-else statements

species <- "mouse"

#all of this code is the same as several if else statement
switch(species,
       "cat" = print("meow"), #this line is same as writing an if statement
       "dog" = print("woof"), #same as an else if statement
       "mouse" = print("squeak")) #same as last else if

#see next week dplyr::case_when()! will do something really similar


## Writing for loops

dog_names <- c("Teddy", "Khora", "Banjo", "Waffle")
#we're going to access the dog names from this vector (data structure)

paste("My dog's name is", dog_names[1]) #returns the phrase with Teddy!; example for one data element to put into for loop

print(paste("My dog's name is", dog_names[1]))

#*paste() is for joining strings together, print() is just for printing them

#version with copy and pasting
print(paste("My dog's name is", dog_names[1]))
print(paste("My dog's name is", dog_names[2]))
print(paste("My dog's name is", dog_names[3]))
print(paste("My dog's name is", dog_names[4]))

#version with a variable that I can update
pupster <- dog_names[1]
print(paste("My dog's name is", pupster)) #prints phrase with Teddy (bc pupster = 1 and Teddy is in position 1)

#convert to a for loop

for (pupster in dog_names) {
  print(paste("My dog's name is", pupster)) #don't need to index out of dog_names in this case
}

#another for loop example

mass <- seq(from=0, to=3, by=0.5) #data that I'm working with

#update each value by 2 and then print it out

#practicing body of the for loop
i <- mass[1]
new_val <- i + 2 
print(new_val) #printing new value

#write into a for loop
for(i in mass){
  new_val <- i + 2 
  print(new_val)
} #prints out the list of values!

#practice same example but with indexing 
i <- 1
new_val <- mass[i] + 2 #telling it to go access the data and pull out the element 
print(new_val) # if i = 1, we will get back 2

#write into a for loop
for (i in 1:length(mass)) { # defining iterator using the length of the vector; it essentially says "1:7"
  new_val <- mass[i] + 2 #telling it to go access the data and pull out the element 
  print(new_val)
}

for (i in seq_along(mass)) { # defining iterator using seq_along(); creates list 1 through 7
  new_val <- mass[i] + 2 #telling it to go access the data and pull out the element 
  print(new_val)
}

#another example with iterating by position (indexing)
tree_height <- c(1,2,6,10)

#example for the first case
tree_height[1] + tree_height[2]

#convert into a generalizable expression
i <- 1
val <- tree_height[i] + tree_height[i+1] #can only have one iterator at a time
print(val)

#convert into a for loop
#test out creating the sequence
seq_along(tree_height) #creates list with values 1 through 4

#find sum of value + next value in the sequence
for (i in 1:length(tree_height)) {
  sum <- tree_height[i] + tree_height[i+1]
  print(sum)
} #normally don't have any values stores for i

#with for loops, start with the simplest possible case, then try it with an iterator (by storing value for i),
#and THEN write it into your for loop

#for loops with conditional statements

#create a vector of animals
animal <- c("cat", "dog","dog", "zebra", "dog")

one_animal <- animal[1]
one_animal

i <- 3
rm(i) #removes i from the environment

if (animal[i]=="dog") {
  print("I love dogs!")
} else {
  print("These are other animals")
}

for(i in 1:length(animal)) {
  if (animal[i]=="dog"){
    print("I love dogs!")
  }else {
    print("these are other animals")
  }
}

#another for loop example with conditionals

#animal species
species <- c("dog", "elephant", "goat", "dog", "dog", "elephant")

#and their respective ages in human years
age_human <- c(3,8,4,6,12,18)

#convert ages to "animal years" equivalent using the following:
# 1 human year = 7 in dog years
# 1 human year = 0.88 in elephant years
# 1 human year = 4.7 in goat years

# allocate a space for our output; creates an empty vector of the proper length
animal_ages <- vector(mode = "numeric", length = length(species))

#defining i so we can test
i <- 2
if(species[i] == "dog") {
  animal_age <- age_human[i] * 7
} else if (species[i]=="elephant"){
  animal_age <- age_human[i] * 0.88
} else if(species[i]=="goat") {
  animal_age <- age_human[i] * 4.7
} #brackets ARE necessary for the last else if portion 

#making it a for loop
for (i in seq_along(species)) {
  if(species[i] == "dog") {
    animal_age <- age_human[i] * 7
  } else if (species[i]=="elephant"){
    animal_age <- age_human[i] * 0.88
  } else if (species[i]=="goat") {
    animal_age <- age_human[i] * 4.7
  }
  print(animal_age)
} #prints all of the animal ages! but only saves the LAST animal age run as animal_age

#saving the values we make
for (i in seq_along(species)) {
  if(species[i] == "dog") {
    animal_age <- age_human[i] * 7
  } else if (species[i]=="elephant"){
    animal_age <- age_human[i] * 0.88
  } else if (species[i]=="goat") {
    animal_age <- age_human[i] * 4.7
  }
 animal_ages[i] <- animal_age #populate empty vector 
} 

#another example of storing an output

tigers <- c(29,34,82)
lions <- c(2,18,6)

big_cats <- vector(mode="numeric", length=length(tigers))

for(i in seq_along(tigers)){
total_cats <- tigers[i] + lions[i]
big_cats[i] <- total_cats
}

#same thing would be
for(i in seq_along(tigers)){
  big_cats[i] <- tigers[i] + lions[i]
}
#but in one line!


# For loops to iterate across columns of data frame

#create vector to store values
mean_mtcars <- vector(mode="numeric", length=ncol(mtcars))

for(i in 1:ncol(mtcars)){
mean_val <- mean(mtcars[[i]], na.rm = TRUE)
mean_mtcars[i] <- mean_val
} #created summaries (means) for each of these columns

# a for loop over columns with a condition, because for df not all columns are numeric!

library(palmerpenguins)

penguins_mediancol3 <- median(penguins[[3]], na.rm=TRUE)
rm(penguins)

i <- 3
if (is.numeric(penguins[[i]])){
  penguins_median <- median(penguins[[i]], na.rm=TRUE)
}

for(i in 1:ncol(penguins)) {
  if (is.numeric(penguins[[i]])){
    penguins_median <- median(penguins[[i]], na.rm=TRUE)
    print(penguins_median)
  } else print("data not numeric")
}

# Functional programming

# apply function iterates over columns or rows

#rewrite our for loop for finding mean values of the columns in mtcars
mean_mtcars2 <- apply(X = mtcars, MARGIN = 2, FUN = mean)
#same as saying apply the function mean across the columns in mtcars

#trying functional programming with what we had done to the palmer penguins data frame
library(tidyverse)


penguin_summary <- penguins |> 
  group_by(species) |>
  summarise(across(where(is.numeric), mean, na.rm=TRUE)) #get a warning message but get the mean of all columns by species!
#stored summary as variable!