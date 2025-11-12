# nfrastack/container-grafana

## About

This repository will build a container for Grafana

## Maintainer

- [Nfrastack](https://www.nfrastack.com)

## Table of Contents

- [About](#about)
- [Maintainer](#maintainer)
- [Table of Contents](#table-of-contents)
- [Installation](#installation)
  - [Prebuilt Images](#prebuilt-images)
  - [Quick Start](#quick-start)
  - [Persistent Storage](#persistent-storage)
- [Configuration](#configuration)
  - [Environment Variables](#environment-variables)
    - [Base Images used](#base-images-used)
    - [Core Configuration](#core-configuration)
    - [Virus Definitions Configuration](#virus-definitions-configuration)
    - [Virus Scanning Settings](#virus-scanning-settings)
    - [Scanning Limits](#scanning-limits)
    - [Alerting Settings](#alerting-settings)
  - [Users and Groups](#users-and-groups)
  - [Networking](#networking)
- [Maintenance](#maintenance)
  - [Shell Access](#shell-access)
- [Support & Maintenance](#support--maintenance)
- [License](#license)

## Installation

### Prebuilt Images
Feature limited builds of the image are available on the [Github Container Registry](https://github.com/nfrastack/container-grafana/pkgs/container/container-grafana) and [Docker Hub](https://hub.docker.com/r/nfrastack/grafana).

To unlock advanced features, one must provide a code to be able to change specific environment variables from defaults. Support the development to gain access to a code.

To get access to the image use your container orchestrator to pull from the following locations:

```
ghcr.io/nfrastack/container-grafana:(image_tag)
docker.io/nfrastack/grafana:(image_tag)
```

Image tag syntax is:

`<image>:<optional tag>-<optional_distribution>_<optional_distribution_variant>`

Example:

`ghcr.io/nfrastack/container-grafana:latest` or

`ghcr.io/nfrastack/container-grafana:1.0` or


* `latest` will be the most recent commit
* An optional `tag` may exist that matches the [CHANGELOG](CHANGELOG.md) - These are the safest
* If there are multiple distribution variations it may include a version - see the registry for availability

Have a look at the container registries and see what tags are available.

#### Multi-Architecture Support

Images are built for `amd64` by default, with optional support for `arm64` and other architectures.

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [compose.yml](examples/compose.yml) that can be modified for your use.

* Map [persistent storage](#persistent-storage) for access to configuration and data files for backup.
* Set various [environment variables](#environment-variables) to understand the capabilities of this image.

### Persistent Storage

The following directories are used for configuration and can be mapped for persistent storage.

| Directory | Description                                    |
| --------- | ---------------------------------------------- |
| `/config` | (optional) Configuration Files                 |
| `/data`   | (optional) Root Hints and volatile information |
| `/logs`   | Log Files                                      |

### Environment Variables

#### Base Images used

This image relies on a customized base image in order to work.
Be sure to view the following repositories to understand all the customizable options:

| Image                                                   | Description                                            |
| ------------------------------------------------------- | ------------------------------------------------------ |
| [OS Base](https://github.com/nfrastack/container-base/) | Base Image                                             |
| [Nginx](https://github.com/nfrastack/container-base/)   | Nginx webserver to proxy to Grafana for added security |

Below is the complete list of available options that can be used to customize your installation.

* Variables showing an 'x' under the `Advanced` column can only be set if the containers advanced functionality is enabled.

#### Core Configuration

| Parameter                    | Description                                             | Default     | Advanced |
| ---------------------------- | ------------------------------------------------------- | ----------- | -------- |
| `DB_TYPE`                    | DB engine type                                          | `sqlite`    |          |
| `DB_HOST`                    | Database host                                           | `localhost` |          |
| `DB_PORT`                    | Database port                                           | `3306`      |          |
| `DB_NAME`                    | Database name                                           | `grafana`   |          |
| `DB_USER`                    | Database user                                           | `grafana`   |          |
| `DB_PASS`                    | Database passwor                                        | `password`  |          |
| `AUTO_ASSIGN_ORG_ROLE`       | Role for auto-created user                              | `Viewer`    |          |
| `OAUTH_ALLOW_INSECURE_EMAIL` | If you use Generic OAuth with an identity provider that | `FALSE`     |          |
|                              | does not support a unique ID field please set it `TRUE` |             |          |

## Users and Groups

| Type  | Name      | ID  |
| ----- | --------- | --- |
| User  | `grafana` | 472 |
| Group | `grafana` | 472 |

### Networking

| Port   | Protocol | Description            |
| ------ | -------- | ---------------------- |
| `3000` | tcp      | Grafana Listening Port |

* * *

## Maintenance

### Shell Access

For debugging and maintenance, `bash` and `sh` are available in the container.

## Support & Maintenance

- For community help, tips, and community discussions, visit the [Discussions board](/discussions).
- For personalized support or a support agreement, see [Nfrastack Support](https://nfrastack.com/).
- To report bugs, submit a [Bug Report](issues/new). Usage questions will be closed as not-a-bug.
- Feature requests are welcome, but not guaranteed. For prioritized development, consider a support agreement.
- Updates are best-effort, with priority given to active production use and support agreements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

# github.com/tiredofit/docker-grafana

[![GitHub release](https://img.shields.io/github/v/tag/tiredofit/docker-grafana?style=flat-square)](https://github.com/tiredofit/docker-grafana/releases/latest)
[![Build Status](https://img.shields.io/github/actions/workflow/status/tiredofit/docker-grafana/main.yml?branch=main&style=flat-square)](https://github.com/tiredofit/docker-grafana/actions)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/grafana.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tiredofit/grafana/)
[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/grafana.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tiredofit/grafana/)
[![Become a sponsor](https://img.shields.io/badge/sponsor-tiredofit-181717.svg?logo=github&style=flat-square)](https://github.com/sponsors/tiredofit)
[![Paypal Donate](https://img.shields.io/badge/donate-paypal-00457c.svg?logo=paypal&style=flat-square)](https://www.paypal.me/tiredofit)

## About

This will allow you to build a Docker image for Grafana.

## Maintainer

- [Dave Conroy](http://github/tiredofit/)

## Table of Contents

- [github.com/tiredofit/docker-grafana](#githubcomtiredofitdocker-grafana)
  - [About](#about)
  - [Maintainer](#maintainer)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites and Assumptions](#prerequisites-and-assumptions)
  - [Installation](#installation)
    - [Build from Source](#build-from-source)
    - [Prebuilt Images](#prebuilt-images)
      - [Multi Architecture](#multi-architecture)
  - [Configuration](#configuration)
    - [Quick Start](#quick-start)
    - [Persistent Storage](#persistent-storage)
    - [Environment Variables](#environment-variables)
      - [Base Images used](#base-images-used)
  - [Maintenance](#maintenance)
    - [Shell Access](#shell-access)
  - [Support](#support)
    - [Usage](#usage)
    - [Bugfixes](#bugfixes)
    - [Feature Requests](#feature-requests)
    - [Updates](#updates)
  - [License](#license)
  - [References](#references)

## Prerequisites and Assumptions

## Installation
### Build from Source
Clone this repository and build the image with `docker build -t (imagename) .`

### Prebuilt Images
Builds of the image are available on [Docker Hub](https://hub.docker.com/r/tiredofit/grafana)

```bash
docker pull docker.io/tiredofit/grafana:(imagetag)
```
Builds of the image are also available on the [Github Container Registry](https://github.com/tiredofit/docker-grafana/pkgs/container/docker-grafana)

```
docker pull ghcr.io/tiredofit/docker-grafana:(imagetag)
```

The following image tags are available along with their tagged release based on what's written in the [Changelog](CHANGELOG.md):

| Container OS | Tag       |
| ------------ | --------- |
| Alpine       | `:latest` |

#### Multi Architecture
Images are built primarily for `amd64` architecture, and may also include builds for `arm/v7`, `arm64` and others. These variants are all unsupported. Consider [sponsoring](https://github.com/sponsors/tiredofit) my work so that I can work with various hardware. To see if this image supports multiple architecures, type `docker manifest (image):(tag)`

## Configuration

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.

### Persistent Storage
| File                   | Description                                                              |
| ---------------------- | ------------------------------------------------------------------------ |
| `/var/run/docker.sock` | You must have access to the docker socket in order to utilize this image |

* * *
### Environment Variables



#### Base Images used

This image relies on an [Alpine Linux](https://hub.docker.com/r/tiredofit/alpine) base image that relies on an [init system](https://github.com/just-containers/s6-overlay) for added capabilities. Outgoing SMTP capabilities are handlded via `msmtp`. Individual container performance monitoring is performed by [zabbix-agent](https://zabbix.org). Additional tools include: `bash`,`curl`,`less`,`logrotate`, `nano`.

Be sure to view the following repositories to understand all the customizable options:

| Image                                                  | Description                            |
| ------------------------------------------------------ | -------------------------------------- |
| [OS Base](https://github.com/tiredofit/docker-alpine/) | Customized Image based on Alpine Linux |


| Parameter | Description | Default |
| --------- | ----------- | ------- |

## Maintenance
### Shell Access

For debugging and maintenance purposes you may want access the containers shell.

```bash
docker exec -it (whatever your container name is e.g. grafana) bash
```

## Support

These images were built to serve a specific need in a production environment and gradually have had more functionality added based on requests from the community.
### Usage
- The [Discussions board](../../discussions) is a great place for working with the community on tips and tricks of using this image.
- [Sponsor me](https://tiredofit.ca/sponsor) for personalized support
### Bugfixes
- Please, submit a [Bug Report](issues/new) if something isn't working as expected. I'll do my best to issue a fix in short order.

### Feature Requests
- Feel free to submit a feature request, however there is no guarantee that it will be added, or at what timeline.
- [Sponsor me](https://tiredofit.ca/sponsor) regarding development of features.

### Updates
- Best effort to track upstream changes, More priority if I am actively using the image in a production environment.
- [Sponsor me](https://tiredofit.ca/sponsor) for up to date releases.

## License
MIT. See [LICENSE](LICENSE) for more details.
## References

