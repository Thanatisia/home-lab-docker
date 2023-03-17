# CONTRIBUTING

## Contribution Ruleset
* Please follow the DevOps/contribution best practices when contributing
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

## Remarks
* Thank you for contributing/using this repository if you did, do follow the steps in [ISSUES.md](ISSUES.md) if you have any issues or suggestions to make


