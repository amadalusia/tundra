{
  writeShellApplication,
  grim,
  slurp,
  libnotify,
  coreutils,
  wl-clipboard
}:

writeShellApplication {
  name = "screenshot-slurp";

  runtimeInputs = [ grim slurp libnotify wl-clipboard coreutils ];

  text = ''
    GEOMETRY="$(${slurp}/bin/slurp)"
    SCREENSHOT="$HOME/Pictures/Screenshots/$(${coreutils}/bin/date +%a-%d-%h-%Y %T).png"

    ${grim}/bin/grim -g "$GEOMETRY" > "$SCREENSHOT"
    ${wl-clipboard}/bin/wl-copy < "$SCREENSHOT"

    ${libnotify}/bin/notify-send --icon="$SCREENSHOT" "Screenshot copied!" "This screenshot has also been saved to $SCREENSHOT."
  '';
}
