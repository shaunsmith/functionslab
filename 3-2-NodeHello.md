# Hello World - Node.js (Fn Triggers)

*Don't forget to replace `<NNN>` with your user number. Your lab instructor will give you your user number.*

## Create your first app

![](images/userinput.png)
>```
> fn create app workshop-<NNN>-app --annotation oracle.com/oci/subnetIds='["ocid1.subnet.oc1.iad.aaaaaaaah2hbng6hb4lvnaqfmenqlejmp677vojolwcablnp4rjbikgrn5ja"]'
>```  

## Create a boiler plate Node function with an http trigger

![](images/userinput.png)
>```
> fn init --runtime node --trigger http node-fn
>```

## Switch directory

![](images/userinput.png)
>```
> cd node-fn
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
> iad.ocir.io/oracle-serverless-devrel/workshop-<NNN>/node-fn
>```

## Invoke the function using CLI

![](images/userinput.png)
>```
> fn -v invoke workshop-<NNN>-app node-fn
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
> node-fn		node-fn-trigger	http	/node-fn-trigger	https://<app-short-code>.call.test.us-ashburn-1.functions.oci.oraclecloud.com/t/node-fn-trigger
>```

Use the endpoint from the above command to construct the parameters for oci-curl as shown below.

Note: Enter passphrase as `emea`

![](images/userinput.png)
>```
> oci-curl <app-short-code>.call.test.us-ashburn-1.functions.oci.oraclecloud.com get "/t/node-fn-trigger"
> 
> Enter pass phrase for /Users/amy/keys/labs_pri_key.pem: emea
> 
>```
