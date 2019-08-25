# Invoke Oracle Functions Using OCI Events service

This lab walks you through how to invoke a function deployed to Oracle Functions
automatically using the Oracle Cloud Infrastructure (OCI) Events service. We will 
trigger a function when an object is uploaded to an OCI Object Storage bucket. We 
will use OCI Events service to call our function which will retrieve metadata from 
the image.

## OCI Events service

OCI Events service is a fully managed service that lets you track changes in your 
OCI resources and respond to them using Oracle Functions, Notifications, and Streaming 
services. OCI Events service is compliant with Cloud Native Computing Foundation (CNCF) 
CloudEvents for seamless interoperability with the cloud native ecosystem.

![OCI Events Service](images/oci-events-service.jpg)

## Create a function

Let's head back to our local terminal to create a function:

![user input](images/userinput.png)
>```
> fn init --runtime java cloud-events-demo-fn
>```

We'll add two dependencies to the pom.xml file. One for the cloudevents-api, and 
another for metadata-extractor so we can extract the image metadata later on:

![user input](images/userinput.png)
>```
> <dependency>
>     <groupId>io.cloudevents</groupId>
>     <artifactId>cloudevents-api</artifactId>
>     <version>0.2.1</version>
> </dependency>
> <dependency>
>     <groupId>com.drewnoakes</groupId>
>     <artifactId>metadata-extractor</artifactId>
>     <version>2.12.0</version>
> </dependency>
>```


