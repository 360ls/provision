# Provision

[Ansible](https://www.ansible.com/) playbook for installing
[OpenCV](http://opencv.org/) and other dependencies for the Jetson TX1.

## Pre-requisites
Make sure that all of the sources in the `/etc/apt/sources.list` file are uncommented.

Install `ansible`:

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

To develop the [Stitcher](https://github.com/360ls/stitcher) or the [Electron](https://github.com/360ls/desktop) application you'll need to provision the developer environment.

```bash
$ make provision-dev
```
