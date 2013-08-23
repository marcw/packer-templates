packer-templates
================

A set of [packer](http://packer.io/) templates.

Packer is supposed to be ran from the root directory of this repository. For example, to build the symfony2 VM, run:

    cp variables.json.dist variables.json
    # edit variables.json if you nedd
    packer -var-file=variables.json symfony2/template.json

DO NOT `cd` to the `symfony2` directory and run `packer template.json`, it just won't work.
