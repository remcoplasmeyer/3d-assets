#!/bin/bash

# Directory containing the MP3 files
DIRECTORY="./mp3"

# Iterate over all MP3 files in the directory
for FILE in "$DIRECTORY"/*.mp3; do
  # Get the original filename
  ORIGINAL_FILENAME=$(basename "$FILE")
  
  # Create a clean name by removing special characters and replacing spaces
  CLEAN_NAME=$(echo "$ORIGINAL_FILENAME" | sed -E 's/[^a-zA-Z0-9]+/-/g' | sed 's/-mp3$//').mp3
  
  # Rename the file
  mv "$FILE" "$DIRECTORY/$CLEAN_NAME"
  echo "Renamed: $ORIGINAL_FILENAME -> $CLEAN_NAME"
done

echo "Renaming completed!"
