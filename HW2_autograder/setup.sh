#!/usr/bin/env bash
# Install GHC and Cabal
apt-get update
apt-get install -y ghc cabal-install

# Update cabal and install testing libraries (e.g., Tasty, HUnit, QuickCheck)
cabal update
# Note: This may take several minutes during the initial build
cabal install --lib tasty tasty-hunit tasty-quickcheck
