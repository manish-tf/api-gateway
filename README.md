# Api Gateway

## Summary

This repository is API management tool that sits between a client and a collection of backend services. It is written in [Spring-Boot](https://spring.io/projects/spring-boot) framework, is used by the application. 

### List of functionalities offered by the service
* api gateway solves a very common use case where a UI application wants to proxy calls to one or more back end services.
* The user needs to mention the services in the application.yml to access the backend services.

## Developer Setup
Following software configurations are needed for the development:

* [JDK 1.8](https://www.oracle.com/in/java/technologies/javase/javase8-archive-downloads.html) 
* [Maven](http://download.Eclipse.org/technology/m2e/releases/)
* [Eclipse](https://www.eclipse.org/downloads/) or [IntelliJ IDEA](https://www.jetbrains.com/idea/download/#section=windows)
* [Lombok](https://projectlombok.org/download)
* [Git](https://git-scm.com/)
* [Postman](https://www.postman.com/downloads/)

## Branches and Branching Strategy
The main Git branch is called `master` which is used for production. A long lived branch called `development` also exists that runs parallelly with `master` branch which will be used by all the developers to keep track of the latest code.

The project exclusively uses Git-Flow branching strategy invented by *Vincent Driessen*.
<p  align="center">
<br>
<img  src="https://www.linkpicture.com/q/git-strategy.png"  height="400"  width="600"  />
<br>
</p>

## Installation
Follow the instructions to run identity service locally:

```sh
$ git clone git@bitbucket.org/tf-bdo-transact/api-gateway.git
$ cd api-gateway/
```

## Running the app

##### 1. Running from an IDE
* You can run a Spring Boot application from your IDE as a simple Java application (Application.java or Main class).
* The main class is a class that contains the main() method. It starts the Spring ApplicationContext. It is the class that we run     for the execution of the application.
<p  align="center">
<br>
<img  src="https://static.javatpoint.com/springboot/images/run-spring-boot-application2.png"  height="200"  width="400"  />
<br>
</p>

##### 2. Running from an command line
One of the ways that you can run your spring-boot application from command line is as follows :
* First go to your project directory in command line [where is your project located ?]
* Then in the next step you have to create jar file for that, this can be done as

```sh
"mvn clean install" for compile
```
* jar file is created in the target sub-directory
* Now go to target sub directory as jar was created inside of it , i.e cd target
* Now run the jar file in there. Use command java -jar name.jar [ name is the name of your created jar file.]

```sh
"java -jar filename.jar" for run the service
```
## Lint with [SonarQube](https://sonar.thoughtfocus.com/sessions/new?return_to=%2F)
* When the code is merged to the master branch the SonarQube script will run and generate the report.               
+ The report will available in the link and user needs to log in using their office email id.
+ The user can analyze the following information:
    + Bugs and vulnerabilities.
    + Code smells and the time you will spend fixing these errors.
    + The average of your code that has been covered running the test.
    + The average of your code that has been covered running the test.
    + Percentage of duplications and the number of duplicated blocks were found in your code.
* Select the project you’ll able to view something as below.
<p  align="center">
<br>
<img  src="https://docs.bitnami.com/images/img/how_to_guides/analyze-projects-sonarqube/initial-metrics-before-add-error.png"  height="400"  width="600"  />
<br>
</p>

## License
[ThoughtFocus © 2022](LICENSE). All rights reserved
