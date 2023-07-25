# Organized by Author

```
This folder contains submodules symlinked to various project repositories containing Dockerfiles and are categorised according to Authors.

At the moment, this folder is just a trial to see its effectiveness in day-to-day production Quality-of-Life uses.

The purpose/goal of this folder is to effectively manage redundancy and minimize repeated services as well as to 
make it easier to reference
```

## Instructions
### For Contributors
1. To add git submodule links
    + In the case whereby you need to re-add the git submodule, please add the '-f' flag to force the re-adding
    ```console
    git submodule add {-f} [git-repository-url]
    ```

### How to use?
- To initialize the git submodules
    + This will clone and pull all contents of the repository into your project folder
    ```console
    git submodule init --recursive
    ```
- Update git submodules
    + This will fetch all changes made to that submodule repository into your local copy
    ```console
    git submodule update
    ```

## Authors
+ Thanatisia (Me)

