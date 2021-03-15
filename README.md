# Free Manga Downloader 2 (FMD2)

<sup>(Forked from https://github.com/riderkick/FMD)</sup>

Use the converter if you want to migrate your FMD1 settings and databases.
[Converter](https://github.com/Slasar41/FMD2/releases/tag/2.0.21.0)

## Download

[![Latest release](https://img.shields.io/github/release/Slasar41/FMD2.svg)](https://github.com/Slasar41/FMD2/releases/latest)

## About FMD

This is an active fork of the Free Manga Downloader which is a free open source application written in Object Pascal for managing and downloading manga from various websites. The source code was released under the GPLv2 license.
  
Some useful arguments that can be used in FMD2:
- `--lua-dofile` trigger FMD2 to always load lua modules from file. Only use it when developing a module. It might slowing down FMD2.
- `--no-commit-queue` disable commit queue for databases. The same as `--max-commit-queue=0 --max-flush-queue=0`. It might slowing down FMD2 with large databases due to intense disk write.
- `--max-commit-queue=16` override max number of commit before writing to disk.
- `--max-flush-queue=256` override max number of update before commiting to database engine.
- `--max-big-flush-queue=16384` override max number of update before commiting to database. Internally used when making large update to databases in one go. Be careful when reducing the number it might slowing down FMD2 significantly.
- `--backup-interval=10` override backup databases interval (minutes).

## Build instructions

In order to build FMD from the source code, you must install the latest Trunk version of Lazarus and Free Pascal Compiler:  
[![Lazarus](https://img.shields.io/badge/Lazarus%20IDE-Blue.svg)](http://www.lazarus-ide.org/)  

To compile FMD some packages and components are needed. You can download and install most of them by the built-in Online Package Manager (OPM).  
The following packages and components are used for building FMD:  
![Synapse 40.1](https://img.shields.io/badge/Synapse-OPM%20(40.1)-Blue.svg) <sup>(Compile before "InternetTools")</sup>  
![DCPCrypt 2.0.4.1](https://img.shields.io/badge/DCPCrypt-OPM%20(2.0.4.1)-Blue.svg)  
![RichMemo (18.01.2020)](https://img.shields.io/badge/RichMemo-OPM%20(18.01.2020)-Blue.svg)  
![LCL Extensions 0.6.1](https://img.shields.io/badge/LCL%20Extensions-OPM%20(0.6.1)-Blue.svg) <sup>(Compile before "Virtual TreeView")</sup>  
![Virtual TreeView 5.5.3.1](https://img.shields.io/badge/Virtual%20TreeView-OPM%20(5.5.3.1)-Blue.svg)  
[![MultiLog (02.12.2019)](https://img.shields.io/badge/MultiLog-git%20master%20commit%20fd700fa5343c1b0e08063f88a1e6761036b10efc%20(02.12.2019)-Blue.svg)](https://github.com/blikblum/multilog)  
[![InternetTools](https://img.shields.io/badge/InternetTools-Blue.svg)](https://github.com/benibela/internettools)  
  
After everything is installed, open the file `md.lpi` by using Lazarus IDE.  
Make sure to add `ssl_openssl` to the uses list of `Synapse` and compile the package again.  
To compile and build the source code of FMD select `Run -> Build`. If everything is ok, the binary file should be in `FMD_source_code_folder/bin`.  
  
If `InternetTools` fails to compile because of a missing or incompatible PPU, make sure to compile `Synapse` first.  
By default `InternetTools` uses [FLRE](https://github.com/BeRo1985/flre) and [PUCU](https://github.com/BeRo1985/PUCU) for its regex engine. Just copy the `FLRE.pas` and `PUCU.pas` to `InternetTools\data` folder. You can use Sorokin's RegExpr engine that comes with lazarus by adjusting the defines. But it's not recommended since the author of `InternetTools` prefer FLRE and doesn't always check the Sorokin's RegExpr compatibility when making an update.

If `Multilog` yield an error about `outputchannel` doesn't exist, just remove it from package inspector and recompile.

Try to `Clean up and build` within lazarus if it still fail to compile.

Some other external 3rd party tools and libraries are used as well:  
[![7-Zip](https://img.shields.io/badge/7--Zip%20(Standalone)-19.00-Blue.svg)](https://www.7-zip.org)  
[![Duktape](https://img.shields.io/badge/Duktape-2.5.0-Blue.svg)](https://github.com/grijjy/DelphiDuktape)  
[![WebP (libwebp)](https://img.shields.io/badge/WebP%20(libwebp)-1.1.0-Blue.svg)](https://github.com/webmproject/libwebp/)  
[![Lua](https://img.shields.io/badge/Lua-5.4.0-Blue.svg)](http://www.lua.org/download)  
[![OpenSSL](https://img.shields.io/badge/OpenSSL-1.1.1g-Blue.svg)](https://www.openssl.org/)  
[![SQLite](https://img.shields.io/badge/SQLite-3.33.0-Blue.svg)](https://www.sqlite.org/)  
[![Brotli](https://img.shields.io/badge/Brotli.svg)](https://www.brotli.org/)  
  
These tools and libraries are not part of the source. You have to either download pre-compiled binaries, compile them yourself or just copy them from the latest FMD releases.  
  
## Localization

Translations are stored inside `languages` folder with `.po` extension.  
In order to translate FMD to your native language you can copy `fmd.po` and rename it to `fmd.xx.po`, where `xx` stand for two-letter language code.  
Additionally you can add country code at the end of language code. For reference you can look at http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes and http://en.wikipedia.org/wiki/ISO_3166-1. For example `id_ID` will be recognized as `Bahasa Indonesia (Indonesia)`.  
To translate the content of the file you need to use translation tools like [Poedit](https://poedit.net).  
Once you have finished translating all of its content you can launch FMD and it will automatically detect your new languages upon startup.
