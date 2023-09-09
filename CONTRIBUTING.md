# CONTRIBUTING

## Contribution Ruleset
- Please follow the DevOps/contribution best practices when contributing
    0. (OPTIONAL) Fork the repository
        + Do this if you wish to fork the repository downstream
    1. Clone Repository/Pull the latest changes
        - Cloning
            ```console
            git clone [repository-url]
            ```
        - Pulling the latest changes
            ```console
            git pull origin main
            ```
    2. Create a new branch
        ```console
        git checkout -b [new-branch-name]
        ```
    3. Make changes
    4. Add changes to tree
        ```console
        git add [files]
        ```
    5. Commit changes to branch
        ```console
        git commit -m [message]
        ```
    6. Push changes to branch
        ```console
        git push -u origin [branch-name]
        ```
    7. Create a Pull Request (PR) to merge the branch upstream
        - Please specify the following in the Pull Request
            ```
            Folder changed: 
            Files changed: 
            Changes made:
                - Changes here
            Reason for change:
                - Reasons here
            ```
    8. Submit Pull Request
    9. Wait for Pull Request merge accept/reject
    10. Switch back to main branch
        ```console
        git switch main
        ```
    10. Repeat step 1

- Please take note of the type of service/image you will be writing for
    - i.e.
         + 'services' : standalone docker image
         + 'stacks': multi-layered/microservice image with more than 1 other services required

- If you would like to contribute your own docker image repository
    - Please refer to the [README in authors folder](authors/README.md)
        + This folder contains all images/service files (docker/docker-compose etc) created by individual/authors and are filtered according to author names
        - as such, please take note of the following before creating the pull request to push into the folder
            - Create the folder according to the following namespace/file structure
                + authors/[author-name]/
            - In the folder 'authors/author-name'
                - Add a submodule linking to the repository (i.e. authors/author-name/[repository|image]/)
                    ```console
                    git submodule add {-f} [remote-repository-url]
                    ```
            - Remember to test that the submodule can be reinitialized and cloned
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
            - Create a Pull Request and specify the following parameters
                - Title: Merge [author-name/repository-name] to 'authors' folder
                - Body:
                    ```
                    Platform: {Mobile|WebApp|CLI Utility|Desktop Application}
                    Service|Project|Application Topic: {Inventory Management System|Networking|DNS|VPN etc}
                    ```

+ For more information, please refer to the [README](README.md)

## Filesystem structure
### Folders
+ authors : Contains all custom service/image repositories from authors who would like to contribute separately
+ categorised : Contains all services/stacks separated by STEM/utilities/tools categories (programming etc)
+ Dockerfiles : Contains custom Dockerfiles to services/projects/applications from various repositories that may not have hosted their docker images on a container repository server (i.e. ghcr or DockerHub)
+ docs : Contains all documentation and miscelleneous write-ups for more administrative information
+ production : Contains a single docker-compose containing various services tested together to be ran in a production environment; To be deprecated in due time
+ services : Contains general services that are not specific and/or Home-Lab services, regardless of WebUI, networking or not
+ stacks : Contains multi-layer/multiplatform stack services/projects that utilises more than 1 other services in conjunction with a primary service to perform a task/purpose

## Templates
### docker-compose files
> Please refer to the following template when writing the docker-compose to include important user details
- Rules
    + Add the following template at the head of the docker-compose file
        ```yaml
        # Docker-compose for
        # [Utility/Service type]
        # Service Author: author
        # Service Name: repository-name
        # URL: https://github.com/author/repository-name
        # Configurations:
        #   - [configuration documentation URLs]

        ### Services here
        ```
        + More examples and Templates can be found in the [templates](docs/templates) folder

## Remarks
* Thank you for contributing/using this repository if you did, do follow the steps in [ISSUES.md](ISSUES.md) if you have any issues or suggestions to make


