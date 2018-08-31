# Hello World - Node.js (Fn Triggers)

*Don't forget to replace `<NNN>` with your user number. Your lab instructor will give you your user number.*

## Create your first app

You may use one of the following subnets:

Subnet Name | Subnet OCID
--- | ---
Public Subnet xqgA:US-ASHBURN-AD-1	| ocid1.subnet.oc1.iad.aaaaaaaaxrpre3meci53mgajfa6q45jvq2ffkeq763sq7qyhjlppnwrujcqa
Public Subnet xqgA:US-ASHBURN-AD-2	| ocid1.subnet.oc1.iad.aaaaaaaas2yhahemdivjfnvyb3gkatgj66nporafite2cjxtqhpfhgfwszhq
Public Subnet xqgA:US-ASHBURN-AD-3	| ocid1.subnet.oc1.iad.aaaaaaaah2hbng6hb4lvnaqfmenqlejmp677vojolwcablnp4rjbikgrn5ja

![](images/userinput.png)
>```
> fn create app workshop-<NNN>-app --annotation oracle.com/oci/subnetIds='["subnet-ocid-use-any-one-from-the-above"]'
>```  

Example:

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
> 
> {"message":"Hello World"}
>```

And you can pass parameters as shown below:

![](images/userinput.png)
>```
> echo -n '{"name":"EMEA"}' | fn invoke workshop-<NNN>-app node-fn --content-type application/json
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


## Clean up

Congratulations! Now that you have verified your deployed function, you should clean up the trigger and function. Leave the app as-is since we will reuse it in the next example.

Refer to [Delete (Trigger, Function, App)](https://github.com/sachin-pikle/functionslab/wiki/Functions-Commands-Cheatsheet#delete-trigger-function-app) section.

First, delete the trigger as shown below.

![](images/userinput.png)
>```
> fn delete trigger workshop-<NNN>-app node-fn node-fn-trigger
> 
> workshop-<NNN>-app node-fn node-fn-trigger deleted
>```

And then, delete the function as shown below.

![](images/userinput.png)
>```
> fn delete function workshop-<NNN>-app node-fn
> 
> workshop-<NNN>-app node-fn deleted
>```

Leave the app as-is since we will reuse it in the next example.
