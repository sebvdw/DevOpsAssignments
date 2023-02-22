#!/bin/sh

# Add your script here

# Generate a random number between 1 and 100
number=$((1 + RANDOM % 100))

# Initialize the user's guess to 0
guess=0

# Loop until the user guesses the correct number
while [ $guess -ne $number ]; do
  # Prompt the user to enter a guess
  read -p "Guess a number between 1 and 100: " guess

  # Check if the guess is too high or too low
  if [ $guess -lt $number ]; then
    echo "Higher"
  elif [ $guess -gt $number ]; then
    echo "Lower"
  fi
done

# Congratulate the user on guessing the correct number
echo "Congratulations! You guessed the number."