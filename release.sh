#!/bin/bash

# Ensure the script exits if any command fails
set -e

# Step 1: Upgrade pip
echo "Upgrading pip..."
python3 -m pip install --upgrade pip

# Step 2: Install the build package
echo "Installing build package..."
python3 -m pip install --upgrade build

# Step 3: Build the package
echo "Building the package..."
python3 -m build

# Step 4: Install the twine package
echo "Installing twine..."
python3 -m pip install --upgrade twine

# Step 5: Upload the package to TestPyPI
echo "Uploading the package to TestPyPI..."
python3 -m twine upload dist/* || {
    echo "Upload failed. Please check the error message above."
    exit 1
}

# Confirmation message
echo "Package uploaded to TestPyPI successfully!"
