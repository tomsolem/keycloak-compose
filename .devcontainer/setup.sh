# bin/bash!
echo "Setting up the development container..."
sudo apt update -y
# PRETTY_NAME="Ubuntu 24.04.2 LTS"
sudo apt-get upgrade -y

# install the PostgreSQL CLI
echo "Installing PostgreSQL client..."
sudo apt-get install -y postgresql-client