#!/usr/bin/env bash
# Exit on error
set -o errexit

# Download the .NET SDK
wget https://download.visualstudio.microsoft.com/download/pr/60218cc4-13eb-41d5-aa0b-5fd5a3fb03b8/6c42bee7c3651b1317b709a27a741362/dotnet-sdk-8.0.303-linux-x64.tar.gz

# Create a directory for .NET SDK and extract the downloaded file
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-8.0.303-linux-x64.tar.gz -C $HOME/dotnet

# Set environment variables for .NET SDK
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet

# Verify the .NET SDK installation
dotnet --version

# Navigate to the TaskManagerApp directory
cd israelweb

# Publish the .NET application
dotnet publish -c Release -o out