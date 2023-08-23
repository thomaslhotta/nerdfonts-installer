# Nerd Fonts Installer Script

This Bash script automates the process of downloading and installing [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts). It fetches the latest version of the fonts and installs them to the user's local font directory.

## Features

- Automatically fetches the latest release version from the Nerd Fonts GitHub repository.
- Downloads selected Nerd Fonts and installs them.
- Refreshes the font cache after installation.
- Easy to extend: You can uncomment font names in the script to include them in the installation.

## Prerequisites

- `curl`: For downloading font files and fetching latest version.
- `unzip`: For extracting downloaded font zip files.

Make sure both are installed on your system. On Ubuntu or Debian-based distributions, you can install them using:

```bash
sudo apt update
sudo apt install curl unzip
```

## Usage

1. Clone the repository or download the script directly.
    ```bash
    git clone https://github.com/yourusername/nerd-fonts-installer.git
    ```
    or
    ```bash
    curl -O https://raw.githubusercontent.com/yourusername/nerd-fonts-installer/main/install-nerd-fonts.sh
    ```

2. Make the script executable.
    ```bash
    chmod +x install-nerd-fonts.sh
    ```

3. Run the script.
    ```bash
    ./install-nerd-fonts.sh
    ```

## Customization

To install additional fonts or change the list of fonts to install:

1. Open `install-nerd-fonts.sh` in a text editor.
2. Locate the `fonts` array and uncomment or add the font names you wish to install.
3. Save the file and run the script.

## License

This script is open source and available under the MIT License. 

