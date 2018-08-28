# Hello World - Go (Fn Triggers)

![](images/userinput.png)
>```
> fn init --runtime go --trigger http go-fn
>```

![](images/userinput.png)
>```
> cd go-fn
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
> fn -v invoke workshop-<NNN>-app go-fn
>```
