#!/bin/bash

for file in *.ppt *.pptx; do
    if [[ -f "$file" ]]; then
        echo "Converting $file to PDF..."
        libreoffice --headless --convert-to pdf "$file"
        
        
        if [[ $? -eq 0 ]]; then
            rm "$file"
        else
            echo "Conversion failed for $file"
        fi

        echo
        echo
    fi
done