# Provision

Contains [Ansible](https://www.ansible.com/) playbook for installing
[OpenCV](http://opencv.org/) and other dependencies for
Ubuntu.

## Pre-requisites
Install `ansible`:

```bash
$ make install
```

## Sudo
Make sure that `sudo` is allowed without a password.

1. Open up sudoers with `sudo visudo`.
2. Add the line `user ALL=(ALL) NOPASSWD:ALL`, replacing `user` with the username.

## Provision

Run the following command to run the playbook.
```bash
$ make provision
```

## Setup

Run the setup script:
```bash
$ make setup
```
