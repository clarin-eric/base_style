# CLARIN base style
[![Build Status](https://travis-ci.org/clarin-eric/base_style.svg?branch=master)](https://travis-ci.org/clarin-eric/base_style)

A [Bootstrap](https://getbootstrap.com/) based CLARIN style implementing the [CLARIN interface guidelines](https://github.com/clarin-eric/interface_guidelines), which in turn are based on the [CLARIN style guide](https://www.clarin.eu/content/styleguide). Additional information about branding and styling in CLARIN can be found on the [CLARIN Trac](https://trac.clarin.eu/wiki/Branding).

## Using the CLARIN style

There are various ways of using the CLARIN style, which are described below. Which one is the best choice, depends on the usage context. There are a few important points to take note of regardless of the means of usage:

* The CLARIN style makes us of, but _does not provide_ a number of open **fonts** that are part of the CLARIN style guides. See the [fonts](#fonts) section of this document for instructions on how to get the right fonts to be used inside your application.
* **Avoid making changes to the CSS or LESS** in your copy of the base style, including the Bootstrap variables. Doing so may make it hard for you to upgrade to future versions of the base style. CSS and LESS have various ways of extending and overriding inherited styles, so please make use of those and do not alter provided 'upstream' stylesheets. If there are fixes or other changes that you think should be included in the next version of the base style, please make an issue or pull request on GitHub.

### Compiled CSS output
A compiled CSS file is made available for each [release](https://github.com/clarin-eric/base_style/releases). See releases within the [main base_style repository](https://github.com/clarin-eric/base_style). The best way to use this CSS file in your project, is to use it as is and make any overrides or other adjustments in separate CSS files local to the project. This way you can easily upgrade the CLARIN CSS when a new release is made available.

### LESS files

#### Bootstrap variables

The [variables.less](src/main/less/variables.less) file can be obtained form the Git repository and is also made available with each release. 

Use this LESS file in place of the supplied file of the same name when building CSS from Bootstrap sources (see Bootstrap's [instructions for building CSS](https://getbootstrap.com/getting-started/#grunt)). 

#### Additional style classes

The [clarin-additions.less](src/main/less/clarin-additions.less) file provides additional common CLARIN classes that are not part of Bootstrap.

This LESS file has to be wrapped into a parent LESS file that also includes its Bootstrap dependencies (variables and mixins). There is a wrapper LESS file [clarin-bootstrap.less](src/main/less/clarin-bootstrap.less) that combines the Bootstrap root less file and the CLARIN additions.

#### Compiling

Use the wrapp LESS file [clarin-bootstrap.less](src/main/less/clarin-bootstrap.less) to compile both "CLARIN flavoured" Bootstrap and the CLARIN additional classes into a single CSS file. Place it in the `less` directory of the Bootstrap source distribution. Alternatively you can use the standard `bootstrap.less` to skip CLARIN's additional classes.

Make sure to use a compatible version of Bootstrap when compiling! The version for which the style was developed and tested can be found in the [Travis configuration file](.travis.yml).

As with the CSS file (see above), its best to use it as is (preferably including it build time based on the style's version number) and make any overrides or other adjustments in separate LESS files local to the project. This way you can easily upgrade the CLARIN style when a new release is made available.

### Using the style in a Maven project
You can use the following artifact:

```xml
<groupId>eu.clarin.style</groupId>
<artifactId>base-style</artifactId>
<version>0.2.0</version>
<!-- available classifiers: 'css-with-bootstrap', 'less-with-bootstrap' and 'less-without-bootstrap' -->
<classifier>css-with-bootstrap</classifier>
```

This can be used in combination with, for example, the [unpack goal of the maven-dependency-plugin](https://maven.apache.org/plugins/maven-dependency-plugin/unpack-mojo.html)
so that the CLARIN base style CSS or LESS is included among your resources before compiling or packaging. See the [VLO webapp project](https://github.com/clarin-eric/VLO/blob/master/vlo-web-app/pom.xml) for an example.

JARs are also bundled with releases, and releases and snapshots are deployed to [CLARIN's Nexus repository](https://nexus.clarin.eu).

#### Building the Maven artifacts yourself

Be aware that the [POM file](pom.xml) was designed to be triggered in the CI process (i.e. by Travis). If you would like to build (one of) these JARs yourself, pass the following parameters:
```
-Dstyle.version=${STYLE_VERSION}
-Dbootstrap.version=${BOOTSTRAP_VERSION}
-P${PROFILE}
```
where `${PROFILE}` should match one of the classifiers and the style and bootstrap versions should match the respective values specified in `.travis.yml`

To deploy to Nexus, you can use the [maven-deploy script](src/main/script/maven-deploy.sh). This requires the `STYLE_VERSION` environment variable to be set.

### Using the style in a drupal website
See the [www-clarin-eu_src](https://github.com/clarin-eric/www-clarin-eu_src) project. Dependency of [alpine-httpd-drupal](https://gitlab.com/CLARIN-ERIC/alpine-httpd-drupal).

## Fonts
The [CLARIN style guide](https://www.clarin.eu/content/styleguide) specifies that the follow open fonts, all available through Google Fonts, are to be used:

* [Source Sans Pro](https://fonts.google.com/specimen/Source+Sans+Pro) (base font)
* [Roboto Slab](https://fonts.google.com/specimen/Roboto+Slab) (can be used for 'streamers' ( 'blockquotes' ) or 'subheads')
* [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro) (monospace font, e.g. for displaying code)

These fonts can be enabled in any webpage by adding the following HTML header elements:
```
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,700,700i&amp;subset=latin-ext,vietnamese" rel="stylesheet">	
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,700&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Code+Pro:400,700&amp;subset=latin-ext" rel="stylesheet">
```

The elements above import regular and bold variants, and for the case of Source Sans Pro also the italic variants. You can modify the available fonts and font variants by altering the parameters of the links. Go to the Google Fonts pages for the individual fonts to get snippets for including different font variants.

## Making changes to the CLARIN style

1. Edit the Less file(s)
 - Make a _branch or fork_ (please **don't** commit anything not ready for release to master!) of the base_style repository.
 - Make any desired changes to the [variables.less](src/main/less/variables.less) file or add new style code to [clarin-additions.less](src/main/less/clarin-additions.less) as required.
1. Check the results
 - Build the Less output using your desired method (see Bootstrap's [instructions for building CSS](https://getbootstrap.com/getting-started/#grunt) but you can use [other Less compilers](http://lesscss.org/usage/) as well) and check the results.
 - Make further changes as required.
1. Make or request a release
 - **IMPORTANT**: increase the version number in [.travis.yml](.travis.yml)
 - Merge into 'master' or make a pull request.
 - Make a tag or ask someone with the right permissions. This will trigger a [Travis job](https://travis-ci.org/clarin-eric/base_style), which will result in a deployment of the artifacts into a [release](https://github.com/clarin-eric/base_style/releases).
