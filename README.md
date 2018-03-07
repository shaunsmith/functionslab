# functionslab

In this lab, you will explore basic Docker commands to run a Docker container and build an image, then push it to a registry.  You will also explore serverless computing using functions with the Docker-based open source Fn project.

This document is meant to be an overview of the entire lab.  Throughout, you may be directed to other labs, to run specific sections.  It is important that when you finish each major section, you return to this document for the next section.

## Section 0 - Have a Docker Environment

* [Docker Options](vm.md)

## Section 1 - Verify Docker Engine Hands on Lab Environment

In this first section you are going to verify that you are able to access to your Docker Engine environment. For convenience, run as root, so that you do not have to preface everything with sudo.  In a terminal: 

```
$ sudo -s
```

Now, here is the Docker specific command to check what version is installed:

```
$ docker --version
```

If Docker is installed and running, you should see an output of something like this:

```
Docker version 17.0x.x-ce, build 276fd32
```

***

## Section 2 - Complete these 3 Docker exercises

* [Hello Helloworld](https://github.com/oracle/cloud-native-devops-workshop/blob/master/containers/docker001/Participant-Guide.md#hello-helloworld)

* [Create a Dockerfile and Docker image](https://github.com/oracle/cloud-native-devops-workshop/blob/master/containers/docker001/Participant-Guide.md#create-a-dockerfile-and-docker-image)

* [Push an Image to your Docker Hub Account](https://github.com/oracle/cloud-native-devops-workshop/blob/master/containers/docker001/Participant-Guide.md#create-a-dockerfile-and-docker-image)

> *Note - Be sure to return to this lab, after completing the above.

## Section 3 - Functions

With core Docker usage under your belt it's time to move on to functions.
Functions as a Service (FaaS) platforms provide a way to deploy code to
the cloud without having to worry about provisioning or managing any compute
infrastructure.  The goal of the open source Fn project is to provide a functions
platform that you can run anywhere--on your laptop or in the cloud.  And Fn will
also be the basis of a fully serverless FaaS platform.  With Fn you can develop
locally and deploy to the cloud knowing your functions are running on *exactly*
the same underlying platform.

* [Install Fn and deploy your first functions](http://fnproject.io/tutorials/Introduction)

* [Introduction to Java Functions](http://fnproject.io/tutorials/JavaFDKIntroduction)

* [Containers as Functions](http://fnproject.io/tutorials/ContainerAsFunction/)

### More Fn Tutorials!

If you've completed these tutorial and want to try
more you're in luck.  There's an ever expanding
collection of Fn tutorials you can try on your own time.

Check out these [Fn Tutorials](http://fnproject.io/tutorials) and just
skip the ones you've already completed.
