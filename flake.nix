{
  description = "Turid's solutions to Advent Of Code 2023";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
  };

  outputs = { nixpkgs, ... }@inputs: {
    devShells.x86_64-linux.default =
      let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      in pkgs.mkShell {
        name = "AoC23";
        buildInputs = with pkgs; [
          git
          python312
          python312Packages.venvShellHook
          jupyter
        ];
        venvDir = "./.venv";
        postShellHook = ''
          unset SOURCE_DATE_EPOCH
          pip install --upgrade pip
          pip install -r ./requirements.txt
        '';
      };
    };
}
