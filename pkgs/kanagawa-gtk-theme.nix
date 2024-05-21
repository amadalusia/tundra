{
  stdenv,
  fetchFromGitHub,
}: {
  gtk-theme = stdenv.mkDerivation {
    pname = "kanagawa-gtk";
    version = "1.0";
    dontBuild = true;
    installPhase = ''
      runHook preInstall

      mkdir -p $out/share/icons/
      mkdir -p $out/share/themes/

      cp -aR $src/icons/* $out/share/icons/
      cp -aR $src/themes/* $out/share/themes/

      runHook postInstall
    '';

    src = fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Kanagawa-GKT-Theme";
      rev = "master";
      sha256 = "sha256-I9UnEhXdJ+HSMFE6R+PRNN3PT6ZAAzqdtdQNQWt7o4Y=";
    };
  };
}