{ writeShellApplication
, grim
, libnotify
, coreutils
, wl-clipboard
}:

writeShellApplication {
  name = "screenshot";

  runtimeInputs = [ grim libnotify wl-clipboard coreutils ];

  text = ''
    SCREENSHOT="$HOME/Pictures/Screenshots/$(${coreutils}/bin/date +%a-%d-%h-%Y\ %T).png"

    ${grim}/bin/grim "$SCREENSHOT"
    ${wl-clipboard}/bin/wl-copy < "$SCREENSHOT"

    ${libnotify}/bin/notify-send --icon="$SCREENSHOT" "Screenshot copied!" "This screenshot has also been saved to $SCREENSHOT."
  '';
}
