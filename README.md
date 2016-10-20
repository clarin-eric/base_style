# CLARIN base style
[![Build Status](https://travis-ci.org/clarin-eric/base_style.svg?branch=master)](https://travis-ci.org/clarin-eric/base_style)

A bootstrap based CLARIN style implementing the [CLARIN interface guidelines](https://github.com/clarin-eric/interface_guidelines). Additional information about branding and styling in CLARIN can be found on the [CLARIN Trac](https://trac.clarin.eu/wiki/Branding).

## Using the CLARIN style

### Compiled CSS output
A compiled CSS file is made available for each release. See releases within the [main base_style repository](https://github.com/clarin-eric/base_style). The best way to use this CSS file in your project, is to use it as is and make any overrides or other adjustments in separate CSS files local to the project. This way you can easily upgrade the CLARIN CSS when a new release is made available.

### Less file
The `variables.less` file can be obtained form the Git repository and is also made available with each release. 

Use this Less file in place of the supplied file of the same name when building CSS from Bootstrap sources (see Bootstrap's [instructions for building CSS](https://getbootstrap.com/getting-started/#grunt)). 

Make sure to use a compatible version of Bootstrap when compiling! The version for which the style was developed and tested can be found in the [Travis configuration file](.travis.yml).

As with the CSS file (see above), its best to use it as is (preferably including it build time based on the style's version number) and make any overrides or other adjustments in separate Less files local to the project. This way you can easily upgrade the CLARIN style when a new release is made available.

### Using the style in a Maven project
This has not been implemented yet. See [#4](https://github.com/clarin-eric/base_style/issues/4).

### Using the style in a drupal website
See the [www-clarin-eu_src](https://github.com/clarin-eric/www-clarin-eu_src) project. Dependency of [alpine-httpd-drupal](https://gitlab.com/CLARIN-ERIC/alpine-httpd-drupal).

## Making changes to the CLARIN style

- Edit `variables.less`
 - In a branch or fork
 - ...
- Check the result
 - ...
- Make a release
 - ...
