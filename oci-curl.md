## oci-curl Configuration

1. Edit the file [/util/oci-curl.sh](/util/oci-curl.sh) cloned/downloaded on your machine. The relevant section of the file containing user account details is shown below. 

*Don't forget to add your user OCID and the full path to your private key file.*


## Invoke the HelloWorld Node function using oci-curl

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


## Invoke the HelloWorld Go function using oci-curl

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

