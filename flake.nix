{
  description = "A demo for source filtering";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      packages = forEachSupportedSystem ({ pkgs }: with pkgs; {
        default = stdenv.mkDerivation {
          pname = "nix-source-filtering-demo";
          version = "0.1.0";

          # lib.sources.trace is for debugging
          src = lib.sources.trace (nix-gitignore.gitignoreSource [
            "flake.nix"
            "flake.lock"
          ] ./.);

          installPhase = ''
            cp -r $src $out/
          '';
        };
      });
    };
}
