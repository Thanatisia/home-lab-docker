# Gitea Git Server

## Introduction
+ Gitea is a git remote repository server hosting utility with a WebUI (WebGUI) similar to Github, Gitlab or codeberg

## System Design
+ This docker-compose snippet is created with the official gitea image, however, due to architectural differences (refer to [Architecture differences](#Architecture-differences) for more information), there are multiple subfolders for the different architecture support
+ However, you can just change the 'image' tag if you have created your own, as this docker-compose snippet is created to be universal/customizable

## Architecture differences
+ Due to differences in support for different architectures, the Dockerfile maintainers may also have seperate repositories for different architectures
+ Hence, I will be seperating the snippets and files required based on Architecture (if available)

## Repositories
+ [Dockerhub - Gitea official image](https://hub.docker.com/r/gitea/gitea)
+ [GitHub - Gitea custom ARMv7 docker image by strobi](github.com/strobh-docker-rpi-gitea)
+ [Dockerhub - Gitea custom ARMv7 docker image by strobi](hub.docker.com/r/strobi/rpi-giteoa)

## Resources
+ For more information, please refer to [the Gitea docs - Install with docker](docs.gitea.io/en-us/install-with-docker)

## References

## Remarks

