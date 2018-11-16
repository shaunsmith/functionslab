# Hello World - Go

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
> fn -v invoke ws-<NNN>-app go-fn --display-call-id
>
> Call ID: 01CWES47JM1BT0GGRZJ0000MN9
> {"message":"Hello World"}
>```

And you can pass parameters as shown below:

![](images/userinput.png)
>```
> echo -n '{"name":"EMEA"}' | fn invoke ws-<NNN>-app go-fn --display-call-id --content-type application/json
>
> Call ID: 01CWES1FR11BT0GGRZJ0000MKW
> {"message":"Hello EMEA"}
>```

## Clean up

Congratulations! Now that you have verified your deployed function, you should clean up the trigger, function and app.

Refer to [Delete (Trigger, Function, App)](https://github.com/sachin-pikle/functionslab/wiki/Functions-Commands-Cheatsheet#delete-trigger-function-app) section.

First, delete the trigger as shown below.

![](images/userinput.png)
>```
> fn delete trigger ws-<NNN>-app go-fn go-fn-trigger
> 
> ws-<NNN>-app go-fn go-fn-trigger deleted
>```

Then, delete the function as shown below.

![](images/userinput.png)
>```
> fn delete function ws-<NNN>-app go-fn
> 
> ws-<NNN>-app go-fn deleted
>```

And finally, delete the app as shown below.

![](images/userinput.png)
>```
> fn delete app ws-<NNN>-app
> 
> ws-<NNN>-app deleted
>```

