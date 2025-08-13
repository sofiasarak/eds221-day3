# basic if statement
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
