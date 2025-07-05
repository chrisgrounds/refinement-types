# Rust Refinement

This repo contains examples of refinement types.

## Usage

### Without refinement types

To see the failing output (i.e. stack overflow), use `cargo build` and `cargo run`.

### With refinement types

To see the compliation errors due to the refinement types, use `cargo flux`.

Use `cargo flux` to see the compliation errors due to the refinement types.

## Dependencies

Use the `install.sh` script to install flux, liquid-fixpoint, and a SMT theorem solver. This script also installs GHC and cabal if they are missing from your system, as they are needed to install liquid-fixpoint.
