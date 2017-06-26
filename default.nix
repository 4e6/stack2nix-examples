# Generated by stack2nix from ./stack.yaml
{ nixpkgs ? import <nixpkgs> {} }:

with nixpkgs;
let
  inherit (stdenv.lib) extends;
  stackagePackages = self: import ./packages.nix { inherit pkgs stdenv; inherit (self) callPackage; };
  stackageConfig = callPackage ./configuration-packages.nix {};
  stackPackages =
    { pkgs, stdenv, callPackage }:
    
    self: {
      "distribution-nixpkgs" = callPackage
        ({ mkDerivation, aeson, base, bytestring, Cabal, containers
         , deepseq, doctest, hspec, language-nix, lens, pretty, process
         , split
         }:
         mkDerivation {
           pname = "distribution-nixpkgs";
           version = "1.1";
           sha256 = "15m881mrhpqg1xjdjz65ym8pajp1nijrcvb6dx3vv55430cjw1qx";
           libraryHaskellDepends = [
             aeson base bytestring Cabal containers deepseq language-nix lens
             pretty process split
           ];
           testHaskellDepends = [ base deepseq doctest hspec lens ];
           doHaddock = false;
           doCheck = false;
           homepage = "https://github.com/peti/distribution-nixpkgs#readme";
           description = "Types and functions to manipulate the Nixpkgs distribution";
           license = stdenv.lib.licenses.bsd3;
         }) {};
      "hopenssl" = callPackage
        ({ mkDerivation, base, bytestring, doctest, HUnit, openssl }:
         mkDerivation {
           pname = "hopenssl";
           version = "2.2";
           sha256 = "0hypc779yyrf3kgb9ik396zwf83d05x2gvrzr1nhv55pr8m0kvax";
           libraryHaskellDepends = [ base bytestring ];
           librarySystemDepends = [ openssl ];
           testHaskellDepends = [ base doctest HUnit ];
           doHaddock = false;
           doCheck = false;
           homepage = "http://github.com/peti/hopenssl";
           description = "FFI Bindings to OpenSSL's EVP Digest Interface";
           license = stdenv.lib.licenses.bsd3;
         }) {};
      "stack2nix" = callPackage
        ({ mkDerivation, aeson, base, bytestring, Cabal, cabal2nix
         , containers, deepseq, distribution-nixpkgs, filepath, hspec
         , inflections, language-nix, lens, network-uri
         , optparse-applicative, pretty, QuickCheck, shakespeare
         , stackage-curator, text, yaml
         }:
         mkDerivation {
           pname = "stack2nix";
           version = "0.1.0.0";
           src = ./.;
           isLibrary = true;
           isExecutable = true;
           libraryHaskellDepends = [
             aeson base bytestring Cabal cabal2nix containers deepseq
             distribution-nixpkgs filepath inflections language-nix lens
             network-uri optparse-applicative pretty QuickCheck stackage-curator
             text yaml
           ];
           executableHaskellDepends = [ base ];
           testHaskellDepends = [
             base bytestring Cabal hspec pretty shakespeare text yaml
           ];
           homepage = "https://github.com/4e6/stack2nix#readme";
           description = "Convert Stack files into Nix build instructions";
           license = stdenv.lib.licenses.bsd3;
         }) {};
      "cabal2nix" = callPackage
        ({ mkDerivation, aeson, ansi-wl-pprint, base, bytestring, Cabal
         , containers, deepseq, directory, distribution-nixpkgs, doctest
         , fetchgit, filepath, gitlib, gitlib-libgit2, hackage-db, hopenssl
         , language-nix, lens, monad-par, monad-par-extras, mtl
         , optparse-applicative, pretty, process, split, stackage-curator
         , text, time, transformers, unordered-containers, utf8-string, yaml
         }:
         mkDerivation {
           pname = "cabal2nix";
           version = "2.3";
           src = fetchgit {
             url = "https://github.com/4e6/cabal2nix.git";
             sha256 = "1zaa60cd640dnkf9y0jgzjmz0zylrcmjzl1vd5rfphj0r7hzh8w6";
             rev = "d4f48bd655e523dcef2cc3860cf1ab171ae4a225";
           };
           isLibrary = true;
           isExecutable = true;
           libraryHaskellDepends = [
             aeson ansi-wl-pprint base bytestring Cabal containers deepseq
             directory distribution-nixpkgs filepath gitlib gitlib-libgit2
             hackage-db hopenssl language-nix lens optparse-applicative pretty
             process split stackage-curator text transformers
             unordered-containers utf8-string yaml
           ];
           executableHaskellDepends = [
             aeson ansi-wl-pprint base bytestring Cabal containers deepseq
             directory distribution-nixpkgs filepath gitlib gitlib-libgit2
             hackage-db hopenssl language-nix lens monad-par monad-par-extras
             mtl optparse-applicative pretty process split stackage-curator text
             time transformers unordered-containers utf8-string yaml
           ];
           testHaskellDepends = [
             aeson ansi-wl-pprint base bytestring Cabal containers deepseq
             directory distribution-nixpkgs doctest filepath gitlib
             gitlib-libgit2 hackage-db hopenssl language-nix lens
             optparse-applicative pretty process split stackage-curator text
             transformers unordered-containers utf8-string yaml
           ];
           doHaddock = false;
           doCheck = false;
           homepage = "https://github.com/nixos/cabal2nix#readme";
           description = "Convert Cabal files into Nix build instructions";
           license = stdenv.lib.licenses.bsd3;
         }) {};
    };
  
  pkgOverrides = self: stackPackages {
    inherit pkgs stdenv;
    inherit (self) callPackage;
  };
  
in callPackage <nixpkgs/pkgs/development/haskell-modules> {
  ghc = pkgs.haskell.compiler.ghc802;
  compilerConfig = self: extends pkgOverrides (extends stackageConfig (stackagePackages self));
}