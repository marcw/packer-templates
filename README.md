packer-templates
================

A set of [packer](http://packer.io/) templates.

Packer is supposed to be ran from the root directory of this repository. For example, to build the symfony2 VM, run:

    packer symfony2/template.json

DO NOT `cd` to the `symfony2` directory and run `packer template.json`, it just won't work.