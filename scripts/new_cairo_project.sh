# File: new_cairo_project.sh
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

# Initialize Scarb project
scarb new $PROJECT_NAME --name $PROJECT_NAME

# Remove any accidental .git directory
rm -rf .git

echo "Project $PROJECT_NAME created successfully in the monorepo."

# File: .gitignore (append to existing .gitignore in root)
# Ignore Scarb build artifacts
**/target/

# Ignore any nested .git directories
**/.git/

# File: .git/hooks/pre-commit
#!/bin/bash

# Check for nested .git directories
NESTED_GITS=$(find . -mindepth 2 -type d -name .git)

if [ -n "$NESTED_GITS" ]; then
    echo "Error: Nested .git directories found:"
    echo "$NESTED_GITS"
    echo "Please remove these before committing."
    exit 1
fi

# File: README.md (append to existing README or create new)
## Creating New Cairo Projects

To create a new Cairo project within this monorepo, use the provided script:

```bash
./scripts/new_cairo_project.sh <project_name>
```

This script will:
1. Create a new directory for your project
2. Initialize a new Scarb project
3. Ensure no nested Git repositories are created

Always use this script to create new projects to maintain the monorepo structure.