#!/bin/bash

# Add CSS file to all HTML files
for file in *.html; do
    # Add CSS link before the closing head tag
    sed -i '' 's|</head>|<link href="hide_webflow.css" rel="stylesheet" type="text/css"/></head>|g' "$file"
done 