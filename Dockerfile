FROM ubuntu:18.04

ARG QTC_SHORT_VERSION=4.7
ARG QTC_FULL_VERSION=4.7.1

RUN echo "Installing prerequisites" && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get --assume-yes dist-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install \
        build-essential \
        curl \
        libclang1 \
        libgl1-mesa-dri \
        libgl1-mesa-glx \
        xdg-utils && \
    echo "Downloading Qt installer $QTC_FULL_VERSION" && \
    curl -L https://download.qt.io/official_releases/qtcreator/$QTC_SHORT_VERSION/$QTC_FULL_VERSION/qt-creator-opensource-linux-x86_64-$QTC_FULL_VERSION.run -o /tmp/qt-creator-opensource-linux-x86_64-$QTC_FULL_VERSION.run && \
    chmod +x /tmp/qt-creator-opensource-linux-x86_64-$QTC_FULL_VERSION.run && \
    echo "Downloading install script" && \
    curl -L https://raw.githubusercontent.com/benlau/qtci/087f970ab383d3682e306aeab707bc89224e572f/bin/extract-qt-installer -o /tmp/extract-qt-installer && \
    chmod +x /tmp/extract-qt-installer && \
    echo "Starting install" && \
    QT_CI_PACKAGES=qt.tools.qtcreator /tmp/extract-qt-installer /tmp/qt-creator-opensource-linux-x86_64-$QTC_FULL_VERSION.run /opt/Qt && \
    echo "Cleanup" && \
    apt-get autoremove --assume-yes && \
    apt-get clean && \
    rm --force --recursive /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/opt/Qt/bin/qtcreator"]
