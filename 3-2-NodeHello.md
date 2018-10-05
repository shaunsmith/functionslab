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
> fn create app ws-<NNN>-app --annotation oracle.com/oci/subnetIds='["subnet-ocid-use-any-one-from-the-above"]'
>```  

Example:

![](images/userinput.png)
>```
> fn create app ws-<NNN>-app --annotation oracle.com/oci/subnetIds='["ocid1.subnet.oc1.iad.aaaaaaaah2hbng6hb4lvnaqfmenqlejmp677vojolwcablnp4rjbikgrn5ja"]'
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
> fn -v invoke ws-<NNN>-app node-fn
> 
> {"message":"Hello World"}
>```

And you can pass parameters as shown below:

![](images/userinput.png)
>```
> echo -n '{"name":"EMEA"}' | fn invoke ws-<NNN>-app node-fn --content-type application/json
>
> {"message":"Hello EMEA"}
>```


## Clean up

Congratulations! Now that you have verified your deployed function, you should clean up the trigger and function. Leave the app as-is since we will reuse it in the next example.

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
