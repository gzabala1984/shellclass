#!/bin/bash

# This script displays various information to the screen.

# Display 'Hello'
echo 'Hello'

# Assign a value to a variable
WORD='script'

echo "$WORD"
echo "${WORD}_test"

# Demonstrate that single quotes does not do expansion

echo '$WORD'
