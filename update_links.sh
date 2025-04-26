#!/bin/bash

# Update navigation links in all HTML files
for file in *.html; do
    # Update the navigation links
    sed -i '' 's|href="/"|href="index.html"|g' "$file"
    sed -i '' 's|href="/showcase"|href="showcase.html"|g' "$file"
    sed -i '' 's|href="/double-exposure"|href="double-exposure.html"|g' "$file"
    sed -i '' 's|href="/paintography"|href="paintography.html"|g' "$file"
    sed -i '' 's|href="/self-reflection"|href="self-reflection.html"|g' "$file"
    sed -i '' 's|href="/heritage"|href="heritage.html"|g' "$file"
    sed -i '' 's|href="/contact"|href="contact.html"|g' "$file"
done 