#!/bin/bash

# Check if exactly one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Incorrect number of arguments provided."
    echo "Usage: $0 <day>"
    echo "Please provide exactly one number indicating the day. For example:"
    echo "$0 5"
    exit 1
fi

day=$1
dirName="day${day}"

# Check if the directory already exists
if [ -d "$dirName" ]; then
    echo "The directory '$dirName' already exists. No action taken."
else
    # Create directory named "day${day}"
    mkdir -p "$dirName"

    # Check if the directory was created successfully
    if [ $? -eq 0 ]; then
        # Since the directory is newly created, create a README.md file inside the directory
        touch "$dirName/README.md"
        
        # Add content to README.md
        echo "# day${day}" > "$dirName/README.md"
        echo "" >> "$dirName/README.md"
        echo "overview" >> "$dirName/README.md"
        echo "" >> "$dirName/README.md"
        echo "### question" >> "$dirName/README.md"
        echo "thoughts" >> "$dirName/README.md"
        echo "" >> "$dirName/README.md"
        echo "<details>" >> "$dirName/README.md"
        echo "<summary>code</summary>" >> "$dirName/README.md"
        echo "</details>" >> "$dirName/README.md"
        echo "" >> "$dirName/README.md"
        echo "# Conclusion" >> "$dirName/README.md"

        echo "Directory '$dirName' and README.md file created successfully, with initial content added."
    else
        echo "Failed to create directory '$dirName'."
        exit 1
    fi
fi
