#!/bin/bash

# Remove Webflow-related elements and comments from all HTML files
for file in *.html; do
    # Remove Webflow comments
    sed -i '' 's|<!-- This site was created in Webflow. https://webflow.com -->||g' "$file"
    sed -i '' 's|<!-- Last Published:.*-->||g' "$file"
    
    # Remove Webflow data attributes
    sed -i '' 's|data-wf-domain="[^"]*"||g' "$file"
    sed -i '' 's|data-wf-page="[^"]*"||g' "$file"
    sed -i '' 's|data-wf-site="[^"]*"||g' "$file"
    sed -i '' 's|data-wf-status="[^"]*"||g' "$file"
    
    # Remove Webflow generator meta tag
    sed -i '' 's|<meta content="Webflow" name="generator"/>||g' "$file"
    
    # Remove Webflow JavaScript files
    sed -i '' 's|<script src="https://cdn.prod.website-files.com/[^"]*webflow[^"]*" type="text/javascript"></script>||g' "$file"
done 