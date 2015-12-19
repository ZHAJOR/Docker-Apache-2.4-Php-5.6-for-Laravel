# Docker-Apache-2.4-Php5.6-for-Laravel
A Dockerfile for developers to run a Laravel projet under php 5.6 and apache 2.4

## Before starting

This configuration was made to run a Laravel project with a postgresql database, as a developer.  
This should also work with a Lumen project (not tested).  
The drivers for mysql are available.

## Usage
First you have to make an image :  
` docker build -t api .`  
Then a container :  
`docker run -d -v /Path/To/api/:/var/www/html -p 12345:80 --name=contrainer-api api`  
The goal here is just to share the project directory with the container, so we can keep working on it.

## Logs
As you can see in the Dockerfile the apache logs are linked to **stderr** and **stdout**, so you can access them just by doing `docker logs container-api`.  
The laravel logs are available in the the /storage/logs/ of your project as always (don't forget to set the rights to write in this directory).

# Kitematic
Don't forget to change the VOLUMES (settings) with your local Laravel project path.

## Conclusion
Have fun !
