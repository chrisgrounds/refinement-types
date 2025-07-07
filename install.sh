#!/bin/sh
# Install GHCup
if ghcup --version; then
  echo "GHCup is already installed. Skipping installation."
else
  echo "GHCup is not installed. Installing GHCup..."
  curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
  ghcup install cabal

  ghcup install ghc 9.10.1
  ghcup set ghc 9.10.1
fi

cabal --version

# Add to bashrc/zshrc
if [ -f "$HOME/.bashrc" ]; then
  echo 'export PATH="$HOME/.ghcup/bin:$PATH"' >>"$HOME/.bashrc"
  echo 'export PATH="$HOME/.cabal/bin:$PATH"' >>"$HOME/.bashrc"
fi
if [ -f "$HOME/.zshrc" ]; then
  echo 'export PATH="$HOME/.ghcup/bin:$PATH"' >>"$HOME/.zshrc"
  echo 'export PATH="$HOME/.cabal/bin:$PATH"' >>"$HOME/.zshrc"
fi

# Install rustup
if rustup --version; then
  echo "Rustup is already installed. Skipping installation."
else
  echo "Rustup is not installed. Installing Rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# Liquid Fixpoint
cd ~
git clone https://github.com/ucsd-progsys/liquid-fixpoint.git
cd liquid-fixpoint
cabal install

# Install Flux
# This will install the flux binary to ~/.cargo/bin
# This will enable `cargo flux`
cd ~
git clone https://github.com/flux-rs/flux
cd flux
cargo xtask install

# Install Z3
# This will install the z3 binary to /usr/local
cd ~
git clone https://github.com/Z3Prover/z3.git
cd z3
python3 scripts/mk_make.py
cd build
make
make install
