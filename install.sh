#!/bin/bash
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible

sudo cp inventory /etc/ansible/hosts
