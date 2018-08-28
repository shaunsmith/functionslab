# Functions Lab

In this lab you will also explore serverless computing using Oracle Functions. 
Oracle Functions uses the open-source Fn engine.

This document is meant to be an overview of the entire lab.  Throughout, you may
be directed to other labs, to run specific sections.  It is important that when
you finish each major section, you return to *this* document for the next
section.

As you make your way through the tutorials, look out for this icon.
![](images/userinput.png) Whenever you see it, it's time for you to
perform an action.

## Section 1 - Setting up a Docker Environment

* [Docker Options](vm.md)

## Section 2 - Verifying your Docker Install

Before we get started with functions we're going to verify that Docker is
installed and working. In a terminal, type the following command:

![](images/userinput.png)
>```
> docker --version
>```

If Docker is installed and running, you should see output something like:

```
Docker version 17.0x.x-ce, build 276fd32
```

NOTE: Depending on how you've installed Docker you may need to prefix `docker`
commands with `sudo` in which case you would have to type:

![](images/userinput.png)
>```
> sudo docker --version
>```

## Section 3 - Functions

With Docker successfully installed it's time to move on to functions.
Functions as a Service (FaaS) platforms provide a way to deploy code to
the cloud without having to worry about provisioning or managing any compute
infrastructure. 

Oracle Functions is a fully managed serverless FaaS platform running in Oracle 
Cloud. Functions uses open source Fn Project as it's underlying FaaS platform.

Fn Project can run anywhere - on your laptop or in the cloud. With Fn you can develop
locally and deploy to the cloud knowing your functions are running on *exactly* 
the same underlying platform.


### 3.1 Setup Local Development Environment

* [Setup Local Development Environment](3-1-SetupEnv.md)


### 3.2 Your First Function

* [Hello World - Node (Http Trigger)](3-2-NodeHello.md)



### 3.3 Your Second Function

* [Hello World - Go (Http Trigger)](3-3-GoHello.md)



### 3.4 Function to Object Store



### 3.5 Function to Database



### 3.6 Troubleshooting

Logs, DEBUG=1, Common Errors

