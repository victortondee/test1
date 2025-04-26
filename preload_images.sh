#!/bin/bash

# Create a temporary file to store unique image URLs
temp_file="temp_urls.txt"

# Extract all image URLs from JSON data in HTML files
for file in *.html; do
    # Extract URLs from JSON data
    grep -o '"url":"[^"]*"' "$file" | sed 's/"url":"//g' | sed 's/"//g' >> "$temp_file"
done

# Sort and remove duplicates
sort -u "$temp_file" > "${temp_file}.sorted"
mv "${temp_file}.sorted" "$temp_file"

# Add preload links to each HTML file
for file in *.html; do
    # Create a temporary file for the modified content
    temp_html="temp_${file}"
    
    # Add preload links before the closing head tag
    while IFS= read -r url; do
        # Get the file extension
        ext="${url##*.}"
        # Add preload link
        sed -i '' "s|</head>|<link rel=\"preload\" href=\"$url\" as=\"image\" type=\"image/$ext\"/></head>|g" "$file"
    done < "$temp_file"
done

# Clean up temporary files
rm "$temp_file" 