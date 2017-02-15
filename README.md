# Zope w/ BDR Add-ons ready to run Docker image

Docker image for Zope with BDR specific Add-ons and settings available.

### Supported tags and respective Dockerfile links

  - `:latest` (default)

### Base docker image

 - [hub.docker.com](https://hub.docker.com/r/eeacms/reportek-bdr/)

### Source code

  - [github.com](http://github.com/eea/eea.docker.reportek.bdr-instance)

### Installation

1. Install [Docker](https://www.docker.com/)

2. Install [Docker Compose](https://docs.docker.com/compose/) (optional)

## Usage

See [eeacms/zope](https://hub.docker.com/u/eeacms/zope)

## Upgrade

    $ docker pull eeacms/reportek-bdr

## Development and testing

If you want to be able to run tests, please add to src/bdr-instance.cfg file the following:

    parts +=
        i18ndude
        test

    [test]
    recipe = zc.recipe.testrunner
    defaults = ['--auto-color', '--auto-progress']
    eggs =
        ${instance:eggs}
        cssselect
        Mock
        pdbpp
    environment = testenv

    [testenv]
    CLIENT_HOME = ${buildout:directory}/var/instance

After that, build the image locally:

    $ docker build -t reportek.bdr-instance:devel .

and use it in docker compose file for _instance_ service:

    image: reportek.bdr-instance:devel

## Copyright and license

The Initial Owner of the Original Code is European Environment Agency (EEA).
All Rights Reserved.

The Original Code is free software;
you can redistribute it and/or modify it under the terms of the GNU
General Public License as published by the Free Software Foundation;
either version 2 of the License, or (at your option) any later
version.

## Funding

[European Environment Agency (EU)](http://eea.europa.eu)
