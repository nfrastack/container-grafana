# SPDX-FileCopyrightText: © 2026 Nfrastack <code@nfrastack.com>
#
# SPDX-License-Identifier: MIT

ARG \
    BASE_IMAGE

FROM ${BASE_IMAGE}

LABEL \
        org.opencontainers.image.title="Grafana" \
        org.opencontainers.image.description="Analytics and monitoring platform" \
        org.opencontainers.image.url="https://hub.docker.com/r/nfrastack/grafana" \
        org.opencontainers.image.documentation="https://github.com/nfrastack/container-grafana/blob/main/README.md" \
        org.opencontainers.image.source="https://github.com/nfrastack/container-grafana.git" \
        org.opencontainers.image.authors="Nfrastack <code@nfrastack.com>" \
        org.opencontainers.image.vendor="Nfrastack <https://www.nfrastack.com>" \
        org.opencontainers.image.licenses="MIT"

ARG \
    GRAFANA_VERSION="v13.0.0" \
    GRAFANA_REPO_URL="https://github.com/grafana/grafana"

COPY CHANGELOG.md /usr/src/container/CHANGELOG.md
COPY LICENSE /usr/src/container/LICENSE
COPY README.md /usr/src/container/README.md

ENV \
    IMAGE_NAME="nfrastack/grafana" \
    IMAGE_REPO_URL="https://github.com/nfrastack/container-grafana/"

EXPOSE 3000

RUN echo "" && \
    BUILD_ENV=" \
                10-nginx/ENABLE_NGINX=FALSE \
                10-nginx/NGINX_ENABLE_CREATE_SAMPLE_HTML=FALSE \
                10-nginx/NGINX_SITE_ENABLED=grafana \
              " \
              && \
    GRAFANA_BUILD_DEPS_ALPINE=" \
                                gcc \
                                make \
                                musl-dev \
                                nodejs \
                                npm \
   #                             yarn \
                            " \
                            && \
    GRAFANA_RUN_DEPS_ALPINE=" \
                                chromium \
                                libc6-compat \
                                ttf-opensans \
                                udev \
                            " \
                            && \
    \
    source /container/base/functions/container/build && \
    container_build_log image && \
    create_user grafana 472 grafana 472 /usr/share/grafana && \
    package update && \
    package upgrade && \
    package install \
                        GRAFANA_BUILD_DEPS \
                        GRAFANA_RUN_DEPS \
                        && \
    package build go && \
    \
    npm install -g yarn && \
    clone_git_repo "${GRAFANA_REPO_URL}" "${GRAFANA_VERSION}" /usr/src/grafana && \
    make && \
    strip /usr/src/grafana/bin/linux/$(container_info arch alt)/grafana && \
    cp -aR \
            /usr/src/grafana/bin/linux/$(container_info arch alt)/grafana \
                /usr/local/sbin && \
    mkdir -p /usr/share/grafana && \
    cp -aR \
            /usr/src/grafana/conf \
            /usr/src/grafana/public \
                /usr/share/grafana && \
    chown -R grafana:grafana /usr/share/grafana && \
    container_build_log add "Grafana" "${GRAFANA_VERSION}" "${GRAFANA_REPO_URL}" && \
    npm uninstall -g yarn && \
    package remove \
                        GRAFANA_BUILD_DEPS && \
    package cleanup

COPY rootfs /
