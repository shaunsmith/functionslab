# Hello World - Node.js (Fn Triggers)

*Don't forget to replace `<NNN>` with your user number. Your lab instructor will give you your user number.*

![](images/userinput.png)
>```
> fn init --runtime node --trigger http node-fn
>```

![](images/userinput.png)
>```
> cd node-fn
>```

![](images/userinput.png)
>```
> fn -v deploy --app workshop-<NNN>-app --no-bump
>```

![](images/userinput.png)
>```
> fn list triggers workshop-<NNN>-app
>```

![](images/userinput.png)
>```
> fn -v invoke workshop-<NNN>-app node-fn
>```

In OCI you need to sign your requests to function http endpoints. Refer to OCI Signed Requests for more information and for sample clients in various popular languages.

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
