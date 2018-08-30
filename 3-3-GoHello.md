# Hello World - Go (HTTP Triggers)

*Don't forget to replace `<NNN>` with your user number. Your lab instructor will give you your user number.*

## Reuse your first app

We will reuse the app you created in the [Hello World - Node (HTTP Triggers)](3-2-NodeHello.md) example. We will add the Go function to the same app.

## Create a boiler plate Go function with an http trigger

![](images/userinput.png)
>```
> fn init --runtime go --trigger http go-fn
>```

## Switch directory

![](images/userinput.png)
>```
> cd go-fn
>```

## Deploy the function to the service

![](images/userinput.png)
>```
> fn -v deploy --app workshop-<NNN>-app --no-bump
>```

## List triggers

![](images/userinput.png)
>```
> fn list triggers workshop-<NNN>-app
>```

## [TEMPORARY SOLUTION] Make the OCIR repo public

Refer to [Functions Cheatsheet - Triggers (List, Inspect, Invoke)](https://github.com/sachin-pikle/functionslab/wiki/Functions-Commands-Cheatsheet#triggers-list-inspect-invoke) section.

![](images/userinput.png)
>```
> On the OCIR console, make your repo (created by Fn deploy) public: 
> iad.ocir.io/oracle-serverless-devrel/workshop-<NNN>/go-fn
>```

## Invoke the function using CLI

![](images/userinput.png)
>```
> fn -v invoke workshop-<NNN>-app go-fn
>
> {"message":"Hello World"}
>```

And you can pass parameters as shown below:

![](images/userinput.png)
>```
> echo -n '{"name":"EMEA"}' | fn invoke workshop-<NNN>-app go-fn --content-type application/json
>
> {"message":"Hello EMEA"}
>```

## Invoke the function using oci-curl

In OCI you need to sign your requests to function http endpoints. Refer to [OCI Signed Requests](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/signingrequests.htm?TocPath=Developer%20Tools%20|REST%20APIs%20|_____4) for more information and for sample clients in various popular languages.

One such client that OCI provides to generate signed curl requests is called `oci-curl`. This section shows how to access function endpoints using `oci-curl`.

In [Setup Local Development Environment > oci-curl Configuration](3-1-SetupEnv.md#oci-curl-configuration) section, you have already configured your credentials with [util/oci-curl.sh](util/oci-curl.sh)

![](images/userinput.png)
>```
> source <full/path/to/oci-curl.sh> 
>```

![](images/userinput.png)
>```
> fn ls t workshop-<NNN>-app
>
> FUNCTION	NAME		TYPE	SOURCE			ENDPOINT
> go-fn		go-fn-trigger	http	/go-fn-trigger		https://<app-short-code>.call.test.us-ashburn-1.functions.oci.oraclecloud.com/t/go-fn-trigger
>```

Use the endpoint from the above command to construct the parameters for oci-curl as shown below.

Note: Enter passphrase as `emea`

![](images/userinput.png)
>```
> oci-curl <app-short-code>.call.test.us-ashburn-1.functions.oci.oraclecloud.com get "/t/go-fn-trigger"
> 
> Enter pass phrase for /Users/amy/keys/labs_pri_key.pem: emea
> 
>```

## Clean up

Congratulations! Now that you have verified your deployed function, you should clean up the trigger, function and app.

Refer to [Delete (Trigger, Function, App)](https://github.com/sachin-pikle/functionslab/wiki/Functions-Commands-Cheatsheet#delete-trigger-function-app) section.

First, delete the trigger as shown below.

![](images/userinput.png)
>```
> fn delete trigger workshop-<NNN>-app go-fn go-fn-trigger
> 
> workshop-<NNN>-app go-fn go-fn-trigger deleted
>```

Then, delete the function as shown below.

![](images/userinput.png)
>```
> fn delete function workshop-<NNN>-app go-fn
> 
> workshop-<NNN>-app go-fn deleted
>```

And finally, delete the app as shown below.

![](images/userinput.png)
>```
> fn delete app workshop-<NNN>-app
> 
> workshop-<NNN>-app deleted
>```

