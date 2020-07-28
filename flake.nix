{
  description = "Extract a DMG file";

  inputs.nixpkgs.url = "nixpkgs/nixos-20.03-small";

  outputs = { self, nixpkgs }: let
    systems = [ "x86_64-linux" "i686-linux" "x86_64-darwin" "aarch64-linux" ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
  in {
    packages = forAllSystems (system: with (import nixpkgs { inherit system; }); {
      undmg = stdenv.mkDerivation {
        pname = "undmg";
        version = "1.0.3";

        buildInputs = [ zlib bzip2 ];

        src = self;

        makeFlags = [ "PREFIX=$(out)" ];
      };
    });

    defaultPackage = forAllSystems (system: self.packages.${system}.undmg);
  };
}
