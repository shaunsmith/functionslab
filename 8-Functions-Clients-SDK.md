# Invoke Oracle Functions using the OCI SDK

This lab walks you through how to invoke a function deployed to Oracle Functions
using (a preview version of) the Oracle Cloud Infrastructure Java SDK.  The OCI
Java SDK exposes two endpoints specificially for Oracle Functions:

- `FunctionsManagementClient` - which provides APIs for function and application
  lifecycle management (e.g., CRUD operations)
- `FunctionsInvokeClient` - for invoking functions

The SDK also provides a number of utility classes for building function
invocation requests and handling request results.

In this example, we'll invoke a existing function by it's id so we will only
need the `FunctionsInvokeClient`.  The key method we're going to use is the
suitably named `invokeFunction`, which takes an `InvokeFunctionRequest`.

The required steps our client code will need to perform are:

1. Authenticate with OCI (more on this below)
2. Create a `FunctionsInvokeClient` with the auth credentials
3. Set the `invokeEndpoint` of the client to the URL of the Oracle Functions service in your region
3. Create an `InvokeFunctionRequest` with the function id
4. Pass the `InvokeFunctionRequest` to the `FunctionsInvokeClient`to call the function
5. Extract the result from an `InvokeFunctionResponse`

## OCI Java SDK

This example uses the latest OCI Java SDK. The SDK is available in Maven Central.

## A Tour of the Code

The entire functions client class is [InvokeById](functions-sdk/src/main/java/com/example/fn/InvokeById.java) but the core functionality is in the following lines:

```java
        AuthenticationDetailsProvider authProvider = new ConfigFileAuthenticationDetailsProvider(ociProfile);
        try (FunctionsInvokeClient fnInvokeClient = new FunctionsInvokeClient(authProvider)) {
            fnInvokeClient.setEndpoint(invokeEndpointURL);

            InvokeFunctionRequest ifr = InvokeFunctionRequest.builder().functionId(functionId)
                    .invokeFunctionBody(StreamUtils.createByteArrayInputStream(payload.getBytes())).build();

            System.out.println("Invoking function endpoint - " + invokeEndpointURL + " with payload [" + payload + "]");
            InvokeFunctionResponse resp = fnInvokeClient.invokeFunction(ifr);
            System.out.println(IOUtils.toString(resp.getInputStream(), StandardCharsets.UTF_8));
         }
```

The first line creates an instance of `ConfigFileAuthenticationDetailsProvider`
which will read the `~/.oci/config` file and attempt to authenticate with OCI.
In this case, we will pass the OCI profile as the first argument while running this program.

```java
AuthenticationDetailsProvider authProvider = new ConfigFileAuthenticationDetailsProvider(ociProfile);
```

The next two lines instantiate a `FunctionsInvokeClient` using the config file
auth provide and sets the Oracle Functions service endpoint for the region.

```java
try (FunctionsInvokeClient fnInvokeClient = new FunctionsInvokeClient(authProvider)) {
    fnInvokeClient.setEndpoint(invokeEndpointURL);
```

The next few lines builds an `InvokeFunctionRequest` object for a function with
the specified id (OCID) and sets the function body (payload) to the string
value that was passed in from the command line.

>NOTE: When setting the payload be sure to use the SDK's **StreamUtils** class.

```java
InvokeFunctionRequest ifr = InvokeFunctionRequest.builder().functionId(functionId)
     .invokeFunctionBody(StreamUtils.createByteArrayInputStream(payload.getBytes())).build();
```

Finally we use the invoke client to call the function we constructed, getting
an `InvokeFunctionResponse` in return.

## Build the Client app and configure your environment

1. Since you've previously cloned the workshop git repo into your home
   directory, cd into the `functionslab/functions-sdk` folder where you'll find
   the Java code and a `pom.xml` to build it.

    ![user input](images/userinput.png)
    >```
    >cd ~/functionslab/functions-sdk
    >```

2. Build the Functions client using Maven

    ![user input](images/userinput.png)
    >```
    >mvn clean package
    >```

3. Define OCI authentication properties

    Similar to what we saw when using the `oci-curl` Bash script, Functions
    clients need to authenticate with OCI before being able to make service
    calls. There are a few ways to authenticate. This example uses an
    `ConfigFileAuthenticationDetailsProvider`, which reads user properties from
    the OCI config file located in `~/.oci/config`. This class can be instructed
    to read an optionally specified OCI profile. For this lab let's use
    the "workshop" profile.

    You're `~/.oci/config` file was pre-populated with all of the right values
    for your tenancy, compartment, user id, etc.  So it's ready to go!  There's
    only one profile defined, but you can have many profiles for use with
    different tenancies or compartments.
    
    Review your `~/.oci/config` file to become familiar with its contents and
    structure.  In a terminal type:

   ![user input](images/userinput.png)
    >```
    >cat ~/.oci/config
    >```

## Invoke your Function

Before we take a look at the client code, let's run it.

The Maven build produces a jar in the target folder. The syntax to run the
example is:

`java -jar target/<jar-name>.jar <oci-profile> <function-invoke-endpoint> <function-id> [<payload-string>]`

Unlike the `oci-curl` example, the OCI SDK supports invoking a function by its
id, not directly using its invoke endpoint. But we need to find the Orace
Functions invoke endpoint (protocol + host) and the function id.  We can do this by
inspecting the function you want to invoke using the Fn CLI, e.g.,:

![user input](images/userinput.png)
>```
> fn inspect fn labapp-NNN nodefn
>```

The result will be a JSON structure similar to the following:

```JSON
{
	"annotations": {
		"fnproject.io/fn/invokeEndpoint": "https://toyh4yqssuq.us-phoenix-1.functions.oci.oraclecloud.com/20181201/functions/ocid1.fnfunc.oc1.phx.abcdefg..hijk/actions/invoke",
		"oracle.com/oci/compartmentId": "ocid1.compartment.oc1..abcdefg"
	},
	"app_id": "ocid1.fnapp.oc1.phx.abcd..fg",
	"created_at": "2019-08-26T21:28:04.866Z",
	"id": "ocid1.fnfunc.oc1.phx.abcdefg..hijk",
	"idle_timeout": 30,
	"image": "phx.ocir.io/oracle/shs/nodefn:0.0.4",
	"memory": 128,
	"name": "nodefn",
	"timeout": 30,
	"updated_at": "2019-08-26T21:28:04.866Z"
}
```

The invoke endpoint you need to pass to the example can be extracted from the
value of the `fnproject.io/fn/invokeEndpoint` property. You just need the
protcol and name of the host. For the example above that would be:
`https://toyh4yqssuq.us-phoenix-1.functions.oci.oraclecloud.com`. The `id`
property contains the function id.

> NOTE: Payload is optional. If your function doesn't expect any input you
> can omit it.

e.g., without payload:

`java -jar target/fn-java-sdk-invokebyid-1.0-SNAPSHOT.jar workshop https://toyh4yqssuq.us-phoenix-1.functions.oci.oraclecloud.com ocid1.fnfunc.oc1.phx.abcdefg..hijk`

e.g., with payload:

`java -jar target/fn-java-sdk-invokebyid-1.0-SNAPSHOT.jar workshop https://toyh4yqssuq.us-phoenix-1.functions.oci.oraclecloud.com ocid1.fnfunc.oc1.phx.abcdefg..hijk '{"name":"foobar"}'`

## What if my function needs input in binary form?

See the [Invoke by Function
name](https://github.com/abhirockzz/fn-java-sdk-invoke) example for details on
how to attach a binary payload to an `InvokeFunctionRequest`.

## Troubleshooting

1. If you fail to provide a "workshop" profile in the OCI `config` file you'll get
   the following exception:

   Exception in thread "main" java.lang.NullPointerException: missing fingerprint in config

2. If you provide an invalid value for function id you'll get an exception
   similar to the following:

   Exception in thread "main" com.oracle.bmc.model.BmcException: (404, Unknown, false) Unexpected Content-Type: application/json;charset=utf-8 instead of application/json. Response body: {"code":"NotAuthorizedOrNotFound","message":"Resource is not authorized or not found"} (opc-request-id: F8BC6E9DC19F44BD8E8967AAEC/01D5424B1F1BT1AW8ZJ0003Z6C/01D5424B1F1BT1AW8ZJ0003Z6D)

3. If you provide an incorrect `tenancy` or `user` or
   `fingerprint` in your OCI `config` file you'll receive an authentication exception similar to the following:

   Exception in thread "main" com.oracle.bmc.model.BmcException: (401, Unknown, false) Unexpected Content-Type: application/json;charset=utf-8 instead of application/json. Response body: {"code":"NotAuthenticated","message":"Not authenticated"} (opc-request-id: 3FD3E66DF81F4BB490A6424530/01D5427GTX1BT1D68ZJ0003Z9E/01D5427GTX1BT1D68ZJ0003Z9F)

## Wrapping Up

In this lab you've got a taste of what it's like to use the OCI SDK for
Functions to invoke a function.  The OCI SDK provides support for the entire
Functions API so you can both invoke and manage functions and applications.
Please refer to the SDK docs for more details.

NEXT: [*Automatically invoke Functions using OCI Events*](9-Functions-Invoke-OCI-Events.md), 
UP: [*Labs*](1-Labs.md), HOME: [*INDEX*](README.md)

