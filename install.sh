#!/usr/bin/env bash
set -e
set -o pipefail

# where conda will be installed
CONDA_DIR="$HOME/miniconda3"
CITYFLOW_DIR="$(pwd)/CityFlow"

# Update system and install C++ build dependencies
echo "Installing build dependencies..."
sudo apt update && \
sudo apt-get install -y build-essential cmake wget git

# Install Miniconda Python 3.6 if not already installed
if [ ! -d "$CONDA_DIR" ]; then
  echo "Installing Miniconda to $CONDA_DIR ..."
  wget -P /tmp/ https://repo.continuum.io/miniconda/Miniconda3-4.5.4-Linux-x86_64.sh
  bash /tmp/Miniconda3-4.5.4-Linux-x86_64.sh -b -p "$CONDA_DIR"
  rm /tmp/Miniconda3-4.5.4-Linux-x86_64.sh
  ln -sf "$CONDA_DIR/etc/profile.d/conda.sh" "$HOME/.conda_init.sh"
  echo ". $HOME/.conda_init.sh" >> ~/.bashrc
  echo "export PATH=\"$CONDA_DIR/bin:\$PATH\"" >> ~/.bashrc
  echo "export LD_PRELOAD=/usr/lib/gcc/x86_64-linux-gnu/13/../../../x86_64-linux-gnu/libstdc++.so.6" >> ~/.bashrc
else
  echo "Miniconda already installed at $CONDA_DIR"
fi

# put conda on PATH
export PATH="$CONDA_DIR/bin:$PATH"

# Upgrade pip (only once if needed)
echo "Upgrading pip..."
pip install --upgrade pip

# Install flask if not installed
if ! pip show flask >/dev/null 2>&1; then
  echo "Installing flask..."
  pip install flask
else
  echo "Flask already installed"
fi

# Install CityFlow if directory exists
if [ -d "$CITYFLOW_DIR" ]; then
  echo "Installing CityFlow from $CITYFLOW_DIR..."
  cd "$CITYFLOW_DIR"
  pip install .
else
  echo "CityFlow source directory not found at $CITYFLOW_DIR"
fi

pip install jupyterlab notebook

echo "✅ Setup complete!"