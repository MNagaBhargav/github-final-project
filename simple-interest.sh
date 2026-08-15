#!/bin/bash
#
# simple-interest.sh
# A simple calculator to compute simple interest based on user input.
#
# Simple Interest (SI) = (Principal x Rate x Time) / 100

echo "===== Simple Interest Calculator ====="

read -p "Enter Principal Amount: " principal
read -p "Enter Rate of Interest (%): " rate
read -p "Enter Time Period (years): " time

# Validate that inputs are numeric
if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]] || \
   ! [[ "$rate" =~ ^[0-9]+([.][0-9]+)?$ ]] || \
   ! [[ "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Please enter valid numeric values for principal, rate, and time."
    exit 1
fi

# Calculate simple interest
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate total amount
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

echo "Simple Interest: $simple_interest"
echo "Total Amount: $total_amount"
