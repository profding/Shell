#!/bin/bash

echo -e "You should input 2 numbers:, I will cross them\n"

read -p "first number:" firstnum
read -p "second number:" secnum
total=$(($firstnum*$secnum))


echo -e "\nThe result: $total"



