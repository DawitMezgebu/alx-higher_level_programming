#!/bin/bash

# Check if two arguments are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <URL> <JSON file>"
    exit 1
fi

# Check if the second argument is a valid JSON file
if ! jq '.' "$2" > /dev/null 2>&1; then
    echo "Not a valid JSON"
    exit 1
fi

# Send POST request with JSON file content in the body
response=$(curl -s -H "Content-Type: application/json" -X POST -d @"$2" "$1")

# Display response body
echo "$response"
