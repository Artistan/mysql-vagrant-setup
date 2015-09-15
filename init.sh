#!/bin/bash

vagrant box add centos-7.0 https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.1.0/centos-7.0-x86_64.box
vagrant init
vagrant up
