#!/usr/bin/env bash

set -o errexit

# Download .NET SDK
wget https://download.visualstudio.microsoft.com/download/pr/60218cc4-13eb-41d5-aa0b-5fd5a3fb03b8/6c42bee7c3651b1317b709a27a741362/dotnet-sdk-8.0.303-linux-x64.tar.gz

# Extract SDK
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-8.0.303-linux-x64.tar.gz -C $HOME/dotnet

# Set environment variables
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet

# Install Blazor WASM tools
dotnet workload install wasm-tools

# Verify installation
dotnet --version

# Navigate to project folder (where .csproj exists)
cd israelweb

# Restore dependencies
dotnet restore

# Publish project
dotnet publish -c Release -o out
