#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get -qy install git vim curl ntp
