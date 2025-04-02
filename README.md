# Project Setup Script

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Bash](https://img.shields.io/badge/Bash-4.0+-green.svg)

## Overview

The **Project Setup Script** is an open-source Bash utility designed to streamline the process of initializing web development projects. It provides a flexible, interactive way to set up frontend, backend, or full-stack applications with popular frameworks and technologies. Whether you're a beginner looking to quickly scaffold a project or an experienced developer wanting to automate repetitive setup tasks, this script has you covered.

The script supports multiple configurations:
- **Frontend Options**: Angular + TypeScript, React + TypeScript
- **Backend Options**: Node.js, Node.js + Express, Node.js + TypeScript, Node.js + Express + TypeScript, NestJS + TypeScript
- **Setup Choices**: Frontend only, Backend only, or both Frontend + Backend

Projects are organized under a `projects/` directory with a user-defined or default name, making it easy to manage multiple projects.

## Features

- **Interactive CLI**: Step-by-step prompts to choose project name and setup type
- **Modular Design**: Separate scripts for frontend, backend, and utility functions
- **Customizable**: Specify your project name or use the default ("my_project")
- **Best Practices**: Follows Bash scripting conventions with error handling and clean structure
- **Cross-Platform**: Works on Unix-like systems (Linux, macOS, WSL on Windows)
- **Open Source**: Licensed under MIT, free to use and modify

## Prerequisites

Before using this script, ensure you have the following installed:
- **Bash** (version 4.0 or higher)
- **Node.js** and **npm** (latest LTS recommended)
- **Git** (optional, for cloning the repository)

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/[your-username]/project-setup-script.git
   cd project-setup-script
   ```

2. **Make the Script Executable**:
   ```bash
   chmod +x setup_project.sh
   ```

## Usage

1. **Run the Script**:
   ```bash
   ./setup_project.sh
   ```

2. **Follow the Prompts**:
   - **Project Name**: Enter a name for your project or press Enter for the default (`my_project`). The name must contain only letters, numbers, hyphens, dots, or underscores, and start with a letter or number.
   - **Setup Option**: Choose one of:
     - `1) Frontend only`
     - `2) Backend only`
     - `3) Frontend + Backend`

3. **Configure Frontend (if selected)**:
   - Choose between:
     - `1) Angular + TypeScript`
     - `2) React + TypeScript`

4. **Configure Backend (if selected)**:
   - Choose between:
     - `1) Node.js only`
     - `2) Node.js + Express`
     - `3) Node.js + TypeScript`
     - `4) Node.js + Express + TypeScript`
     - `5) NestJS + TypeScript`

5. **Project Creation**:
   - The script creates a directory structure under `projects/[project_name]/` with the selected components.
   - Example structure for a full-stack project:
     ```
     projects/my_project/
     ├── frontend/
     └── backend/
     ```

6. **Start Your Project**:
   - Follow the on-screen instructions to navigate to the created directories and run:
     - Frontend: `cd projects/[project_name]/frontend && npm start`
     - Backend: `cd projects/[project_name]/backend && npm start`

## Project Structure

The repository is organized as follows:
```
project-setup-script/
├── setup_project.sh       # Main script
├── functions/            # Helper scripts
│   ├── setup_frontend.sh # Frontend setup logic
│   ├── setup_backend.sh  # Backend setup logic
│   └── utils.sh          # Utility functions
├── projects/             # Generated projects go here
└── README.md             # This file
```

## Examples

### Creating a Full-Stack Project
```bash
$ ./setup_project.sh
=== Project Setup Script ===

Enter project name (press Enter for default: my_project):
Project name: myapp

Select Setup Option for myapp:
1) Frontend only
2) Backend only
3) Frontend + Backend
Enter your choice (1-3): 3

Select Frontend Configuration:
1) Angular + TypeScript
2) React + TypeScript
Enter your choice (1-2): 1

Select Backend Configuration:
1) Node.js only
2) Node.js + Express
3) Node.js + TypeScript
4) Node.js + Express + TypeScript
5) NestJS + TypeScript
Enter your choice (1-5): 4

# ... setup process runs ...

Project setup complete!
To start the backend: cd projects/myapp/backend && npm start
To start the frontend: cd projects/myapp/frontend && npm start
```

### Creating a Frontend-Only Project
```bash
$ ./setup_project.sh
=== Project Setup Script ===

Enter project name (press Enter for default: my_project):
Project name: [Enter]

Select Setup Option for my_project:
1) Frontend only
2) Backend only
3) Frontend + Backend
Enter your choice (1-3): 1

Select Frontend Configuration:
1) Angular + TypeScript
2) React + TypeScript
Enter your choice (1-2): 2

# ... setup process runs ...

Project setup complete!
To start the frontend: cd projects/my_project/frontend && npm start
```

## Contributing

Contributions are welcome! Here's how to get involved:

1. **Fork the Repository**
2. **Create a Feature Branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make Changes**: Enhance the script, add new frameworks, or improve documentation
4. **Commit Changes**:
   ```bash
   git commit -m "Add your message here"
   ```
5. **Push to Your Fork**:
   ```bash
   git push origin feature/your-feature-name
   ```
6. **Open a Pull Request**: Describe your changes and submit for review

Please follow these guidelines:
- Keep code modular and well-commented
- Test changes locally before submitting
- Update the README if new features are added

## Troubleshooting

- **Angular Setup Fails**: Ensure the project name is valid (no spaces or special characters beyond `-`, `.`, or `_`).
- **Permission Denied**: Run `chmod +x setup_project.sh` or use `sudo` if necessary.
- **npm Errors**: Verify Node.js and npm are installed and up-to-date.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute it as needed.

## Acknowledgments

- Built with inspiration from common web development workflows
- Thanks to the open-source community for the amazing tools used (Angular, React, Node.js, etc.)

---

Happy coding! If you find this project useful, please give it a ⭐ on GitHub!