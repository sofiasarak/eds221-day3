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