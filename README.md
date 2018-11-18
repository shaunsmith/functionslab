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

Note:

1. Make sure you use `clear-guest` or `clear-internet`. And NOT `clear-corporate`. 

2. If you are using virtualbox with the "fnlab.ova" image make sure you run the entire lab inside the "fnlab VM".



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
Docker version 18.03.1-ce, build 9ee9f40
```

NOTE: Depending on how you've installed Docker you may need to prefix `docker`
commands with `sudo` in which case you would have to type:

![](images/userinput.png)
>```
> sudo docker --version
>```

## Section 3 - Functions

Note: For this section you do NOT need the fn server on your machine. Your CLI will connect to the Functions cloud service.

With Docker successfully installed it's time to move on to functions.
Functions as a Service (FaaS) platforms provide a way to deploy code to
the cloud without having to worry about provisioning or managing any compute
infrastructure. 

Oracle Functions is a fully managed serverless FaaS platform running in Oracle 
Cloud. Functions uses open source Fn Project as it's underlying FaaS platform.

Fn Project can run anywhere - on your laptop or in the cloud. With Fn you can develop
locally and deploy to the cloud knowing your functions are running on *exactly* 
the same underlying platform.

### 3.1) Clone or download this repo

Use the "Clone or download" button at the top right to clone or download this repo.

![](images/userinput.png)
>```
> git clone https://github.com/sachin-pikle/functionslab.git
>```

### 3.2) Setup Local Development Environment

* [Setup Local Development Environment](3-1-SetupEnv.md)


### 3.3) Functions Commands Cheatsheet

* Use the [Functions Commands Cheatsheet](https://github.com/sachin-pikle/functionslab/wiki/Functions-Commands-Cheatsheet)

* Also see the [fn CLI docs](https://github.com/fnproject/docs/blob/master/cli/README.md)


### 3.4) Your First Function

* [Hello World - Node](3-2-NodeHello.md)


### 3.5) Your Second Function

* [Hello World - Go](3-3-GoHello.md)


### 3.6) Function to OCI Object Store

* [Java Function to OCI Object Store](https://github.com/abhirockzz/fn-oci-object-store-workshop/blob/master/README_Fn_Service.md)


## Section 4 - Open Source Fn

Note: For this section you need the fn server running on your machine. Each lab below has a step to start the fn server.

### 4.1) Troubleshooting

TODO - Add DEBUG=1, Common Errors

* [View your Function logs](https://github.com/abhirockzz/fn-syslog-example)

### 4.2) Function to OCI Object Store

* [Java Function to OCI Object Store](https://github.com/abhirockzz/fn-oci-object-store-workshop/blob/master/README_Fn_OSS.md)

### 4.3) Function to Oracle Database

Note: Your lab instructor will share your DB connection details

* [Java Function to Oracle Database](https://github.com/abhirockzz/fn-oracledb-java-workshop)

