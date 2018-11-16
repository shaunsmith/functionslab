# Hello World - Node.js

*Don't forget to replace `<NNN>` with your user number. Your lab instructor will give you your user number.*

## Create your first app

You may use one of the following subnets:

Subnet Name | Subnet OCID
--- | ---
Public Subnet xqgA:PHX-AD-1	| ocid1.subnet.oc1.phx.aaaaaaaaghmsma7mpqhqdhbgnby25u2zo4wqlrrcskvu7jg56dryxt3hgvka
Public Subnet xqgA:PHX-AD-2	| ocid1.subnet.oc1.phx.aaaaaaaaw3wnectmap3fybdlh5oz6tw6xzqgt7jsaxsfospolk3bvo2usgza
Public Subnet xqgA:PHX-AD-3	| ocid1.subnet.oc1.phx.aaaaaaaabrg4uf2uzc3ni4jkz5vhqwprofmlmo7mpumnuddd7iandssruohq

![](images/userinput.png)
>```
> fn create app ws-<NNN>-app --annotation oracle.com/oci/subnetIds='["subnet-ocid-use-any-one-from-the-above"]'
>```  

Example:

![](images/userinput.png)
>```
> fn create app ws-<NNN>-app --annotation oracle.com/oci/subnetIds='["ocid1.subnet.oc1.phx.aaaaaaaabrg4uf2uzc3ni4jkz5vhqwprofmlmo7mpumnuddd7iandssruohq"]'
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
> fn -v deploy --app ws-<NNN>-app --no-bump --no-cache
>```

## List triggers

![](images/userinput.png)
>```
> fn list triggers ws-<NNN>-app
>```

## Invoke the function using CLI

![](images/userinput.png)
>```
> fn invoke ws-<NNN>-app node-fn --display-call-id
> 
> {"message":"Hello World"}
>```

And you can pass parameters as shown below:

![](images/userinput.png)
>```
> echo -n '{"name":"EMEA"}' | fn invoke ws-<NNN>-app node-fn --display-call-id --content-type application/json
>
> {"message":"Hello EMEA"}
>```


## Clean up

Congratulations! Now that you have verified your deployed function, you may clean up the trigger and function. Leave the app as-is since we will reuse it in the next example.

Refer to [Delete (Trigger, Function, App)](https://github.com/sachin-pikle/functionslab/wiki/Functions-Commands-Cheatsheet#delete-trigger-function-app) section.

First, delete the trigger as shown below.

![](images/userinput.png)
>```
> fn delete trigger ws-<NNN>-app node-fn node-fn-trigger
> 
> ws-<NNN>-app node-fn node-fn-trigger deleted
>```

And then, delete the function as shown below.

![](images/userinput.png)
>```
> fn delete function ws-<NNN>-app node-fn
> 
> ws-<NNN>-app node-fn deleted
>```

Leave the app as-is since we will reuse it in the next example.
