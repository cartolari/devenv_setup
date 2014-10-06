#!/bin/bash
apt-get install software-properties-common -qy
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install ansible -qy
