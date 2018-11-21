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

### 1.1) Install Docker

* [Docker Options](vm.md)

### 1.2) Verify your Docker Installation

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


## Section 2 - Open Source Fn

With Docker successfully installed it's time to move on to functions.
Functions as a Service (FaaS) platforms provide a way to deploy code to
the cloud without having to worry about provisioning or managing any compute
infrastructure. The goal of the open source Fn project is to provide a functions
platform that you can run anywhere--on your laptop or in the cloud. And Fn will
also be the basis of a fully serverless FaaS platform.  With Fn you can develop
locally and deploy to the cloud knowing your functions are running on *exactly*
the same underlying platform.

### 2.1) Installing Fn

You've got Docker installed so the principal Fn prerequisite is satisfied. So
let's start by [Installing Fn](http://fnproject.io/tutorials/install).

### 2.2) Your First Function

Now that the Fn server and CLI are installed we can dig into the creation and
running of functions.  In this tutorial you'll create, run locally, and deploy
a Go function.  If you aren't a Go programmer don't panic! All the code is
provided and is pretty easy to understand.  The focus of this tutorial is on
becoming familiar with the basics of Fn, not Go programming.

So let's [create and deploy your first function](http://fnproject.io/tutorials/Introduction).

### 2.3) Introducing the Java Function Development Kit

Fn provides an FDK (Function Development Kit) for each of the core supported
programming languages.  But the Java FDK is the most advanced with support for
Maven builds, automatic function argument type conversions, and comprehenive
support for function testing with JUnit.

The [Introduction to Java Functions](http://fnproject.io/tutorials/JavaFDKIntroduction)
tutorial covers all these topics and more.

### 2.4) Troubleshooting

If you've been following the instructions in the tutorials carefully you
shouldn't have run into any unexpected failures--hopefully!!  But in real life
when you're writing code things go wrong--builds fail, exceptions are thrown,
etc.  Fortunately the [Troubleshooting](http://fnproject.io/tutorials/Troubleshooting)
tutorial introduces techniques you can use to track down the source of a
failure.

### 2.5) Containers as Functions

One of the coolest features of Fn is that while it's easy to write functions
in various programming languages, you can also deploy Docker images as
functions. This opens up entire world's of opportunity as you can package
existing code, utilities, or use a programming language not yet supported by
Fn.  Try the [Containers as Functions](http://fnproject.io/tutorials/ContainerAsFunction/)
tutorial to see how easy it is.


## Section 3 - Oracle Functions

Note: For this section you do NOT need the fn server on your machine. Your CLI will 
connect to the OracleFunctions cloud service.

Oracle Functions is a fully managed serverless FaaS platform running in Oracle 
Cloud. Functions uses open source Fn Project as it's underlying FaaS platform.

### 3.1) Setup Local Development Environment

* [Setup Local Development Environment](3-1-SetupEnv.md)


### 3.2) Functions Commands Cheatsheet

* Use the [Functions Commands Cheatsheet](https://github.com/sachin-pikle/functionslab/wiki/Functions-Commands-Cheatsheet)

* Also see the [fn CLI docs](https://github.com/fnproject/docs/blob/master/cli/README.md)


### 3.3) Your First Function

* [Hello World - Node](3-2-NodeHello.md)


### 3.4) Troubleshooting Functions

* If you haven't already, get a PaperTrail destination syslog endpoint by following steps 1-5 
from [Troubleshooting Fn](https://fnproject.io/tutorials/Troubleshooting/#LogCapture)

* Update your app's syslog-url with the PaperTrail destination

  ![](images/userinput.png)
  >```
  > fn update app ws<NNN>app --syslog-url tcp://<your-Papertrail-destination>
  >```

* Inspect your app and confirm the syslog-url shown matches what you provided

  ![](images/userinput.png)
  >```
  > fn inspect app ws<NNN>app
  >```

* Add a console.log statement in your node function

  ![](images/userinput.png)
  >```
  >   // Add a console.log statement before the return statement
  >   console.log("Inside helloworld node function. Name=", name);
  >```

* Redeploy the updated function

  ![](images/userinput.png)
  >```
  > fn -v deploy --app ws<NNN>app --no-cache
  >```

* Invoke the function

  ![](images/userinput.png)
  >```
  > fn invoke ws<NNN>app node-fn --display-call-id
  >```
  
  >```
  > echo -n '{"name":"DOAG"}' | fn invoke ws<NNN>app node-fn --display-call-id --content-type application/json
  >```

* View the log statement in your PaperTrail Events console

  >```
  > Nov 21 22:08:34 linuxkit-000017025c24 app_id=ocid1.fnapp.oc1.phx.aaaaaaaaagyg7suol3nt3oo24ka3i4uzt7bjf: Inside helloworld node function. Name= World
  > Nov 21 22:10:07 linuxkit-000017025c24 app_id=ocid1.fnapp.oc1.phx.aaaaaaaaagyg7suol3nt3oo24ka3i4uzt7bjf: Inside helloworld node function. Name= DOAG
  >```


### 3.5) Your Second Function

* [Hello World - Go](3-3-GoHello.md)


### 3.6) Function to OCI Object Store

* [Java Function to OCI Object Store](https://github.com/abhirockzz/fn-oci-object-store-workshop/blob/master/README_Fn_Service.md)
