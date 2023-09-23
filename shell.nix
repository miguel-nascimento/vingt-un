
{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = with pkgs; [ dune_3 
    ocamlPackages.ocaml
    ocamlPackages.findlib
    ocamlPackages.utop
    ocamlPackages.merlin
  ];
}