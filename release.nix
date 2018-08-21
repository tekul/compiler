{ compiler ? "ghc843" }:

let
  pkgs = import <nixpkgs> {};
  dontCheck = pkgs.haskell.lib.dontCheck;
  doJailbreak = pkgs.haskell.lib.doJailbreak;
  haskellPkgs = pkgs.haskell.packages."${compiler}".extend (self: super: {
    elm = self.callPackage ./elm.nix {};
    language-glsl = self.callHackage "language-glsl" "0.3.0" {};
  });
in
  {
    elm = haskellPkgs.elm;
  }
