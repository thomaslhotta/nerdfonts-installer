#!/bin/bash

# Define a function for error messages
die() { echo "$*" 1>&2 ; exit 1; }

# Validate dependencies
command -v curl >/dev/null 2>&1 || die "curl is required but it's not installed."
command -v unzip >/dev/null 2>&1 || die "unzip is required but it's not installed."

# Fetch the latest release version from GitHub
version=$(curl --silent "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
[[ ! "$version" ]] && die "Failed to fetch latest version."

# Fonts to be installed
declare -a fonts=(
    # "3270"
    # "Agave"
    # "AnonymousPro"
    # "Arimo"
    # "AurulentSansMono"
    # "BigBlueTerminal"
    # "BitstreamVeraSansMono"
    # "CascadiaCode"
    # "CodeNewRoman"
    # "ComicShannsMono"
    # "Cousine"
    # "DaddyTimeMono"
    # "DejaVuSansMono"
    # "DroidSansMono"
    # "EnvyCodeR"
    # "FantasqueSansMono"
    # "FiraCode"
    # "FiraMono"
    # "Go-Mono"
    # "Gohu"
    # "Hack"
    # "Hasklig"
    # "HeavyData"
    # "Hermit"
    # "iA-Writer"
    # "IBMPlexMono"
    # "Inconsolata"
    # "InconsolataGo"
    # "InconsolataLGC"
    # "IntelOneMono"
    # "Iosevka"
    # "IosevkaTerm"
    "JetBrainsMono"
    # "Lekton"
    # "LiberationMono"
    # "Lilex"
    # "Meslo"
    # "Monofur"
    # "Monoid"
    # "Mononoki"
    # "MPlus"
    # "Noto"
    # "OpenDyslexic"
    # "Overpass"
    # "ProFont"
    # "ProggyClean"
    # "RobotoMono"
    # "ShareTechMono"
    # "SourceCodePro"
    # "SpaceMono"
    # "Terminus"
    # "Tinos"
    "Ubuntu"
    "UbuntuMono"
    # "VictorMono"
)

# Default fonts directory
fonts_dir="${HOME}/.local/share/fonts"

# Create fonts directory if it doesn't exist

# Download and install each font
[[ ! -d "$fonts_dir" ]] && die "Could not find fonts directory."

for font in "${fonts[@]}"; do
    zip_file="${font}.zip"
    download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/${version}/${zip_file}"

    echo "Downloading $font Nerd Font..."
    curl -LO "$download_url" || die "Download failed."

    echo "Installing $font..."
    unzip -q "$zip_file" -d "$fonts_dir" || die "Unzip failed."

    # Remove the downloaded zip file
    rm -f "$zip_file" || die "Failed to remove zip file."
done

# Remove unnecessary 'Windows Compatible' versions of fonts
find "$fonts_dir" -name '*Windows Compatible*' -delete || die "Failed to remove unnecessary files."

# Update the font cache
echo "Updating font cache..."
fc-cache -fv || die "Font cache update failed."

echo "All Nerd Fonts (version $version) have been installed successfully."

