{
  pkgs,
  ...
}:

{
  packages = [
    pkgs.git
  ];

  languages.typst = {
    enable = true;
    fontPaths = [
      "${pkgs.roboto}/share/fonts/opentype"
      "${pkgs.noto-fonts-cjk-sans-static}/share/fonts/opentype"
    ];
  };

  enterShell = ''
    typst --version
    git --version # Use packages
    export FONTCONFIG_FILE=${
      pkgs.makeFontsConf {
        fontDirectories = [
          pkgs.noto-fonts-cjk-sans-static
        ];
      }
    }
  '';
}
