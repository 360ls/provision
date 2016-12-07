# Provision

[Ansible](https://www.ansible.com/) playbook for installing
[OpenCV](http://opencv.org/) and other dependencies for the [Jetson TX1](http://www.nvidia.com/object/jetson-tx1-module.html).

## Pre-requisites

Make sure that all of the sources in the `/etc/apt/sources.list` file are uncommented.

Install Ansible:

```bash
$ make install
```

## Sudo

Make sure that `sudo` is allowed without a password.

1. Open up sudoers with `sudo visudo`.
2. Add the line `user ALL=(ALL) NOPASSWD:ALL`, replacing `user` with the username.

## Provisioning

Run the following command to run the playbook.

```bash
$ make provision
```

Provisioning will take around an hour or so to compile and build OpenCV from the source.

## Developer Environment

To develop the [Stitcher](https://github.com/360ls/stitcher) or the [Electron](https://github.com/360ls/desktop) application you will need to provision the developer environment with the following command:

```bash
$ make provision-dev
```
