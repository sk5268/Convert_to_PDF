@echo off
setlocal

set delete_files=false
if "%1" == "--delete" (
    set delete_files=true
)

for %%f in (*.ppt *.pptx *.docx *.odt) do (
    if exist "%%f" (
        echo Converting %%f to PDF...
        "C:\Program Files\LibreOffice\program\soffice" --headless --convert-to pdf "%%f"

        if %errorlevel%==0 (
            if "%delete_files%"=="true" (
                del "%%f"
            )
        ) else (
            echo Conversion failed for %%f
        )

        echo.
        echo.
    )
)

echo.
echo Conversions completed.

endlocal
