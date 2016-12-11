# Provision

[Ansible](https://www.ansible.com/) playbook for installing
[OpenCV](http://opencv.org/) and other dependencies for the [Jetson TX1](http://www.nvidia.com/object/jetson-tx1-module.html).

## Pre-requisites

### Jetson

Install [Jetpack](https://developer.nvidia.com/embedded/jetpack-archive) versions less
than `2.1`. Our application will not work on newer versions as we require a 32-bit
architecture to run [Electron](https://github.com/electron/electron/issues/259).

### Setup

First make sure to check the package sources:

```bash
$ sudo vi /etc/apt/sources.list
```

Any commented sources should be uncommented.

Make sure that `sudo` is allowed without a password.

1. Open up sudoers with `sudo visudo`.
2. Add the line `user ALL=(ALL) NOPASSWD:ALL`, replacing `user` with the username.

### Installation

Install Ansible:

```bash
$ sudo make install
```

## Provisioning

Run the following command to run the playbook.

```bash
$ make provision
```

Provisioning will take around an hour or so to compile and build OpenCV from the source.

## Testing Setup

Run the test script to make sure all of the expected functionalities are working:

```bash
$ make test
```

## Developer Environment

To develop the [Stitcher](https://github.com/360ls/stitcher) or the [Electron](https://github.com/360ls/desktop) application you will need to provision the developer environment with the following command:

```bash
$ make provision-dev
```

## Running Specific Roles

To run a specific role, use the tag specified in the playbook.
For example, to run the `opencv` role, you can run:

```bash
$ ansible-playbook playbook.prod.yml --tags "opencv"
```
