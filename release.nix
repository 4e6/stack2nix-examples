with import <nixpkgs> {};
with pkgs.haskell.lib;
let haskellPackages = import ./. {};
in haskellPackages.override {
  overrides = self: super: {
    stackage2nix = disableSharedExecutables super.stackage2nix;
  };
}
