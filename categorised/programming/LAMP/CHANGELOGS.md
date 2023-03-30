# CHANGELOGS

## Changes
- 2023-03-30 2324H | updates-and-implementation
    - Updates
        - Changed base image from `php` => `php:apache`
            + The 'php:apache' base image is basically the php image but with apache configured and installed in it from the get-go
        - Got base image working
        - Got the LAMP stack containers working together as well as the volumes mounted
            + Able to access database via MySQL Workbench
            + Able to view PHP files
            + Able to access phpmyadmin from browser
