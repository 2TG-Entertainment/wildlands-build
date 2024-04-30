#!/bin/bash

# Path to your Unity WebGL build directory (adjust as necessary)
ROOT_DIR="."
IMG_NAME="faenora.jpg"

# Path to the index.html and custom.css in the build directory
INDEX_PATH="$ROOT_DIR/index.html"
CUSTOM_CSS_PATH="$ROOT_DIR/custom.css"
UNITY_CSS_PATH="$ROOT_DIR/TemplateData/style.css"

# Ensure paths are correct and files exist
if [ ! -f "$INDEX_PATH" ]; then
    echo "index.html not found in the specified directory."
    exit 1
fi

if [ ! -f "$UNITY_CSS_PATH" ]; then
    echo "Unity style.css not found in the specified directory."
    exit 1
fi

if [ ! -f "$CUSTOM_CSS_PATH" ]; then
    touch custom.css
    echo "Created custom.css."
fi

# Check for macOS and adjust sed command accordingly
if [[ "$OSTYPE" == "darwin"* ]]; then
    SED_CMD="sed "
else
    SED_CMD="sed -i"
fi

# Add a link to the custom.css file in the index.html just before the </head> tag
$SED_CMD "/<\/head>/i \\
<link rel=\"stylesheet\" href=\"custom.css\">" "$INDEX_PATH"

# Add custom background image style to custom.css
echo "body {" > "$CUSTOM_CSS_PATH"
echo "    background-image: url($IMG_NAME);" >> "$CUSTOM_CSS_PATH"
echo "    background-size: cover;" >> "$CUSTOM_CSS_PATH"
echo "    background-position: center center;" >> "$CUSTOM_CSS_PATH"
echo "    background-repeat: no-repeat;" >> "$CUSTOM_CSS_PATH"
echo "    min-height: 100vh;" >> "$CUSTOM_CSS_PATH"
echo "}" >> "$CUSTOM_CSS_PATH"

echo "index.html and custom.css have been successfully modified."
