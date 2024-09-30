#!/bin/bash

delete_files=false
if [[ "$1" == "--delete" ]]; then
    delete_files=true
fi

for file in *.ppt *.pptx *.docx; do
    if [[ -f "$file" ]]; then
        echo "Converting $file to PDF..."
        libreoffice --headless --convert-to pdf "$file"
        
        if [[ $? -eq 0 ]]; then
            if [[ "$delete_files" == true ]]; then
                rm "$file"
            fi
        else
            echo "Conversion failed for $file"
        fi

        echo
        echo
    fi
done

echo
echo "Conversions completed."
