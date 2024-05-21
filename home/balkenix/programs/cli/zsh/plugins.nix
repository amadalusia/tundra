{pkgs, ...}: {
  programs.zsh.plugins = [
    {
      name = "agkozak-zsh-prompt";
      src = pkgs.fetchFromGitHub {
        owner = "agkozak";
        repo = "agkozak-zsh-prompt";
        rev = "refs/tags/v3.11.3";
        sha256 = "617fc2e6d6ec56d79a22804a37188c586a7ced31";
      };
    }
    {
      name = "enhancd";
      src = pkgs.fetchFromGitHub {
        owner = "b4b4r07";
        repo = "enhancd";
        rev = "v2.2.1";
        sha256 = "0iqa9j09fwm6nj5rpip87x3hnvbbz9w9ajgm6wkrd5fls8fn8i5g";
      };
    }
  ];
}
