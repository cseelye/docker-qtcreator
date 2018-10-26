# docker-qtcreator [![Build Status](https://travis-ci.org/cseelye/docker-qtcreator.svg?branch=master)](https://travis-ci.org/cseelye/docker-qtcreator)
Run Qt Creator in a docker container

Docker Hub: https://hub.docker.com/r/cseelye/linux-shell/  
Github: https://github.com/cseelye/docker-linux-shell

I created this primarily for doing linux development on Mac OS; this allows the clang code model or language server to run in a linux environment so that parsing/code completion/etc work correctly for a linux codebase.

The qtcreator-container shell script will launch the container for you and takes care of details like mounting your home directory into the container and mapping the X11 socket correctly.

For Mac OS users, I have created a wrapper app with [Platypus](https://github.com/sveinbjornt/Platypus) that makes the shell script into a real app. [Download the zip file here](https://github.com/cseelye/docker-qtcreator/releases/latest). The first time you launch it, it will need to download and extract the container, so it may appear to be doing nothing for a couple minutes before launching Qt Creator.
