# Install GHCup
if ! command -v ghcup &> /dev/null
then
    echo "GHCup is not installed. Installing GHCup..."
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
    ghcup install cabal
else
    echo "GHCup is already installed. Skipping installation."
fi

cabal --version

# Install rustup
if ! command -v rustup &> /dev/null
then
    echo "Rustup is not installed. Installing Rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
    echo "Rustup is already installed. Skipping installation."
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
# This will install the z3 binary to ~/.cargo/bin
# This will enable `cargo z3`
cd ~
git clone https://github.com/Z3Prover/z3.git
cd z3
python3 scripts/mk_make.py --python
cd build
make
make install
