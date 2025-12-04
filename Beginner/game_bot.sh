# Simple Chat Bot Script (Beginner Friendly)
# The bot greets the user, asks their name and passion, then plays a guessing game.
# User can choose to quit or continue after each round.

# Function to display a friendly welcome message
echo "==============================="
echo " Welcome to Friendly Chat Bot! "
echo "==============================="

# Ask for user's name
read -p "Hi there! What's your name? " USERNAME
echo "Nice to meet you, $USERNAME!"

# Ask about user's passion
read -p "What are you passionate about, $USERNAME? " PASSION
echo "Wow, $PASSION sounds awesome! Keep it up, $USERNAME."

# Main loop for the game
while true; do
	echo
	echo "Let's play a simple guessing game!"
	echo "I'm thinking of a number between 1 and 5. Can you guess it?"
	# Generate a random number between 1 and 5
	SECRET=$(( (RANDOM % 5) + 1 ))
	read -p "Enter your guess: " GUESS

	# Check if the guess is correct
	if [ "$GUESS" -eq "$SECRET" ] 2>/dev/null; then
		echo "Congratulations, $USERNAME! You guessed it right!"
	else
		echo "Oops! The correct number was $SECRET. Better luck next time!"
	fi

	# Ask if the user wants to play again or quit
	read -p "Do you want to play again? (y/n): " CHOICE
	if [ "$CHOICE" != "y" ]; then
		echo "Thanks for chatting and playing, $USERNAME! Have a great day!"
		break
	fi
done
