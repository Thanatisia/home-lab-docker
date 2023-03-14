# Unbound DNS resolver

## Introduction
+ There are quite afew (albeit unofficial) Unbound docker-compose files out there
- However, there are some authors that are widely used, namely
    + [MatthewVance](https://github.com/MatthewVance)

## System Design
+ This docker-compose snippet is created based on MatthewVance's Dockerfile image, however, you can just change the 'image' tag if you have created your own, as this docker-compose snippet is created to be universal/customizable

## Architecture differences
+ Due to differences in support for different architectures, the Dockerfile maintainers may also have seperate repositories for different architectures
+ Hence, I will be seperating the snippets and files required based on Architecture (if available)

## Repositories
+ [MatthewVance/unbound-docker (General)](https://github.com/MatthewVance/unbound-docker)
+ [MatthewVance/unbound-docker (Raspberry Pi/ARM)](https://github.com/MatthewVance/unbound-docker-rpi)
