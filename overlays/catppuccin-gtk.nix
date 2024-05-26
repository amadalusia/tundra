
{lib, ...}: final: prev: {
  catppuccin-gtk =
    prev.callPackage (
      args:
        (prev.catppuccin-gtk.override args).overrideAttrs (attrs: {
          version = "v1.0.0-rc5";

          src = final.fetchFromGitHub {
            rev = "v1.0.0-rc5";
            # hash = ".....:"
            owner = "catppuccin";
            repo = "gtk";
          };

          patches = null; # patches not needed for 1.x

          nativeBuildInputs =
            attrs.nativeBuildInputs
            ++ [
              final.git # to apply patches
            ];

          installPhase = ''
            set -e
            runHook preInstall

            mkdir -p $out/share/themes
            python ./build.py ${args.variant} \
              "--accent " ${builtins.toString args.accents} \
              ${lib.optionalString (args.size != "") "--size " + args.size} \
              ${lib.optionalString (args.tweaks != []) "--tweaks " + builtins.toString args.tweaks} \
              --dest $out/share/themes

            runHook postInstall
          '';
        })
    )
    {};
}
