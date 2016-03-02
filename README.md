# undmg
Extract a DMG file.

## Usage
```sh
./undmg < ./Sublime\ Text\ Build\ 3103.dmg
```

## Building

This requires zlib, bzip2, and glibc to build.

```
$ git clone https://github.com/matthewbauer/undmg.git
$ cd undmg
$ make
$ ./undmg
```

## License
GPL3, most of this code is from the [xpwn](https://github.com/planetbeing/xpwn)
