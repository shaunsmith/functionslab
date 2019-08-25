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

