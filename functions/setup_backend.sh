#!/bin/bash

setup_backend() {
    local backend_dir="$1"
    echo -e "\n${BLUE}Select Backend Configuration:${NC}"
    echo "1) Node.js only"
    echo "2) Node.js + Express"
    echo "3) Node.js + TypeScript"
    echo "4) Node.js + Express + TypeScript"
    echo "5) NestJS + TypeScript"
    read -p "Enter your choice (1-5): " backend_type

    mkdir -p "$backend_dir"
    cd "$backend_dir" || exit 1

    case $backend_type in
        1)
            echo "Setting up Node.js only..."
            npm init -y
            ;;
        2)
            echo "Setting up Node.js + Express..."
            npm init -y
            npm install express
            create_basic_express_file "index.js" "require"
            ;;
        3)
            echo "Setting up Node.js + TypeScript..."
            npm init -y
            npm install typescript ts-node @types/node --save-dev
            npx tsc --init
            create_basic_ts_file "index.ts"
            ;;
        4)
            echo "Setting up Node.js + Express + TypeScript..."
            npm init -y
            npm install express
            npm install typescript ts-node @types/node @types/express --save-dev
            npx tsc --init
            create_basic_express_file "index.ts" "import"
            ;;
        5)
            echo "Setting up NestJS + TypeScript..."
            npm i -g @nestjs/cli
            nest new . --skip-git --package-manager npm
            ;;
        *)
            echo "Invalid choice. Defaulting to Node.js only..."
            npm init -y
            ;;
    esac

    # Update package.json scripts
    update_package_scripts "$backend_type"
    cd - || exit 1
}

create_basic_express_file() {
    local filename="$1"
    local import_type="$2"
    if [ "$import_type" = "require" ]; then
        echo "const express = require('express');
const app = express();
app.listen(3000, () => console.log('Server running on port 3000'));" > "$filename"
    else
        echo "import express from 'express';
const app = express();
app.listen(3000, () => console.log('Server running on port 3000'));" > "$filename"
    fi
}

create_basic_ts_file() {
    local filename="$1"
    echo "console.log('Hello from TypeScript');" > "$filename"
}

update_package_scripts() {
    local backend_type="$1"
    if [ "$backend_type" -eq 3 ] || [ "$backend_type" -eq 4 ]; then
        sed -i '/"scripts": {/a \    "start": "ts-node index.ts",' package.json
    elif [ "$backend_type" -ne 5 ] && [ "$backend_type" -ne 0 ]; then
        sed -i '/"scripts": {/a \    "start": "node index.js",' package.json
    fi
}