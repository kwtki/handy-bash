#!/bin/bash

# This script converts all PDF files in the current directory into JPG images
# using 'pdftoppm' (part of the Poppler utilities). The output images will be
# saved into a new folder called './jpg_output' inside the current directory.

# Ensure pdftoppm is available
if ! command -v pdftoppm &> /dev/null
then
    echo "Error: pdftoppm (from poppler) is not installed. Install it via 'brew install poppler'"
    exit 1
fi

# Create output directory in the current folder
mkdir -p jpg_output

# Convert each PDF in the current directory to JPG
for pdf in *.pdf; do
    if [[ -f "$pdf" ]]; then
        base="${pdf%.pdf}"  # Remove the .pdf extension to use as filename base
        echo "Converting '$pdf' to JPG..."
        # Output files will be named like: jpg_output/filename-1.jpg, filename-2.jpg, etc.
        pdftoppm "$pdf" "jpg_output/${base}" -jpeg
    fi
done

echo "✅ All PDFs have been converted to JPGs in the 'jpg_output/' folder."