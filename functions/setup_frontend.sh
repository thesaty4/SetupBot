#!/bin/bash

setup_frontend() {
    local frontend_dir="$1"
    local project_name=$(basename "$frontend_dir")  # Extract project name from path

    echo -e "\n${BLUE}Select Frontend Configuration:${NC}"
    echo "1) Angular + TypeScript"
    echo "2) React + TypeScript"
    read -p "Enter your choice (1-2): " frontend_type

    mkdir -p "$frontend_dir"
    cd "$frontend_dir" || exit 1

    case $frontend_type in
        1)
            echo "Setting up Angular + TypeScript..."
            npm install -g @angular/cli
            # Use the project name instead of just "." and create in current directory
            ng new frontend --directory . --skip-git --routing --skip-install
            npm install
            ;;
        2)
            echo "Setting up React + TypeScript..."
            npx create-react-app . --template typescript --use-npm
            ;;
        *)
            echo "Invalid choice. Defaulting to React + TypeScript..."
            npx create-react-app . --template typescript --use-npm
            ;;
    esac

    cd - || exit 1
}