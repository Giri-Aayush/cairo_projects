#!/bin/bash

set -e

if [ $# -eq 0 ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi

PROJECT_NAME=$1
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

# Create project directory
mkdir -p "$ROOT_DIR/$PROJECT_NAME"
cd "$ROOT_DIR/$PROJECT_NAME"

# Initialize Scarb project without creating an additional directory
scarb init --name $PROJECT_NAME

# Remove any accidental .git directory
rm -rf .git

# Update .gitignore in the root directory
cat << EOF >> "$ROOT_DIR/.gitignore"

# Ignore Scarb build artifacts for $PROJECT_NAME
$PROJECT_NAME/target/
EOF

echo "Project $PROJECT_NAME created successfully in the monorepo."
echo "Updated .gitignore in the root directory."