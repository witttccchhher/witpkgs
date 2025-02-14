# My custom packages for Nix

## Usage

Add to your *flake.nix*:

```nix
inputs = {
    witpkgs.url = "github:witttccchhher/witpkgs";
}
```

Then, you can use in `home.packages` or `environment.systemPackages`:

```nix
inputs.witpkgs.packages.${pkgs.system}.<package-name>
```

## List of packages

- [anicli-ru](https://github.com/vypivshiy/ani-cli-ru) (Broken)
- [canvas](https://github.com/adi1090x/canvas)
- [distrohoop](https://github.com/br0sinski/distrohoop)
- [minbrowser](https://github.com/minbrowser/min)
- [goto](https://github.com/grafviktor/goto)
