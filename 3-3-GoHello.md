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

## Invoke the function using CLI

![](images/userinput.png)
>```
> fn -v invoke workshop-<NNN>-app go-fn
>```

## Invoke the function using oci-curl

In OCI you need to sign your requests to function http endpoints. Refer to [OCI Signed Requests](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/signingrequests.htm?TocPath=Developer%20Tools%20|REST%20APIs%20|_____4) for more information and for sample clients in various popular languages.

One such client that OCI provides to generate signed curl requests is called `oci-curl`. This section shows how to access function endpoints using `oci-curl`.

![](images/userinput.png)
>```
> source oci-curl.sh
>```

![](images/userinput.png)
>```
> fn ls t workshop-<NNN>-app
>```

![](images/userinput.png)
>```
> oci-curl 66smj7vz6qq.call.test.us-ashburn-1.functions.oci.oraclecloud.com get "/t/go-fn-trigger"
>```
