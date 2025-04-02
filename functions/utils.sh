#!/bin/bash

create_base_structure() {
    local project_root="$1"
    mkdir -p "$project_root"
    echo "Created project directory: $project_root"
}

display_instructions() {
    local project_root="$1"
    local setup_choice="$2"
    
    echo -e "\n${GREEN}Project setup complete!${NC}"
    echo "Directory structure:"
    ls -R "$project_root"
    
    case $setup_choice in
        1)
            echo -e "\nTo start the frontend: cd $project_root/frontend && npm start"
            ;;
        2)
            echo -e "\nTo start the backend: cd $project_root/backend && npm start"
            ;;
        3)
            echo -e "\nTo start the backend: cd $project_root/backend && npm start"
            echo "To start the frontend: cd $project_root/frontend && npm start"
            ;;
    esac
}