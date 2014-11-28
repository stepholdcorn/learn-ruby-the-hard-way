def start
	puts "You are in a dark room at Hogwarts."
	puts "There is a door to your left and one to your right."
	puts "Which one do you take?"
	
	print "> "
	choice = $stdin.gets.chomp.downcase
	
	if choice == "left"
		potions_room
	elsif choice == "right"
		monster_room
	else	
		dead("You stumble over Ron and hit your head.")
end
end

def dead(cause)
	puts cause, "GAME OVER!"
	exit(0)
end

def potions_room
	puts "You have entered the Potions Room."
	puts "Here you are challenged by Snape to make a potion that can either give you magical powers, or...kill you!"
	puts "Do you flee or stay to make the potion?"
	
	print "> "
	potion = $stdin.gets.chomp.downcase
	
	if potion.include? "flee"
	start
	elsif potion.include? "stay"
	dead("Uh oh, that potion is not making you feel well...")
	else
	potions_room
end
end

def monster_room
puts "Oh my, you have entered a room with a three-headed dog!"
puts "It looks to be standing over a trap door."
puts "You notice a harp in the corner, maybe the music would put the dog to sleep?!"
puts "Or you could just take your chances and run?"
dog_moved = false

while true
print "< "
decision = $stdin.gets.chomp.downcase

if decision.include? "run"
dead("The dog catches you...")

elsif decision.include? "harp" and not dog_moved
puts "The dog has fallen asleep, you run and go through a trap door unseen."
# dog_moved = true
gold_room

else puts "I don't know what that means, try again."
end
end
end

def gold_room
puts "Wow you've entered a room full of gallions!"
puts "How much do you take?"

print "< "
amount = $stdin.gets.chomp.to_i

if amount < 1000
puts "That's a good amount, not too greedy. Congratulations you have won!"
exit(0)
else
dead("Oh no the three-headed dog has woken up, and the weight of all those galleons slows you down!")
end
end

start