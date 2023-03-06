#!/bin/bash
if [ $# == 0 ]
then
    echo "Please supply a data set"
else
# initialize a variable to store the sum
sum=0

# read each line of the file
while read line; do
  # extract the number from the line
  number=$(echo "$line" | grep -Eo '[0-9]+')

  # add the number to the sum
  sum=$((sum + number))
done < $1

# output the sum
echo "The sum of the numbers in the file is: $sum"
fi

