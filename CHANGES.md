# Change log

All notable changes to the [CLARIN base style project](https://github.com/clarin-eric/base_style) will be documented in this file.

## 0.2.0
- Updated bootstrap version to 3.3.7
- Tooltip background colour now primary brand colour (turquoise blue)
- The Roboto Slab and Source Code Pro fonts are used in the style
- Javascript is now bundled in compiled distributions
- Additional style classes are defined in the `clarin-additions.less` file and compiled into the distribution CSS
- Classes for social media icons were added (in `clarin-additions.less`)
- Distribution package name changed from `release-${VERSION}.tgz` to `bootstrap-clarin-${VERSION}.tgz`

## 0.1.2
No changes in styling but improved distribution/packaging:
 - proper creation of a compiled tarball containing CLARIN flavoured Bootstrap
 - creation of Maven artifacts (#4): 
  - compiled Bootstrap CSS
  - full customised Bootstrap LESS sources
  - CLARIN LESS variables without Bootstrap
 - deployment of these Maven artifacts in the [CLARIN Nexus repository](https://nexus.clarin.eu) (#8)
 - automation of the above steps (using [Travis CI](https://travis-ci.org/clarin-eric/base_style))

## 0.1.1
- Make link-color lighter to avoid confusion with normal text

## 0.1.0
- First stable release, to be used in the [CLARIN website](https://www.clarin.eu) and [VLO](https://vlo.clarin.eu)
