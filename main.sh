#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default project name
DEFAULT_PROJECT_NAME="my_project"
SCRIPT_DIR="$(dirname "$0")"

# Source helper functions
source "$SCRIPT_DIR/functions/setup_frontend.sh"
source "$SCRIPT_DIR/functions/setup_backend.sh"
source "$SCRIPT_DIR/functions/utils.sh"

echo -e "${GREEN}=== Project Setup Script ===${NC}\n"

# Ask for project name with default
echo -e "${BLUE}Enter project name (press Enter for default: $DEFAULT_PROJECT_NAME):${NC}"
read -p "Project name: " project_name

# Set project name to default if empty
if [ -z "$project_name" ]; then
    project_name="$DEFAULT_PROJECT_NAME"
fi

# Project root directory inside projects/
PROJECT_ROOT="$SCRIPT_DIR/projects/$project_name"

# Show main options
echo -e "\n${BLUE}Select Setup Option for $project_name:${NC}"
echo "1) Frontend only"
echo "2) Backend only"
echo "3) Frontend + Backend"
read -p "Enter your choice (1-3): " setup_choice

# Create base directory structure
create_base_structure "$PROJECT_ROOT"

case $setup_choice in
    1)
        setup_frontend "$PROJECT_ROOT/frontend"
        ;;
    2)
        setup_backend "$PROJECT_ROOT/backend"
        ;;
    3)
        setup_frontend "$PROJECT_ROOT/frontend"
        setup_backend "$PROJECT_ROOT/backend"
        ;;
    *)
        echo "Invalid choice. Exiting..."
        exit 1
        ;;
esac

# Display final instructions
display_instructions "$PROJECT_ROOT" "$setup_choice"